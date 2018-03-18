
Partial Class modules_system_setups_metadata_manageroles
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.gvUsers.DataBind()
    End Sub
End Class
