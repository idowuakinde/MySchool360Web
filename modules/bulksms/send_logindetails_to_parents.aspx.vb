Imports System.IO
Imports System.Net
Imports System.Data

Partial Class modules_bulksms_send_logindetails_to_parents
    Inherits System.Web.UI.Page

    Public balanceNaira As Double = 0, balanceUnits As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call ShowBalance()

        Dim defaultSenderAlias As String = CType(Common.GetTableRows(" SELECT ModuleName, SettingTitle, SettingValue FROM dbo.Core_Setting ")(5).Item(2), String)

        Dim currentRecipient As String = "", parentsCollection As DataRowCollection = Common.GetTableRows(" SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones, EmailAddress, CurrentBal, RA as ParentsPassword FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('CRE','NUR','PRI','SEC')) UNION ALL SELECT '08066032312, 08057020667', 'idowuakinde@yahoo.com', 'adebeyuu@gmail.com', 'pass'")

        Dim messageText As String = "", sendingResponse As String = ""

        For i As Int32 = 0 To parentsCollection.Count - 1
            messageText = "Dear Parent, Your login details for MySchool360 are as follows:- URL: childville.myschool360.info, Username: <user>, Password: <pass>, Role: Parent. All devices supported (desktops, laptops, tablets and mobile phones). Thank you."
            messageText = messageText.Replace("<user>", parentsCollection(i).Item(1).ToString & " OR " & parentsCollection(i).Item(2).ToString)         'fetch the username
            messageText = messageText.Replace("<pass>", parentsCollection(i).Item(3).ToString)                                                          'fetch the password

            If parentsCollection(i).Item(0).ToString.Contains(",") Then
                Dim currentRecipients As String() = parentsCollection(i).Item(0).ToString.Split(",")
                For j As Int32 = 0 To currentRecipients.Length - 1
                    lblStatus.Text &= "" & (((i * 2) + j) + 1).ToString & ".    "
                    sendingResponse = SendSMS(defaultSenderAlias, Common.CleanupPhoneNumber(currentRecipients(j).Trim), messageText)
                Next
            Else
                currentRecipient = Common.CleanupPhoneNumber(parentsCollection(i).Item(0).ToString)
                sendingResponse = SendSMS(defaultSenderAlias, currentRecipient.Trim, messageText)
            End If
        Next
    End Sub

    Protected Function SendSMS(ByVal senderAlias As String, ByVal recipient As String, ByVal messageText As String) As String
        Dim WebRequest As Net.WebRequest 'object for WebRequest
        Dim WebResponse As Net.WebResponse 'object for WebResponse
        'Url Encode message
        messageText = HttpUtility.UrlEncode(messageText)
        Dim WebResponseString As String = ""
        Dim URL As String = "http://sms.hive.com.ng/api/?username=" & Common.CONST_BULKSMS_USERNAME & "&password=" & Common.CONST_BULKSMS_PASSWORD & "&sender=" & senderAlias & "&message=" & messageText & "&mobiles=" & recipient & ""
        'Response.Write("" & URL & "<br />")
        WebRequest = Net.HttpWebRequest.Create(URL) 'Hit URL Link
        WebRequest.Timeout = 25000
        Try
            WebResponse = WebRequest.GetResponse 'Get Response
            Dim reader As IO.StreamReader = New IO.StreamReader(WebResponse.GetResponseStream)
            'Read Response and store in variable
            WebResponseString = reader.ReadToEnd()
            WebResponse.Close()
            'Response.Write(WebResponseString) 'Display Response.
        Catch ex As Exception
            WebResponseString = "Request Timeout" 'If any exception occur.
            'Response.Write(WebResponseString)
        End Try

        Dim feedbackMessage As String = "Sender=" & senderAlias & ";Recipient=" & recipient & ";Message=" & messageText & ";Result=" & WebResponseString.Replace("1701", "Success")
        lblStatus.Text &= "" & feedbackMessage & "<br /><hr />"

        Return WebResponseString
    End Function

    Protected Function CheckBalance() As String
        Dim WebRequest As Net.WebRequest 'object for WebRequest
        Dim WebResponse As Net.WebResponse 'object for WebResponse
        Dim WebResponseString As String = ""
        Dim URL As String = "http://sms.hive.com.ng/api/?username=" & Common.CONST_BULKSMS_USERNAME & "&password=" & Common.CONST_BULKSMS_PASSWORD & "&request=balance"
        WebRequest = Net.HttpWebRequest.Create(URL) 'Hit URL Link
        WebRequest.Timeout = 25000
        Try
            WebResponse = WebRequest.GetResponse 'Get Response
            Dim reader As IO.StreamReader = New IO.StreamReader(WebResponse.GetResponseStream)
            'Read Response and store in variable
            WebResponseString = reader.ReadToEnd()
            WebResponse.Close()
            'Response.Write(WebResponseString) 'Display Response.
        Catch ex As Exception
            WebResponseString = "Request Timeout" 'If any exception occur.
            'Response.Write(WebResponseString)
        End Try

        Return WebResponseString
    End Function

    Private Sub ShowBalance()
        Dim balance As String = CheckBalance()
        If balance.ToUpper = "REQUEST TIMEOUT" Then
            Me.lblBalance.Text = balance
        Else
            balanceNaira = CType(balance, Double)
            balanceUnits = balanceNaira / Common.CONST_BULKSMS_PRICE_PER_UNIT

            Me.lblBalance.Text = FormatNumber(balanceUnits, 0).ToString & " SMS units remaining. 160 characters = 1 SMS unit."
            If balanceUnits > Common.CONST_BULKSMS_REFILL_LEVEL Then
                Me.lblBalance.ForeColor = Drawing.Color.Green
            Else
                Me.lblBalance.ForeColor = Drawing.Color.Red
            End If
        End If
    End Sub
End Class
