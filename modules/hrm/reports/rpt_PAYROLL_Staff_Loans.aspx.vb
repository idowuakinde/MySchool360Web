
Partial Class modules_reports_rpt_PAYROLL_Staff_Loans
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double, total2 As Double, total3 As Double, total4 As Double, total5 As Double
    Public activeMonth As Int32, activeYear As Int32

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("LoanAmount").ToString
            total2 += rowView("InstalmentAmount").ToString
            total3 += rowView("PaidUp").ToString
            total4 += rowView("Outstanding").ToString
            total5 += rowView("Instalments").ToString

            Dim loanAmount As Double = CType(rowView("LoanAmount"), Double)
            If loanAmount <= 0 Then
                e.Row.BackColor = Drawing.Color.Yellow
            Else
                'e.Row.BackColor = Drawing.Color.Red
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        dsSqlGetData.SelectCommand = "SELECT a.StaffCompanyLoanInstalmentId as PayrollArchiveId, b.StaffCode, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName, IsNull(a.LoanAmount, 0) AS LoanAmount, IsNull(a.InstalmentAmount, 0) AS InstalmentAmount, IsNull(a.PaidUp, 0) AS PaidUp, IsNull(a.InstalmentsLeft, 0) AS Instalments, isNull(a.Outstanding, 0) AS Outstanding, dbo.FN_MONTHNAME(ExpiryMonth) + ' ' + CAST(ExpiryYear AS VARCHAR) AS ExpiryDate FROM dbo.HR_PAYROLL_Staff_Company_Loan_Instalment_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.Remark = b.StaffCode WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY b.Surname"
    End Sub
End Class
