Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_classposition_height
    Inherits System.Web.UI.Page

    Public studentClass As String, matricNumber As String, classPosition As Int32, classSize As Int32
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        StatisticalEngine.Options.MatchColors = True
        studentClass = Request.QueryString("b").ToString
        matricNumber = Request.QueryString("a").ToString
        Me.lblClassName.Text &= "{" & studentClass & ", HEIGHTS}"

        ''''JS1 PERCENTILE
        Chart1.Type = ChartType.Combo
        Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.Width = Unit.Parse(900)
        Chart1.Height = Unit.Parse(400)
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "Portal Number: (Hidden), Height: %yvalue metres"
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
        de1.SqlStatement = "select right(CustomerCode,5) as MatricNumber, CustomerCodeOld as Height from TEMPCustomers where DistrictCode = '" & studentClass & "' ORDER BY Height"
        Dim sc1 As SeriesCollection
        sc1 = de1.GetSeries()
        sc1(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"

        Chart1.YAxis.ScaleRange.ValueLow = sc1(0).Elements(0).YValue - 0.1
        Chart1.YAxis.ScaleRange.ValueHigh = sc1(0).Elements(sc1(0).Elements.Count - 1).YValue + 0.1
        For Each el As Element In sc1(0).Elements
            'Define the annotation and assign to the appropriate element
            If el.Name = matricNumber Then
                classSize = sc1(0).Elements.Count
                classPosition = sc1(0).Elements.IndexOf(el)
                Dim a As New Annotation("This is you." & ControlChars.Lf & "Your Portal Number: %Name " & ControlChars.Lf & "Your Height: %YValue metres" & ControlChars.Lf & "Your Position: " & (classSize - classPosition).ToString & "/" & classSize.ToString)
                a.Background.Color = Color.FromArgb(200, 180, 180, 220)
                a.Background.Bevel = True
                a.Background.GlassEffect = True
                a.Orientation = dotnetCHARTING.Orientation.Bottom
                a.DefaultCorner = BoxCorner.Round
                a.DynamicSize = False
                el.Annotation = a
            Else
                el.Name = "(Hidden)"
            End If
        Next
        Chart1.SeriesCollection.Add(sc1)
        'Add the percentile as a 'Data Distribution' series
        Dim dd1 As Series = StatisticalEngine.DataDistribution(sc1(0))
        dd1.YAxis.ScaleRange = Chart1.YAxis.ScaleRange
        Chart1.SeriesCollection.Add(dd1)
    End Sub

End Class
