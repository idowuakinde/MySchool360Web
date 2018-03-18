Imports System.Data

Partial Class modules_system_setups_users_changepassword_parents
    Inherits System.Web.UI.Page

    Public username As String = "", roleId As Int32 = 0, parentEmail As String = "", oldPassword As String = "", oldPasswords As String() = {""}, passwordRowCount As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        roleId = Request.Cookies("Parent")("RoleId")
        parentEmail = Common.DecodeHTML(Request.Cookies("Parent")("Username"))

        Dim rowPassword As DataRowCollection

        rowPassword = Common.GetTableRows(" SELECT [RA] FROM dbo.TEMPCustomers WHERE EmailAddress = '" & parentEmail & "' OR CurrentBal = '" & parentEmail & "' ")

        passwordRowCount = rowPassword.Count : Response.Write("'Count: " & passwordRowCount & "'") 'Response.Write("'" & parentEmail & "'") 'Response.Write("'Count: " & passwordRowCount & "'")
        If passwordRowCount = 0 Then
            oldPassword = ""
        ElseIf passwordRowCount = 1 Then
            oldPassword = CType(rowPassword(0).Item(0), String) : Response.Write("'Single: " & oldPassword & "'")
        Else
            For i As Int32 = 0 To passwordRowCount - 1
                ReDim Preserve oldPasswords(oldPasswords.Length + 1)
                oldPasswords(i) = CType(rowPassword(i).Item(0), String) : Response.Write("'Multiple: " & oldPasswords(i) & "'")
            Next
        End If

        'close this object
        rowPassword = Nothing
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        'check for correctness of oldpassword. Otherwise, display error
        'If correct, check that newpassword1 and newpassword2 are identical. Otherwise, display error

        'Response.Write("'Array Index Where Password (" & Me.txtOldPassword.Text & ") is found: " & Array.IndexOf(oldPasswords, Me.txtOldPassword.Text) & "'") 'Me.txtOldPassword.Text

        'If Me.txtOldPassword.Text = oldPassword Then
        If Array.IndexOf(oldPasswords, Me.txtOldPassword.Text) >= 0 Then
            If txtNewPassword.Text = txtNewPassword2.Text Then
                Dim updateReturnCode As Int32

                updateReturnCode = Common.UpdateTableRow(" UPDATE dbo.TEMPCustomers SET [RA] = '" & txtNewPassword.Text & "' WHERE EmailAddress = '" & parentEmail & "' OR CurrentBal = '" & parentEmail & "' ")

                If updateReturnCode > 0 Then
                    lblStatus.Font.Bold = True
                    lblStatus.ForeColor = Drawing.Color.Green
                    lblStatus.Text = "Congratulations! Your password was changed successfully. <br /><br />Please note: Changes take effect upon next login."
                Else
                    lblStatus.Font.Bold = True
                    lblStatus.ForeColor = Drawing.Color.Red
                    lblStatus.Text = "An unexpected error occurred during the CHANGE PASSWORD Operation: <br />Please contact an Administrator."
                End If
            Else
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Red
                lblStatus.Text = "An error occurred during the CHANGE PASSWORD Operation: <br />The values you specified for New Password are not identical. <br />Please try again or contact an Administrator."
            End If
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the CHANGE PASSWORD Operation: <br />The Old Password you specified does not match our records. <br />Please try again or contact an Administrator."
        End If
    End Sub
End Class
