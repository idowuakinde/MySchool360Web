
Partial Class modules_academics_mysyllabus_all_review
    Inherits System.Web.UI.Page

    Public serialLessons As Int32 = 0, serialSubjects As Int32 = 0
    Public termname As String, sessionName As String
    Public className As String
    Public innerGrid As GridView

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            className = Request.QueryString("a")
            Session("ClassName") = className

            termname = Request.QueryString("b")
            sessionName = Request.QueryString("c")
            Me.Label9.Text = ":: LESSON NOTES FOR " & className.ToUpper & ", " & termname.ToUpper & " " & sessionName.ToUpper & " SESSION"
        Else
            className = Session("ClassName")
            Me.gvSubjects.DataBind()

            '''''''javascript:__doPostBack('gvSubjects$ctl05$gvLessonNotes$ctl02$hlnkEdit','')
            If Page.Request.Params("__EVENTTARGET").EndsWith("$hlnkEdit") Then
                Dim gridViewName As String = Page.Request.Params("__EVENTTARGET").Split("$")(0) & "$" & Page.Request.Params("__EVENTTARGET").Split("$")(1) & "$" & Page.Request.Params("__EVENTTARGET").Split("$")(2)

                innerGrid = Me.FindControl(gridViewName)
            ElseIf Page.Request.Params("__EVENTTARGET").EndsWith("$hlnkUpdate") Then
                Dim gridViewName As String = Page.Request.Params("__EVENTTARGET").Split("$")(0) & "$" & Page.Request.Params("__EVENTTARGET").Split("$")(1) & "$" & Page.Request.Params("__EVENTTARGET").Split("$")(2)

                innerGrid = CType(Me.gvSubjects.SelectedRow.FindControl(gridViewName), GridView)
                'Response.Write("'" & "Update click captured..." & "'") : Response.End()
                'Call Update routine...
                Dim rowToUpdate As Int32 = CType(Me.gvSubjects.SelectedRow.FindControl("gvLessonNotes"), GridView).EditIndex    ' innerGrid.EditIndex
                'For i As Int32 = 5 To Request.Form.Count - 1
                '    Response.Write("'" & i + 1 & ". " & Request.Form.Keys(i).ToString & ": " & Request.Form.Item(i).ToString & "'<br />") ': Response.End()
                'Next
                'Response.End()
                Call SaveLessonNoteChanges(Request.Form.Item(5).ToString, Request.Form.Item(6).ToString, Request.Form.Item(7).ToString, Request.Form.Item(8).ToString, Request.Form.Item(9).ToString, Request.Form.Item(10).ToString, Request.Form.Item(11).ToString)
                Me.gvSubjects.DataBind()
            End If
        End If
    End Sub

    Private Function SaveLessonNoteChanges(ByVal intLessonNoteId As String, ByVal intWeekNumber As String, ByVal strlessonNumber As String, ByVal strlessonTopic As String, ByVal strlessonObjectives As String, ByVal strlessonMethod As String, ByVal strlessonHomework As String) As Int32
        Dim updateResponse As Int32

        ''save the comments
        Dim sqlUpdate As String = ""
        sqlUpdate = "      UPDATE dbo.TEMPLessonNote "
        sqlUpdate &= "      SET WeekNumber = " & CType(intWeekNumber, Int32) & ", "
        sqlUpdate &= "          LessonNumber = '" & strlessonNumber & "', "
        sqlUpdate &= "          LessonTopic = '" & strlessonTopic & "', "
        sqlUpdate &= "          LessonObjectives = '" & strlessonObjectives & "', "
        sqlUpdate &= "          LessonMethod = '" & strlessonMethod & "', "
        sqlUpdate &= "          LessonHomework = '" & strlessonHomework & "' "
        sqlUpdate &= "      WHERE LessonNoteId = " & CType(intLessonNoteId, Int32) & " "

        updateResponse += Common.UpdateTableRow(sqlUpdate)

        Return updateResponse
    End Function

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialLessons += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            If e.Row.RowState = DataControlRowState.Edit Then
                'Response.Write("'" & "Row is in 'Edit' State..." & "'") ': Response.End()
            End If
        End If
    End Sub

    Protected Sub gvDetail_RowEditing(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewEditEventArgs)
        If Not innerGrid Is Nothing Then
            'Response.Write("'" & innerGrid.Parent.Parent.Parent.Parent.UniqueID & "'") : Response.End()
            Me.gvSubjects.SelectedIndex = CType(innerGrid.Parent.Parent, GridViewRow).RowIndex
        End If
    End Sub

    Protected Sub gvDetail_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)
        Me.gvSubjects.DataBind()
    End Sub

    Protected Sub gvSubjects_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSubjects.RowDataBound
        serialLessons = 0
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialSubjects += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            Dim gvDetails As GridView = e.Row.FindControl("gvLessonNotes")
            Dim dsDetails As SqlDataSource = e.Row.FindControl("dsSqlSyllabus")
            dsDetails.SelectCommand = " SELECT DISTINCT LessonNoteId, b.SubjectId, b.ShortName, SubjectShortName, a.ClassName, WeekNumber, LessonNumber, LessonTopic, LessonObjectives, LessonMethod, LessonHomework, a.Remark, a.Remark2, a.Remark3 FROM [dbo].[TEMPLessonNote] a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName INNER JOIN dbo.TEMPClass c ON a.ClassName = c.ClassName WHERE a.ClassName = @ClassName AND a.SubjectShortName = @SubjectShortName AND a.Remark = @TermName AND a.Remark2 = @SessionName ORDER BY WeekNumber, LessonNumber "
            dsDetails.SelectParameters(0).DefaultValue = className
            dsDetails.SelectParameters(1).DefaultValue = e.Row.DataItem("ShortName").ToString
            dsDetails.SelectParameters(2).DefaultValue = termname
            dsDetails.SelectParameters(3).DefaultValue = sessionName
            gvDetails.DataBind()
        End If
    End Sub
End Class
