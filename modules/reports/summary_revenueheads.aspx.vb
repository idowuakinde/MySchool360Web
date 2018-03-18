Imports dotnetCHARTING
Imports System.Drawing

Partial Class modules_reports_school_summary_revenueheads
    Inherits System.Web.UI.Page

    Public serialNumber As Int32, totalRevenueHeadCount As Int32
    Public total As Double
    Public filterDate_Start As DateTime, filterDate_End As DateTime
    Public filterExpression As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Me.ddlDay1.SelectedIndex = 0
            Me.ddlMonth1.SelectedIndex = 0
            Me.ddlYear1.SelectedIndex = 0
            Me.ddlDay2.SelectedIndex = Me.ddlDay2.Items.Count - 1
            Me.ddlMonth2.SelectedIndex = Me.ddlMonth2.Items.Count - 1
            Me.ddlYear2.SelectedIndex = Me.ddlYear2.Items.Count - 1
        Else
        End If
        Chart.Type = ChartType.Combo
        Chart.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected in form of %xvalue fees"
        Chart.Debug = True
        Chart.Mentor = False
        Chart.LegendBox.Visible = False
        Chart.ShadingEffectMode = ShadingEffectMode.Three
        Chart.DefaultElement.ShowValue = False
        Chart.DefaultSeries.PaletteName = Palette.One
        'Add a series
        Dim de As DataEngine
        de = New DataEngine()
        de.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de.CommandTimeout = 300
        filterDate_Start = New Date(Me.ddlYear1.Text, Me.ddlMonth1.Text, Me.ddlDay1.Text)
        filterDate_End = New Date(Me.ddlYear2.Text, Me.ddlMonth2.Text, Me.ddlDay2.Text)
        filterExpression = " where TransactionDate between '" & filterDate_Start & "' and '" & filterDate_End & "' "
        de.SqlStatement = "select TransactionType, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by TransactionType order by sum(amount) desc"
        Call SetGridSource(filterExpression)
        Dim sc As SeriesCollection
        sc = de.GetSeries()
        Chart.SeriesCollection.Add(sc)

        'add a new pie chart
        Chart1.Type = ChartType.Pies
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected in form of %xvalue fees"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.SeriesCollection.Add(sc)
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            totalRevenueHeadCount += rowView("RevenueHeadCount").ToString
            total += rowView("Revenue").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Me.Label4.Text = "TOTAL REVENUE COLLECTED (ACROSS " & serialNumber & " PAYMENT PURPOSES) BETWEEN " & MonthName(filterDate_Start.Month, True) & " " & filterDate_Start.Day & ", " & filterDate_Start.Year & " AND " & MonthName(filterDate_End.Month, True) & " " & filterDate_End.Day & ", " & filterDate_End.Year & ": N " & FormatNumber(total, 2)
        End If
    End Sub

    Private Sub SetGridSource(ByVal filterExpression As String)
        Me.dsSqlRevenueHeadSummaries.SelectCommand = "select UPPER(TransactionType) as RevenueHead, count(TransactionType) as RevenueHeadCount, sum(amount) as Revenue from dbo.TEMPOfficeEntries " & filterExpression & " group by TransactionType order by sum(amount) desc"
    End Sub

End Class
