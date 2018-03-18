Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class frameset_main_admin
    Inherits System.Web.UI.Page
    Public serial As Int32, serial2 As Int32, serial3 As Int32
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Chart1.Type = ChartType.Combo
        'Chart1.DefaultSeries.Type = SeriesType.Spline
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "%xvalue: %yvalue%"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.TitleBox.Visible = True
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = True
        Chart1.DefaultSeries.PaletteName = Palette.One
        Chart1.Title = "Top 5 Performers (" & sessionName & " Appraisal)"
        'Add a series
        Dim de1 As DataEngine
        de1 = New DataEngine()
        de1.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString
        de1.SqlStatement = " select TOP 5 Surname, AggregateAppraisalScore FROM dbo.VW_APPRAISAL_AggregateScores WHERE SessionName = '" & sessionName & "' ORDER BY AggregateAppraisalScore DESC "
        Dim sc1 As SeriesCollection
        sc1 = de1.GetSeries()
        If sc1.Count > 0 Then
            sc1(0).ImageBarTemplate = "../../images/ImageBars/man_nolegs"
        End If
        Chart1.YAxis.ScaleRange.ValueHigh = 100
        Chart1.SeriesCollection.Add(sc1)
    End Sub

    Protected Sub gvBirthdays_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvBirthdays.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub gvUpcomingLeaves_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUpcomingLeaves.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial3 += 1
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub
End Class
