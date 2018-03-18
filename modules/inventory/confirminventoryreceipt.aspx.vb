
Partial Class modules_inventory_confirminventoryreceipt
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
                With e.Row.Parent.Parent.Parent.Parent
                    CType(.FindControl("btnConfirmBatch"), Button).Enabled = False : CType(.FindControl("btnConfirmBatch"), Button).Text = "   THIS BATCH HAS BEEN CONFIRMED   "
                    CType(.FindControl("btnConfirmBatch0"), Button).Enabled = False : CType(.FindControl("btnConfirmBatch0"), Button).Text = "   THIS BATCH HAS BEEN CONFIRMED   "
                End With
            End If
        End If
    End Sub

    Protected Sub gvMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMaster.SelectedIndexChanged
        For Each gvRow As GridViewRow In gvMaster.Rows
            gvRow.FindControl("gvDetail").Visible = False
            gvRow.FindControl("btnConfirmBatch").Visible = False
            gvRow.FindControl("btnConfirmBatch0").Visible = False
        Next
        dsSqlGetDetail.SelectParameters(0).DefaultValue = gvMaster.SelectedDataKey(0).ToString
        dsSqlGetDetail.DataBind()
        CType(gvMaster.SelectedRow.FindControl("gvDetail"), GridView).DataBind()

        If CType(gvMaster.SelectedRow.FindControl("gvDetail"), GridView).Rows.Count = 0 Then
        Else
            gvMaster.SelectedRow.FindControl("gvDetail").Visible = True
            gvMaster.SelectedRow.FindControl("btnConfirmBatch").Visible = True
            gvMaster.SelectedRow.FindControl("btnConfirmBatch0").Visible = True
        End If
    End Sub

    Protected Sub btnConfirmBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim username As String = Common.DecodeHTML(Request.Cookies("User")("Username")).Replace("'", "''")

        Dim sqlUpdate As String = " UPDATE dbo.INVENTORY_InventoryBatch "
        sqlUpdate &= "              SET InventoryBatchConfirmStatus = 'RECEIVED', "
        sqlUpdate &= "                  InventoryBatchConfirmUsername = '" & username & "', "
        sqlUpdate &= "                  InventoryBatchConfirmTimeStamp = '" & Now() & "' "
        sqlUpdate &= "              WHERE InventoryBatchId = " & gvMaster.SelectedValue & " "
        Call Common.UpdateTableRow(sqlUpdate)

        're-bind the inner grid to update the text values of the action buttons
        CType(gvMaster.SelectedRow.FindControl("gvDetail"), GridView).DataBind()
    End Sub

    Protected Sub btnConfirmBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Call btnConfirmBatch_Click(sender, e)
    End Sub
End Class
