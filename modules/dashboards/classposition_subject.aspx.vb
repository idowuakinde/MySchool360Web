Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_school_dashboard_subjectposition
    Inherits System.Web.UI.Page

    Public studentClass As String, matricNumber As String, subjectPosition As Int32, classSize As Int32, subjectShortName As String, subjectName As String
    Public className As String
    Public sessionName As String, termName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        StatisticalEngine.Options.MatchColors = True
        matricNumber = Request.QueryString("a").ToString
        studentClass = Request.QueryString("b").ToString : className = studentClass
        subjectName = Request.QueryString("c").ToString
        subjectShortName = Request.QueryString("d").ToString
        Me.lblClassName.Text &= "{" & studentClass & ", " & subjectName.ToUpper & "}"
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        termName = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

        ''''SUBJECT PERCENTILE
        Chart1.Type = ChartType.Combo
        Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.Width = Unit.Parse(900)
        Chart1.Height = Unit.Parse(400)
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "Portal Number: (Hidden), Score: %yvalue%"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = True
        'Chart1.YAxis.FormatString = "{n:0}"
        Chart1.YAxis.ScaleRange.ValueLow = 0
        Chart1.YAxis.ScaleRange.ValueHigh = 100
        Chart1.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de1 As DataEngine
        de1 = New DataEngine()
        de1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de1.CommandTimeout = 300
        de1.SqlStatement = " SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) AS AnnualAverage FROM [SmartSchoolDemo].[dbo].[VW_ACADEMICS_Student_Term_Totals] WHERE SubjectShortName = '" & subjectShortName & "' AND ClassName = '" & className & "' AND SessionName = '" & sessionName & "' GROUP BY PortalNumber ORDER BY AnnualAverage DESC"
        Dim sc1 As SeriesCollection
        sc1 = de1.GetSeries()
        If sc1.Count > 0 Then
            sc1(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"

            'Chart1.YAxis.ScaleRange.ValueLow = sc1(0).Elements(0).YValue - 5
            'Chart1.YAxis.ScaleRange.ValueHigh = sc1(0).Elements(sc1(0).Elements.Count - 1).YValue + 5
            For Each el As Element In sc1(0).Elements
                'Define the annotation and assign to the appropriate element
                If el.Name = matricNumber Then
                    classSize = sc1(0).Elements.Count
                    subjectPosition = (sc1(0).Elements.Count - sc1(0).Elements.IndexOf(el)) - 1
                    'Dim a As New Annotation("This is you." & ControlChars.Lf & "Your Portal Number: %Name " & ControlChars.Lf & "Your Score: %YValue%") ' & ControlChars.Lf & "Your Position: " & (classSize - subjectPosition).ToString & "/" & classSize.ToString)
                    Dim a As New Annotation("This is you." & ControlChars.Lf & "Your Portal Number: %Name " & ControlChars.Lf & "Your Score: %YValue%")
                    If Common.ShowPosition Then a.Label.Text &= ControlChars.Lf & "Your Position: " & (classSize - subjectPosition).ToString & Common.GetOrdinal(classSize - subjectPosition).ToString & " of " & classSize.ToString
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
        End If
    End Sub

End Class
