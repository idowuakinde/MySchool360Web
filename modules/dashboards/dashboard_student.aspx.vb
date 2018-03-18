Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_school_dashboard_student
    Inherits System.Web.UI.Page

    Public portalNumber As String, sessionName As String, termName As String, className As String, serialSubjects As Int32 = 0, serialTests As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        termName = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("b")

        Me.dsSqlSubjects.SelectCommand = " Select SubjectId, SubjectShortName, SubjectName from dbo.VW_ACADEMICS_Student_Subject_Scores where PortalNumber = @MatricNumber AND SessionName = @SessionName AND TermName = @TermName AND SubjectShortName IS NOT NULL group by SubjectId, SubjectShortName, SubjectName order by AVG(PersonalAggregateSubjectScore) DESC "
        Me.dsSqlSubjects.SelectParameters(0).DefaultValue = portalNumber
        Me.dsSqlSubjects.SelectParameters(1).DefaultValue = sessionName
        Me.dsSqlSubjects.SelectParameters(2).DefaultValue = termName

        ''''OVERALL
        Chart0.Type = ChartType.Combo
        Chart0.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart0.DefaultSeries.DefaultElement.ToolTip = "Average: %yvalue% (across all subjects)"
        Chart0.Debug = True
        Chart0.Mentor = False
        Chart0.LegendBox.Visible = False
        Chart0.ShadingEffectMode = ShadingEffectMode.Three
        Chart0.DefaultElement.ShowValue = True
        Chart0.YAxis.FormatString = "{n:0}"
        Chart0.YAxis.ScaleRange.ValueLow = 0
        Chart0.YAxis.ScaleRange.ValueHigh = 100
        'Add a series
        Dim de0 As DataEngine
        de0 = New DataEngine()
        de0.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de0.CommandTimeout = 300
        de0.SqlStatement = " SELECT AssessmentType, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND PortalNumber = '" & portalNumber & "' AND AssessmentType IS NOT NULL GROUP BY AssessmentType ORDER BY AssessmentType DESC "
        Dim sc0 As SeriesCollection
        sc0 = de0.GetSeries()
        If sc0.Count > 0 Then
            sc0(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        End If
        Chart0.SeriesCollection.Add(sc0)

        Chart0b.Type = ChartType.Combo
        Chart0b.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart0b.DefaultSeries.DefaultElement.ToolTip = "Average: %yvalue%"
        Chart0b.Debug = True
        Chart0b.Mentor = False
        Chart0b.LegendBox.Visible = False
        Chart0b.ShadingEffectMode = ShadingEffectMode.Three
        Chart0b.DefaultElement.ShowValue = False
        Chart0b.YAxis.FormatString = "{n:0}"
        Chart0b.YAxis.ScaleRange.ValueLow = 0
        Chart0b.YAxis.ScaleRange.ValueHigh = 100
        'Add a series
        Dim de0b As DataEngine
        de0b = New DataEngine()
        de0b.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de0b.CommandTimeout = 300
        de0b.SqlStatement = " SELECT SubjectShortName, AVG(PersonalAggregateSubjectScore) AS PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND PortalNumber = '" & portalNumber & "' AND SubjectShortName IS NOT NULL GROUP BY SubjectShortName ORDER BY AVG(PersonalAggregateSubjectScore) DESC "
        Dim sc0b As SeriesCollection
        sc0b = de0b.GetSeries()
        If sc0b.Count > 0 Then
            sc0b(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        End If
        Chart0b.SeriesCollection.Add(sc0b)
    End Sub

    Protected Sub gvTests_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvTests.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialTests += 1
            Dim row As GridViewRow = CType(e.Row, GridViewRow)
            'load the test charts
            Dim testChart As dotnetCHARTING.Chart = row.FindControl("chartTest")
            Call BindChart(testChart, " SELECT SubjectShortName, AVG(PersonalAggregateSubjectScore) AS PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & row.DataItem("AssessmentType") & "' AND PortalNumber = '" & portalNumber & "' AND SubjectShortName IS NOT NULL GROUP BY SubjectShortName ORDER BY AVG(PersonalAggregateSubjectScore) DESC ", "Average: %yvalue% (" & row.DataItem("AssessmentType") & ")")
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
        End If
    End Sub

    Protected Sub gvSubjects_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvSubjects.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialSubjects += 1
            Dim row As GridViewRow = CType(e.Row, GridViewRow)
            'load the subject charts
            Dim subjectChart As dotnetCHARTING.Chart = row.FindControl("chartSubject")
            Call BindChart(subjectChart, " Select AssessmentType, PersonalAggregateSubjectScore from dbo.VW_ACADEMICS_Student_Subject_Scores a where PortalNumber = '" & portalNumber & "' and a.SubjectShortName = '" & row.DataItem("SubjectShortName") & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType IS NOT NULL group by AssessmentType, PersonalAggregateSubjectScore ORDER BY AssessmentType DESC", row.DataItem("SubjectShortName") & " %xvalue: %yvalue%")
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
        End If
    End Sub

    Private Sub BindChart(ByRef chartToBind As dotnetCHARTING.Chart, ByVal sqlStatement As String, ByVal tooltip As String)
        chartToBind.Type = ChartType.Combo
        chartToBind.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        chartToBind.DefaultSeries.DefaultElement.ToolTip = tooltip
        chartToBind.Debug = True
        chartToBind.Mentor = False
        chartToBind.LegendBox.Visible = False
        chartToBind.ShadingEffectMode = ShadingEffectMode.Three
        chartToBind.DefaultElement.ShowValue = False
        chartToBind.YAxis.FormatString = "{n:0}"
        chartToBind.YAxis.ScaleRange.ValueLow = 0
        chartToBind.YAxis.ScaleRange.ValueHigh = 100
        'Add a series
        Dim deSubject As DataEngine
        deSubject = New DataEngine()
        deSubject.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        deSubject.CommandTimeout = 300
        deSubject.SqlStatement = sqlStatement
        Dim scSubject As SeriesCollection
        scSubject = deSubject.GetSeries()
        If scSubject.Count > 0 Then
            scSubject(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        End If
        chartToBind.SeriesCollection.Add(scSubject)
    End Sub
End Class
