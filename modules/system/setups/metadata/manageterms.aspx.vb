
Partial Class modules_system_setups_metadata_manageterms
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub gvUsers_RowCancelingEdit(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCancelEditEventArgs) Handles gvUsers.RowCancelingEdit
        Me.DetailsView1.Enabled = True
    End Sub

    Protected Sub gvUsers_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs) Handles gvUsers.RowEditing
        Me.DetailsView1.Enabled = False
    End Sub

    Protected Sub gvUsers_RowUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewUpdatedEventArgs) Handles gvUsers.RowUpdated
        Me.DetailsView1.Enabled = True
    End Sub
End Class
