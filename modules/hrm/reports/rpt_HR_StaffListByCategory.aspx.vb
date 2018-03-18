
Partial Class modules_reports_rpt_HR_StaffListByCategory
    Inherits System.Web.UI.Page
    Public serial As Int32, total As Double, filterText As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case ddlChooser.SelectedValue
            Case "0"
                dsSqlGetData.SelectCommand = "SELECT a.StaffGUID, a.StaffCode, RTRIM(LTRIM(UPPER(IsNull(a.Surname,'')) + ' ' + IsNull(a.OtherNames,''))) AS StaffName, IsNull(Gender, '') as Gender, DateOfBirth, DateOfEmployment, datediff(yy, DateOfEmployment, getdate()) as YearsInService, IsNull(MaritalStatus, '') as MaritalStatus, WeddingDate, a.LocationId, LocationName, a.Department, f.DepartmentName, a.JobLevelId, JobLevelName, a.DesignationId, d.DesignationName, a.LgaOfOriginId, e.LgaName, IsNull(BloodGroup, '') as Bloodgroup, IsNull(Genotype, '') as Genotype, IsNull(AreaOfInterest, '') as AreaOfInterest, IsNull(Hobbies, '') as Hobbies, IsNull(Visa, '') as Challenged FROM dbo.HR_Staff_Base a INNER JOIN dbo.HR_Location b ON a.LocationId = b.LocationId INNER JOIN dbo.HR_JobLevel c ON a.JobLevelId = c.JobLevelId INNER JOIN dbo.HR_Designation d ON a.DesignationId = d.DesignationId INNER JOIN dbo.Core_Lga e ON a.LgaOfOriginId = e.LgaId INNER JOIN dbo.Core_Department f ON a.Department = left(f.DepartmentName, charindex('.', f.DepartmentName) - 1) ORDER BY StaffName  "
            Case Else
                dsSqlGetData.SelectCommand = "SELECT a.StaffGUID, a.StaffCode, RTRIM(LTRIM(UPPER(IsNull(a.Surname,'')) + ' ' + IsNull(a.OtherNames,''))) AS StaffName, IsNull(Gender, '') as Gender, DateOfBirth, DateOfEmployment, datediff(yy, DateOfEmployment, getdate()) as YearsInService, IsNull(MaritalStatus, '') as MaritalStatus, WeddingDate, a.LocationId, LocationName, a.Department, f.DepartmentName, a.JobLevelId, JobLevelName, a.DesignationId, d.DesignationName, a.LgaOfOriginId, e.LgaName, IsNull(BloodGroup, '') as Bloodgroup, IsNull(Genotype, '') as Genotype, IsNull(AreaOfInterest, '') as AreaOfInterest, IsNull(Hobbies, '') as Hobbies, IsNull(Visa, '') as Challenged FROM dbo.HR_Staff_Base a INNER JOIN dbo.HR_Location b ON a.LocationId = b.LocationId INNER JOIN dbo.HR_JobLevel c ON a.JobLevelId = c.JobLevelId INNER JOIN dbo.HR_Designation d ON a.DesignationId = d.DesignationId INNER JOIN dbo.Core_Lga e ON a.LgaOfOriginId = e.LgaId INNER JOIN dbo.Core_Department f ON a.Department = left(f.DepartmentName, charindex('.', f.DepartmentName) - 1) WHERE JobLevelName = @JobLevelName ORDER BY StaffName  "
        End Select
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'total += rowView("PAYE").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub
End Class
