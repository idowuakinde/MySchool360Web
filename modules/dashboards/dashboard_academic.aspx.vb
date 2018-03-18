Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_school_dashboard_academic
    Inherits System.Web.UI.Page

    Public currentTarget As Int32 = CInt(System.Configuration.ConfigurationManager.AppSettings("Annual_Revenue_Target"))
    Public filterDate_Start As DateTime, filterDate_End As DateTime
    Public filterExpression As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        ''''STUDENT-LEVEL PERFORMANCE TRACKER
        Chart4.Type = ChartType.Combo
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "The average score of %xvalue students was %yvalue% in the last examinations"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de4.CommandTimeout = 300
        de4.SqlStatement = "select StudentLevel, Avg(Score)+40 as AverageScore from dbo.VW_EXAM_RESULTS " & filterExpression & " group by StudentLevel order by StudentLevel"
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        sc4(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        Chart4.SeriesCollection.Add(sc4)

        ''''STUDENT-GEO TRACKER
        Chart5.Type = ChartType.Combo
        Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart5.DefaultSeries.DefaultElement.ToolTip = "The average score of %xvalue students was %yvalue% in the last examinations"
        Chart5.Debug = True
        Chart5.Mentor = False
        Chart5.LegendBox.Visible = False
        Chart5.ShadingEffectMode = ShadingEffectMode.Three
        Chart5.DefaultElement.ShowValue = False
        'Add a series
        Dim de5 As DataEngine
        de5 = New DataEngine()
        de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de5.CommandTimeout = 300
        de5.SqlStatement = "select GeoCode, Avg(Score)+40 as AverageScore from dbo.VW_EXAM_RESULTS " & filterExpression & " group by GeoCode order by GeoCode"
        Dim sc5 As SeriesCollection
        sc5 = de5.GetSeries()
        sc5(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        Chart5.SeriesCollection.Add(sc5)

        ''''MULTIPLE-CAMPUS TRACKER
        Chart6.Type = ChartType.Combo
        Chart6.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart6.DefaultSeries.DefaultElement.ToolTip = "The average score of %xvalue students was %yvalue% in the last examinations"
        Chart6.Debug = True
        Chart6.Mentor = False
        Chart6.LegendBox.Visible = False
        Chart6.ShadingEffectMode = ShadingEffectMode.Three
        Chart6.DefaultElement.ShowValue = False
        'Add a series
        Dim de6 As DataEngine
        de6 = New DataEngine()
        de6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de6.CommandTimeout = 300
        de6.SqlStatement = "select Campus, Avg(Score)+40 as AverageScore from dbo.VW_EXAM_RESULTS " & filterExpression & " group by Campus order by Campus"
        Dim sc6 As SeriesCollection
        sc6 = de6.GetSeries()
        sc6(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        Chart6.SeriesCollection.Add(sc6)

        ''''FACULTY TRACKER
        Chart7.Type = ChartType.Combo
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "The average score of %xvalue students was %yvalue% in the last examinations"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de7.CommandTimeout = 300
        de7.SqlStatement = "select Faculty, Avg(Score)+40 as AverageScore from dbo.VW_EXAM_RESULTS " & filterExpression & " group by Faculty order by Faculty"
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        sc7(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        Chart7.SeriesCollection.Add(sc7)
    End Sub

End Class
