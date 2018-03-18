
Partial Class modules_hr_edit_staff
    Inherits System.Web.UI.Page

    Public serial As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        dsoUsers.SelectCommand = "SELECT [StaffId], [StaffGUID], [StaffCode], [MaritalStatus], CAST(IsNull([WeddingDate], 0) AS DATETIME) AS WeddingDate, [Gender], [DateOfBirth], [ConfirmationStatus], [RetirementStatus], [Surname], [OtherNames], [Department], b.DepartmentName AS DepartmentName, CAST(IsNull([DateOfEmployment], 0) AS DATETIME) AS DateOfEmployment, [Email], a.[DesignationId], c.DesignationName, a.[JobLevelId], d.JobLevelName, a.[LocationId], e.LocationName, [Residence], [PermanentResidence], [Telephone], a.[ReligionId], f.ReligionName, [Hometown], a.[LGAOfOriginId], g.LgaName + ' LGA (' + h.StateName + ')' AS LgaName, a.[BankId], i.BankName, [BankAccountNumber], [Visa], [EyeColour], [Height], [Weight], [TrouserLength], [ShoeSize], [BloodGroup], [Genotype], [Hobbies], a.[AreaOfInterest], [VisaType], [Coop_MonthlyDeduction], [Coop_LoanRepayment], [MaxMedical], [NextOfKinName], [NextOfKinAddress], [NextOfKinRelationship] FROM [dbo].[HR_Staff_Base] a INNER JOIN dbo.[Core_Department] b ON a.Department = b.DepartmentCode LEFT JOIN dbo.[HR_Designation] c ON a.DesignationId = c.DesignationId LEFT JOIN dbo.[HR_JobLevel] d ON a.JobLevelId = d.JobLevelId LEFT JOIN dbo.[HR_Location] e ON a.LocationId = e.LocationId LEFT JOIN dbo.[HR_Religion] f ON a.ReligionId = f.ReligionId LEFT JOIN dbo.[Core_Lga] g ON a.LgaOfOriginId = g.LgaId LEFT JOIN dbo.[Core_State] h ON g.StateId = h.StateId LEFT JOIN dbo.[HR_Bank] i ON a.BankId = i.BankId ORDER BY Surname, OtherNames"
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        SetGridSource(Me.txtSearch.Text)
    End Sub

    Private Sub SetGridSource(ByVal searchText As String)
        Me.dsoUsers.SelectCommand = "SELECT [StaffId], [StaffGUID], [StaffCode], [MaritalStatus], CAST(IsNull([WeddingDate], 0) AS DATETIME) AS WeddingDate, [Gender], [DateOfBirth], [ConfirmationStatus], [RetirementStatus], [Surname], [OtherNames], [Department], b.DepartmentName AS DepartmentName, CAST(IsNull([DateOfEmployment], 0) AS DATETIME) AS DateOfEmployment, [Email], a.[DesignationId], c.DesignationName, a.[JobLevelId], d.JobLevelName, a.[LocationId], e.LocationName, [Residence], [PermanentResidence], [Telephone], a.[ReligionId], f.ReligionName, [Hometown], a.[LGAOfOriginId], g.LgaName + ' LGA (' + h.StateName + ')' AS LgaName, a.[BankId], i.BankName, [BankAccountNumber], [Visa], [EyeColour], [Height], [Weight], [TrouserLength], [ShoeSize], [BloodGroup], [Genotype], [Hobbies], a.[AreaOfInterest], [VisaType], [Coop_MonthlyDeduction], [Coop_LoanRepayment], [MaxMedical], [NextOfKinName], [NextOfKinAddress], [NextOfKinRelationship] FROM [dbo].[HR_Staff_Base] a INNER JOIN dbo.[Core_Department] b ON a.Department = b.DepartmentCode LEFT JOIN dbo.[HR_Designation] c ON a.DesignationId = c.DesignationId LEFT JOIN dbo.[HR_JobLevel] d ON a.JobLevelId = d.JobLevelId LEFT JOIN dbo.[HR_Location] e ON a.LocationId = e.LocationId LEFT JOIN dbo.[HR_Religion] f ON a.ReligionId = f.ReligionId LEFT JOIN dbo.[Core_Lga] g ON a.LgaOfOriginId = g.LgaId LEFT JOIN dbo.[Core_State] h ON g.StateId = h.StateId LEFT JOIN dbo.[HR_Bank] i ON a.BankId = i.BankId WHERE (a.StaffCode LIKE '%" & searchText & "%' OR a.Surname LIKE '%" & searchText & "%' OR a.OtherNames LIKE '%" & searchText & "%') ORDER BY Surname, OtherNames"
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'total += rowView("Pension").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub
End Class
