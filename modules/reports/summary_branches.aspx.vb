Imports dotnetCHARTING
Imports System.Drawing

Partial Class modules_reports_school_summary_branches
    Inherits System.Web.UI.Page

    Public serialNumber As Int32, totalBankRevenue As Double, bank As String, totalTransactionCount As Int32
    Public filterDate_Start As DateTime, filterDate_End As DateTime, filterExpression As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bank = Request.QueryString("a")
        filterDate_Start = CType(Request.QueryString("b"), DateTime)
        filterDate_End = CType(Request.QueryString("c"), DateTime)
        totalBankRevenue = GetTotalBankRevenue(bank)
        totalTransactionCount = GetTotalTransactionCount(bank)
        Me.Label4.Text = "TOTAL REVENUE COLLECTED FROM " & bank & " BETWEEN " & MonthName(filterDate_Start.Month, True) & " " & filterDate_Start.Day & ", " & filterDate_Start.Year & " AND " & MonthName(filterDate_End.Month, True) & " " & filterDate_End.Day & ", " & filterDate_End.Year & ": N " & FormatNumber(totalBankRevenue, 2)

        Chart.Type = ChartType.Combo
        Chart.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected from %xvalue branch"
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
        de.SqlStatement = "SELECT BankBranch AS Branch, SUM(Amount) AS Revenue FROM TEMPOfficeEntries WHERE NewBankName = '" & bank & "' AND TransactionDate BETWEEN '" & filterDate_Start & "' AND '" & filterDate_End & "' GROUP BY BankBranch ORDER BY Revenue DESC"
        Dim sc As SeriesCollection
        sc = de.GetSeries()
        Chart.SeriesCollection.Add(sc)

        'add a new pie chart
        Chart1.Type = ChartType.Pies
        Chart1.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart1.DefaultSeries.DefaultElement.ToolTip = "N %yvalue collected from %xvalue branch"
        Chart1.Debug = True
        Chart1.Mentor = False
        Chart1.LegendBox.Visible = False
        Chart1.ShadingEffectMode = ShadingEffectMode.Three
        Chart1.DefaultElement.ShowValue = False
        Chart1.SeriesCollection.Add(sc)
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        serialNumber += 1
    End Sub

    Private Function GetTotalBankRevenue(ByVal newBankName As String) As Double
        Dim sqlQueryText As String = "select sum(amount) as TotalRevenue from dbo.TEMPOfficeEntries where NewBankName = '" & newBankName & "' and TransactionDate BETWEEN '" & filterDate_Start & "' AND '" & filterDate_End & "' group by NewBankName"
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function

    Private Function GetTotalTransactionCount(ByVal newBankName As String) As Int32
        Dim sqlQueryText As String = "select count(*) as TotalCount from dbo.TEMPOfficeEntries where NewBankName = '" & newBankName & "' and TransactionDate BETWEEN '" & filterDate_Start & "' AND '" & filterDate_End & "'"
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function
End Class
