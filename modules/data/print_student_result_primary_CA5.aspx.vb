
Partial Class modules_data_print_student_result_primary_CA5
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, innerSerial As Int32 = 0, innerTotal As Int32 = 0, innerAverage As Int32 = 0, portalNumber As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "3rd Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

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

        Me.dsSqlStudents.SelectCommand = " SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, ISNULL(Score_PE, '') AS Score_PE, ISNULL(ClubsAndExtras, '') AS ClubsAndExtras, ISNULL(DaysAbsent, 0) as DaysAbsent, CASE ISNULL(Punctuality, 0) WHEN 0 THEN 'Unspecified' WHEN 1 THEN 'Never punctual' WHEN 2 THEN 'Sometimes punctual' WHEN 3 THEN 'Always punctual' END AS Punctuality, ISNULL(ClassTeacherComment, '') AS ClassTeacherComment FROM dbo.TEMPCustomers_MultiSession a LEFT JOIN dbo.TEMPStudentSubjectScoreTeacherComment b ON a.CustomerCode = b.PortalNumber AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' WHERE CustomerCode = '" & portalNumber & "' ORDER BY PortalNumber "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = className
        Me.dsSqlStudents.DataBind()

        Me.dsSqlSubjects.SelectCommand = " SELECT CustomerId, CustomerCode as PortalNumber, d.SubjectName, ScoreId, (ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0))*2 AS MidTermSubjectScore FROM dbo.TEMPCustomers_MultiSession a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName AND AssessmentType = @AssessmentType INNER JOIN dbo.TEMPSubject d ON b.SubjectShortName = d.ShortName WHERE a.CustomerCode = @PortalNumber AND ISNULL(c.Score, 0) + ISNULL(c.ScoreClassTest, 0) >= 0 AND IsNull(a.BelongToCode, '2012/2013') = '" & sessionName & "' AND b.SessionName = @SessionName AND b.TermName = @TermName ORDER BY StudentSubjectId "
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
            innerTotal += (rowView("MidTermSubjectScore"))
        End If
    End Sub
End Class
