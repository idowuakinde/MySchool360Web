
Partial Class modules_academics_mysyllabus_all_1
    Inherits System.Web.UI.Page

    Public serialLessons As Int32 = 0, serialSubjects As Int32 = 0
    Public termName As String = "1st Term"
    Public portalNumber As String, studentClass As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        studentClass = Request.QueryString("b")

        Me.Label9.Text = ":: LESSON NOTES FOR " & studentClass.ToUpper & ", " & termName.ToUpper
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialLessons += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub gvSubjects_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSubjects.RowDataBound
        serialLessons = 0
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialSubjects += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            Dim gvDetails As GridView = e.Row.FindControl("gvLessonNotes")
            Dim dsDetails As SqlDataSource = e.Row.FindControl("dsSqlSyllabus")
            dsDetails.SelectCommand = " SELECT LessonNoteId AS LessonPlanId, b.SubjectId, b.ShortName, SubjectShortName, a.ClassName, WeekNumber, LessonNumber, LessonTopic, LessonObjectives, LessonMethod, LessonHomework, a.Remark, a.Remark2, a.Remark3 FROM [dbo].[TEMPLessonNote] a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName INNER JOIN dbo.TEMPClass c ON a.ClassName = c.ClassName WHERE a.ClassName = @ClassName AND a.SubjectShortName = @SubjectShortName AND a.Remark = @TermName ORDER BY WeekNumber, LessonNumber "
            dsDetails.SelectParameters(0).DefaultValue = studentClass
            dsDetails.SelectParameters(1).DefaultValue = e.Row.DataItem("ShortName").ToString
            dsDetails.SelectParameters(2).DefaultValue = termName
            gvDetails.DataBind()
        End If
    End Sub
End Class
