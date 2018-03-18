
Partial Class modules_reports_rpt_Prov_Coop
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double, total2 As Double, total3 As Double, total4 As Double

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("FresherFee").ToString
            total2 += rowView("MonthlyContribution").ToString
            total3 += rowView("LoanDeduction").ToString
            total4 += rowView("TotalDeduction").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim activemonth As Int32 = CType(Request.QueryString("a"), Int32)
        dsSqlGetData.SelectCommand = "SELECT a.StaffCoopDeductionId as PayrollArchiveId, b.StaffCode, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName, IsNull(a.FresherFee, 0) AS FresherFee, IsNUll(a.MonthlyContribution, 0) AS MonthlyContribution, IsNull(a.LoanDeduction, 0) AS LoanDeduction, (IsNull(a.FresherFee, 0) + IsNUll(a.MonthlyContribution, 0) + IsNull(a.LoanDeduction, 0)) AS TotalDeduction FROM dbo.HR_PAYROLL_Staff_Coop a INNER JOIN dbo.HR_Staff_Base b ON a.Remark = b.StaffCode WHERE EffectiveMonth = " & activemonth & " AND EffectiveYear = year(getdate()) ORDER BY a.StaffName "
    End Sub
End Class
