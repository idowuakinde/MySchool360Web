Imports System
Imports System.Configuration
Imports System.Web.Configuration
Imports System.Collections
Imports Vanilla

Namespace jsConnectdotNet

    Partial Public Class modules_vanilla_default
        Inherits System.Web.UI.Page

        Protected Sub Page_Init(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Init
            Try
                ' 1. Get your client ID and secret here. These must match those in your jsConnect settings.
                Dim clientID As String = Common.CONST_FORUMS_VANILLA_SSO_JSCONNECT_CLIENTID
                Dim secret As String = Common.CONST_FORUMS_VANILLA_SSO_JSCONNECT_SECRETKEY

                ' 2. Grab the current user from your session management system or database here.
                'Dim signedIn As Boolean = True  'this is just a placeholder

                ' YOUR CODE HERE.
                Dim signedIn As Boolean, roleId As Int32, roleName As String, userName As String, fullName As String, email As String, photoLocation As String

                If Request.Cookies("User")("Username") = "" Then    'Parents are deliberately not catered to, because the Use Case of parents logging into the discussion forums is far-fetched.
                    signedIn = False
                Else
                    signedIn = True
                    userName = Common.DecodeHTML(Request.Cookies("User")("UserName"))
                    roleId = Common.DecodeHTML(Request.Cookies("User")("RoleId"))
                    roleName = Common.DecodeHTML(Request.Cookies("User")("RoleName"))
                    If roleName.Contains("Student") Then
                        fullName = Common.DecodeHTML(Request.Cookies("User")("FirstName")).ToUpper
                        email = Common.GetTableRows("SELECT EmailAddress FROM dbo.TempCustomers WHERE CustomerCode = '" & userName & "'")(0).Item(0).ToString
                        photoLocation = "http://" & Request.ServerVariables.Item("HTTP_HOST") & Request.ApplicationPath & "/images/pp/" & userName & ".jpg"
                        roleName = "member"
                    ElseIf roleName = "System Administrator" Then
                        fullName = (Common.DecodeHTML(Request.Cookies("User")("FirstName")) & " " & Common.DecodeHTML(Request.Cookies("User")("MiddleName")) & " " & Common.DecodeHTML(Request.Cookies("User")("Surname"))).ToUpper
                        email = Common.GetTableRows("SELECT Email FROM dbo.Core_User WHERE Username = '" & userName & "'")(0).Item(0).ToString
                        photoLocation = "http://" & Request.ServerVariables.Item("HTTP_HOST") & Request.ApplicationPath & "/images/pp_staff/" & userName & ".jpg"
                        roleName = "member,administrator"
                    Else
                        fullName = (Common.DecodeHTML(Request.Cookies("User")("FirstName")) & " " & Common.DecodeHTML(Request.Cookies("User")("MiddleName")) & " " & Common.DecodeHTML(Request.Cookies("User")("Surname"))).ToUpper
                        email = Common.GetTableRows("SELECT Email FROM dbo.Core_User WHERE Username = '" & userName & "'")(0).Item(0).ToString
                        photoLocation = "http://" & Request.ServerVariables.Item("HTTP_HOST") & Request.ApplicationPath & "/images/pp_staff/" & userName & ".jpg"
                        roleName = "member,moderator"
                    End If

                    ' 3. Fill in the user information in a way that Vanilla can understand.
                    Dim user As SortedList = New SortedList
                    'CHANGE THESE FOUR LINES
                    user("uniqueid") = userName
                    user("name") = fullName
                    user("email") = email
                    user("photourl") = photoLocation
                    user("roles") = roleName
                    user("callback") = "http://" & Request.ServerVariables.Item("HTTP_HOST") & ":8080/m_foru_chi/" '"http://localhost:8080/vanilla/"

                    ' 4. Generate the jsConnect string.
                    Dim secure As Boolean = False               ' // set this to 'False' while testing, and 'True' when live
                    Dim hash As String = "sha1"                 ' // values supported are md5, sha1, sha256
                    Vanilla.jsConnect.debug = True              ' // turn on debug to help troubleshoot some issues.
                    Dim js As String = Vanilla.jsConnect.GetJsConnectString(user, Request.QueryString, clientID, secret, secure, hash)

                    Response.Write(js)
                    Response.End()
                End If
            Catch ex1 As System.Threading.ThreadAbortException
                'Response.Write("'" & "ThreadAbortException." & "'") : Response.End()
                'Throw ex1
                'do nothing. This is Response.End()
            Catch ex As Exception
                Dim exCollection As SortedList = New SortedList
                exCollection("error") = "exception"
                exCollection("message") = ex.Message

                Dim exString As String = jsConnect.JSonEncode(exCollection)
                Response.Write(exString)
                Response.End()
            End Try
        End Sub
    End Class
End Namespace
