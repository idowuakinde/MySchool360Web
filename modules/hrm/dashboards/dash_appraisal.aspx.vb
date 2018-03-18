Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_dash_appraisal
    Inherits System.Web.UI.Page
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Chart1.Type = ChartType.Combo
        'Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.URL = ""
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "%xvalue scored %yvalue% in the last Appraisal exercise"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de1 As DataEngine
        de1 = New DataEngine()
        de1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de1.SqlStatement = " select TOP 5 Surname, AggregateAppraisalScore FROM dbo.VW_APPRAISAL_AggregateScores WHERE SessionName = '" & sessionName & "' AND AppraisalDepartment = 'Administrative' ORDER BY AggregateAppraisalScore DESC "
        Dim sc1 As SeriesCollection
        sc1 = de1.GetSeries()
        If sc1.Count > 0 Then
            sc1(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        End If
        Chart1.YAxis.ScaleRange.ValueHigh = 100
        Chart1.SeriesCollection.Add(sc1)

        Chart2.Type = ChartType.Combo
        'Chart2.DefaultSeries.Type = SeriesType.Spline
        Chart2.URL = ""
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "%xvalue scored %yvalue% in the last Appraisal exercise"
        Chart2.Debug = True
        Chart2.Mentor = False
        Chart2.LegendBox.Visible = False
        Chart2.ShadingEffectMode = ShadingEffectMode.Three
        Chart2.DefaultElement.ShowValue = False
        Chart2.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de2 As DataEngine
        de2 = New DataEngine()
        de2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de2.SqlStatement = " select TOP 5 Surname, AggregateAppraisalScore FROM dbo.VW_APPRAISAL_AggregateScores WHERE SessionName = '" & sessionName & "' AND AppraisalDepartment = 'Teaching' ORDER BY AggregateAppraisalScore DESC "
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        If sc2.Count > 0 Then
            sc2(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        End If
        Chart2.YAxis.ScaleRange.ValueHigh = 100
        Chart2.SeriesCollection.Add(sc2)

        Chart3.Type = ChartType.Combo
        'Chart3.DefaultSeries.Type = SeriesType.Spline
        Chart3.URL = ""
        Chart3.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart3.DefaultSeries.DefaultElement.ToolTip = "%xvalue scored %yvalue% in the last Appraisal exercise"
        Chart3.Debug = True
        Chart3.Mentor = False
        Chart3.LegendBox.Visible = False
        Chart3.ShadingEffectMode = ShadingEffectMode.Three
        Chart3.DefaultElement.ShowValue = False
        Chart3.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de3 As DataEngine
        de3 = New DataEngine()
        de3.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de3.SqlStatement = " select TOP 5 Surname, AggregateAppraisalScore FROM dbo.VW_APPRAISAL_AggregateScores WHERE SessionName = '" & sessionName & "' AND AppraisalDepartment = 'Maintenance & Grounds' ORDER BY AggregateAppraisalScore DESC "
        Dim sc3 As SeriesCollection
        sc3 = de3.GetSeries()
        If sc3.Count > 0 Then
            sc3(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        End If
        Chart3.YAxis.ScaleRange.ValueHigh = 100
        Chart3.SeriesCollection.Add(sc3)
    End Sub
End Class
