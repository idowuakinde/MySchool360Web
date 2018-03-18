Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_dashboard_teacher
    Inherits System.Web.UI.Page

    Public matricNumber As String, classSize As Int32, classPosition As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        matricNumber = "23122" 'Request.QueryString("a")

        ''''OVERALL
        Chart0.Type = ChartType.Combo
        'Chart0.DefaultSeries.Type = SeriesType.Spline
        Chart0.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart0.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart0.Debug = True
        Chart0.Mentor = False
        Chart0.LegendBox.Visible = False
        Chart0.ShadingEffectMode = ShadingEffectMode.Three
        Chart0.DefaultElement.ShowValue = False
        Chart0.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de0 As DataEngine
        de0 = New DataEngine()
        de0.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de0.CommandTimeout = 300
        de0.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, (Eval1 + Eval2 + Eval3 + Eval4 + Eval5 + Eval6 + Eval7 + Eval8)/8 AS AggregateScore from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by AggregateScore "
        Dim sc0 As SeriesCollection
        sc0 = de0.GetSeries()
        If sc0.Count > 0 Then
            sc0(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart0.YAxis.ScaleRange.ValueLow = sc0(0).Elements(0).YValue - 2
			'Chart0.YAxis.ScaleRange.ValueHigh = sc0(0).Elements(sc0(0).Elements.Count - 1).YValue + 2
        End If
        Chart0.SeriesCollection.Add(sc0)

        Chart1.Type = ChartType.Combo
        'Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de1 As DataEngine
        de1 = New DataEngine()
        de1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de1.CommandTimeout = 300
        de1.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval1 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc1 As SeriesCollection
        sc1 = de1.GetSeries()
        If sc1.Count > 0 Then
            sc1(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart1.YAxis.ScaleRange.ValueLow = sc1(0).Elements(0).YValue - 2
			Chart1.YAxis.ScaleRange.ValueHigh = sc1(0).Elements(sc1(0).Elements.Count - 1).YValue + 3
        End If
        Chart1.SeriesCollection.Add(sc1)

        Chart2.Type = ChartType.Combo
        'Chart2.DefaultSeries.Type = SeriesType.Spline
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart2.Debug = True
        Chart2.Mentor = False
        Chart2.LegendBox.Visible = False
        Chart2.ShadingEffectMode = ShadingEffectMode.Three
        Chart2.DefaultElement.ShowValue = False
        Chart2.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de2 As DataEngine
        de2 = New DataEngine()
        de2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de2.CommandTimeout = 300
        de2.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval2 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        If sc2.Count > 0 Then
            sc2(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart2.YAxis.ScaleRange.ValueLow = sc2(0).Elements(0).YValue - 2
			Chart2.YAxis.ScaleRange.ValueHigh = sc2(0).Elements(sc2(0).Elements.Count - 1).YValue + 3
        End If
        Chart2.SeriesCollection.Add(sc2)

        Chart3.Type = ChartType.Combo
        'Chart3.DefaultSeries.Type = SeriesType.Spline
        Chart3.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart3.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart3.Debug = True
        Chart3.Mentor = False
        Chart3.LegendBox.Visible = False
        Chart3.ShadingEffectMode = ShadingEffectMode.Three
        Chart3.DefaultElement.ShowValue = False
        Chart3.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de3 As DataEngine
        de3 = New DataEngine()
        de3.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de3.CommandTimeout = 300
        de3.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval3 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc3 As SeriesCollection
        sc3 = de3.GetSeries()
        If sc3.Count > 0 Then
            sc3(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart3.YAxis.ScaleRange.ValueLow = sc3(0).Elements(0).YValue - 2
			Chart3.YAxis.ScaleRange.ValueHigh = sc3(0).Elements(sc3(0).Elements.Count - 1).YValue + 3
        End If
        Chart3.SeriesCollection.Add(sc3)

        Chart4.Type = ChartType.Combo
        'Chart4.DefaultSeries.Type = SeriesType.Spline
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        Chart4.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de4.CommandTimeout = 300
        de4.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval4 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        If sc4.Count > 0 Then
            sc4(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart4.YAxis.ScaleRange.ValueLow = sc4(0).Elements(0).YValue - 2
			Chart4.YAxis.ScaleRange.ValueHigh = sc4(0).Elements(sc4(0).Elements.Count - 1).YValue + 3
        End If
        Chart4.SeriesCollection.Add(sc4)

        Chart5.Type = ChartType.Combo
        'Chart5.DefaultSeries.Type = SeriesType.Spline
        Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart5.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart5.Debug = True
        Chart5.Mentor = False
        Chart5.LegendBox.Visible = False
        Chart5.ShadingEffectMode = ShadingEffectMode.Three
        Chart5.DefaultElement.ShowValue = False
        Chart5.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de5 As DataEngine
        de5 = New DataEngine()
        de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de5.CommandTimeout = 300
        de5.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval5 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc5 As SeriesCollection
        sc5 = de5.GetSeries()
        If sc5.Count > 0 Then
            sc5(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart5.YAxis.ScaleRange.ValueLow = sc5(0).Elements(0).YValue - 2
			Chart5.YAxis.ScaleRange.ValueHigh = sc5(0).Elements(sc5(0).Elements.Count - 1).YValue + 3
        End If
        Chart5.SeriesCollection.Add(sc5)

        Chart6.Type = ChartType.Combo
        'Chart6.DefaultSeries.Type = SeriesType.Spline
        Chart6.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart6.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart6.Debug = True
        Chart6.Mentor = False
        Chart6.LegendBox.Visible = False
        Chart6.ShadingEffectMode = ShadingEffectMode.Three
        Chart6.DefaultElement.ShowValue = False
        Chart6.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de6 As DataEngine
        de6 = New DataEngine()
        de6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de6.CommandTimeout = 300
        de6.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval6 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc6 As SeriesCollection
        sc6 = de6.GetSeries()
        If sc6.Count > 0 Then
            sc6(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart6.YAxis.ScaleRange.ValueLow = sc6(0).Elements(0).YValue - 2
			Chart6.YAxis.ScaleRange.ValueHigh = sc6(0).Elements(sc6(0).Elements.Count - 1).YValue + 3
        End If
        Chart6.SeriesCollection.Add(sc6)

        Chart7.Type = ChartType.Combo
        'Chart7.DefaultSeries.Type = SeriesType.Spline
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        Chart7.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de7.CommandTimeout = 300
        de7.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval7 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        If sc7.Count > 0 Then
            sc7(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart7.YAxis.ScaleRange.ValueLow = sc7(0).Elements(0).YValue - 2
			Chart7.YAxis.ScaleRange.ValueHigh = sc7(0).Elements(sc7(0).Elements.Count - 1).YValue + 3
        End If
        Chart7.SeriesCollection.Add(sc7)

        Chart8.Type = ChartType.Combo
        'Chart8.DefaultSeries.Type = SeriesType.Spline
        Chart8.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart8.DefaultSeries.DefaultElement.ToolTip = "Teacher: %xvalue, Score: %yvalue out of 4.0"
        Chart8.Debug = True
        Chart8.Mentor = False
        Chart8.LegendBox.Visible = False
        Chart8.ShadingEffectMode = ShadingEffectMode.Three
        Chart8.DefaultElement.ShowValue = False
        Chart8.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de8 As DataEngine
        de8 = New DataEngine()
        de8.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de8.CommandTimeout = 300
        de8.SqlStatement = " select c.FirstName + ' ' + c.Surname AS Username, Eval8 AS Score from TEMPScoreSheet_Teacher a INNER JOIN Core_User c ON a.Username = c.Username order by Score "
        Dim sc8 As SeriesCollection
        sc8 = de8.GetSeries()
        If sc8.Count > 0 Then
            sc8(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
			'Chart8.YAxis.ScaleRange.ValueLow = sc8(0).Elements(0).YValue - 2
			Chart8.YAxis.ScaleRange.ValueHigh = sc8(0).Elements(sc8(0).Elements.Count - 1).YValue + 3
        End If
        Chart8.SeriesCollection.Add(sc8)
    End Sub

End Class
