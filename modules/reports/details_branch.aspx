<%@ Page Language="VB" AutoEventWireup="false" CodeFile="details_branch.aspx.vb" Inherits="modules_reports_school_details_branch" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style type="text/css">
<!--
.style3 {font-weight: bold}
-->
</style>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="1500"  border="0">
  <tr>
    <td valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Branch Details Report for <%=Request.QueryString("a") & "; " & Request.QueryString("b").ToUpper & " Branch"%></span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td width="2%" rowspan="1" align="right" valign="top">&nbsp;</td>
        <td valign="bottom">
            <asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Font-Underline="True"></asp:Label>&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" align="right" class="defaultHeaderTextStyle"><hr noshade="noshade" /></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle">
            <asp:GridView ID="gvUsers" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" CssClass="borderedTableGrey"
                DataSourceID="dsSqlBranchDetails" PageSize="30" Width="100%" ShowFooter="True">
                <Columns>
                    <asp:TemplateField HeaderText="S/N">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# serialNumber %>"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Bank" HeaderText="BANK" SortExpression="Bank" />
                    <asp:BoundField DataField="Branch" HeaderText="BRANCH" SortExpression="Branch" />
                    <asp:BoundField DataField="TransactionType" HeaderText="PURPOSE OF PAYMENT" 
                        SortExpression="TransactionType" FooterText="TOTAL:" Visible="False" />
                    <asp:TemplateField HeaderText="AMOUNT" SortExpression="Amount">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Amount") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Amount", "N {0:N}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
                        <FooterTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# "N " & FormatNumber(totalBranchRevenue,2).ToString %>'></asp:Label>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ModeOfPayment" HeaderText="MODE OF PAYMENT" SortExpression="ModeOfPayment" />
                    <asp:BoundField DataField="PaymentDate" HeaderText="PAYMENT DATE" SortExpression="PaymentDate" />
                    <asp:BoundField DataField="CustomerId" HeaderText="CUSTOMER ID" SortExpression="CustomerId" />
                    <asp:BoundField DataField="CustomerName" HeaderText="CUSTOMER NAME" SortExpression="CustomerName" />
                    <asp:BoundField DataField="BillingAddress" HeaderText="CUSTOMER ADDRESS" SortExpression="BillingAddress" />
                </Columns>
                <SelectedRowStyle BackColor="#D0D4DB" />
                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                <EditRowStyle CssClass="defaultFormElementStyle" />
                <FooterStyle BackColor="Black" BorderColor="WhiteSmoke" BorderStyle="Solid" Font-Bold="True"
                    ForeColor="WhiteSmoke" HorizontalAlign="Right" VerticalAlign="Top" Wrap="False" Font-Size="Small" />
                <HeaderStyle BackColor="Black" BorderColor="WhiteSmoke" BorderStyle="Solid" ForeColor="WhiteSmoke"
                    Wrap="False" />
                <AlternatingRowStyle BackColor="Orange" />
            </asp:GridView>
            <asp:SqlDataSource ID="dsSqlBranchDetails" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                SelectCommand="select&#13;&#10;&#9;NewBankName as Bank,&#13;&#10;&#9;BankBranch as Branch,&#13;&#10;&#9;Tellar as Teller,&#13;&#10;&#9;Amount,&#13;&#10;&#9;TransactionDate as PaymentDate,&#13;&#10;&#9;AccountNumber as CustomerId,&#13;&#10;&#9;CustomerName,&#13;&#10;&#9;BillingAddress,&#13;&#10;&#9;ModeOfPayment,&#13;&#10;&#9;TransactionType&#13;&#10;from TEMPOfficeEntries&#13;&#10;where NewBankName = @Param1&#13;&#10;and BankBranch = @Param2&#13;&#10; AND TransactionDate BETWEEN @Param3 AND @Param4 order  by TransactionDate desc">            
                <SelectParameters>
                    <asp:QueryStringParameter Name="Param1" QueryStringField="a" />
                    <asp:QueryStringParameter Name="Param2" QueryStringField="b" />
                    <asp:QueryStringParameter Name="Param3" QueryStringField="c" />
                    <asp:QueryStringParameter Name="Param4" QueryStringField="d" />
                </SelectParameters>
            </asp:SqlDataSource>        </td>
      </tr>
      
    </table></td>
  </tr>
</table>
    </form>
</body>
</html>
