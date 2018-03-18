
Partial Class modules_hrm_hrm_all
    Inherits System.Web.UI.Page

    Public userRole As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        userRole = Request.Cookies("User")("RoleName")
    End Sub
End Class
