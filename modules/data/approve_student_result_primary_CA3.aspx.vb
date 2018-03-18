
Partial Class modules_data_approve_student_result_primary_CA3
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, innerSerial As Int32 = 0, innerTotal As Int32 = 0, innerAverage As Int32 = 0, portalNumber As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "2nd Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        Dim rowsClassName As System.Data.DataRowCollection = Common.GetTableRows(" SELECT DistrictCode FROM dbo.TEMPCustomers WHERE CustomerCode = '" & portalNumber & "' ")
        If rowsClassName.Count = 0 Then
            className = ""
        Else
            className = rowsClassName(0).Item(0).ToString
        End If

        Me.dsSqlStudents.SelectCommand = " SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, ISNULL(Score_PE, '') AS Score_PE, ISNULL(ClubsAndExtras, '') AS ClubsAndExtras, ISNULL(DaysAbsent, 0) as DaysAbsent, ISNULL(Punctuality, 0) AS Punctuality, ISNULL(ClassTeacherComment, '') AS ClassTeacherComment FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubjectScoreTeacherComment b ON a.CustomerCode = b.PortalNumber AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' WHERE CustomerCode = '" & portalNumber & "' ORDER BY PortalNumber "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = className
        Me.dsSqlStudents.DataBind()

        Me.dsSqlSubjects.SelectCommand = " SELECT CustomerId, CustomerCode as PortalNumber, d.SubjectName, ScoreId, (ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0))*2 AS MidTermSubjectScore FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName AND AssessmentType = @AssessmentType INNER JOIN dbo.TEMPSubject d ON b.SubjectShortName = d.ShortName WHERE a.CustomerCode = @PortalNumber AND ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0) >= 0 AND b.SessionName = @SessionName AND b.TermName = @TermName ORDER BY StudentSubjectId "
        Me.dsSqlSubjects.SelectParameters(0).DefaultValue = assessmentType
        Me.dsSqlSubjects.SelectParameters(1).DefaultValue = Me.gvMaster.SelectedValue
        Me.dsSqlSubjects.SelectParameters(2).DefaultValue = sessionName
        Me.dsSqlSubjects.SelectParameters(3).DefaultValue = TermName
        Me.dsSqlSubjects.DataBind()
    End Sub

    Protected Sub gvMaster_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMaster.RowCommand
        If e.CommandName = "Select" Then
            Dim index As Int32 = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = gvMaster.Rows(index)
            'add code
            Call SaveComments(row)
        End If
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Me.gvMaster.SelectedIndex = e.Row.RowIndex
        End If
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            innerSerial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            innerTotal += (rowView("MidTermSubjectScore")) ' + rowView("TermEndSubjectScore"))
        End If
    End Sub

    Public Sub SaveComments(ByVal currentRow As GridViewRow)
        Dim insertResponse As Int32

        Dim portalNumber As String = CType(currentRow.FindControl("lblPortalNumber"), Label).Text
        Dim comment As String = CType(currentRow.FindControl("txtComments"), TextBox).Text.Replace("'", "''")

        ''save the comments
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreCommentId FROM dbo.TEMPStudentSubjectScoreTeacherComment WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScoreTeacherComment "
        sqlInsert &= "      SET ClassTeacherComment = '" & comment & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScoreTeacherComment(PortalNumber, SessionName, TermName, AssessmentType, ClassTeacherComment) "
        sqlInsert &= "      VALUES('" & portalNumber & "','" & sessionName & "','" & TermName & "','" & assessmentType & "','" & comment & "')"
        'Response.Write(sqlInsert)
        insertResponse += Common.InsertTableRow(sqlInsert)
        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Scores were successfully saved."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub
End Class
