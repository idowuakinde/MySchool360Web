
Partial Class modules_profiles_manage_student_subjects
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0, portalNumber As String
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_LoadComplete(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.LoadComplete
        If Request.QueryString("a") = "" Then
            sessionName = sessionName
        Else
            sessionName = Request.QueryString("a")
        End If

        If Request.QueryString("b") = "" Then
            'fetch all PortalNumbers
        Else
            portalNumber = Request.QueryString("b")
        End If
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            CType(e.Row.Cells(3).Controls(0), LinkButton).Text = "Show " & rowView("LastName") & "'s Subjects"
        End If
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            If Not (rowView("SessionName").ToString.Trim.Contains(sessionName) And rowView("TermName").ToString.Trim.Contains(TermName)) Then
                e.Row.BackColor = Drawing.Color.LightGray
                e.Row.Cells(0).Text = "{Not Editable}"
            End If
        End If
    End Sub

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
        gvMaster.SelectedRow.FindControl("gvDetail").DataBind()
    End Sub

    Protected Sub dsSqlGetDetail_Selecting(sender As Object, e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs) Handles dsSqlGetDetail.Selecting
        e.Command.Parameters(1).Value = sessionName
    End Sub
End Class
