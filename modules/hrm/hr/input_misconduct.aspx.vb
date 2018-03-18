
Partial Class modules_hr_input_misconduct
    Inherits System.Web.UI.Page
    Public actionDate_year As DropDownList, actionDate_month As DropDownList, actionDate_day As DropDownList, actionDate_label As Label
    Public startDate_year As DropDownList, startDate_month As DropDownList, startDate_day As DropDownList, startDate_label As Label
    Public endDate_year As DropDownList, endDate_month As DropDownList, endDate_day As DropDownList, endDate_label As Label

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'action date
        actionDate_year = CType(DetailsView1.FindControl("ddlDateAction_Year"), DropDownList)
        actionDate_month = CType(DetailsView1.FindControl("ddlDateAction_Month"), DropDownList)
        actionDate_day = CType(DetailsView1.FindControl("ddlDateAction_Day"), DropDownList)
        'start date
        startDate_year = CType(DetailsView1.FindControl("ddlDateStart_Year"), DropDownList)
        startDate_month = CType(DetailsView1.FindControl("ddlDateStart_Month"), DropDownList)
        startDate_day = CType(DetailsView1.FindControl("ddlDateStart_Day"), DropDownList)
        'end date
        endDate_year = CType(DetailsView1.FindControl("ddlDateEnd_Year"), DropDownList)
        endDate_month = CType(DetailsView1.FindControl("ddlDateEnd_Month"), DropDownList)
        endDate_day = CType(DetailsView1.FindControl("ddlDateEnd_Day"), DropDownList)

        'Me.gvUsers.DataBind()
        'Me.DetailsView1.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'month/day/year
        actionDate_label = CType(DetailsView1.FindControl("lblActionDate"), Label)
        actionDate_label.Text = MonthName(actionDate_month.SelectedValue, True).ToUpper & "/" & actionDate_day.SelectedValue & "/" & actionDate_year.SelectedValue

        'month/day/year
        startDate_label = CType(DetailsView1.FindControl("lblStartDate"), Label)
        startDate_label.Text = MonthName(startDate_month.SelectedValue, True).ToUpper & "/" & startDate_day.SelectedValue & "/" & startDate_year.SelectedValue

        'month/day/year
        endDate_label = CType(DetailsView1.FindControl("lblEndDate"), Label)
        endDate_label.Text = MonthName(endDate_month.SelectedValue, True).ToUpper & "/" & endDate_day.SelectedValue & "/" & endDate_year.SelectedValue
    End Sub

    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        'Response.Write("'" & Me.DropDownList4.SelectedValue & "'") : Response.End()
        If Me.DropDownList4.SelectedValue <> "0" Then
            Me.gvUsers.Visible = True
            Me.DetailsView1.Visible = True
        Else
            Me.gvUsers.Visible = False
            Me.DetailsView1.Visible = False
        End If
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        'Me.gvUsers.DataBind()
        'Me.DetailsView1.DataBind()
    End Sub
End Class
