
Partial Class modules_payments_fees_history
    Inherits System.Web.UI.Page

    Public serialNumber As Int32
    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
        End If
    End Sub
End Class
