
Partial Class modules_reports_rpt_PAYROLL_Staff_PaySlip_Small
    Inherits System.Web.UI.Page

    Public activeMonth As Int32, activeYear As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        dsSqlGetData.SelectCommand = "SELECT b.PayrollArchiveId, b.EffectiveMonth, b.EffectiveYear, b.StaffId as StaffId, b.StaffCode as StaffCode, b.StaffName, IsNull(c.JobLevelName, '') + ' (' + e.DesignationName + ')' as DesignationName, IsNull(d.LocationName, '') AS LocationName, IsNull(a.Department, '') as DepartmentName, b.[Basic], b.Functional, b.NiteShift, b.Overtime1, b.Overtime2, b.OtherTaxable, b.HousingTaxable, b.TransportTaxable, b.HousingNonTaxable, b.TransportNonTaxable, b.Lunch, b.Clothing, b.Utility, b.PAYE, b.Loan, b.UnionDues, b.FOBTOB, b.COOP, b.OtherDeduction, b.Pension, b.TotalTaxablePay, b.TotalNonTaxablePay, b.TotalDeduction as TotalDeductions FROM dbo.VW_HR_PAYROLL_Archive_Shadow b INNER JOIN dbo.HR_Staff_Base a ON b.StaffCode = a.StaffCode INNER JOIN dbo.HR_JobLevel c ON a.JobLevelId = c.JobLevelId INNER JOIN dbo.HR_Location d ON a.LocationId = d.LocationId INNER JOIN dbo.HR_Designation e ON a.DesignationId = e.DesignationId WHERE b.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY b.StaffName "
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        SetGridSource(Me.txtSearch.Text)
    End Sub

    Private Sub SetGridSource(ByVal searchText As String)
        Me.dsSqlGetData.SelectCommand = "SELECT b.PayrollArchiveId, b.EffectiveMonth, b.EffectiveYear, b.StaffId as StaffId, b.StaffCode as StaffCode, b.StaffName, IsNull(c.JobLevelName, '') + ' (' + e.DesignationName + ')' as DesignationName, IsNull(d.LocationName, '') AS LocationName, IsNull(a.Department, '') as DepartmentName, b.[Basic], b.Functional, b.NiteShift, b.Overtime1, b.Overtime2, b.OtherTaxable, b.HousingTaxable, b.TransportTaxable, b.HousingNonTaxable, b.TransportNonTaxable, b.Lunch, b.Clothing, b.Utility, b.PAYE, b.Loan, b.UnionDues, b.FOBTOB, b.COOP, b.OtherDeduction, b.Pension, b.TotalTaxablePay, b.TotalNonTaxablePay, b.TotalDeduction as TotalDeductions FROM dbo.VW_HR_PAYROLL_Archive_Shadow b INNER JOIN dbo.HR_Staff_Base a ON b.StaffCode = a.StaffCode INNER JOIN dbo.HR_JobLevel c ON a.JobLevelId = c.JobLevelId INNER JOIN dbo.HR_Location d ON a.LocationId = d.LocationId INNER JOIN dbo.HR_Designation e ON a.DesignationId = e.DesignationId WHERE b.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " AND (b.StaffCode LIKE '%" & searchText & "%' OR b.StaffName LIKE '%" & searchText & "%') ORDER BY b.StaffName "
    End Sub
End Class
