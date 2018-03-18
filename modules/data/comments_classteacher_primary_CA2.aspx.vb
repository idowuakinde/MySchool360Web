
Partial Class modules_data_comments_classteacher_primary_CA2
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, innerSerial As Int32 = 0, innerTotal As Int32 = 0, innerAverage As Int32 = 0, username As String = "", className As String = "", assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "1st Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        Dim rowsClassName As System.Data.DataRowCollection = Common.GetTableRows(" SELECT ClassName FROM dbo.TEMPClass WHERE Teacher = '" & username & "' ")
        If rowsClassName.Count = 0 Then
            className = ""
        Else
            className = rowsClassName(0).Item(0).ToString
        End If
        Me.lblHeader.Text = ":: Append Class Teacher Comments (Primary School, AFTER the Mid-Term)."

        Me.dsSqlStudents.SelectCommand = " SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, ISNULL(Score_PE, '') AS Score_PE, ISNULL(ClubsAndExtras, '') AS ClubsAndExtras, ISNULL(DaysAbsent, 0) as DaysAbsent, ISNULL(Punctuality, 0) AS Punctuality, REPLACE(ISNULL(ClassTeacherComment, ''), '''''', '''') AS ClassTeacherComment, IsNull(Remark1, 0) AS Handwriting FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubjectScoreTeacherComment2 b ON a.CustomerCode = b.PortalNumber AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' WHERE DistrictCode = '" & className & "' ORDER BY PortalNumber "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = className
        Me.dsSqlStudents.DataBind()

        Me.dsSqlSubjects.SelectCommand = " SELECT CustomerId, CustomerCode as PortalNumber, d.ShortName AS SubjectShortName, d.SubjectName, ScoreId, ISNULL((SELECT ISNULL(Score, 0) + ISNULL(ScoreClassTest, 0) FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = c.PortalNumber AND SubjectShortName = d.ShortName AND SessionName = c.SessionName AND TermName = c.TermName AND AssessmentType = 'Test'), 0) AS MidTermSubjectScore, ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0) AS TermEndSubjectScore FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore2 c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName AND AssessmentType = @AssessmentType INNER JOIN dbo.TEMPSubject d ON b.SubjectShortName = d.ShortName WHERE a.CustomerCode = @PortalNumber AND ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0) >= 0 AND b.SessionName = @SessionName AND b.TermName = @TermName ORDER BY StudentSubjectId "
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

            Select Case Common.GetProgramme(className).ToUpper
                Case "PRI"
                    CType(e.Row.FindControl("txtPE"), TextBox).ReadOnly = True
                Case Else
                    CType(e.Row.FindControl("txtPE"), TextBox).ReadOnly = False
            End Select
        End If
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            innerSerial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            innerTotal += (rowView("MidTermSubjectScore") + rowView("TermEndSubjectScore"))
        End If
    End Sub

    Public Sub SaveComments(ByVal currentRow As GridViewRow)
        Dim insertResponse As Int32

        Dim portalNumber As String = CType(currentRow.FindControl("lblPortalNumber"), Label).Text
        Dim scorePE As String = CType(currentRow.FindControl("txtPE"), TextBox).Text.Replace("'", "''")
        Dim scoreClubsAndExtras As String = CType(currentRow.FindControl("txtClubs"), TextBox).Text.Replace("'", "''")
        Dim scoreDaysAbsent As Int32 = CType(currentRow.FindControl("ddlDaysAbsent"), DropDownList).SelectedValue
        Dim scorePunctuality As Int32 = CType(currentRow.FindControl("ddlPunctuality"), DropDownList).SelectedValue
        Dim comment As String = CType(currentRow.FindControl("txtComments"), TextBox).Text.Replace("'", "''")
        Dim handwriting As String = CType(currentRow.FindControl("ddlHandwriting"), DropDownList).SelectedValue

        ''save the comments
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreCommentId FROM dbo.TEMPStudentSubjectScoreTeacherComment2 WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScoreTeacherComment2 "
        sqlInsert &= "      SET Score_PE = '" & scorePE & "', "
        sqlInsert &= "          ClubsAndExtras = '" & scoreClubsAndExtras & "', "
        sqlInsert &= "          DaysAbsent = " & scoreDaysAbsent & ", "
        sqlInsert &= "          Punctuality = " & scorePunctuality & ", "
        sqlInsert &= "          ClassTeacherComment = '" & comment & "', "
        sqlInsert &= "          Remark1 = '" & handwriting & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScoreTeacherComment2(PortalNumber, SessionName, TermName, AssessmentType, Score_PE, ClubsAndExtras, DaysAbsent, Punctuality, ClassTeacherComment, Remark1) "
        sqlInsert &= "      VALUES('" & portalNumber & "','" & sessionName & "','" & TermName & "','" & assessmentType & "','" & scorePE & "','" & scoreClubsAndExtras & "'," & scoreDaysAbsent & "," & scorePunctuality & ",'" & comment & "','" & handwriting & "')"
        'Response.Write(sqlInsert)
        insertResponse += Common.InsertTableRow(sqlInsert)
        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Comments were successfully saved."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub
End Class
