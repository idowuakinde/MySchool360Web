
Partial Class modules_reports_rpt_HR_AllStaffSummary
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double, total2 As Double, total3 As Double, total4 As Double, total5 As Double, total6 As Double, total7 As Double, total8 As Double, total9 As Double, total10 As Double, total11 As Double, total12 As Double, total13 As Double, total14 As Double, total15 As Double, total16 As Double, total17 As Double, total18 As Double, total19 As Double, total20 As Double, total21 As Double, total22 As Double, total23 As Double

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'total += rowView("Basic").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

End Class
