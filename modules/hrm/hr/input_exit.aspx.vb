
Partial Class modules_hr_input_exit
    Inherits System.Web.UI.Page

    Public actionDate_year As DropDownList, actionDate_month As DropDownList, actionDate_day As DropDownList, actionDate_label As Label

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'action date
        actionDate_year = CType(DetailsView1.FindControl("ddlDateAction_Year"), DropDownList)
        actionDate_month = CType(DetailsView1.FindControl("ddlDateAction_Month"), DropDownList)
        actionDate_day = CType(DetailsView1.FindControl("ddlDateAction_Day"), DropDownList)

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
