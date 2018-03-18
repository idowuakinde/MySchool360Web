Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_dashboard_acad
    Inherits System.Web.UI.Page

    Public totalRevenues As Double, stateText As String
    Public currentTarget As Int32 = CInt(CType(System.Configuration.ConfigurationManager.AppSettings("Annual_Revenue_Target"), Double) / 1000000)
    Public filterDate_Start As DateTime, filterDate_End As DateTime
    Public filterExpression As String
    Public currentMonth As Int32 = Now.Month : Public currentYear As Int32 = Now.Year
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        totalRevenues = (GetTotalRevenues() * 8 / 7) / 1000000

        stateText = FormatNumber(totalRevenues * 100 / currentTarget, 0)
        Me.Label4.BackColor = Color.Black
        If stateText >= 0 And stateText <= 50 Then
            Me.Label4.ForeColor = Color.Red
        ElseIf stateText > 50 And stateText <= 75 Then
            Me.Label4.ForeColor = Color.Yellow
        ElseIf stateText > 75 And stateText <= 100 Then
            Me.Label4.ForeColor = Color.Green
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
        Dim s1 As New Series("Annual Salary Budget Tracker", New Element("", totalRevenues))
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

        Chart1.Type = ChartType.Combo
        Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.URL = ""
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "&#8358; %yvalue (%YPercentOfSeries of Annual Total) was paid in %xvalue"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de As DataEngine
        de = New DataEngine()
        de.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de.SqlStatement = "SELECT dbo.FN_MONTHNAME(4) AS MonthNumber, 29200000 UNION ALL SELECT dbo.FN_MONTHNAME(5) AS MonthNumber, 28056000 UNION ALL SELECT dbo.FN_MONTHNAME(6) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 6 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(7) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 7 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(8) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 8 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(9) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 9 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(10) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 10 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(11) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 11 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(12) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 12 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(1) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 1 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(2) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 2 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(3) AS MonthNumber, SUM(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 3 AND EffectiveYear = " & currentYear & " "
        Dim sc As SeriesCollection
        sc = de.GetSeries()
        Chart1.YAxis.ScaleRange.ValueHigh = 75000000
        Chart1.SeriesCollection.Add(sc)

        Chart2.Type = ChartType.Combo
        Chart2.DefaultSeries.Type = SeriesType.Spline
        Chart2.URL = ""
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "&#8358; %yvalue (%YPercentOfSeries of Total) paid to '%xvalue' Grade Level last month"
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
        de2.SqlStatement = "select JobLevelName, SUM(TotalTaxablePay + TotalNonTaxablePay) AS GrossPay FROM dbo.VW_HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode INNER JOIN dbo.HR_JobLevel c On b.JobLevelId = c.JobLevelId WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " GROUP BY JoblevelName ORDER BY GrossPay DESC "
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        'sc2(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        Chart2.SeriesCollection.Add(sc2)

        Chart4.Type = ChartType.Combo
        'Chart4.DefaultSeries.Type = SeriesType.Spline
        Chart4.URL = ""
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "&#8358; %yvalue (%YPercentOfSeries of Total) Salaries paid to '%xvalue' Department last month"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        Chart4.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de4.SqlStatement = "SELECT b.Department, SUM(TotalTaxablePay + TotalNonTaxablePay) AS GrossPay FROM dbo.VW_HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " GROUP BY Department ORDER BY GrossPay DESC "
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        'sc4(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        Chart4.SeriesCollection.Add(sc4)

        Chart5.Type = ChartType.Combo
        'Chart5.DefaultSeries.Type = SeriesType.Spline
        Chart5.URL = ""
        Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart5.DefaultSeries.DefaultElement.ToolTip = "&#8358; %yvalue (%YPercentOfSeries of Total) paid out in form of %xvalue Allowance last month"
        Chart5.Debug = True
        Chart5.Mentor = False
        Chart5.LegendBox.Visible = False
        Chart5.ShadingEffectMode = ShadingEffectMode.Three
        Chart5.DefaultElement.ShowValue = False
        Chart5.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de5 As DataEngine
        de5 = New DataEngine()
        de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de5.SqlStatement = "SELECT 'Basic' as ExpenseName, SUM([Basic]) as TotalPaid FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Functional' as ExpenseName, SUM(Functional) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Housing' as ExpenseName, SUM(HousingNonTaxable) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Transport' as ExpenseName, SUM(TransportTaxable) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Lunch' as ExpenseName, SUM(Lunch) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Overtime' as ExpenseName, SUM(overtime1) + SUM(overtime2) + SUM(NiteShift) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Clothing' as ExpenseName, SUM(Clothing) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " UNION ALL SELECT 'Utility' as ExpenseName, SUM(Utility) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " ORDER BY TotalPaid DESC "
        Dim sc5 As SeriesCollection
        sc5 = de5.GetSeries()
        'sc5(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        Chart5.SeriesCollection.Add(sc5)

        Chart7.Type = ChartType.Combo
        Chart7.DefaultSeries.Type = SeriesType.Spline
        Chart7.URL = ""
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "&#8358; %yvalue Average Salary paid in %xvalue"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        Chart7.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de7.SqlStatement = "SELECT dbo.FN_MONTHNAME(4), 29200000/475 UNION ALL SELECT dbo.FN_MONTHNAME(5), 28056000/482 UNION ALL SELECT dbo.FN_MONTHNAME(6), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 6 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(7), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 7 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(8), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 8 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(9), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 9 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(10), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 10 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(11), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 11 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(12), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 12 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(1), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 1 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(2), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 2 AND EffectiveYear = " & currentYear & " UNION ALL SELECT dbo.FN_MONTHNAME(3), AVG(TotalTaxablePay + TotalNonTaxablePay) FROM dbo.VW_HR_PAYROLL_Archive_Shadow WHERE EffectiveMonth = 3 AND EffectiveYear = " & currentYear & " "
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        'sc7(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        Chart7.YAxis.ScaleRange.ValueHigh = 120000
        Chart7.SeriesCollection.Add(sc7)

        Chart6.Type = ChartType.Combo
        Chart6.DefaultSeries.Type = SeriesType.Spline
        Chart6.URL = ""
        Chart6.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart6.DefaultSeries.DefaultElement.ToolTip = "Average Salary of &#8358; %yvalue paid to staff in '%xvalue' Grade Level last month"
        Chart6.Debug = True
        Chart6.Mentor = False
        Chart6.LegendBox.Visible = False
        Chart6.ShadingEffectMode = ShadingEffectMode.Three
        Chart6.DefaultElement.ShowValue = False
        Chart6.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de6 As DataEngine
        de6 = New DataEngine()
        de6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de6.SqlStatement = "SELECT JobLevelName, AVG(TotalTaxablePay + TotalNonTaxablePay) AS GrossPay FROM dbo.VW_HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode INNER JOIN dbo.HR_JobLevel c ON b.JobLevelId = c.JobLevelId WHERE EffectiveMonth = " & currentMonth & " AND EffectiveYear = " & currentYear & " GROUP BY JobLevelName ORDER BY GrossPay DESC "
        Dim sc6 As SeriesCollection
        sc6 = de6.GetSeries()
        'sc6(0).ImageBarTemplate = "../../../images/ImageBars/man_nolegs"
        Chart6.SeriesCollection.Add(sc6)
    End Sub

    Private Function GetTotalRevenues() As Double
        Return (((45 + 40) / 2) * 4) * 1000000
    End Function
End Class
