<%@ Page Language="VB" AutoEventWireup="false" CodeFile="history.aspx.vb" Inherits="modules_payments_fees_history" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
          <tr>
            <td colspan="2"><asp:Label ID="Label11" runat="server" Font-Bold="True" Font-Size="Small" Text=":: My Payment History" CssClass="pageHeaderStyleAMMA"></asp:Label></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey" DataKeyNames="EntryId" DataSourceID="dsSqlFinProfile" Width="100%" EmptyDataText="No records found.">
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# serialNumber+1 %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="TransactionDate" HeaderText="Transaction Date" SortExpression="TransactionDate" DataFormatString="{0:D}" />
                        <asp:BoundField DataField="EntryId" HeaderText="Entry Id" InsertVisible="False" ReadOnly="True"
                            SortExpression="EntryId" Visible="False" />
                        <asp:BoundField DataField="NewBankName" HeaderText="Bank Name" SortExpression="NewBankName" />
                        <asp:BoundField DataField="BankCbnCode" HeaderText="Bank CBN Code" SortExpression="BankCbnCode" />
                        <asp:BoundField DataField="OldBankName" HeaderText="OldBankName" SortExpression="OldBankName"
                            Visible="False" />
                        <asp:BoundField DataField="BankBranch" HeaderText="Bank Branch" SortExpression="BankBranch" />
                        <asp:BoundField DataField="AmountPaid" DataFormatString="{0:N}" HeaderText="Amount Paid"
                            SortExpression="AmountPaid" >
                            <ItemStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:BoundField>
                        <asp:BoundField DataField="CollectingTeller" HeaderText="Collecting Teller" SortExpression="CollectingTeller" />
                        <asp:BoundField DataField="ReceiptNo" HeaderText="Receipt Number" SortExpression="ReceiptNo" />
                        <asp:BoundField DataField="ModeOfPayment" HeaderText="Mode Of Payment" SortExpression="ModeOfPayment" />
                        <asp:BoundField DataField="PaymentPurpose" HeaderText="Payment Purpose" SortExpression="PaymentPurpose" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="Matric Number" SortExpression="MatricNumber"
                            Visible="False" />
                    </Columns>
                    <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlFinProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>" SelectCommand="SELECT [EntryId], [BankCbnCode], [NewBankName], [OldBankName], [BankBranch], [CollectingTeller], [ReceiptNo], [AmountPaid], [ModeOfPayment], [PaymentPurpose], [TransactionDate], [MatricNumber] FROM [VW_StudentProfilesFin] WHERE ([MatricNumber] = @MatricNumber)">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
            </td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
