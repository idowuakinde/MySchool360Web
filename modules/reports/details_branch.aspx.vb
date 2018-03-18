
Partial Class modules_reports_school_details_branch
    Inherits System.Web.UI.Page

    Public serialNumber As Int32, totalBranchRevenue As Double, bank As String, branch As String
    Public filterDate_Start As DateTime, filterDate_End As DateTime, filterExpression As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        bank = Request.QueryString("a")
        branch = Request.QueryString("b")
        filterDate_Start = CType(Request.QueryString("c"), DateTime)
        filterDate_End = CType(Request.QueryString("d"), DateTime)
        totalBranchRevenue = GetTotalBranchRevenue(bank, branch)
        Me.Label4.Text = "TOTAL REVENUE COLLECTED IN THIS BANK BRANCH BETWEEN " & MonthName(filterDate_Start.Month, True) & " " & filterDate_Start.Day & ", " & filterDate_Start.Year & " AND " & MonthName(filterDate_End.Month, True) & " " & filterDate_End.Day & ", " & filterDate_End.Year & ": N " & FormatNumber(totalBranchRevenue, 2)
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        serialNumber += 1
    End Sub

    Private Function GetTotalBranchRevenue(ByVal newBankName As String, ByVal bankBranch As String) As Double
        Dim sqlQueryText As String = "select sum(amount) as TotalRevenue from dbo.TEMPOfficeEntries where NewBankName = '" & newBankName & "' and BankBranch = '" & bankBranch & "' AND TransactionDate BETWEEN '" & filterDate_Start & "' AND '" & filterDate_End & "' group by NewBankName"
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function
End Class
