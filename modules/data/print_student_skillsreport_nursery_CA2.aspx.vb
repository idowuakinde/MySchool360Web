
Partial Class modules_data_print_student_skillsreport_nursery_CA2
    Inherits System.Web.UI.Page

    Public portalNumber As String, assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "1st Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        portalNumber = Request.QueryString("a")

        Me.dsSqlSkillsReport.SelectCommand = " SELECT UPPER(a.DistrictCode) AS DistrictCode, a.[CustomerCode], UPPER(a.CustomerName) AS CustomerName, ISNULL(Score1A, 'Not Observed') AS Score1A, ISNULL(Score1B, 'Not Observed') AS Score1B, ISNULL(Score1C, 'Not Observed') AS Score1C, ISNULL(Score1D, 'Not Observed') AS Score1D, ISNULL(Score1E, 'Not Observed') AS Score1E, ISNULL(Score1F, 'Not Observed') AS Score1F, ISNULL(Score1G, 'Not Observed') AS Score1G, ISNULL(Score2A, 'Not Observed') AS Score2A, ISNULL(Score2B, 'Not Observed') AS Score2B, ISNULL(Score2C, 'Not Observed') AS Score2C, ISNULL(Score2D, 'Not Observed') AS Score2D, ISNULL(Score2E, 'Not Observed') AS Score2E, ISNULL(Score3A, 'Not Observed') AS Score3A, ISNULL(Score3B, 'Not Observed') AS Score3B, ISNULL(Score3C, 'Not Observed') AS Score3C, ISNULL(Score3D, 'Not Observed') AS Score3D, ISNULL(Score4A, 'Not Observed') AS Score4A, ISNULL(Score4B, 'Not Observed') AS Score4B, ISNULL(Score4C, 'Not Observed') AS Score4C, ISNULL(Score4D, 'Not Observed') AS Score4D, ISNULL(Score5A, 'Not Observed') AS Score5A, ISNULL(Score5B, 'Not Observed') AS Score5B, ISNULL(Score5C, 'Not Observed') AS Score5C, ISNULL(Score5D, 'Not Observed') AS Score5D, ISNULL(Score6A, 'Not Observed') AS Score6A, ISNULL(Score6B, 'Not Observed') AS Score6B, ISNULL(Score7A, 'Not Observed') AS Score7A, ISNULL(Score7B, 'Not Observed') AS Score7B, ISNULL(Score7C, 'Not Observed') AS Score7C, ISNULL(Score7D, 'Not Observed') AS Score7D, ISNULL(Score7E, 'Not Observed') AS Score7E, ISNULL(Comment, '') AS Comment FROM [TEMPcustomers] a LEFT JOIN dbo.TEMPStudentSubjectScore_Nursery_Skills2 b ON a.CustomerCode = b.PortalNumber AND SessionName = @SessionName AND TermName = @TermName AND AssessmentType = @AssessmentType WHERE CustomerCode = @CustomerCode ORDER BY [CustomerName] "
        Me.dsSqlSkillsReport.SelectParameters("CustomerCode").DefaultValue = portalNumber
        Me.dsSqlSkillsReport.SelectParameters("SessionName").DefaultValue = sessionName
        Me.dsSqlSkillsReport.SelectParameters("TermName").DefaultValue = TermName
        Me.dsSqlSkillsReport.SelectParameters("AssessmentType").DefaultValue = assessmentType
    End Sub
End Class
