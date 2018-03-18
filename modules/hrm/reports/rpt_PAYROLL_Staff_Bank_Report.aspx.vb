
Partial Class modules_reports_rpt_PAYROLL_Staff_Bank_Report
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double
    Public activeMonth As Int32, activeYear As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        Select Case ddlChooser.SelectedValue
            Case "0"
                dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId, a.StaffCode, RTRIM(LTRIM(a.StaffName)) AS StaffName, b.ShortName as BankName, IsNull(c.BankAccountNumber, '') AS BankAccountNumber, (TotalTaxablePay + TotalNonTaxablePay - TotalDeduction) AS NetPay FROM dbo.VW_HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base c ON a.StaffCode = c.StaffCode INNER JOIN dbo.HR_Bank b ON b.BankId = c.BankId WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY RTRIM(LTRIM(a.StaffName))  "
            Case Else
                dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId, a.StaffCode, RTRIM(LTRIM(a.StaffName)) AS StaffName, b.ShortName as BankName, IsNull(c.BankAccountNumber, '') AS BankAccountNumber, (TotalTaxablePay + TotalNonTaxablePay - TotalDeduction) AS NetPay FROM dbo.VW_HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base c ON a.StaffCode = c.StaffCode INNER JOIN dbo.HR_Bank b ON b.BankId = c.BankId WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " AND b.ShortName = @BankCode ORDER BY RTRIM(LTRIM(a.StaffName)) "
        End Select
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("NetPay").ToString

            Dim loanAmount As String = CType(rowView("StaffCode"), String)
            If loanAmount = "" Then
                e.Row.BackColor = Drawing.Color.Yellow
            Else
                'e.Row.BackColor = Drawing.Color.Red
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub
End Class
