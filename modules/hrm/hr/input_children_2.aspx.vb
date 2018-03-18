
Partial Class modules_hr_input_children_2
    Inherits System.Web.UI.Page
    Public gvDetail As GridView
    Public birthDate_year As DropDownList, birthDate_month As DropDownList, birthDate_day As DropDownList, birthDate_label As Label

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
        'birth date
        birthDate_year = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateBirth_Year"), DropDownList)
        birthDate_month = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateBirth_Month"), DropDownList)
        birthDate_day = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("ddlDateBirth_Day"), DropDownList)
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        'month/day/year
        birthDate_label = CType(CType(gvMaster.Rows(gvMaster.SelectedIndex).FindControl("DetailsView1"), DetailsView).FindControl("lblBirthDate"), Label)
        birthDate_label.Text = MonthName(birthDate_month.SelectedValue, True).ToUpper & "/" & birthDate_day.SelectedValue & "/" & birthDate_year.SelectedValue
    End Sub

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        'Me.DetailsView1.DataBind()
    End Sub
End Class
