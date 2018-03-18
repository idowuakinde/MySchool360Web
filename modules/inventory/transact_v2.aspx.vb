
Partial Class modules_inventory_transact_v2
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            If CType(rowView("ActualReturnDate"), Date) = CType("1/1/1900", Date) Then
                'do nothing, therefore draw the "Edit" linkbutton...
                e.Row.BackColor = Drawing.Color.Yellow
            Else
                e.Row.Cells(0).Text = ""
            End If
        Else
            'do nothing
        End If
    End Sub

    Protected Sub dsSqlAssetTransaction_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlAssetTransaction.Inserting
        If e.Command.Parameters("@ActualReturnDate").Value = "" Then e.Command.Parameters("@ActualReturnDate").Value = CDate("01/01/1900")

        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next
    End Sub

    Protected Sub dsSqlTransaction_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlAssetTransaction.Updating
        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next
    End Sub
End Class
