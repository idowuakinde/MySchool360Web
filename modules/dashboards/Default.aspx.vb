Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_school_Default
    Inherits System.Web.UI.Page

    Public totalRevenues As Double, stateText As String
    Public currentTarget As Int32 = CInt(System.Configuration.ConfigurationManager.AppSettings("Annual_Revenue_Target_School"))
    Public filterDate_Start As DateTime, filterDate_End As DateTime
    Public filterExpression As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        totalRevenues = GetTotalRevenues()

        stateText = FormatNumber(totalRevenues * 100 / currentTarget, 0)
        Me.Label4.BackColor = Color.Black
        If stateText >= 0 And stateText <= 50 Then
            Me.Label4.ForeColor = Color.Red
        ElseIf stateText > 50 And stateText <= 75 Then
            Me.Label4.ForeColor = Color.Yellow
        ElseIf stateText > 75 And stateText <= 100 Then
            Me.Label4.ForeColor = Color.Lime
        End If
        stateText &= "%"
        Me.Label4.Text = stateText
        Me.Label5.Text = "N" & currentTarget
        Me.Label6.Text = "N" & FormatNumber(totalRevenues, 1)

        'chart...
        Chart.Type = ChartType.Gauges
        Chart.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart.Background = New Background(Color.Gray)
        Chart.DefaultSeries.Background.Color = Color.White
        Chart.Use3D = True
        Chart.Debug = True
        Chart.Mentor = False
        Chart.LegendBox.Visible = False
        Chart.DefaultElement.ShowValue = True

        ' Create a series with a single element
        Dim s1 As New Series("Annual Revenue Target Tracker", New Element("", totalRevenues))
        ' Instantiate an axis for the created series.
        s1.YAxis = New Axis()
        s1.YAxis.Maximum = currentTarget
        ' Set visual properties of the axis.
        s1.YAxis.DefaultTick.Line.Width = 10
        s1.YAxis.DefaultTick.Line.EndCap = LineCap.Triangle
        ' Instantiate an axis marker.
        Dim am As New AxisMarker("", New Background(Color.Green), currentTarget * 0.75, currentTarget)
        ' Instantiate the second axis marker.
        Dim am2 As New AxisMarker("", New Background(Color.Yellow), currentTarget * 0.5, currentTarget * 0.75)
        ' Instantiate the third axis marker.
        Dim am3 As New AxisMarker("", New Background(Color.Red), 0, currentTarget * 0.5)
        ' Add the two axis markers to the series' axis.
        s1.YAxis.Markers.Add(am)
        s1.YAxis.Markers.Add(am2)
        s1.YAxis.Markers.Add(am3)
        ' Add the series
        Chart.SeriesCollection.Add(s1)

        ''''BANK PERFORMANCE TRACKER
        Chart1.Type = ChartType.Combo
		'Chart1.XAxis.RadarMode = RadarMode.Polar
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected from %xvalue"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de As DataEngine
        de = New DataEngine()
        de.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de.CommandTimeout = 300
        de.SqlStatement = "select NewBankName, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by NewBankName order by sum(amount) desc"
        Dim sc As SeriesCollection
        sc = de.GetSeries()
        Chart1.SeriesCollection.Add(sc)

        ''''REVENUE-HEAD PERFORMANCE TRACKER
        Chart2.Type = ChartType.Combo
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected in form of %xvalue fees"
        Chart2.Debug = True
        Chart2.Mentor = False
        Chart2.LegendBox.Visible = False
        Chart2.ShadingEffectMode = ShadingEffectMode.Three
        Chart2.DefaultElement.ShowValue = False
        Chart2.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de2 As DataEngine
        de2 = New DataEngine()
        de2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de2.CommandTimeout = 300
        de2.SqlStatement = "select TransactionType, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by TransactionType order by sum(amount) desc"
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        Chart2.SeriesCollection.Add(sc2)

        ''''STUDENT-LEVEL PERFORMANCE TRACKER
        Chart4.Type = ChartType.Combo
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected from %xvalue students"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        Chart4.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de4.CommandTimeout = 300
        de4.SqlStatement = "select ZoneCode, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by ZoneCode order by ZoneCode"
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        Chart4.SeriesCollection.Add(sc4)

        ''''STUDENT-GEO TRACKER
        Chart5.Type = ChartType.Combo
        Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart5.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected from students of %xvalue origin"
        Chart5.Debug = True
        Chart5.Mentor = False
        Chart5.LegendBox.Visible = False
        Chart5.ShadingEffectMode = ShadingEffectMode.Three
        Chart5.DefaultElement.ShowValue = False
        Chart5.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de5 As DataEngine
        de5 = New DataEngine()
        de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de5.CommandTimeout = 300
        de5.SqlStatement = "select DistrictCode, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by DistrictCode order by sum(amount) desc"
        Dim sc5 As SeriesCollection
        sc5 = de5.GetSeries()
        Chart5.SeriesCollection.Add(sc5)

        ''''PAYMENT-CHANNEL TRACKER
        Chart7.Type = ChartType.Combo
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected via %xvalue"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        Chart7.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de7.CommandTimeout = 300
        de7.SqlStatement = "select ModeOfPayment, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by ModeOfPayment order by sum(amount) desc"
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        Chart7.SeriesCollection.Add(sc7)

        ''''MULTIPLE-CAMPUS TRACKER
        Chart6.Type = ChartType.Combo
        Chart6.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart6.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected from students in %xvalue"
        Chart6.Debug = True
        Chart6.Mentor = False
        Chart6.LegendBox.Visible = False
        Chart6.ShadingEffectMode = ShadingEffectMode.Three
        Chart6.DefaultElement.ShowValue = False
        Chart6.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de6 As DataEngine
        de6 = New DataEngine()
        de6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de6.CommandTimeout = 300
        de6.SqlStatement = "select UPPER(CheckNo), sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by UPPER(CheckNo) order by sum(amount) desc"
        Dim sc6 As SeriesCollection
        sc6 = de6.GetSeries()
        Chart6.SeriesCollection.Add(sc6)
    End Sub

    Private Function GetTotalRevenues() As Double
        Dim sqlQueryText As String = "select sum(amount)/1000000 as TotalRevenue from dbo.TEMPOfficeEntries"
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function

End Class
