
Partial Class modules_reports_rpt_PAYROLL_Staff_Taxes_Location
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double
    Public activeMonth As Int32, activeYear As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        Select Case ddlChooser.SelectedValue
            Case "0"
                dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId AS PayrollArchiveId, a.StaffCode, UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,'') AS StaffName, c.LocationName + ' (' + e.StateName + ')' as LocationName, d. JobLevelName, IsNull(a.PAYE, 0) AS PAYE FROM dbo.HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode INNER JOIN dbo.HR_Location c ON b.LocationId = c.LocationId INNER JOIN dbo.HR_JobLevel d ON b.JobLevelId = d.JobLevelId INNER JOIN dbo.Core_State e ON c.StateId = e.StateId WHERE EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY a.StaffName "
            Case Else
                dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId AS PayrollArchiveId, a.StaffCode, UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,'') AS StaffName, c.LocationName + ' (' + e.StateName + ')' as LocationName, d. JobLevelName, IsNull(a.PAYE, 0) AS PAYE FROM dbo.HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode INNER JOIN dbo.HR_Location c ON b.LocationId = c.LocationId INNER JOIN dbo.HR_JobLevel d ON b.JobLevelId = d.JobLevelId INNER JOIN dbo.Core_State e ON c.StateId = e.StateId WHERE EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " AND e.StateId = (SELECT b.StateId FROM dbo.HR_Location a INNER JOIN dbo.Core_State b ON a.StateId = b.StateId WHERE a.LocationName = @LocationName) ORDER BY a.StaffName "
        End Select
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("PAYE").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub
End Class
