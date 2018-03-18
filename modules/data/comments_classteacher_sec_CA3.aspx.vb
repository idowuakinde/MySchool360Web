
Partial Class modules_data_comments_classteacher_sec_CA3
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, innerSerial As Int32 = 0, innerTotal As Int32 = 0, innerAverage As Int32 = 0, username As String = "", className As String = "", assessmentType As String = "Test", currentSubjectShortName As String = ""
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "2nd Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
    Public countAstar As Int32, countA As Int32, countBplus As Int32, countB As Int32, countCplus As Int32, countC As Int32, countD As Int32, countE As Int32, countF As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        Dim rowsClassName As System.Data.DataRowCollection = Common.GetTableRows(" SELECT ClassName FROM dbo.TEMPClass WHERE Teacher = '" & username & "' ")
        If rowsClassName.Count = 0 Then
            className = ""
        Else
            className = rowsClassName(0).Item(0).ToString
        End If
        Me.lblHeader.Text = ":: Append Class Teacher Comments (Secondary School, BEFORE the Mid-Term)."

        Me.dsSqlStudents.SelectCommand = " SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, ISNULL(ClassTeacherComment, '') AS ClassTeacherComment FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubjectScoreTeacherComment2 b ON a.CustomerCode = b.PortalNumber AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' WHERE DistrictCode = '" & className & "' ORDER BY PortalNumber "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = className
        Me.dsSqlStudents.DataBind()

        Me.dsSqlSubjects.SelectCommand = " SELECT CustomerId, CustomerCode as PortalNumber, DistrictCode as ClassName, d.SubjectName, d.SubjectName as SubjectShortName, ScoreId, ISNULL(c.Score, 0) AS CycleTest, ISNULL(c.ScoreClassTest, 0) AS ClassTests, ISNULL(c.ScoreAssignments, 0) AS Assignments, ISNULL(c.ScoreClassWork, 0) AS ClassWork, ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0) + ISNULL(c.ScoreAssignments, 0) + ISNULL(c.ScoreClassWork, 0) AS MidTermSubjectScore, ISNULL(c.Comment, '') AS SubjectComment FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName AND AssessmentType = @AssessmentType INNER JOIN dbo.TEMPSubject d ON b.SubjectShortName = d.ShortName WHERE a.CustomerCode = @PortalNumber AND b.SessionName = @SessionName AND b.TermName = @TermName ORDER BY StudentSubjectId "
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
            CType(e.Row.FindControl("lblPagePosition"), Label).Text = "Current Page: " & gvMaster.PageIndex + 1 & " of " & gvMaster.PageCount
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Me.gvMaster.SelectedIndex = e.Row.RowIndex
        End If
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            innerSerial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            innerTotal += (rowView("CycleTest") + rowView("ClassTests") + rowView("Assignments") + rowView("ClassWork")) / 2
            currentSubjectShortName = CType(rowView("SubjectShortName"), String).Replace("''", "'")
            Select Case rowView("SubjectName").ToString.ToUpper
                Case "MUSIC"
                    Dim termSubjectOverallTotal As Double = (CType(rowView("MidTermSubjectScore"), Double)) ' + CType(rowView("TermEndSubjectScore"), Double)) / 2
                    e.Row.Cells(2).Text = "<table align='left' border='1' class='style17'><tr><td>INVOLVEMENT</td></tr><tr><td>KNOWLEDGE</td></tr><tr><td bgcolor='#CCCCCCC'><strong>TOTAL 1<sup>st</sup> HALF</strong></td></tr></table>"
                    e.Row.Cells(3).Text = "<table align='left' border='1' class='style17'><tr><td align='center'>50</td></tr><tr><td align='center'>50</td></tr><tr><td align='center' bgcolor='#CCCCCCC'>100</td></tr></table>"
                    e.Row.Cells(4).Text = "<table align='left' border='1' class='style17'><tr><td align='center'>" & CType(rowView("CycleTest"), Double).ToString & "</td></tr><tr><td align='center'>" & CType(rowView("ClassTests"), Double).ToString & "</td></tr><tr><td align='center' bgcolor='#CCCCCCC'>" & Math.Ceiling(CType(rowView("MidTermSubjectScore"), Double)).ToString & " (" & Common.GetGradeSchool2(CType(rowView("MidTermSubjectScore"), Double), className).Split(",")(0) & ")</td></tr></table>"
                    e.Row.Cells(5).Text = "<table align='left' border='1' class='style17'><tr><td align='left' height='90' valign='top'><span>" & CType(rowView("SubjectComment"), String).Replace("''", "'") & "</span></td></tr></table>"
                    e.Row.BackColor = Drawing.Color.LightCyan
                    Call CountGrade(Common.GetGradeSchool2(termSubjectOverallTotal, className))
                Case "PE", "PHYSICAL EDUCATION"
                    Dim termSubjectOverallTotal As Double = (CType(rowView("MidTermSubjectScore"), Double)) ' + CType(rowView("TermEndSubjectScore"), Double)) / 2
                    e.Row.Cells(2).Text = "<table align='left' border='1' class='style17'><tr><td>INVOLVEMENT</td></tr><tr><td>KNOWLEDGE</td></tr><tr><td bgcolor='#CCCCCCC'><strong>TOTAL 1<sup>st</sup> HALF</strong></td></tr></table>"
                    e.Row.Cells(3).Text = "<table align='left' border='1' class='style17'><tr><td align='center'>80</td></tr><tr><td align='center'>20</td></tr><tr><td align='center' bgcolor='#CCCCCCC'>100</td></tr></table>"
                    e.Row.Cells(4).Text = "<table align='left' border='1' class='style17'><tr><td align='center'>" & CType(rowView("CycleTest"), Double).ToString & "</td></tr><tr><td align='center'>" & CType(rowView("ClassTests"), Double).ToString & "</td></tr><tr><td align='center' bgcolor='#CCCCCCC'>" & Math.Ceiling(CType(rowView("MidTermSubjectScore"), Double)).ToString & " (" & Common.GetGradeSchool2(CType(rowView("MidTermSubjectScore"), Double), className).Split(",")(0) & ")</td></tr></table>"
                    e.Row.Cells(5).Text = "<table align='left' border='1' class='style17'><tr><td align='left' height='90' valign='top'><span>" & CType(rowView("SubjectComment"), String).Replace("''", "'") & "</span></td></tr></table>"
                    e.Row.BackColor = Drawing.Color.LightCyan
                    Call CountGrade(Common.GetGradeSchool2(termSubjectOverallTotal, className))
                Case Else
                    Dim termSubjectOverallTotal As Double = (CType(rowView("MidTermSubjectScore"), Double)) ' + CType(rowView("TermEndSubjectScore"), Double)) / 2
                    e.Row.Cells(2).Text = "<table align='left' border='1' class='style17'><tr><td>CYCLE TESTS</td></tr><tr><td>CLASS TESTS</td></tr><tr><td>ASSIGNMENTS</td></tr><tr><td>CLASS WORK</td></tr><tr><td bgcolor='#CCCCCCC'><strong>TOTAL 1<sup>st</sup> HALF</strong></td></tr></table>"
                    e.Row.Cells(3).Text = "<table align='left' border='1' class='style17'><tr><td align='center'>40</td></tr><tr><td align='center'>40</td></tr><tr><td align='center'>10</td></tr><tr><td align='center'>10</td></tr><tr><td align='center' bgcolor='#CCCCCCC'>100</td></tr></table>"
                    e.Row.Cells(4).Text = "<table align='left' border='1' class='style17'><tr><td align='center'>" & CType(rowView("CycleTest"), Double).ToString & "</td></tr><tr><td align='center'>" & CType(rowView("ClassTests"), Double).ToString & "</td></tr><tr><td align='center'>" & CType(rowView("Assignments"), Double).ToString & "</td></tr><tr><td align='center'>" & CType(rowView("ClassWork"), Double).ToString & "</td></tr><tr><td align='center' bgcolor='#CCCCCCC'>" & Math.Ceiling(CType(rowView("MidTermSubjectScore"), Double)).ToString & " (" & Common.GetGradeSchool2(CType(rowView("MidTermSubjectScore"), Double), className).Split(",")(0) & ")</td></tr></table>"
                    e.Row.Cells(5).Text = "<table align='left' border='1' class='style17'><tr><td align='left' height='90' valign='top'><span>" & CType(rowView("SubjectComment"), String).Replace("''", "'") & "</span></td></tr></table>"
                    Call CountGrade(Common.GetGradeSchool2(termSubjectOverallTotal, className))
            End Select
        End If
    End Sub

    Public Sub SaveComments(ByVal currentRow As GridViewRow)
        Dim insertResponse As Int32

        Dim portalNumber As String = CType(currentRow.FindControl("lblPortalNumber"), Label).Text
        Dim comment As String = CType(currentRow.FindControl("txtComments"), TextBox).Text.Replace("'", "''")

        ''save the comments
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreCommentId FROM dbo.TEMPStudentSubjectScoreTeacherComment2 WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScoreTeacherComment2 "
        sqlInsert &= "      SET ClassTeacherComment = '" & comment & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScoreTeacherComment2(PortalNumber, SessionName, TermName, AssessmentType, ClassTeacherComment) "
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

    Public Sub CountGrade(ByVal grade As String)
        Select Case grade.Split(",")(0)
            Case "A*"
                countAstar += 1
            Case "A"
                countA += 1
            Case "B+"
                countBplus += 1
            Case "B"
                countB += 1
            Case "C+"
                countCplus += 1
            Case "C"
                countC += 1
            Case "D"
                countD += 1
            Case "E"
                countE += 1
            Case "F"
                countF += 1
        End Select
    End Sub
End Class
