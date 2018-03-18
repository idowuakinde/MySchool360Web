
Partial Class modules_reports_rpt_PAYROLL_Staff_SpecialDeductions
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double
    Public activeMonth As Int32, activeYear As Int32

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("Amount").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        dsSqlGetData.SelectCommand = "SELECT a.SpecialDeductionId as PayrollArchiveId, b.StaffCode, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName, a.Amount, a.Purpose FROM dbo.HR_PAYROLL_Staff_Special_Deduction_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffId = b.StaffId WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY a.StaffName"
    End Sub

End Class
