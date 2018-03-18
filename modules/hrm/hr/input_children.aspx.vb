
Partial Class modules_hr_input_children
    Inherits System.Web.UI.Page
    Public birthDate_year As DropDownList, birthDate_month As DropDownList, birthDate_day As DropDownList, birthDate_label As Label

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        If Me.DropDownList4.SelectedValue <> "0" Then
            Me.gvUsers.Visible = True
            Me.DetailsView1.Visible = True
        Else
            Me.gvUsers.Visible = False
            Me.DetailsView1.Visible = False
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'birth date
        birthDate_year = CType(DetailsView1.FindControl("ddlDateBirth_Year"), DropDownList)
        birthDate_month = CType(DetailsView1.FindControl("ddlDateBirth_Month"), DropDownList)
        birthDate_day = CType(DetailsView1.FindControl("ddlDateBirth_Day"), DropDownList)

        'Me.gvUsers.DataBind()
        'Me.DetailsView1.DataBind()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'month/day/year
        birthDate_label = CType(DetailsView1.FindControl("lblBirthDate"), Label)
        birthDate_label.Text = MonthName(birthDate_month.SelectedValue, True).ToUpper & "/" & birthDate_day.SelectedValue & "/" & birthDate_year.SelectedValue
    End Sub
End Class
