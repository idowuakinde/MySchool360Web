
Partial Class modules_system_setups_metadata_managemodules
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub gvUsers_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvUsers.RowEditing
        Dim objGridView As GridView = CType(sender, GridView)
        objGridView.SelectedIndex = e.NewEditIndex
        objGridView = Nothing
    End Sub
End Class
