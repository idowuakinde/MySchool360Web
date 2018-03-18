
Partial Class modules_data_print_student_result_prenursery_CA2
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, innerAverage As Int32 = 0, portalNumber As String = "", className As String = "", assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "1st Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        If Request.QueryString("b") = "" Then
            sessionName = sessionName
        Else
            sessionName = Request.QueryString("b")
        End If
        Dim rowsClassName As System.Data.DataRowCollection = Common.GetTableRows(" SELECT DistrictCode FROM dbo.TEMPCustomers_MultiSession WHERE CustomerCode = '" & portalNumber & "' AND IsNull(BelongToCode, '2012/2013') = '" & sessionName & "' ")
        If rowsClassName.Count = 0 Then
            className = ""
        Else
            className = rowsClassName(0).Item(0).ToString
        End If
        'Response.Write("'" & className & "'")

        Me.dsSqlStudents.SelectCommand = "SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, ISNULL(c.ScoreA1, 0) AS ScoreA1, ISNULL(c.ScoreA2, 0) AS ScoreA2, ISNULL(c.ScoreA3, 0) AS ScoreA3, ISNULL(c.ScoreA4, 0) AS ScoreA4, ISNULL(c.ScoreA5, 0) AS ScoreA5, ISNULL(c.ScoreA6, 0) AS ScoreA6, ISNULL(c.ScoreB1, 0) AS ScoreB1, ISNULL(c.ScoreB2, 0) AS ScoreB2, ISNULL(c.ScoreB3, 0) AS ScoreB3, ISNULL(c.ScoreB4, 0) AS ScoreB4, ISNULL(c.ScoreC1, 0) AS ScoreC1, ISNULL(c.ScoreC2, 0) AS ScoreC2, ISNULL(c.ScoreC3, 0) AS ScoreC3, ISNULL(c.ScoreD1, 0) AS ScoreD1, ISNULL(c.ScoreD2, 0) AS ScoreD2, ISNULL(c.ScoreD3, 0) AS ScoreD3, ISNULL(c.ScoreD4, 0) AS ScoreD4, ISNULL(c.ScoreD5, 0) AS ScoreD5, ISNULL(c.ScoreD6, 0) AS ScoreD6, ISNULL(c.ScoreD7, 0) AS ScoreD7, ISNULL(c.ScoreD8, 0) AS ScoreD8, ISNULL(c.ScoreD9, 0) AS ScoreD9, ISNULL(c.ScoreD10, 0) AS ScoreD10, ISNULL(c.ScoreE1, 0) AS ScoreE1, ISNULL(c.ScoreE2, 0) AS ScoreE2, ISNULL(c.ScoreE3, 0) AS ScoreE3, ISNULL(c.ScoreE4, 0) AS ScoreE4, ISNULL(c.ScoreE5, 0) AS ScoreE5, ISNULL(c.ScoreE6, 0) AS ScoreE6, ISNULL(c.ScoreE7, 0) AS ScoreE7, ISNULL(c.ScoreE8, 0) AS ScoreE8, ISNULL(c.ScoreE9, 0) AS ScoreE9, ISNULL(c.ScoreE10, 0) AS ScoreE10, ISNULL(c.ScoreF1, 0) AS ScoreF1, ISNULL(c.ScoreF2, 0) AS ScoreF2, ISNULL(c.ScoreF3, 0) AS ScoreF3, ISNULL(c.ScoreF4, 0) AS ScoreF4, ISNULL(c.ScoreG1, 0) AS ScoreG1, ISNULL(c.ScoreG2, 0) AS ScoreG2, REPLACE(ISNULL(c.Comment, ''), '''''', '''') as Comment FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubjectScore_Nursery2 c ON a.CustomerCode = c.PortalNumber AND c.SessionName = @SessionName AND c.TermName = @TermName AND c.AssessmentType = @AssessmentType WHERE (a.DistrictCode = 'Playgroup' OR a.DistrictCode = 'Pre-Nursery') AND CustomerCode = '" & portalNumber & "' ORDER BY PortalNumber "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = sessionName
        Me.dsSqlStudents.SelectParameters(1).DefaultValue = TermName
        Me.dsSqlStudents.SelectParameters(2).DefaultValue = assessmentType
        Me.dsSqlStudents.SelectParameters(3).DefaultValue = className
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Me.gvMaster.SelectedIndex = e.Row.RowIndex
        End If
    End Sub
End Class
