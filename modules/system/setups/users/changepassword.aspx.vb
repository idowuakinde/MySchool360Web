Imports System.Data

Partial Class modules_system_setups_users_changepassword
    Inherits System.Web.UI.Page

    Public username As String = "", oldPassword As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        Dim rowPassword As DataRowCollection = Common.GetTableRows(" SELECT [Password] FROM dbo.Core_User WHERE Username = '" & username & "' ")

        oldPassword = CType(rowPassword(0).Item(0), String)

        'close this object
        rowPassword = Nothing
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSave.Click
        'check for correctness of oldpassword. Otherwise, display error
        'If correct, check that newpassword1 and newpassword2 are identical. Otherwise, display error
        If Me.txtOldPassword.Text = oldPassword Then
            If txtNewPassword.Text = txtNewPassword2.Text Then
                Dim updateReturnCode As Int32 = Common.UpdateTableRow(" UPDATE dbo.Core_User SET [Password] = '" & txtNewPassword.Text & "' WHERE Username = '" & username & "' ")
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
