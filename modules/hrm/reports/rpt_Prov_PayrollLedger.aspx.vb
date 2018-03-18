
Partial Class modules_reports_rpt_Prov_PayrollLedger
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double, total2 As Double, total3 As Double, total4 As Double, total5 As Double, total6 As Double, total7 As Double, total8 As Double, total9 As Double, total10 As Double, total11 As Double, total12 As Double, total13 As Double, total14 As Double, total15 As Double, total16 As Double, total17 As Double, total18 As Double, total19 As Double, total20 As Double, total21 As Double, total22 As Double, total23 As Double

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("Basic").ToString
            total2 += rowView("Functional").ToString
            total3 += rowView("Overtime1").ToString
            total4 += rowView("Overtime2").ToString
            total5 += rowView("OtherTaxable").ToString
            total6 += rowView("TaxableHousing").ToString
            total7 += rowView("TaxableTransport").ToString
            total8 += rowView("Housing").ToString
            total9 += rowView("Transport").ToString
            total10 += rowView("Lunch").ToString
            total11 += rowView("Clothing").ToString
            total12 += rowView("Utility").ToString
            total13 += rowView("NightShift").ToString
            total14 += rowView("PAYE").ToString
            total15 += rowView("Loan").ToString
            total16 += rowView("UnionDues").ToString
            total17 += rowView("FOBTOB").ToString
            total18 += rowView("COOP").ToString
            total19 += rowView("OtherDeduction").ToString
            total20 += rowView("Pension").ToString
            total21 += rowView("GrossPay").ToString
            total22 += rowView("TotalDed").ToString
            total23 += rowView("NetPay").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim activeMonth As Int32 = CType(Request.QueryString("a"), Int32)
        dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId, b.staffid as StaffId, b.StaffCode as StaffCode, LTRIM(a.StaffName) as StaffName, [Basic], Functional, Overtime1, Overtime2, OtherTaxable, HousingTaxable as TaxableHousing, TransportTaxable as TaxableTransport, HousingNonTaxable as Housing, TransportNonTaxable as Transport, Lunch, Clothing, Utility, NiteShift as NightShift, PAYE, Loan, UnionDues, FOBTOB, COOP, OtherDeduction, Pension, (TotalTaxablePay + TotalNonTaxablePay) as grosspay, TotalDeduction as totalded, (TotalTaxablePay + TotalNonTaxablePay - TotalDeduction) as netpay FROM dbo.VW_HR_PAYROLL_PROVISIONAL_Archive a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = Year(GetDate()) ORDER BY a.StaffName  "
    End Sub
End Class
