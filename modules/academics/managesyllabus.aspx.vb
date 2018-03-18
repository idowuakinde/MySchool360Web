
Partial Class modules_system_setups_metadata_managesyllabus
    Inherits System.Web.UI.Page

    Public serial As Int32, username As String
    Public termName As String = "3rd Term", sessionName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")

        If Request.QueryString("c") = "" Then
            sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        Else
            sessionName = Request.QueryString("c")
        End If

        Me.lblHeader.Text = ":: View/Edit Existing Lesson Notes for " & termName.ToUpper & " " & sessionName.ToUpper & " Session"
        If Not Me.IsPostBack Then
            'Me.dsSqlSubjects.SelectCommand = "SELECT DISTINCT a.[UserId], b.Username, a.[SubjectId], c.SubjectName, c.ShortName FROM [dbo].[TEMPUserSubject] a INNER JOIN dbo.Core_User b ON a.UserId = b.UserId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId WHERE b.Username = @Username ORDER BY c.SubjectName "
            Me.dsSqlSubjects.SelectCommand = "SELECT DISTINCT a.[UserId], b.Username, a.ClassName, a.[SubjectId], c.SubjectName, c.ShortName FROM [dbo].[TEMPUserSubject] a INNER JOIN dbo.Core_User b ON a.UserId = b.UserId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId WHERE b.Username = @Username ORDER BY a.ClassName, c.SubjectName "
            Me.dsSqlSubjects.SelectParameters.Add(New QueryStringParameter("Username", "a"))
        End If
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        serial += 1
    End Sub

    Protected Sub gvMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMaster.SelectedIndexChanged
        Session("SubjectId") = gvMaster.SelectedValue
        Session("SubjectName") = GetSubjectName(Session("SubjectId"))
        Session("ClassName") = gvMaster.SelectedDataKey(1).ToString
        For Each gvRow As GridViewRow In gvMaster.Rows
            gvRow.FindControl("gvDetail").Visible = False
            gvRow.FindControl("lblAddNew").Visible = False
            gvRow.FindControl("dvSubjectSyllabus").Visible = False
        Next
        dsSqlSyllabus.SelectParameters(0).DefaultValue = gvMaster.SelectedDataKey(0).ToString
        dsSqlSyllabus.SelectParameters(1).DefaultValue = gvMaster.SelectedDataKey(1).ToString
        dsSqlSyllabus.SelectParameters(2).DefaultValue = termName
        dsSqlSyllabus.SelectParameters(3).DefaultValue = sessionName
        dsSqlSyllabus.DataBind()
        gvMaster.SelectedRow.FindControl("gvDetail").Visible = True
        gvMaster.SelectedRow.FindControl("lblAddNew").Visible = True : CType(gvMaster.SelectedRow.FindControl("lblAddNew"), Label).Text = "Add a New Lesson Note for " & Session("SubjectName") & " (" & Session("ClassName") & ") "
        gvMaster.SelectedRow.FindControl("dvSubjectSyllabus").Visible = True 'CType(CType(gvMaster.SelectedRow.FindControl("dvSubjectSyllabus"), DetailsView).FindControl("txtAddClass"), TextBox).Text = gvMaster.SelectedDataKey(1).ToString
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        ''Me.dsSqlSubjects.UpdateParameters(1).DefaultValue = CType(CType(sender, GridView).Rows(e.RowIndex).FindControl("txtSubjectCommentEdit"), TextBox).Text
        ''Me.dsSqlSyllabus.SelectParameters(0).DefaultValue = "Year 10"
        'Me.dsSqlSyllabus.SelectParameters(0).DefaultValue = CType(gvMaster.Rows(gvMaster.SelectedRow.RowIndex).FindControl("lblClassName"), Label).Text
    End Sub

    Private Function GetSubjectName(ByVal subjectId As Int32) As String
        Dim ret As String
        Dim rows As System.Data.DataRowCollection = Common.GetTableRows("SELECT SubjectName FROM dbo.TEMPSubject WHERE SubjectId = '" & subjectId & "'")

        ret = rows(0).Item("SubjectName").ToString

        Return ret
    End Function

    Protected Sub DetailsViewItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs)
        gvMaster.SelectedRow.FindControl("gvDetail").DataBind()
    End Sub

    Protected Sub dsSqlSyllabus_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs) Handles dsSqlSyllabus.Inserted
        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, IsDBNull(p.Value))
        'Next
    End Sub

    Protected Sub dsSqlSyllabus_Inserting(sender As Object, e As SqlDataSourceCommandEventArgs) Handles dsSqlSyllabus.Inserting
        e.Command.Parameters("@Remark2").Value = sessionName
    End Sub

    Protected Sub dsSqlSyllabus_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlSyllabus.Updating
        e.Command.Parameters("@Remark").Value = termName
        e.Command.Parameters("@Remark2").Value = sessionName
    End Sub
End Class
