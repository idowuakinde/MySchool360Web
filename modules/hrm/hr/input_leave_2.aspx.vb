
Partial Class modules_hr_input_leave_2
    Inherits System.Web.UI.Page
    Public gvDetail As GridView
    Public startDate_year As DropDownList, startDate_month As DropDownList, startDate_day As DropDownList, startDate_label As Label
    Public endDate_year As DropDownList, endDate_month As DropDownList, endDate_day As DropDownList, endDate_label As Label

    Protected Sub gvMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMaster.SelectedIndexChanged
        For Each gvRow As GridViewRow In gvMaster.Rows
            gvRow.FindControl("gvDetail").Visible = False
            gvRow.FindControl("lblAddNew").Visible = False
            gvRow.FindControl("DetailsView1").Visible = False
        Next
        dsSqlGetDetail.SelectParameters(0).DefaultValue = gvMaster.SelectedDataKey(0).ToString
        dsSqlGetDetail.DataBind()
        gvMaster.SelectedRow.FindControl("gvDetail").Visible = True
        gvMaster.SelectedRow.FindControl("lblAddNew").Visible = True
        gvMaster.SelectedRow.FindControl("DetailsView1").Visible = True
    End Sub

    Protected Sub DetailsViewItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)
        gvDetail = gvMaster.Rows(gvMaster.SelectedIndex).FindControl("gvDetail")
        gvDetail.DataBind()
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'start date'
        startDate_year = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateStart_Year"), DropDownList)
        startDate_month = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateStart_Month"), DropDownList)
        startDate_day = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateStart_Day"), DropDownList)
        'end date
        endDate_year = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateEnd_Year"), DropDownList)
        endDate_month = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateEnd_Month"), DropDownList)
        endDate_day = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateEnd_Day"), DropDownList)
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'month/day/year
        startDate_label = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("lblStartDate"), Label)
        startDate_label.Text = MonthName(startDate_month.SelectedValue, True).ToUpper & "/" & startDate_day.SelectedValue & "/" & startDate_year.SelectedValue

        'month/day/year
        endDate_label = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("lblEndDate"), Label)
        endDate_label.Text = MonthName(endDate_month.SelectedValue, True).ToUpper & "/" & endDate_day.SelectedValue & "/" & endDate_year.SelectedValue
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        'Me.DetailsView1.DataBind()
    End Sub
End Class
