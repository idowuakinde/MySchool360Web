
Partial Class modules_hr_input_career
    Inherits System.Web.UI.Page
    Public effectiveDate_year As DropDownList, effectiveDate_month As DropDownList, effectiveDate_day As DropDownList, effectiveDate_label As Label

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'start date
        effectiveDate_year = CType(DetailsView1.FindControl("ddlDateStart_Year"), DropDownList)
        effectiveDate_month = CType(DetailsView1.FindControl("ddlDateStart_Month"), DropDownList)
        effectiveDate_day = CType(DetailsView1.FindControl("ddlDateStart_Day"), DropDownList)

        'Me.gvUsers.DataBind()
        'Me.DetailsView1.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'month/day/year
        effectiveDate_label = CType(DetailsView1.FindControl("lblStartDate"), Label)
        effectiveDate_label.Text = MonthName(effectiveDate_month.SelectedValue, True).ToUpper & "/" & effectiveDate_day.SelectedValue & "/" & effectiveDate_year.SelectedValue
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
End Class
