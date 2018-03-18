
Partial Class modules_inventory_inspect_asset
    Inherits System.Web.UI.Page

    Public serial As Int32

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            'Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            serial += 1
        Else
            'do nothing
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        e.Values("AssetInspectionTimeStamp") = Now()
    End Sub
End Class
