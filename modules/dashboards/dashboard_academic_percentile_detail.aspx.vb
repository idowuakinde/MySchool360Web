Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_dashboard_academic_percentile_detail
    Inherits System.Web.UI.Page

    Public sessionName As String, termName As String, assessmentType As String, classNames As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        classNames = Request.QueryString("a")

        StatisticalEngine.Options.MatchColors = True
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        termName = "1st Term" 'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
        assessmentType = "Before Mid-Term"

        Chart7.Type = ChartType.Combo
        Chart7.DefaultSeries.Type = SeriesType.Spline
        Chart7.Width = Unit.Parse(900)
        Chart7.Height = Unit.Parse(500)
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        Chart7.DefaultSeries.PaletteName = Palette.Mixed
        Chart7.YAxis.ScaleRange.ValueLow = 0
        Chart7.YAxis.ScaleRange.ValueHigh = 100
        Chart7.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de7.CommandTimeout = 300
        de7.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        If sc7.Count > 0 Then
            sc7(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd7 As Series = StatisticalEngine.DataDistribution(sc7(0))
            dd7.YAxis.ScaleRange = Chart7.YAxis.ScaleRange
            Chart7.SeriesCollection.Add(dd7)
        End If
        Chart7.SeriesCollection.Add(sc7)
    End Sub
End Class
