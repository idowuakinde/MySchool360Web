Imports System.IO
Imports System.Net
Imports System.Data

Partial Class modules_bulkemail_sendemail
    Inherits System.Web.UI.Page

    Public senderAlias As String = "", recipients As String = "", recipientDetails As String(), messageSubject As String = "", messageText As String = "", messageFormat As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Call ShowBalance()

        Dim senderAlias As String = Common.GetTableRows(" SELECT SettingValue FROM dbo.Core_Setting WHERE SettingTitle = 'Default E-mail Sending Address' ")(0).Item(0).ToString
        CType(Me.dvNewStudent.FindControl("txtAlias"), TextBox).Text = senderAlias
    End Sub

    Protected Sub dvNewStudent_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvNewStudent.ItemInserted
        'Call ShowBalance()
    End Sub

    Protected Sub dvNewStudent_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvNewStudent.ItemInserting
        senderAlias = CType(dvNewStudent.FindControl("txtAlias"), TextBox).Text
        recipients = CType(dvNewStudent.FindControl("txtRecipients"), TextBox).Text
        messageSubject = CType(dvNewStudent.FindControl("txtSubject"), TextBox).Text
        messageText = CType(dvNewStudent.FindControl("txtMessageText"), TextBox).Text
        messageFormat = 1   '1 for text, 0 for html

        Dim ret As Boolean = SendEmail(senderAlias, recipients, messageSubject, messageText, 1)
        Select Case ret
            Case True
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Green
                lblStatus.Text = "Congratulations! E-mails sent successfully. <br /><br />Please be mindful to monitor the default sender address (" & senderAlias & ") for notifications of occasional delivery failures."
            Case Else
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Red
                lblStatus.Text = "An error occurred during the BULK SMS Operation (Error Code: " & ret & "). Please try again or contact an Administrator."
        End Select
    End Sub

    Protected Function SendEmail(ByVal senderAlias As String, ByVal recipients As String, subject As String, ByVal body As String, format As Int32) As Boolean
        On Error Resume Next

        Dim ret As Boolean
        Dim currentRecipient As String

        'body = Common.EncodeHTML(body)

        'loop through the recipients comma-delimited string and send emails to all recipients...
        recipientDetails = recipients.Split(",")
        For i As Int32 = 0 To recipientDetails.Length - 1
            currentRecipient = recipientDetails(i)

            'toAddresses = "idowuakinde@yahoo.com"
            'ccAddresses = ""
            'bccAddresses = ""
            'attachment = Server.MapPath("~/_pdf/results/Childville_ReportCard_20121stTermMid_" & portalNumber & ".PDF")

            Call Common.SendMail(senderAlias, currentRecipient, "", "", subject, format, body)
        Next

        Return True
    End Function

    Protected Sub btnSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.dvNewStudent.InsertItem(True)
    End Sub

    Protected Sub ddlRecipientGroups_SelectedIndexChanged(sender As Object, e As System.EventArgs)
        Dim selectedRecipientGroup As String = CType(sender, DropDownList).SelectedValue
        Dim filterValue As String = "", sqlGetSelectedEmails As String
        Select Case selectedRecipientGroup.ToUpper
            Case "CRE", "NUR", "PRI", "SEC"
                filterValue = selectedRecipientGroup
                sqlGetSelectedEmails = " SELECT EmailAddress + ', ' + CurrentBal AS ParentsEmails FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & filterValue & "') "
            Case "JUNIOR"
                filterValue = "CRE','NUR','PRI"
                sqlGetSelectedEmails = " SELECT EmailAddress + ', ' + CurrentBal AS ParentsEmails FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) "
            Case "SENIOR"
                filterValue = "SEC"
                sqlGetSelectedEmails = " SELECT EmailAddress + ', ' + CurrentBal AS ParentsEmails FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) "
            Case "PARENTS"
                filterValue = "CRE','NUR','PRI','SEC"
                sqlGetSelectedEmails = " SELECT EmailAddress + ', ' + CurrentBal AS ParentsEmails FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) "
            Case "TEACHING"
                filterValue = "TEACHING"
                sqlGetSelectedEmails = " SELECT Email AS StaffEmails FROM dbo.HR_Staff_Base WHERE AppraisalDepartment IN ('" & filterValue & "') "
            Case "ADMIN"
                filterValue = "ADMINISTRATIVE"
                sqlGetSelectedEmails = " SELECT Email AS StaffEmails FROM dbo.HR_Staff_Base WHERE AppraisalDepartment IN ('" & filterValue & "') "
            Case "MAINTENANCE"
                filterValue = "MAINTENANCE & GROUNDS"
                sqlGetSelectedEmails = " SELECT Email AS StaffEmails FROM dbo.HR_Staff_Base WHERE AppraisalDepartment IN ('" & filterValue & "') "
            Case "STAFF"
                sqlGetSelectedEmails = " SELECT Email AS StaffEmails FROM dbo.HR_Staff_Base "
            Case "ALL"  'All Parents and Staff
                filterValue = "CRE','NUR','PRI','SEC"
                sqlGetSelectedEmails = " SELECT EmailAddress + ', ' + CurrentBal AS ParentsAndStaffEmails FROM dbo.TEMPCustomers WHERE DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN ('" & filterValue & "')) UNION ALL SELECT Email FROM dbo.HR_Staff_Base "
            Case Else   'Specific Class
                filterValue = selectedRecipientGroup
                sqlGetSelectedEmails = " SELECT EmailAddress + ', ' + CurrentBal AS ParentsEmails FROM dbo.TEMPCustomers WHERE DistrictCode IN ('" & filterValue & "') "
        End Select

        'Response.Write("*" & sqlGetSelectedPhoneNumbers & "*") : Response.End()

        Dim recipientCollection As DataRowCollection = Common.GetTableRows(sqlGetSelectedEmails)
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
