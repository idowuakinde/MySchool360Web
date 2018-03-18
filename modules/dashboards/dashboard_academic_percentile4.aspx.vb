Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_dashboard_academic_percentile4
    Inherits System.Web.UI.Page

    Public sessionName As String, termName As String, assessmentType As String, classNames As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        StatisticalEngine.Options.MatchColors = True
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        termName = "2nd Term" 'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
        assessmentType = "After Mid-Term"

        ''''PLAYGROUP
        If assessmentType = "Before Mid-Term" Then
            Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
            Chart7.Visible = False
        Else
            classNames = "PLAYGROUP"
            Chart7.Type = ChartType.Combo
            Chart7.DefaultSeries.Type = SeriesType.Spline
            Chart7.Width = Unit.Parse(900)
            Chart7.Height = Unit.Parse(250)
            Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
            Chart7.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
            Chart7.Debug = True
            Chart7.Mentor = False
            Chart7.LegendBox.Visible = False
            Chart7.ShadingEffectMode = ShadingEffectMode.Three
            Chart7.DefaultElement.ShowValue = False
            Chart7.DefaultSeries.PaletteName = Palette.Mixed
            Chart7.YAxis.FormatString = "{n:0}"
            Chart7.YAxis.ScaleRange.ValueLow = 0
            Chart7.YAxis.ScaleRange.ValueHigh = 100
            Chart7.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
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
            End If
            Chart7.SeriesCollection.Add(sc7)
        End If

        ''''PRE-NURSERY
        If assessmentType = "Before Mid-Term" Then
            Chart8.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
            Chart8.Visible = False
        Else
            classNames = "PRE-NURSERY"
            Chart8.Type = ChartType.Combo
            Chart8.DefaultSeries.Type = SeriesType.Spline
            Chart8.Width = Unit.Parse(900)
            Chart8.Height = Unit.Parse(250)
            Chart8.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
            Chart8.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
            Chart8.Debug = True
            Chart8.Mentor = False
            Chart8.LegendBox.Visible = False
            Chart8.ShadingEffectMode = ShadingEffectMode.Three
            Chart8.DefaultElement.ShowValue = False
            Chart8.DefaultSeries.PaletteName = Palette.Mixed
            Chart8.YAxis.FormatString = "{n:0}"
            Chart8.YAxis.ScaleRange.ValueLow = 0
            Chart8.YAxis.ScaleRange.ValueHigh = 100
            Chart8.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
            'Add a series
            Dim de8 As DataEngine
            de8 = New DataEngine()
            de8.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
            de8.CommandTimeout = 300
            de8.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
            Dim sc8 As SeriesCollection
            sc8 = de8.GetSeries()
            If sc8.Count > 0 Then
                sc8(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
                'Add the percentile as a 'Data Distribution' series
                Dim dd8 As Series = StatisticalEngine.DataDistribution(sc8(0))
                dd8.YAxis.ScaleRange = Chart8.YAxis.ScaleRange
            End If
            Chart8.SeriesCollection.Add(sc8)
        End If

        ''''NURSERY 1
        classNames = "NURSERY 1 BLUE', 'NURSERY 1 RED"
        chart6.Type = ChartType.Combo
        chart6.DefaultSeries.Type = SeriesType.Spline
        chart6.Width = Unit.Parse(900)
        chart6.Height = Unit.Parse(250)
        chart6.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        chart6.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        chart6.Debug = True
        chart6.Mentor = False
        chart6.LegendBox.Visible = False
        chart6.ShadingEffectMode = ShadingEffectMode.Three
        chart6.DefaultElement.ShowValue = False
        chart6.DefaultSeries.PaletteName = Palette.Mixed
        chart6.YAxis.FormatString = "{n:0}"
        chart6.YAxis.ScaleRange.ValueLow = 0
        chart6.YAxis.ScaleRange.ValueHigh = 100
        chart6.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
        'Add a series
        Dim de6 As DataEngine
        de6 = New DataEngine()
        de6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de6.CommandTimeout = 300
        de6.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc6 As SeriesCollection
        sc6 = de6.GetSeries()
        If sc6.Count > 0 Then
            sc6(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd6 As Series = StatisticalEngine.DataDistribution(sc6(0))
            dd6.YAxis.ScaleRange = chart6.YAxis.ScaleRange
        End If
        chart6.SeriesCollection.Add(sc6)

        ''''''''NURSERY 2
        classNames = "NURSERY 2 BLUE', 'NURSERY 2 RED"
        chart5.Type = ChartType.Combo
        chart5.DefaultSeries.Type = SeriesType.Spline
        chart5.Width = Unit.Parse(900)
        chart5.Height = Unit.Parse(250)
        chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        chart5.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        chart5.Debug = True
        chart5.Mentor = False
        chart5.LegendBox.Visible = False
        chart5.ShadingEffectMode = ShadingEffectMode.Three
        chart5.DefaultElement.ShowValue = False
        chart5.DefaultSeries.PaletteName = Palette.Mixed
        chart5.YAxis.FormatString = "{n:0}"
        chart5.YAxis.ScaleRange.ValueLow = 0
        chart5.YAxis.ScaleRange.ValueHigh = 100
        chart5.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
        'Add a series
        Dim de5 As DataEngine
        de5 = New DataEngine()
        de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de5.CommandTimeout = 300
        de5.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc5 As SeriesCollection
        sc5 = de5.GetSeries()
        If sc5.Count > 0 Then
            sc5(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd5 As Series = StatisticalEngine.DataDistribution(sc5(0))
            dd5.YAxis.ScaleRange = chart5.YAxis.ScaleRange
        End If
        chart5.SeriesCollection.Add(sc5)

        ''''YEAR 1
        classNames = "YEAR 1 BLUE', 'YEAR 1 RED"
        Chart4.Type = ChartType.Combo
        Chart4.DefaultSeries.Type = SeriesType.Spline
        Chart4.Width = Unit.Parse(900)
        Chart4.Height = Unit.Parse(250)
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        Chart4.DefaultSeries.PaletteName = Palette.Mixed
        Chart4.YAxis.FormatString = "{n:0}"
        Chart4.YAxis.ScaleRange.ValueLow = 0
        Chart4.YAxis.ScaleRange.ValueHigh = 100
        Chart4.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de4.CommandTimeout = 300
        de4.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        If sc4.Count > 0 Then
            sc4(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd4 As Series = StatisticalEngine.DataDistribution(sc4(0))
            dd4.YAxis.ScaleRange = Chart4.YAxis.ScaleRange
        End If
        Chart4.SeriesCollection.Add(sc4)

        ''''YEAR 2
        classNames = "YEAR 2 BLUE', 'YEAR 2 RED"
        Chart3.Type = ChartType.Combo
        Chart3.DefaultSeries.Type = SeriesType.Spline
        Chart3.Width = Unit.Parse(900)
        Chart3.Height = Unit.Parse(250)
        Chart3.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart3.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart3.Debug = True
        Chart3.Mentor = False
        Chart3.LegendBox.Visible = False
        Chart3.ShadingEffectMode = ShadingEffectMode.Three
        Chart3.DefaultElement.ShowValue = False
        Chart3.DefaultSeries.PaletteName = Palette.Mixed
        Chart3.YAxis.FormatString = "{n:0}"
        Chart3.YAxis.ScaleRange.ValueLow = 0
        Chart3.YAxis.ScaleRange.ValueHigh = 100
        Chart3.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
        'Add a series
        Dim de3 As DataEngine
        de3 = New DataEngine()
        de3.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de3.CommandTimeout = 300
        de3.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc3 As SeriesCollection
        sc3 = de3.GetSeries()
        If sc3.Count > 0 Then
            sc3(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd3 As Series = StatisticalEngine.DataDistribution(sc3(0))
            dd3.YAxis.ScaleRange = Chart3.YAxis.ScaleRange
        End If
        Chart3.SeriesCollection.Add(sc3)

        ''''YEAR 3
        classNames = "YEAR 3 BLUE', 'YEAR 3 RED"
        Chart2.Type = ChartType.Combo
        Chart2.DefaultSeries.Type = SeriesType.Spline
        Chart2.Width = Unit.Parse(900)
        Chart2.Height = Unit.Parse(250)
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart2.Debug = True
        Chart2.Mentor = False
        Chart2.LegendBox.Visible = False
        Chart2.ShadingEffectMode = ShadingEffectMode.Three
        Chart2.DefaultElement.ShowValue = False
        Chart2.DefaultSeries.PaletteName = Palette.Mixed
        Chart2.YAxis.FormatString = "{n:0}"
        Chart2.YAxis.ScaleRange.ValueLow = 0
        Chart2.YAxis.ScaleRange.ValueHigh = 100
        Chart2.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
        'Add a series
        Dim de2 As DataEngine
        de2 = New DataEngine()
        de2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de2.CommandTimeout = 300
        de2.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        If sc2.Count > 0 Then
            sc2(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd2 As Series = StatisticalEngine.DataDistribution(sc2(0))
            dd2.YAxis.ScaleRange = Chart2.YAxis.ScaleRange
        End If
        Chart2.SeriesCollection.Add(sc2)

        ''''YEAR 4
        classNames = "YEAR 4 BLUE', 'YEAR 4 RED"
        Chart1.Type = ChartType.Combo
        Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.Width = Unit.Parse(900)
        Chart1.Height = Unit.Parse(250)
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.DefaultSeries.PaletteName = Palette.Mixed
        Chart1.YAxis.FormatString = "{n:0}"
        Chart1.YAxis.ScaleRange.ValueLow = 0
        Chart1.YAxis.ScaleRange.ValueHigh = 100
        Chart1.URL = "dashboard_academic_percentile_detail4.aspx?a=" & classNames
        'Add a series
        Dim de1 As DataEngine
        de1 = New DataEngine()
        de1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de1.CommandTimeout = 300
        de1.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc1 As SeriesCollection
        sc1 = de1.GetSeries()
        If sc1.Count > 0 Then
            sc1(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd1 As Series = StatisticalEngine.DataDistribution(sc1(0))
            dd1.YAxis.ScaleRange = Chart1.YAxis.ScaleRange
        End If
        Chart1.SeriesCollection.Add(sc1)

        ''''YEAR 5
        classNames = "YEAR 5 BLUE', 'YEAR 5 RED"
        Chart13.Type = ChartType.Combo
        Chart13.DefaultSeries.Type = SeriesType.Spline
        Chart13.Width = Unit.Parse(900)
        Chart13.Height = Unit.Parse(250)
        Chart13.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart13.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart13.Debug = True
        Chart13.Mentor = False
        Chart13.LegendBox.Visible = False
        Chart13.ShadingEffectMode = ShadingEffectMode.Three
        Chart13.DefaultElement.ShowValue = False
        Chart13.DefaultSeries.PaletteName = Palette.Mixed
        Chart13.YAxis.FormatString = "{n:0}"
        Chart13.YAxis.ScaleRange.ValueLow = 0
        Chart13.YAxis.ScaleRange.ValueHigh = 100
        Chart13.URL = "dashboard_academic_percentile_detail.aspx?a=" & classNames
        'Add a series
        Dim de13 As DataEngine
        de13 = New DataEngine()
        de13.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de13.CommandTimeout = 300
        de13.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc13 As SeriesCollection
        sc13 = de13.GetSeries()
        If sc13.Count > 0 Then
            sc13(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd13 As Series = StatisticalEngine.DataDistribution(sc13(0))
            dd13.YAxis.ScaleRange = Chart13.YAxis.ScaleRange
        End If
        Chart13.SeriesCollection.Add(sc13)

        ''''YEAR 6
        classNames = "YEAR 6"
        Chart14.Type = ChartType.Combo
        Chart14.DefaultSeries.Type = SeriesType.Spline
        Chart14.Width = Unit.Parse(900)
        Chart14.Height = Unit.Parse(250)
        Chart14.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart14.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart14.Debug = True
        Chart14.Mentor = False
        Chart14.LegendBox.Visible = False
        Chart14.ShadingEffectMode = ShadingEffectMode.Three
        Chart14.DefaultElement.ShowValue = False
        Chart14.DefaultSeries.PaletteName = Palette.Mixed
        Chart14.YAxis.FormatString = "{n:0}"
        Chart14.YAxis.ScaleRange.ValueLow = 0
        Chart14.YAxis.ScaleRange.ValueHigh = 100
        Chart14.URL = "dashboard_academic_percentile_detail.aspx?a=" & classNames
        'Add a series
        Dim de14 As DataEngine
        de14 = New DataEngine()
        de14.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de14.CommandTimeout = 300
        de14.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc14 As SeriesCollection
        sc14 = de14.GetSeries()
        If sc14.Count > 0 Then
            sc14(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd14 As Series = StatisticalEngine.DataDistribution(sc14(0))
            dd14.YAxis.ScaleRange = Chart14.YAxis.ScaleRange
        End If
        Chart14.SeriesCollection.Add(sc14)

        ''''YEAR 7
        classNames = "YEAR 7"
        Chart9.Type = ChartType.Combo
        Chart9.DefaultSeries.Type = SeriesType.Spline
        Chart9.Width = Unit.Parse(900)
        Chart9.Height = Unit.Parse(250)
        Chart9.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart9.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart9.Debug = True
        Chart9.Mentor = False
        Chart9.LegendBox.Visible = False
        Chart9.ShadingEffectMode = ShadingEffectMode.Three
        Chart9.DefaultElement.ShowValue = False
        Chart9.DefaultSeries.PaletteName = Palette.Mixed
        Chart9.YAxis.FormatString = "{n:0}"
        Chart9.YAxis.ScaleRange.ValueLow = 0
        Chart9.YAxis.ScaleRange.ValueHigh = 100
        Chart9.URL = "dashboard_academic_percentile_detail.aspx?a=" & classNames
        'Add a series
        Dim de9 As DataEngine
        de9 = New DataEngine()
        de9.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de9.CommandTimeout = 300
        de9.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc9 As SeriesCollection
        sc9 = de9.GetSeries()
        If sc9.Count > 0 Then
            sc9(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd9 As Series = StatisticalEngine.DataDistribution(sc9(0))
            dd9.YAxis.ScaleRange = Chart9.YAxis.ScaleRange
        End If
        Chart9.SeriesCollection.Add(sc9)

        ''''YEAR 8
        classNames = "YEAR 8"
        Chart10.Type = ChartType.Combo
        Chart10.DefaultSeries.Type = SeriesType.Spline
        Chart10.Width = Unit.Parse(900)
        Chart10.Height = Unit.Parse(250)
        Chart10.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart10.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart10.Debug = True
        Chart10.Mentor = False
        Chart10.LegendBox.Visible = False
        Chart10.ShadingEffectMode = ShadingEffectMode.Three
        Chart10.DefaultElement.ShowValue = False
        Chart10.DefaultSeries.PaletteName = Palette.Mixed
        Chart10.YAxis.FormatString = "{n:0}"
        Chart10.YAxis.ScaleRange.ValueLow = 0
        Chart10.YAxis.ScaleRange.ValueHigh = 100
        Chart10.URL = "dashboard_academic_percentile_detail.aspx?a=" & classNames
        'Add a series
        Dim de10 As DataEngine
        de10 = New DataEngine()
        de10.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de10.CommandTimeout = 300
        de10.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc10 As SeriesCollection
        sc10 = de10.GetSeries()
        If sc10.Count > 0 Then
            sc10(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd10 As Series = StatisticalEngine.DataDistribution(sc10(0))
            dd10.YAxis.ScaleRange = Chart10.YAxis.ScaleRange
        End If
        Chart10.SeriesCollection.Add(sc10)

        ''''YEAR 9
        classNames = "YEAR 9"
        Chart11.Type = ChartType.Combo
        Chart11.DefaultSeries.Type = SeriesType.Spline
        Chart11.Width = Unit.Parse(900)
        Chart11.Height = Unit.Parse(250)
        Chart11.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart11.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart11.Debug = True
        Chart11.Mentor = False
        Chart11.LegendBox.Visible = False
        Chart11.ShadingEffectMode = ShadingEffectMode.Three
        Chart11.DefaultElement.ShowValue = False
        Chart11.DefaultSeries.PaletteName = Palette.Mixed
        Chart11.YAxis.FormatString = "{n:0}"
        Chart11.YAxis.ScaleRange.ValueLow = 0
        Chart11.YAxis.ScaleRange.ValueHigh = 100
        Chart11.URL = "dashboard_academic_percentile_detail.aspx?a=" & classNames
        'Add a series
        Dim de11 As DataEngine
        de11 = New DataEngine()
        de11.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de11.CommandTimeout = 300
        de11.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc11 As SeriesCollection
        sc11 = de11.GetSeries()
        If sc11.Count > 0 Then
            sc11(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd11 As Series = StatisticalEngine.DataDistribution(sc11(0))
            dd11.YAxis.ScaleRange = Chart11.YAxis.ScaleRange
        End If
        Chart11.SeriesCollection.Add(sc11)

        ''''YEAR 10
        classNames = "YEAR 10"
        Chart12.Type = ChartType.Combo
        Chart12.DefaultSeries.Type = SeriesType.Spline
        Chart12.Width = Unit.Parse(900)
        Chart12.Height = Unit.Parse(250)
        Chart12.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart12.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart12.Debug = True
        Chart12.Mentor = False
        Chart12.LegendBox.Visible = False
        Chart12.ShadingEffectMode = ShadingEffectMode.Three
        Chart12.DefaultElement.ShowValue = False
        Chart12.DefaultSeries.PaletteName = Palette.Mixed
        Chart12.YAxis.FormatString = "{n:0}"
        Chart12.YAxis.ScaleRange.ValueLow = 0
        Chart12.YAxis.ScaleRange.ValueHigh = 100
        Chart12.URL = "dashboard_academic_percentile_detail.aspx?a=" & classNames
        'Add a series
        Dim de12 As DataEngine
        de12 = New DataEngine()
        de12.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de12.CommandTimeout = 300
        de12.SqlStatement = " SELECT StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN ('" & classNames & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc12 As SeriesCollection
        sc12 = de12.GetSeries()
        If sc12.Count > 0 Then
            sc12(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
            'Add the percentile as a 'Data Distribution' series
            Dim dd12 As Series = StatisticalEngine.DataDistribution(sc12(0))
            dd12.YAxis.ScaleRange = Chart12.YAxis.ScaleRange
        End If
        Chart12.SeriesCollection.Add(sc12)
    End Sub
End Class
