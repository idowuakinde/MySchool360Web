
Partial Class modules_data_manage_student_scores_nurseryskills_CA4
    Inherits System.Web.UI.Page

    Public portalNumber As String, assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "2nd Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
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

        Me.dsSqlSkillsReport.SelectCommand = " SELECT UPPER(a.DistrictCode) AS DistrictCode, a.[CustomerCode], UPPER(a.CustomerName) AS CustomerName, ISNULL(Score1A, 'Not Observed') AS Score1A, ISNULL(Score1B, 'Not Observed') AS Score1B, ISNULL(Score1C, 'Not Observed') AS Score1C, ISNULL(Score1D, 'Not Observed') AS Score1D, ISNULL(Score1E, 'Not Observed') AS Score1E, ISNULL(Score1F, 'Not Observed') AS Score1F, ISNULL(Score1G, 'Not Observed') AS Score1G, ISNULL(Score2A, 'Not Observed') AS Score2A, ISNULL(Score2B, 'Not Observed') AS Score2B, ISNULL(Score2C, 'Not Observed') AS Score2C, ISNULL(Score2D, 'Not Observed') AS Score2D, ISNULL(Score2E, 'Not Observed') AS Score2E, ISNULL(Score3A, 'Not Observed') AS Score3A, ISNULL(Score3B, 'Not Observed') AS Score3B, ISNULL(Score3C, 'Not Observed') AS Score3C, ISNULL(Score3D, 'Not Observed') AS Score3D, ISNULL(Score4A, 'Not Observed') AS Score4A, ISNULL(Score4B, 'Not Observed') AS Score4B, ISNULL(Score4C, 'Not Observed') AS Score4C, ISNULL(Score4D, 'Not Observed') AS Score4D, ISNULL(Score5A, 'Not Observed') AS Score5A, ISNULL(Score5B, 'Not Observed') AS Score5B, ISNULL(Score5C, 'Not Observed') AS Score5C, ISNULL(Score5D, 'Not Observed') AS Score5D, ISNULL(Score6A, 'Not Observed') AS Score6A, ISNULL(Score6B, 'Not Observed') AS Score6B, ISNULL(Score7A, 'Not Observed') AS Score7A, ISNULL(Score7B, 'Not Observed') AS Score7B, ISNULL(Score7C, 'Not Observed') AS Score7C, ISNULL(Score7D, 'Not Observed') AS Score7D, ISNULL(Score7E, 'Not Observed') AS Score7E, ISNULL(Comment, '') AS Comment FROM [TEMPcustomers] a LEFT JOIN dbo.TEMPStudentSubjectScore_Nursery_Skills2 b ON a.CustomerCode = b.PortalNumber AND SessionName = @SessionName AND TermName = @TermName AND AssessmentType = @AssessmentType WHERE CustomerCode = @CustomerCode ORDER BY [CustomerName] "
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
        Dim score1f As String = CType(Me.DetailsView1.FindControl("rdo1f"), RadioButtonList).Text
        Dim score1g As String = CType(Me.DetailsView1.FindControl("rdo1g"), RadioButtonList).Text
        Dim score2a As String = CType(Me.DetailsView1.FindControl("rdo2a"), RadioButtonList).Text
        Dim score2b As String = CType(Me.DetailsView1.FindControl("rdo2b"), RadioButtonList).Text
        Dim score2c As String = CType(Me.DetailsView1.FindControl("rdo2c"), RadioButtonList).Text
        Dim score2d As String = CType(Me.DetailsView1.FindControl("rdo2d"), RadioButtonList).Text
        Dim score2e As String = CType(Me.DetailsView1.FindControl("rdo2e"), RadioButtonList).Text
        Dim score3a As String = CType(Me.DetailsView1.FindControl("rdo3a"), RadioButtonList).Text
        Dim score3b As String = CType(Me.DetailsView1.FindControl("rdo3b"), RadioButtonList).Text
        Dim score3c As String = CType(Me.DetailsView1.FindControl("rdo3c"), RadioButtonList).Text
        Dim score3d As String = CType(Me.DetailsView1.FindControl("rdo3d"), RadioButtonList).Text
        Dim score4a As String = CType(Me.DetailsView1.FindControl("rdo4a"), RadioButtonList).Text
        Dim score4b As String = CType(Me.DetailsView1.FindControl("rdo4b"), RadioButtonList).Text
        Dim score4c As String = CType(Me.DetailsView1.FindControl("rdo4c"), RadioButtonList).Text
        Dim score4d As String = CType(Me.DetailsView1.FindControl("rdo4d"), RadioButtonList).Text
        Dim score5a As String = CType(Me.DetailsView1.FindControl("rdo5a"), RadioButtonList).Text
        Dim score5b As String = CType(Me.DetailsView1.FindControl("rdo5b"), RadioButtonList).Text
        Dim score5c As String = CType(Me.DetailsView1.FindControl("rdo5c"), RadioButtonList).Text
        Dim score5d As String = CType(Me.DetailsView1.FindControl("rdo5d"), RadioButtonList).Text
        Dim score6a As String = CType(Me.DetailsView1.FindControl("rdo6a"), RadioButtonList).Text
        Dim score6b As String = CType(Me.DetailsView1.FindControl("rdo6b"), RadioButtonList).Text
        Dim score7a As String = CType(Me.DetailsView1.FindControl("rdo7a"), RadioButtonList).Text
        Dim score7b As String = CType(Me.DetailsView1.FindControl("rdo7b"), RadioButtonList).Text
        Dim score7c As String = CType(Me.DetailsView1.FindControl("rdo7c"), RadioButtonList).Text
        Dim score7d As String = CType(Me.DetailsView1.FindControl("rdo7d"), RadioButtonList).Text
        Dim score7e As String = CType(Me.DetailsView1.FindControl("rdo7e"), RadioButtonList).Text
        Dim SkillsReportComment As String = CType(Me.DetailsView1.FindControl("txtComments"), TextBox).Text.Replace("'", "''")

        'save the scores
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreId FROM dbo.TEMPStudentSubjectScore_Nursery_Skills2 WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScore_Nursery_Skills2 "
        sqlInsert &= "      SET Score1A = '" & score1a & "', "
        sqlInsert &= "          Score1B = '" & score1b & "', "
        sqlInsert &= "          Score1C = '" & score1c & "', "
        sqlInsert &= "          Score1D = '" & score1d & "', "
        sqlInsert &= "          Score1E = '" & score1e & "', "
        sqlInsert &= "          Score1F = '" & score1f & "', "
        sqlInsert &= "          Score1G = '" & score1g & "', "
        sqlInsert &= "          Score2A = '" & score2a & "', "
        sqlInsert &= "          Score2B = '" & score2b & "', "
        sqlInsert &= "          Score2C = '" & score2c & "', "
        sqlInsert &= "          Score2D = '" & score2d & "', "
        sqlInsert &= "          Score2E = '" & score2e & "', "
        sqlInsert &= "          Score3A = '" & score3a & "', "
        sqlInsert &= "          Score3B = '" & score3b & "', "
        sqlInsert &= "          Score3C = '" & score3c & "', "
        sqlInsert &= "          Score3D = '" & score3d & "', "
        sqlInsert &= "          Score4A = '" & score4a & "', "
        sqlInsert &= "          Score4B = '" & score4b & "', "
        sqlInsert &= "          Score4C = '" & score4c & "', "
        sqlInsert &= "          Score4D = '" & score4d & "', "
        sqlInsert &= "          Score5A = '" & score5a & "', "
        sqlInsert &= "          Score5B = '" & score5b & "', "
        sqlInsert &= "          Score5C = '" & score5c & "', "
        sqlInsert &= "          Score5D = '" & score5d & "', "
        sqlInsert &= "          Score6A = '" & score6a & "', "
        sqlInsert &= "          Score6B = '" & score6b & "', "
        sqlInsert &= "          Score7A = '" & score7a & "', "
        sqlInsert &= "          Score7B = '" & score7b & "', "
        sqlInsert &= "          Score7C = '" & score7c & "', "
        sqlInsert &= "          Score7D = '" & score7d & "', "
        sqlInsert &= "          Score7E = '" & score7e & "', "
        sqlInsert &= "          Comment = '" & SkillsReportComment.Replace("'", "''") & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScore_Nursery_Skills2(PortalNumber, SessionName, TermName, AssessmentType, Score1A, Score1B, Score1C, Score1D, Score1E, Score1F, Score1G, Score2A, Score2B, Score2C, Score2D, Score2E, Score3A, Score3B, Score3C, Score3D, Score4A, Score4B, Score4C, Score4D, Score5A, Score5B, Score5C, Score5D, Score6A, Score6B, Score7A, Score7B, Score7C, Score7D, Score7E, Comment) "
        sqlInsert &= "      VALUES('" & portalNumber & "','" & sessionName & "','" & TermName & "','" & assessmentType & "','" & score1a & "','" & score1b & "','" & score1c & "','" & score1d & "','" & score1e & "','" & score1f & "','" & score1g & "','" & score2a & "','" & score2b & "','" & score2c & "','" & score2d & "','" & score2e & "','" & score3a & "','" & score3b & "','" & score3c & "','" & score3d & "','" & score4a & "','" & score4b & "','" & score4c & "','" & score4d & "','" & score5a & "','" & score5b & "','" & score5c & "','" & score5d & "','" & score6a & "','" & score6b & "','" & score7a & "','" & score7b & "','" & score7c & "','" & score7d & "','" & score7e & "','" & SkillsReportComment.Replace("'", "''") & "') "
        'Response.Write(sqlInsert) : Response.End()
        insertResponse += Common.InsertTableRow(sqlInsert)

        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Skills were successfully saved."
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
