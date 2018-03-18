Imports System.IO
Imports System.Net
Imports System.Data

Partial Class modules_bulksms_sendsms
    Inherits System.Web.UI.Page

    Public senderAlias As String = "", recipients As String = "", messageType As String = "", messageText As String = ""
    Public balanceNaira As Double = 0, balanceUnits As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call ShowBalance()

        Dim defaultSenderAlias As String = CType(Common.GetTableRows(" SELECT ModuleName, SettingTitle, SettingValue FROM dbo.Core_Setting ")(5).Item(2), String)
        CType(Me.dvNewStudent.FindControl("txtAlias"), TextBox).Text = defaultSenderAlias
    End Sub

    Protected Sub dvNewStudent_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvNewStudent.ItemInserted
        Call ShowBalance()
    End Sub

    Protected Sub dvNewStudent_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvNewStudent.ItemInserting
        senderAlias = CType(dvNewStudent.FindControl("txtAlias"), TextBox).Text
        recipients = CType(dvNewStudent.FindControl("txtRecipients"), TextBox).Text
        messageType = CType(dvNewStudent.FindControl("ddlMessageType"), DropDownList).SelectedValue
        messageText = CType(dvNewStudent.FindControl("txtMessageText"), TextBox).Text

        Dim ret As String = SendSMS(senderAlias, recipients, messageText)
        Select Case ret
            Case "1701"
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Green
                lblStatus.Text = "Congratulations! BULK SMS Message(s) sent successfully."
            Case Else
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Red
                lblStatus.Text = "An error occurred during the BULK SMS Operation (Error Code: " & ret & "). Please try again or contact an Administrator."
        End Select
    End Sub

    Protected Function SendSMS(ByVal senderAlias As String, ByVal recipients As String, ByVal messageText As String) As String
        Dim WebRequest As Net.WebRequest 'object for WebRequest
        Dim WebResponse As Net.WebResponse 'object for WebResponse
        'Url Encode message
        messageText = HttpUtility.UrlEncode(messageText)
        Dim WebResponseString As String = ""
        Dim URL As String = "http://sms.hive.com.ng/api/?username=" & Common.CONST_BULKSMS_USERNAME & "&password=" & Common.CONST_BULKSMS_PASSWORD & "&sender=" & senderAlias & "&message=" & messageText & "&mobiles=" & recipients & ""
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

    Protected Sub btnSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.dvNewStudent.InsertItem(True)
    End Sub

    Protected Sub ddlRecipientGroups_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        'Dim sqlSelect As String = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode = '" & CType(sender, DropDownList).SelectedValue & "' "
        'Dim sqlSelect As String = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode = '" & filterValue & "' "
        Dim selectedRecipientGroup As String = CType(sender, DropDownList).SelectedValue
        Dim filterValue As String = "", sqlGetSelectedClasses As String = "", sqlGetSelectedPhoneNumbers As String = ""
        Select Case selectedRecipientGroup.ToUpper
            Case "CRE", "NUR", "PRI", "SEC"
                sqlGetSelectedClasses = "SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & selectedRecipientGroup.ToUpper & "'"
                filterValue = selectedRecipientGroup
                sqlGetSelectedPhoneNumbers = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & filterValue & "') "
            Case "JUNIOR"
                filterValue = "CRE','NUR','PRI"
                sqlGetSelectedPhoneNumbers = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) "
            Case "SENIOR"
                filterValue = "SEC"
                sqlGetSelectedPhoneNumbers = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) "
            Case "PARENTS"
                filterValue = "CRE','NUR','PRI','SEC"
                sqlGetSelectedPhoneNumbers = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) "
            Case "TEACHING"
                filterValue = "TEACHING"
                sqlGetSelectedPhoneNumbers = " SELECT Telephone AS StaffTelephones FROM dbo.HR_Staff_Base WHERE AppraisalDepartment IN ('" & filterValue & "') "
            Case "ADMIN"
                filterValue = "ADMINISTRATIVE"
                sqlGetSelectedPhoneNumbers = " SELECT Telephone AS StaffTelephones FROM dbo.HR_Staff_Base WHERE AppraisalDepartment IN ('" & filterValue & "') "
            Case "MAINTENANCE"
                filterValue = "MAINTENANCE & GROUNDS"
                sqlGetSelectedPhoneNumbers = " SELECT Telephone AS StaffTelephones FROM dbo.HR_Staff_Base WHERE AppraisalDepartment IN ('" & filterValue & "') "
            Case "STAFF"
                sqlGetSelectedPhoneNumbers = " SELECT Telephone AS StaffTelephones FROM dbo.HR_Staff_Base "
            Case "ALL"  'All Parents and Staff
                filterValue = "CRE','NUR','PRI','SEC"
                sqlGetSelectedPhoneNumbers = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) UNION ALL SELECT Telephone FROM dbo.HR_Staff_Base "
            Case Else   'Specific Class
                filterValue = selectedRecipientGroup
                sqlGetSelectedPhoneNumbers = " SELECT PhoneNumber + ', ' + Extension AS ParentsTelephones FROM dbo.TEMPCustomers WHERE DistrictCode IN ('" & filterValue & "') "
        End Select

        'Response.Write("*" & sqlGetSelectedPhoneNumbers & "*") : Response.End()

        Dim recipientCollection As DataRowCollection = Common.GetTableRows(sqlGetSelectedPhoneNumbers)
        Dim recipients As String = ""

        For i As Int32 = 0 To recipientCollection.Count - 1
            recipients &= recipientCollection(i).Item(0).ToString & ", "
        Next
        If recipients.Length > 0 Then
            recipients = Left(recipients, recipients.Length - 2)
        End If

        CType(dvNewStudent.FindControl("txtRecipients"), TextBox).Text = recipients
    End Sub
End Class
