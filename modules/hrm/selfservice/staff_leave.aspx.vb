
Partial Class modules_selfservice_staff_leave
    Inherits System.Web.UI.Page

    Public serial As Int32
    Public startDate_year As DropDownList, startDate_month As DropDownList, startDate_day As DropDownList, startDate_label As Label
    Public endDate_year As DropDownList, endDate_month As DropDownList, endDate_day As DropDownList, endDate_label As Label

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'start date'
        startDate_year = CType(DetailsView1.FindControl("ddlDateStart_Year"), DropDownList)
        startDate_month = CType(DetailsView1.FindControl("ddlDateStart_Month"), DropDownList)
        startDate_day = CType(DetailsView1.FindControl("ddlDateStart_Day"), DropDownList)
        'end date
        endDate_year = CType(DetailsView1.FindControl("ddlDateEnd_Year"), DropDownList)
        endDate_month = CType(DetailsView1.FindControl("ddlDateEnd_Month"), DropDownList)
        endDate_day = CType(DetailsView1.FindControl("ddlDateEnd_Day"), DropDownList)
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'month/day/year
        startDate_label = CType(DetailsView1.FindControl("lblStartDate"), Label)
        startDate_label.Text = MonthName(startDate_month.SelectedValue, True).ToUpper & "/" & startDate_day.SelectedValue & "/" & startDate_year.SelectedValue

        'month/day/year
        endDate_label = CType(DetailsView1.FindControl("lblEndDate"), Label)
        endDate_label.Text = MonthName(endDate_month.SelectedValue, True).ToUpper & "/" & endDate_day.SelectedValue & "/" & endDate_year.SelectedValue
    End Sub
End Class
