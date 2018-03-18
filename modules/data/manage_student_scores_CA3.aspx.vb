
Partial Class modules_data_manage_student_scores_CA3
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", subjectShortName As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "2nd Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        subjectShortName = Request.QueryString("b")
        className = Request.QueryString("c")
        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"
                Select Case subjectShortName.ToUpper
                    Case "MUSIC"
                        Server.Transfer("manage_student_scores_special_CA3.aspx", True)
                    Case "PHYSICAL EDUCATION", "PE"
                        Server.Transfer("manage_student_scores_special_PE_CA3.aspx", True)
                    Case Else
                        'do nothing
                End Select
            Case Else
                'do nothing
        End Select
        Me.lblHeader.Text = ":: View/Edit Students' Scores BEFORE the Mid-Term Break. (SUBJECT: " & subjectShortName & ", CLASS: " & className & ")"

        Me.dsSqlStudents.SelectCommand = " SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, b.SubjectShortName, ISNULL(c.Score, 0) AS Score, ISNULL(c.ScoreClassTest, 0) AS ScoreClassTest, ISNULL(c.ScoreAssignments, 0) AS ScoreAssignments, ISNULL(c.ScoreClassWork, 0) AS ScoreClassWork, ISNULL(c.Comment, '') as Comment FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName WHERE a.DistrictCode = @ClassName AND b.SubjectShortName = @SubjectShortName AND b.SessionName = @SessionName AND b.TermName = @TermName ORDER BY CustomerCode "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = className
        Me.dsSqlStudents.SelectParameters(1).DefaultValue = subjectShortName
        Me.dsSqlStudents.SelectParameters(2).DefaultValue = sessionName
        Me.dsSqlStudents.SelectParameters(3).DefaultValue = TermName
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange") = "javascript:CopyStandardComment(this, " & Chr(34) & rowView("FirstName") & Chr(34) & ");"
        End If
    End Sub

    Protected Sub btnSaveScores_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveScores.Click
        Dim insertResponse As Int32
        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim portalNumber As String = Me.gvMaster.Rows(i).Cells(2).Text
            Dim subjectScoreCycleTest As Int32 = CType(CType(Me.gvMaster.Rows(i).FindControl("ddlTestScore"), DropDownList).Text, Int32)
            Dim subjectScoreClassTests As Int32 = CType(CType(Me.gvMaster.Rows(i).FindControl("ddlClassTests"), DropDownList).Text, Int32)
            Dim subjectScoreAssignments As Int32 = CType(CType(Me.gvMaster.Rows(i).FindControl("ddlAssignments"), DropDownList).Text, Int32)
            Dim subjectScoreClassWork As Int32 = CType(CType(Me.gvMaster.Rows(i).FindControl("ddlScoreClassWork"), DropDownList).Text, Int32)
            Dim subjectComment As String = CType(Me.gvMaster.Rows(i).FindControl("txtAddSubjectComment"), TextBox).Text

            'save the scores
            Dim sqlInsert As String
            sqlInsert = " IF EXISTS (SELECT ScoreId FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
            sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScore "
            sqlInsert &= "      SET Score = " & subjectScoreCycleTest & ", "
            sqlInsert &= "          ScoreClassTest = " & subjectScoreClassTests & ", "
            sqlInsert &= "          ScoreAssignments = " & subjectScoreAssignments & ", "
            sqlInsert &= "          ScoreClassWork = " & subjectScoreClassWork & ", "
            sqlInsert &= "          Comment = '" & subjectComment.Replace("'", "''") & "' "
            sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
            sqlInsert &= "ELSE "
            sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScore(PortalNumber, SubjectShortName, SessionName, TermName, AssessmentType, Score, ScoreClassTest, ScoreAssignments, ScoreClassWork, Comment) "
            sqlInsert &= "      VALUES('" & portalNumber & "','" & subjectShortName & "','" & sessionName & "','" & TermName & "','" & assessmentType & "'," & subjectScoreCycleTest & "," & subjectScoreClassTests & "," & subjectScoreAssignments & "," & subjectScoreClassWork & ",'" & subjectComment.Replace("'", "''") & "') "
            'Response.Write(sqlInsert)
            insertResponse += Common.InsertTableRow(sqlInsert)
        Next
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
