
Partial Class modules_inventory_recordinventorytransfer
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0
    Public serialInner As Int32 = 0, totalQuantityInner As Int32 = 0, totalValueInner As Double = 0

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        'Me.DetailsView1.DataBind()
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

        End If
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialInner += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            totalQuantityInner += CType(rowView("Quantity"), Int32)
            totalValueInner += CType(rowView("Quantity"), Int32) * CType(rowView("ValuePerUnit"), Double)
            If CType(rowView("InventoryBatchConfirmStatus"), String).ToUpper = "RECEIVED" Then
                e.Row.Cells(0).Text = ""    ' disable the Delete icon for this row
                e.Row.Cells(1).Text = ""    ' disable the Edit link for this row

                With e.Row.Parent.Parent.Parent.Parent
                    .FindControl("lblAddNew").Visible = False
                    .FindControl("DetailsView1").Visible = False
                End With
            End If
        End If
    End Sub

    Protected Sub gvMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMaster.SelectedIndexChanged
        For Each gvRow As GridViewRow In gvMaster.Rows
            gvRow.FindControl("gvDetail").Visible = False
            gvRow.FindControl("lblAddNew").Visible = False
            gvRow.FindControl("DetailsView1").Visible = False
        Next
        dsSqlGetDetail.SelectParameters(0).DefaultValue = gvMaster.SelectedDataKey(0).ToString
        dsSqlGetDetail.DataBind()
        gvMaster.SelectedRow.FindControl("gvDetail").Visible = True
        gvMaster.SelectedRow.FindControl("lblAddNew").Visible = True
        gvMaster.SelectedRow.FindControl("DetailsView1").Visible = True
    End Sub

    Protected Sub DetailsViewItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)
        gvMaster.SelectedRow.FindControl("gvDetail").DataBind()
    End Sub

    Protected Sub dsSqlGetDetail_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlGetDetail.Updating
        'Dim colParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'For Each p As System.Data.Common.DbParameter In colParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next

        ''e.Cancel = True
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs)
        e.Values("InventoryBatchTransferTimeStamp") = Now()
    End Sub
End Class
