
Partial Class modules_reports_rpt_Prov_SpecialAllowances
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double

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
        Dim activeMonth As Int32 = CType(Request.QueryString("a"), Int32)
        dsSqlGetData.SelectCommand = "SELECT a.SpecialAllowanceId as PayrollArchiveId, b.StaffCode, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName, a.Amount, a.Purpose FROM dbo.HR_PAYROLL_Staff_Special_Allowance a INNER JOIN dbo.HR_Staff_Base b ON a.Remark = b.StaffCode WHERE a.EffectiveMonth = " & activeMonth & " AND a.EffectiveYear = Year(GetDate()) ORDER BY a.StaffName "
    End Sub
End Class
