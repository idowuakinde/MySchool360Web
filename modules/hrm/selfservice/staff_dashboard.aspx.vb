Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class modules_selfservice_staff_dashboard
    Inherits System.Web.UI.Page

    Public matricNumber As String, classPosition As Int32, classSize As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        matricNumber = Request.QueryString("a").ToString

        Chart4.Type = ChartType.Combo
        Chart4.DefaultSeries.Type = SeriesType.Spline
        Chart4.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart4.DefaultSeries.DefaultElement.ToolTip = "Staff '%xvalue' is %yvalue years old"
        Chart4.Debug = True
        Chart4.Mentor = False
        Chart4.LegendBox.Visible = False
        Chart4.ShadingEffectMode = ShadingEffectMode.Three
        Chart4.DefaultElement.ShowValue = False
        Chart4.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de4 As DataEngine
        de4 = New DataEngine()
        de4.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de4.SqlStatement = "select StaffCode, datediff(yy, DateOfBirth, GetDate()) as Age from dbo.HR_Staff_Base WHERE DateOfBirth <> '01/01/1900' AND Department = (SELECT Department FROM dbo.HR_Staff_Base b WHERE StaffCode = '" & matricNumber & "') ORDER BY Age "
        Dim sc4 As SeriesCollection
        sc4 = de4.GetSeries()
        For Each el As Element In sc4(0).Elements
            'Define the annotation and assign to the appropriate element
            If el.Name = matricNumber Then
                classSize = sc4(0).Elements.Count
                classPosition = sc4(0).Elements.IndexOf(el)
                Dim a As New Annotation("Here you are!" & ControlChars.Lf & "%Name " & ControlChars.Lf & "Age: %YValue yrs" & ControlChars.Lf & "Position: " & (classSize - classPosition).ToString & "/" & classSize.ToString)
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
        Chart4.SeriesCollection.Add(sc4)

        Chart5.Type = ChartType.Combo
        Chart5.DefaultSeries.Type = SeriesType.Spline
        Chart5.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart5.DefaultSeries.DefaultElement.ToolTip = "Staff '%xvalue' has served for %yvalue years"
        Chart5.Debug = True
        Chart5.Mentor = False
        Chart5.LegendBox.Visible = False
        Chart5.ShadingEffectMode = ShadingEffectMode.Three
        Chart5.DefaultElement.ShowValue = False
        Chart5.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de5 As DataEngine
        de5 = New DataEngine()
        de5.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de5.SqlStatement = "select StaffCode, datediff(yy, DateOfEmployment, GetDate()) as YearsofService from dbo.HR_Staff_Base WHERE DateOfEmployment <> '01/01/1900' AND Department = (SELECT Department FROM dbo.HR_Staff_Base b WHERE StaffCode = '" & matricNumber & "') ORDER BY YearsofService "
        Dim sc5 As SeriesCollection
        sc5 = de5.GetSeries()
        For Each el As Element In sc5(0).Elements
            'Define the annotation and assign to the appropriate element
            If el.Name = matricNumber Then
                classSize = sc5(0).Elements.Count
                classPosition = sc5(0).Elements.IndexOf(el)
                Dim a As New Annotation("Here you are!" & ControlChars.Lf & "%Name " & ControlChars.Lf & "Served for: %YValue yrs" & ControlChars.Lf & "Position: " & (classSize - classPosition).ToString & "/" & classSize.ToString)
                a.Background.Color = Color.FromArgb(200, 180, 180, 220)
                a.Background.Bevel = True
                a.Background.GlassEffect = True
                a.Orientation = dotnetCHARTING.Orientation.Top
                a.DefaultCorner = BoxCorner.Round
                a.DynamicSize = False
                el.Annotation = a
            Else
                el.Name = "(Hidden)"
            End If
        Next
        Chart5.SeriesCollection.Add(sc5)

        Chart7.Type = ChartType.Combo
        Chart7.DefaultSeries.Type = SeriesType.Spline
        Chart7.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart7.DefaultSeries.DefaultElement.ToolTip = "Staff '%xvalue' is %yvalue metres tall"
        Chart7.Debug = True
        Chart7.Mentor = False
        Chart7.LegendBox.Visible = False
        Chart7.ShadingEffectMode = ShadingEffectMode.Three
        Chart7.DefaultElement.ShowValue = False
        Chart7.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de7 As DataEngine
        de7 = New DataEngine()
        de7.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de7.SqlStatement = "select StaffCode, Height from dbo.HR_Staff_Base WHERE Department = (SELECT Department FROM dbo.HR_Staff_Base b WHERE StaffCode = '" & matricNumber & "') ORDER BY Height "
        Dim sc7 As SeriesCollection
        sc7 = de7.GetSeries()
        For Each el As Element In sc7(0).Elements
            'Define the annotation and assign to the appropriate element
            If el.Name = matricNumber Then
                classSize = sc7(0).Elements.Count
                classPosition = sc7(0).Elements.IndexOf(el)
                Dim a As New Annotation("Here you are!" & ControlChars.Lf & "%Name " & ControlChars.Lf & "Height: %YValue metres" & ControlChars.Lf & "Position: " & (classSize - classPosition).ToString & "/" & classSize.ToString)
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
        Chart7.SeriesCollection.Add(sc7)

        Chart2.Type = ChartType.Combo
        Chart2.DefaultSeries.Type = SeriesType.Line
        Chart2.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart2.DefaultSeries.DefaultElement.ToolTip = "Staff '%xvalue' weighs %yvalue kg"
        Chart2.Debug = True
        Chart2.Mentor = False
        Chart2.LegendBox.Visible = False
        Chart2.ShadingEffectMode = ShadingEffectMode.Three
        Chart2.DefaultElement.ShowValue = False
        Chart2.DefaultSeries.PaletteName = Palette.Mixed
        'Add a series
        Dim de2 As DataEngine
        de2 = New DataEngine()
        de2.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de2.SqlStatement = "select StaffCode, Weight from dbo.HR_Staff_Base WHERE Department = (SELECT Department FROM dbo.HR_Staff_Base b WHERE StaffCode = '" & matricNumber & "') ORDER BY Weight "
        Dim sc2 As SeriesCollection
        sc2 = de2.GetSeries()
        For Each el As Element In sc2(0).Elements
            'Define the annotation and assign to the appropriate element
            If el.Name = matricNumber Then
                classSize = sc2(0).Elements.Count
                classPosition = sc2(0).Elements.IndexOf(el)
                Dim a As New Annotation("Here you are!" & ControlChars.Lf & "%Name " & ControlChars.Lf & "Weight: %YValue kg" & ControlChars.Lf & "Position: " & (classSize - classPosition).ToString & "/" & classSize.ToString)
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
        Chart2.SeriesCollection.Add(sc2)
    End Sub
End Class
