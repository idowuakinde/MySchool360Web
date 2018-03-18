
Partial Class modules_system_setups_metadata_managepromotionexclusions
    Inherits System.Web.UI.Page

    Public sessionName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub dsSqlPromotionExclusions_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlPromotionExclusions.Inserting
        e.Command.Parameters("@SessionName").Value = CType(DetailsView1.FindControl("lblSessionName_Add"), Label).Text
        e.Command.Parameters("@PortalNumber").Value = CType(DetailsView1.FindControl("ddlStudent_Add"), DropDownList).SelectedValue

        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next

        'e.Cancel = True
    End Sub

    Protected Sub dsSqlPromotionExclusions_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlPromotionExclusions.Updating
        e.Command.Parameters("@SessionName").Value = CType(gvUsers.Rows(gvUsers.EditIndex).FindControl("ddlSession_Edit"), DropDownList).SelectedValue
        e.Command.Parameters("@PortalNumber").Value = CType(gvUsers.Rows(gvUsers.EditIndex).FindControl("ddlStudent_Edit"), DropDownList).SelectedValue
    End Sub
End Class
