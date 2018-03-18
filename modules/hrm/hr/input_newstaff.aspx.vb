
Partial Class modules_hr_input_newstaff
    Inherits System.Web.UI.Page
    Public employDate_year As DropDownList, employDate_month As DropDownList, employDate_day As DropDownList, employDate_label As Label
    Public birthDate_year As DropDownList, birthDate_month As DropDownList, birthDate_day As DropDownList, birthDate_label As Label
    Public staffCode_dept As DropDownList, staffCode_branch As DropDownList, staffCode_designation As DropDownList, staffCode_label As Label

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'employment date
        employDate_year = CType(DetailsView1.FindControl("ddlDateEmploy_Year"), DropDownList)
        For k As Int32 = Year(Now) To Year(Now) - 50 Step -1
            employDate_year.Items.Add(k)
        Next

        employDate_month = CType(DetailsView1.FindControl("ddlDateEmploy_Month"), DropDownList)

        employDate_day = CType(DetailsView1.FindControl("ddlDateEmploy_Day"), DropDownList)
        For l As Int32 = 1 To 31
            employDate_day.Items.Add(l)
        Next

        'birth date
        birthDate_year = CType(DetailsView1.FindControl("ddlDateBirth_Year"), DropDownList)
        For m As Int32 = Year(Now) - 10 To Year(Now) - 100 Step -1
            birthDate_year.Items.Add(m)
        Next

        birthDate_month = CType(DetailsView1.FindControl("ddlDateBirth_Month"), DropDownList)

        birthDate_day = CType(DetailsView1.FindControl("ddlDateBirth_Day"), DropDownList)
        For n As Int32 = 1 To 31
            birthDate_day.Items.Add(n)
        Next
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.DetailsView1.DataBind()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        staffCode_dept = CType(DetailsView1.FindControl("dropDownList5"), DropDownList)
        staffCode_branch = CType(DetailsView1.FindControl("dropDownList8"), DropDownList)
        staffCode_designation = CType(DetailsView1.FindControl("dropDownList6"), DropDownList)
        staffCode_label = CType(DetailsView1.FindControl("lblStaffCode"), Label)
        'staffCode_label.Text = Left(staffCode_branch.SelectedItem.Text.ToUpper, 3) & "-" & Left(staffCode_dept.SelectedItem.Text.ToUpper, 3) & "-" & Left(staffCode_designation.SelectedItem.Text.ToUpper, 3) & "-" & employDate_year.SelectedValue & "-" & "001"
        '1st 2 xters - (location abbr) + next 2 xters - (dept ext code) + next 3 xters - (serial number) + "-" + next 2 xters (year of empl) 
        staffCode_label.Text = Common.GetLocationAbbreviation(staffCode_branch.SelectedValue) & Common.GetDepartmentAbbreviation(staffCode_dept.SelectedValue) & Common.PadNumber((Common.GetMaxStaffId + 1), 3) & "-" & Right(employDate_year.SelectedValue, 2)
        'month / day / year
        birthDate_label = CType(DetailsView1.FindControl("lblBirthDate"), Label)
        birthDate_label.Text = MonthName(birthDate_month.SelectedValue, True).ToUpper & "/" & birthDate_day.SelectedValue & "/" & birthDate_year.SelectedValue
        employDate_label = CType(DetailsView1.FindControl("lblEmployDate"), Label)
        employDate_label.Text = MonthName(employDate_month.SelectedValue, True).ToUpper & "/" & employDate_day.SelectedValue & "/" & employDate_year.SelectedValue
    End Sub
End Class
