
Partial Class modules_reports_rpt_menu_student
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", className As String = "", serial As Int32 = 0
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("b")
        If Request.QueryString("c") = "" Then
            sessionName = sessionName
        Else
            sessionName = Request.QueryString("c")
        End If

        Me.dsSqlStudentSubjects.SelectCommand = " SELECT DISTINCT [SubjectShortName] FROM [TEMPStudentSubject] WHERE ([PortalNumber] = @PortalNumber) AND SessionName = @SessionName ORDER BY [SubjectShortName] "
        Me.dsSqlStudentSubjects.SelectParameters(0).DefaultValue = portalNumber
        Me.dsSqlStudentSubjects.SelectParameters(1).DefaultValue = sessionName

        'set the hyperlink destinationURLs as appropriate
        If className.ToUpper = "PRE-NURSERY" Or className.ToUpper = "PLAYGROUP" Then
            Me.hlnkTerm1Aggregate0.NavigateUrl = ""
            Me.hlnkTerm1Aggregate.NavigateUrl = Common.GetStudentResultsPage2(className, "1st Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm2Aggregate0.NavigateUrl = ""
            Me.hlnkTerm2Aggregate.NavigateUrl = Common.GetStudentResultsPage2(className, "2nd Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm3Aggregate0.NavigateUrl = ""
            Me.hlnkTerm3Aggregate.NavigateUrl = Common.GetStudentResultsPage2(className, "3rd Term") & "?a=" & portalNumber & "&b=" & sessionName
        Else
            Me.hlnkTerm1Aggregate0.NavigateUrl = Common.GetStudentResultsPage(className, "1st Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm1Aggregate.NavigateUrl = Common.GetStudentResultsPage2(className, "1st Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm2Aggregate0.NavigateUrl = Common.GetStudentResultsPage(className, "2nd Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm2Aggregate.NavigateUrl = Common.GetStudentResultsPage2(className, "2nd Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm3Aggregate0.NavigateUrl = Common.GetStudentResultsPage(className, "3rd Term") & "?a=" & portalNumber & "&b=" & sessionName
            Me.hlnkTerm3Aggregate.NavigateUrl = Common.GetStudentResultsPage2(className, "3rd Term") & "?a=" & portalNumber & "&b=" & sessionName
        End If

        'set the labels for Behavioural Report as appropriate
        Select Case className.ToUpper
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED", "PLAYGROUP"    'nursery & playgroup
                Me.hlnkTerm1BehaviouralReport.Text = "Skills Report"
                Me.hlnkTerm1BehaviouralReport.NavigateUrl = Common.GetStudentResultsPage3(className, "1st Term") & "?a=" & portalNumber & "&b=" & sessionName
                Me.hlnkTerm2BehaviouralReport.Text = "Skills Report"
                Me.hlnkTerm2BehaviouralReport.NavigateUrl = Common.GetStudentResultsPage3(className, "2nd Term") & "?a=" & portalNumber & "&b=" & sessionName
                Me.hlnkTerm3BehaviouralReport.Text = "Skills Report"
                Me.hlnkTerm3BehaviouralReport.NavigateUrl = Common.GetStudentResultsPage3(className, "3rd Term") & "?a=" & portalNumber & "&b=" & sessionName
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"    'nursery & playgroup & primary
                Me.hlnkTerm1BehaviouralReport.Text = "Behavioural Assessment"
                Me.hlnkTerm1BehaviouralReport.NavigateUrl = Common.GetStudentResultsPage3(className, "1st Term") & "?a=" & portalNumber & "&b=" & sessionName
                Me.hlnkTerm2BehaviouralReport.Text = "Behavioural Assessment"
                Me.hlnkTerm2BehaviouralReport.NavigateUrl = Common.GetStudentResultsPage3(className, "2nd Term") & "?a=" & portalNumber & "&b=" & sessionName
                Me.hlnkTerm3BehaviouralReport.Text = "Behavioural Assessment"
                Me.hlnkTerm3BehaviouralReport.NavigateUrl = Common.GetStudentResultsPage3(className, "3rd Term") & "?a=" & portalNumber & "&b=" & sessionName
            Case Else
                Me.hlnkTerm1BehaviouralReport.Visible = False
                Me.hlnkTerm2BehaviouralReport.Visible = False
                Me.hlnkTerm3BehaviouralReport.Visible = False
        End Select
    End Sub

    Protected Sub gvSubjects_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSubjects.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
        End If
    End Sub
End Class
