Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Collections
Imports System.Text
Imports System.Collections.Specialized

Namespace Vanilla
    ' <summary>
    ' This object contains the client code for Vanilla jsConnect single-sign-on.
    ' Version 1.0.3b
    ' </summary>

    Public Class jsConnect
        Public Shared debug As Boolean = False

        Protected Shared Function GetError(ByVal code As String, ByVal message As String) As IDictionary
            Dim result As IDictionary = New SortedList()
            result("error") = code
            result("message") = message

            Return result
        End Function

        Public Shared Function GetJsConnectString(ByVal user As IDictionary, ByVal request As NameValueCollection, ByVal clientID As String, ByVal secret As String, ByVal secure As Boolean, ByVal hash As String) As String
            If request Is Nothing Then
                request = System.Web.HttpContext.Current.Request.QueryString
            End If

            Dim vError As IDictionary = Nothing

            Dim timestamp As Int32 = 0
            Try
                timestamp = System.Convert.ToInt32(request("timestamp"))

            Catch ex As Exception
                timestamp = 0
            End Try

            Dim currentTimestamp As Int32 = jsConnect.TimeStamp

            If secure Then
                If request("client_id") Is Nothing Then
                    vError = jsConnect.GetError("invalid_request", "The client_id parameter is missing.")
                ElseIf request("client_id") <> clientID Then
                    vError = jsConnect.GetError("invalid_client", "Unknown client " & request("client_id") & ".")
                ElseIf request("timestamp") Is Nothing And request("signature") Is Nothing Then
                    If (Not user Is Nothing And user.Count > 0) Then
                        vError = New SortedList()
                        vError("name") = user("name")
                        If user.Contains("photourl") Then
                            vError("photourl") = user("photourl")
                        Else
                            vError("photourl") = ""
                        End If
                    Else
                        vError = New SortedList
                        vError("name") = ""
                        vError("photourl") = ""
                    End If
                ElseIf timestamp = 0 Then
                    vError = jsConnect.GetError("invalid_request", "The timestamp is missing or invalid.")
                ElseIf request("signature") Is Nothing Then
                    vError = jsConnect.GetError("invalid_request", "The signature is missing.")
                ElseIf (Math.Abs(currentTimestamp - timestamp) > 30 * 60) Then
                    vError = jsConnect.GetError("invalid_request", "The timestamp is invalid.")
                Else
                    'Make sure the timestamp's siagnature checks out.
                    Dim timeStampSig As String = jsConnect.hash(timestamp.ToString() & secret, hash)
                    If (timeStampSig <> request("signature")) Then
                        vError = jsConnect.GetError("access_denied", "Signature invalid.")
                    End If
                End If
            End If

            Dim vResult As IDictionary

            If Not vError Is Nothing Then
                vResult = vError
            ElseIf (Not user Is Nothing And user.Count > 0) Then
                vResult = New SortedList(user)
                Call SignJsConnect(vResult, clientID, secret, True, hash)
            Else
                vResult = New SortedList
                vResult("name") = ""
                vResult("photourl") = ""
            End If

            Dim json As String = jsConnect.JsonEncode(vResult)
            If (request("callback") Is Nothing) Then
                Return json
            Else
                Return request("callback") & "(" & json & ")"
            End If
        End Function

        ' <summary>
        ' Backwards compatability version of GetJsConnectString().
        ' </summary>
        Public Shared Function GetJsConnectString(ByVal user As IDictionary, ByVal request As NameValueCollection, ByVal clientID As String, ByVal secret As String, ByVal secure As Boolean) As String
            Return GetJsConnectString(user, request, clientID, secret, secure, hash:="md5")
        End Function

        ' <summary>
        ' Encode a dictionary as json.
        ' </summary>
        ' <param name="d">The data to encode.</param>
        ' <returns>The json encoded string.</returns>
        Public Shared Function JSonEncode(ByVal data As IDictionary) As String
            Dim vResult As String = Common.SerializeJson(data)
            Return vResult
        End Function

        Public Shared Function Hash(ByVal password As String, ByVal method As String) As String
            Dim textBytes As Byte() = System.Text.Encoding.Default.GetBytes(password)

            Try
                Dim cryptHandler As System.Security.Cryptography.HashAlgorithm = Nothing

                Select Case method.ToLower
                    Case ""
                    Case "md5"
                        cryptHandler = System.Security.Cryptography.MD5.Create()
                    Case "sha1"
                        cryptHandler = System.Security.Cryptography.SHA1.Create()
                    Case "sha256"
                        cryptHandler = System.Security.Cryptography.SHA256.Create
                End Select

                Dim vHash As Byte() = cryptHandler.ComputeHash(textBytes)
                Dim ret As String = ""
                For Each a As Byte In vHash
                    If a < 16 Then
                        ret &= "0" & a.ToString("x")
                    Else
                        ret &= a.ToString("x")
                    End If
                Next

                Return ret
            Catch ex As Exception
                Throw ex
            End Try
        End Function

        Public Shared Function StrUpper(ByVal m As System.Text.RegularExpressions.Match) As String
            Return m.ToString.ToUpper
        End Function

        Public Shared Function SignJsConnect(ByVal data As IDictionary, ByVal clientID As String, ByVal secret As String, ByVal setData As Boolean, ByVal hash As String) As String
            'Generate a sorted list of the keys.
            Dim dataCount As Int32 = data.Count
            Dim keys(dataCount) As String   '() = New String(dataCount) ' String(data.Keys.Count)
            data.Keys.CopyTo(keys, 0)
            Array.Sort(keys, New CaseInsensitiveComparer())

            'Generate the string to sign.
            Dim sigStr As StringBuilder = New StringBuilder
            For Each key As String In keys
                If sigStr.Length > 0 Then
                    sigStr.Append("&")

                    Dim enclave As String = jsConnect.UrlEncode(data(key).ToString)

                    sigStr.AppendFormat("{0}={1}", jsConnect.UrlEncode(key.ToLower), enclave)
                End If
            Next

            'Sign the Strinf with the secret.
            Dim signature As String = jsConnect.Hash(sigStr.ToString & secret, hash)

            If setData Then
                data("clientid") = clientID
                data("signature") = signature

                If debug Then
                    data("sigStr") = sigStr.ToString
                End If
            End If

            Return signature
        End Function

        Public Shared Function TimeStamp() As Int32
            Dim epoch As DateTime = New DateTime(1970, 1, 1)
            Dim span As TimeSpan = (DateTime.UtcNow - epoch)

            Return Convert.ToInt32(span.TotalSeconds)
        End Function

        Public Shared Function UrlEncode(ByVal s As String) As String
            Dim vResult As String = Common.EncodeHTML(s)

            Return vResult
        End Function
    End Class
End Namespace
