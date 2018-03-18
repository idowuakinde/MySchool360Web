Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_dashboards_dashboard_acad4
    Inherits System.Web.UI.Page

    Public sessionName As String, termName As String, assessmentType As String, programmeName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        termName = "2nd Term" 'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
        assessmentType = "After Mid-Term"

        Me.lblStudentCount.Text = Common.GetStudentCount()  ' "300"
        Me.lblTeacherCount.Text = Common.GetTeacherCount()  ' "20"
        Me.lblStudentTeacherRatio.Text = System.Math.Round(Common.GetStudentCount / Common.GetTeacherCount).ToString & " : 1" '"15 : 1"
        Me.lblPassRate.Text = FormatNumber(Common.CONST_ACADEMICS_PASSRATES_CUTOFF, 0).ToString & "%"

        ''''SECONDARY
        programmeName = "SEC"
        Chart1.Type = ChartType.Combo
        'Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.DefaultSeries.PaletteName = Palette.One
        Chart1.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de As DataEngine
        de = New DataEngine()
        de.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de.CommandTimeout = 300
        de.SqlStatement = " SELECT TOP 5 StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & programmeName & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc As SeriesCollection
        sc = de.GetSeries()
        If sc.Count > 0 Then
            sc(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
        End If
        Chart1.SeriesCollection.Add(sc)

        ''''PRIMARY
        programmeName = "PRI"
        Chart2.Type = ChartType.Combo
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart2.Debug = True
        Chart2.Mentor = False
        Chart2.LegendBox.Visible = False
        Chart2.ShadingEffectMode = ShadingEffectMode.Three
        Chart2.DefaultElement.ShowValue = False
        Chart2.DefaultSeries.PaletteName = Palette.One
        Chart2.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de2 As DataEngine
        de2 = New DataEngine()
        de2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de2.CommandTimeout = 300
        de2.SqlStatement = " SELECT TOP 5 StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & programmeName & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        If sc2.Count > 0 Then
            sc2(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
        End If
        Chart2.SeriesCollection.Add(sc2)

        ''''NURSERY
        programmeName = "NUR"
        Chart4.Type = ChartType.Combo
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        Chart4.DefaultSeries.PaletteName = Palette.One
        Chart4.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de4.CommandTimeout = 300
        de4.SqlStatement = " SELECT TOP 5 StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & programmeName & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        If sc4.Count > 0 Then
			Chart4.YAxis.ScaleRange.ValueLow = sc4(0).Elements(0).YValue - 20
			Chart4.YAxis.ScaleRange.ValueHigh = sc4(0).Elements(sc4(0).Elements.Count - 1).YValue + 10
            sc4(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
        End If
        Chart4.SeriesCollection.Add(sc4)

        ''''CRECHE
        If assessmentType = "Before Mid-Term" Then
            Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
            Chart5.Visible = False
        Else
            programmeName = "CRE"
            Chart5.Type = ChartType.Combo
            Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
            Chart5.DefaultSeries.DefaultElement.ToolTip = "%xvalue, %yvalue%"
            Chart5.Debug = True
            Chart5.Mentor = False
            Chart5.LegendBox.Visible = False
            Chart5.ShadingEffectMode = ShadingEffectMode.Three
            Chart5.DefaultElement.ShowValue = False
            Chart5.DefaultSeries.PaletteName = Palette.One
            Chart5.YAxis.FormatString = "{n:0}"
            'Add a series
            Dim de5 As DataEngine
            de5 = New DataEngine()
            de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
            de5.CommandTimeout = 300
            de5.SqlStatement = " SELECT TOP 5 StudentName, AVG(PersonalAggregateSubjectScore) as PersonalAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' AND ClassName IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = '" & programmeName & "') GROUP BY StudentName ORDER BY PersonalAverage DESC "
            Dim sc5 As SeriesCollection
            sc5 = de5.GetSeries()
            If sc5.Count > 0 Then
                sc5(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
            End If
            Chart5.SeriesCollection.Add(sc5)
        End If

        ''''SUBJECT PASS RATES
        Chart7.Type = ChartType.Combo
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "%xvalue: %yvalue% Pass Rate"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        Chart7.DefaultSeries.PaletteName = Palette.One
        Chart7.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de7.CommandTimeout = 300
        de7.SqlStatement = " select a.SubjectShortName, 100*(select count(*) from dbo.VW_Academics_Student_Subject_Scores where SubjectShortName = a.SubjectShortName AND PersonalAggregateSubjectScore >= " & Common.CONST_ACADEMICS_PASSRATES_CUTOFF & ") / (select count(*) from dbo.VW_Academics_Student_Subject_Scores where SubjectShortName = a.SubjectShortName) as PassRate FROM dbo.VW_Academics_Student_Subject_Scores a WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' GROUP BY SubjectShortName ORDER BY PassRate DESC "
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        If sc7.Count > 0 Then
            sc7(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        End If
        Chart7.SeriesCollection.Add(sc7)

        ''''CLASS PASS RATES
        Chart6.Type = ChartType.Combo
        Chart6.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart6.DefaultSeries.DefaultElement.ToolTip = "%xvalue: %yvalue% Pass Rate"
        Chart6.Debug = True
        Chart6.Mentor = False
        Chart6.LegendBox.Visible = False
        Chart6.ShadingEffectMode = ShadingEffectMode.Three
        Chart6.DefaultElement.ShowValue = False
        Chart6.DefaultSeries.PaletteName = Palette.One
        Chart6.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de6 As DataEngine
        de6 = New DataEngine()
        de6.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de6.CommandTimeout = 300
        de6.SqlStatement = " select ClassName, 100*(select count(*) from dbo.VW_ACADEMICS_Student_Subject_Scores where ClassName = a.ClassName AND PersonalAggregateSubjectScore >= " & Common.CONST_ACADEMICS_PASSRATES_CUTOFF & ") / (select count(*) from dbo.VW_ACADEMICS_Student_Subject_Scores where ClassName = a.ClassName) as PassRate FROM dbo.VW_ACADEMICS_Student_Subject_Scores a WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' GROUP BY ClassName ORDER BY PassRate DESC "
        Dim sc6 As SeriesCollection
        sc6 = de6.GetSeries()
        If sc6.Count > 0 Then
            sc6(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        End If
        Chart6.SeriesCollection.Add(sc6)

        ''''GENDER PASS RATES
        Chart3.Type = ChartType.Combo
        Chart3.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart3.DefaultSeries.DefaultElement.ToolTip = "%xvalue: %yvalue% Pass Rate"
        Chart3.Debug = True
        Chart3.Mentor = False
        Chart3.LegendBox.Visible = False
        Chart3.ShadingEffectMode = ShadingEffectMode.Three
        Chart3.DefaultElement.ShowValue = False
        Chart3.DefaultSeries.PaletteName = Palette.One
        Chart3.YAxis.FormatString = "{n:0}"
        'Add a series
        Dim de3 As DataEngine
        de3 = New DataEngine()
        de3.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de3.CommandTimeout = 300
        de3.SqlStatement = " select CASE Gender WHEN 'M' THEN 'Males' WHEN 'F' THEN 'Females' ELSE 'Unknown' END as Gender, 100*(select count(*) from dbo.VW_ACADEMICS_Student_Subject_Scores where Gender = a.Gender AND PersonalAggregateSubjectScore >= " & Common.CONST_ACADEMICS_PASSRATES_CUTOFF & ") / (select count(*) from dbo.VW_ACADEMICS_Student_Subject_Scores where Gender = a.Gender) as PassRate FROM dbo.VW_ACADEMICS_Student_Subject_Scores a WHERE SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' GROUP BY Gender ORDER BY PassRate DESC "
        Dim sc3 As SeriesCollection
        sc3 = de3.GetSeries()
        If sc3.Count > 0 Then
            sc3(0).ImageBarTemplate = "../../images/ImageBars/black_pencil"
        End If
        Chart3.SeriesCollection.Add(sc3)
    End Sub

End Class
