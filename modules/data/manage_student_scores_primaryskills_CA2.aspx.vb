
Partial Class modules_data_manage_student_scores_primaryskills_CA2
    Inherits System.Web.UI.Page

    Public portalNumber As String, assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "1st Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
    Public callbackURL As String = ""

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        If Not IsPostBack Then
            If Not IsNothing(Request.UrlReferrer) Then
                callbackURL = Request.UrlReferrer.OriginalString
                hidCallbackURL.Value = callbackURL
                'Response.Write("'" & callbackURL & "'") : Response.End()
            End If
        End If
        portalNumber = Request.QueryString("a")

        Me.dsSqlSkillsReport.SelectCommand = " SELECT UPPER(a.DistrictCode) AS DistrictCode, a.[CustomerCode], UPPER(a.CustomerName) AS CustomerName, ISNULL(Score1A, 'Poor') AS Score1A, ISNULL(Score1B, 'Poor') AS Score1B, ISNULL(Score1C, 'Poor') AS Score1C, ISNULL(Score1D, 'Poor') AS Score1D, ISNULL(Score1E, 'Poor') AS Score1E, ISNULL(Score2A, 'Poor') AS Score2A, ISNULL(Score2B, 'Poor') AS Score2B, ISNULL(Score2C, 'Poor') AS Score2C, ISNULL(Score2D, 'Poor') AS Score2D, ISNULL(Score2E, 'Poor') AS Score2E, ISNULL(Score3A, 'Poor') AS Score3A, ISNULL(Score3B, 'Poor') AS Score3B, ISNULL(Score3C, 'Poor') AS Score3C, ISNULL(Score3D, 'Poor') AS Score3D, ISNULL(Score3E, 'Poor') AS Score3E, ISNULL(Score4A, 'Poor') AS Score4A, ISNULL(Score4B, 'Poor') AS Score4B, ISNULL(Score4C, 'Poor') AS Score4C, ISNULL(Score4D, 'Poor') AS Score4D, ISNULL(Score4E, 'Poor') AS Score4E, ISNULL(Comment, '') AS Comment FROM [TEMPcustomers] a LEFT JOIN dbo.TEMPStudentSubjectScore_Primary_Skills2 b ON a.CustomerCode = b.PortalNumber AND SessionName = @SessionName AND TermName = @TermName AND AssessmentType = @AssessmentType WHERE CustomerCode = @CustomerCode ORDER BY [CustomerName] "
        Me.dsSqlSkillsReport.SelectParameters("CustomerCode").DefaultValue = portalNumber
        Me.dsSqlSkillsReport.SelectParameters("SessionName").DefaultValue = sessionName
        Me.dsSqlSkillsReport.SelectParameters("TermName").DefaultValue = TermName
        Me.dsSqlSkillsReport.SelectParameters("AssessmentType").DefaultValue = assessmentType
    End Sub

    Protected Sub DetailsView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdateEventArgs) Handles DetailsView1.ItemUpdating
        'instead of running the default Edit operation, run a custom (contextual) insert/update operation instead
        Dim insertResponse As Int32
        Dim score1a As String = CType(Me.DetailsView1.FindControl("rdo1a"), RadioButtonList).Text
        Dim score1b As String = CType(Me.DetailsView1.FindControl("rdo1b"), RadioButtonList).Text
        Dim score1c As String = CType(Me.DetailsView1.FindControl("rdo1c"), RadioButtonList).Text
        Dim score1d As String = CType(Me.DetailsView1.FindControl("rdo1d"), RadioButtonList).Text
        Dim score1e As String = CType(Me.DetailsView1.FindControl("rdo1e"), RadioButtonList).Text
        Dim score2a As String = CType(Me.DetailsView1.FindControl("rdo2a"), RadioButtonList).Text
        Dim score2b As String = CType(Me.DetailsView1.FindControl("rdo2b"), RadioButtonList).Text
        Dim score2c As String = CType(Me.DetailsView1.FindControl("rdo2c"), RadioButtonList).Text
        Dim score2d As String = CType(Me.DetailsView1.FindControl("rdo2d"), RadioButtonList).Text
        Dim score2e As String = CType(Me.DetailsView1.FindControl("rdo2e"), RadioButtonList).Text
        Dim score3a As String = CType(Me.DetailsView1.FindControl("rdo3a"), RadioButtonList).Text
        Dim score3b As String = CType(Me.DetailsView1.FindControl("rdo3b"), RadioButtonList).Text
        Dim score3c As String = CType(Me.DetailsView1.FindControl("rdo3c"), RadioButtonList).Text
        Dim score3d As String = CType(Me.DetailsView1.FindControl("rdo3d"), RadioButtonList).Text
        Dim score3e As String = CType(Me.DetailsView1.FindControl("rdo3e"), RadioButtonList).Text
        Dim score4a As String = CType(Me.DetailsView1.FindControl("rdo4a"), RadioButtonList).Text
        Dim score4b As String = CType(Me.DetailsView1.FindControl("rdo4b"), RadioButtonList).Text
        Dim score4c As String = CType(Me.DetailsView1.FindControl("rdo4c"), RadioButtonList).Text
        Dim score4d As String = CType(Me.DetailsView1.FindControl("rdo4d"), RadioButtonList).Text
        Dim score4e As String = CType(Me.DetailsView1.FindControl("rdo4e"), RadioButtonList).Text
        Dim SkillsReportComment As String = CType(Me.DetailsView1.FindControl("txtComments"), TextBox).Text.Replace("'", "''")

        'save the scores
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreId FROM dbo.TEMPStudentSubjectScore_Primary_Skills2 WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScore_Primary_Skills2 "
        sqlInsert &= "      SET Score1A = '" & score1a & "', "
        sqlInsert &= "          Score1B = '" & score1b & "', "
        sqlInsert &= "          Score1C = '" & score1c & "', "
        sqlInsert &= "          Score1D = '" & score1d & "', "
        sqlInsert &= "          Score1E = '" & score1e & "', "
        sqlInsert &= "          Score2A = '" & score2a & "', "
        sqlInsert &= "          Score2B = '" & score2b & "', "
        sqlInsert &= "          Score2C = '" & score2c & "', "
        sqlInsert &= "          Score2D = '" & score2d & "', "
        sqlInsert &= "          Score2E = '" & score2e & "', "
        sqlInsert &= "          Score3A = '" & score3a & "', "
        sqlInsert &= "          Score3B = '" & score3b & "', "
        sqlInsert &= "          Score3C = '" & score3c & "', "
        sqlInsert &= "          Score3D = '" & score3d & "', "
        sqlInsert &= "          Score3E = '" & score3e & "', "
        sqlInsert &= "          Score4A = '" & score4a & "', "
        sqlInsert &= "          Score4B = '" & score4b & "', "
        sqlInsert &= "          Score4C = '" & score4c & "', "
        sqlInsert &= "          Score4D = '" & score4d & "', "
        sqlInsert &= "          Score4E = '" & score4e & "', "
        sqlInsert &= "          Comment = '" & SkillsReportComment.Replace("'", "''") & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScore_Primary_Skills2(PortalNumber, SessionName, TermName, AssessmentType, Score1A, Score1B, Score1C, Score1D, Score1E, Score2A, Score2B, Score2C, Score2D, Score2E, Score3A, Score3B, Score3C, Score3D, Score3E, Score4A, Score4B, Score4C, Score4D, Score4E, Comment) "
        sqlInsert &= "      VALUES('" & portalNumber & "','" & sessionName & "','" & TermName & "','" & assessmentType & "','" & score1a & "','" & score1b & "','" & score1c & "','" & score1d & "','" & score1e & "','" & score2a & "','" & score2b & "','" & score2c & "','" & score2d & "','" & score2e & "','" & score3a & "','" & score3b & "','" & score3c & "','" & score3d & "','" & score3e & "','" & score4a & "','" & score4b & "','" & score4c & "','" & score4d & "','" & score4e & "','" & SkillsReportComment.Replace("'", "''") & "') "
        'Response.Write(sqlInsert) : Response.End()
        insertResponse += Common.InsertTableRow(sqlInsert)

        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Student's Behavioural Assessment was successfully saved."
            'navigate away from this page (ONLY ON SUCCESS!)
            Response.Redirect(hidCallbackURL.Value, True)
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If

        'finally, cancel the Edit operation
        e.Cancel = True
    End Sub
End Class
