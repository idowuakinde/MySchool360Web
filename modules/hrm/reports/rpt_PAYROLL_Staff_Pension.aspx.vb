
Partial Class modules_reports_rpt_PAYROLL_Staff_Pension
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double
    Public activeMonth As Int32, activeYear As Int32

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("Pension").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId, a.StaffCode, a.StaffName, c.LocationName, d.JobLevelName, a.Pension FROM dbo.VW_HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode INNER JOIN dbo.HR_Location c ON b.LocationId = c.LocationId INNER JOIN dbo.HR_JobLevel d ON b.JobLevelId = d.JobLevelId WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY a.StaffName "
    End Sub
End Class
