Imports dotnetCHARTING
Imports System.Drawing

Partial Class modules_reports_validate_payment
    Inherits System.Web.UI.Page

    Public serialNumber As Int32, total As Double

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvResults.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("Amount")
        End If
    End Sub

    Private Sub SetGridSource(ByVal searchText As String)
        Me.dsSqlBranchDetails.SelectCommand = "select DISTINCT NewBankName as Bank, BankBranch as Branch, Tellar as Teller, Amount, TransactionDate as PaymentDate, AccountNumber as CustomerId, CustomerName, BillingAddress, ModeOfPayment, TransactionType FROM dbo.TEMPOfficeEntries WHERE AccountNumber LIKE '" & searchText & "%' OR CustomerName LIKE '%" & searchText & "%' order by TransactionDate desc"
    End Sub

    Protected Sub btnSearch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSearch.Click
        SetGridSource(Me.txtSearch.Text)
    End Sub

End Class
