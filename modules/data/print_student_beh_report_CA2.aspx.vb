
Partial Class modules_data_print_student_beh_report_CA2
    Inherits System.Web.UI.Page

    Public portalNumber As String, assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "1st Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        portalNumber = Request.QueryString("a")

        Me.dsSqlSkillsReport.SelectCommand = " SELECT UPPER(a.DistrictCode) AS DistrictCode, a.[CustomerCode], UPPER(a.CustomerName) AS CustomerName, ISNULL(Score1A, 'Poor') AS Score1A, ISNULL(Score1B, 'Poor') AS Score1B, ISNULL(Score1C, 'Poor') AS Score1C, ISNULL(Score1D, 'Poor') AS Score1D, ISNULL(Score1E, 'Poor') AS Score1E, ISNULL(Score2A, 'Poor') AS Score2A, ISNULL(Score2B, 'Poor') AS Score2B, ISNULL(Score2C, 'Poor') AS Score2C, ISNULL(Score2D, 'Poor') AS Score2D, ISNULL(Score2E, 'Poor') AS Score2E, ISNULL(Score3A, 'Poor') AS Score3A, ISNULL(Score3B, 'Poor') AS Score3B, ISNULL(Score3C, 'Poor') AS Score3C, ISNULL(Score3D, 'Poor') AS Score3D, ISNULL(Score3E, 'Poor') AS Score3E, ISNULL(Score4A, 'Poor') AS Score4A, ISNULL(Score4B, 'Poor') AS Score4B, ISNULL(Score4C, 'Poor') AS Score4C, ISNULL(Score4D, 'Poor') AS Score4D, ISNULL(Score4E, 'Poor') AS Score4E, ISNULL(Comment, '') AS Comment FROM [TEMPcustomers] a LEFT JOIN dbo.TEMPStudentSubjectScore_Primary_Skills2 b ON a.CustomerCode = b.PortalNumber AND SessionName = @SessionName AND TermName = @TermName AND AssessmentType = @AssessmentType WHERE CustomerCode = @CustomerCode ORDER BY [CustomerName] "
        Me.dsSqlSkillsReport.SelectParameters("CustomerCode").DefaultValue = portalNumber
        Me.dsSqlSkillsReport.SelectParameters("SessionName").DefaultValue = sessionName
        Me.dsSqlSkillsReport.SelectParameters("TermName").DefaultValue = TermName
        Me.dsSqlSkillsReport.SelectParameters("AssessmentType").DefaultValue = assessmentType
    End Sub
End Class
