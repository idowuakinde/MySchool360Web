
Partial Class modules_inventory_sell_inventory
    Inherits System.Web.UI.Page

    Public serial As Int32, totalUnits As Double, totalValue As Double

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            serial += 1
            totalUnits += CType(rowView("Quantity"), Double)
            totalValue += CType(rowView("Quantity"), Double) * CType(rowView("ValuePerUnit"), Double)
        Else
            'do nothing
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        e.Values("InventorySaleTimeStamp") = Now()
    End Sub

    'Protected Sub dsSqlInventorySales_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlInventorySales.Inserting
    '    Dim colParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

    '    For Each param As System.Data.Common.DbParameter In colParams
    '        Trace.Warn(param.ParameterName, param.Value)
    '    Next
    'End Sub
End Class
