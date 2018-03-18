<%@ Page Language="VB" AutoEventWireup="false" CodeFile="validate_payment.aspx.vb" Inherits="modules_reports_validate_payment" %>
<%@ Register TagPrefix="dotnet"  Namespace="dotnetCHARTING" Assembly="dotnetCHARTING"%>
<%@ Import Namespace="System.Drawing" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Validate Payment</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="1200"  border="0">
  <tr>
    <td width="999" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Validate Payment</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0">
      <tr>
        <td width="2%" align="right" valign="top">&nbsp;</td>
        <td valign="top"><table width="100%" border="0">
                <tr>
                  <td width="20%" class="defaultHeaderTextStyle"> Student&#39;s Name:</td>
                  <td>
                      <asp:TextBox ID="txtSearch" runat="server" Columns="50" 
                          CssClass="defaultFormElementStyle"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                  <td>&nbsp;</td>
                  <td>
                      <asp:Button ID="btnSearch" runat="server" CssClass="defaultFormElementStyle" 
                          Text="   Search >   " /></td>
                </tr>
              </table>        </td>
        </tr>
      <tr>
        <td align="right" valign="top">&nbsp;</td>
        <td valign="bottom">&nbsp;</td>
        </tr>
      <tr>
        <td align="right" valign="top">&nbsp;</td>
        <td valign="bottom"><asp:Label ID="Label4" runat="server" Font-Bold="True" Font-Size="Small" Font-Underline="True">The following payment records were found matching the specified name(s):</asp:Label></td>
        </tr>
      <tr>
        <td colspan="2" align="right" class="defaultHeaderTextStyle"><hr noshade="noshade" /></td>
        </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle">
            <asp:GridView ID="gvResults" runat="server" AllowSorting="True"
                AutoGenerateColumns="False" CssClass="borderedTableGrey"
                DataSourceID="dsSqlBranchDetails" PageSize="30" Width="100%" 
                ShowFooter="True" EmptyDataText="No payment records found.">
                <Columns>
                    <asp:TemplateField HeaderText="S/N">
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text="<%# serialNumber + 1 %>"></asp:Label>
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
                        <HeaderStyle HorizontalAlign="Right" />
                        <ItemStyle Font-Bold="True" HorizontalAlign="Right" VerticalAlign="Top" />
                        <FooterTemplate>
                            <asp:Label ID="Label3" runat="server" Text='<%# "N " & FormatNumber(total,2).ToString %>'></asp:Label>
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
                SelectCommand="">
                <SelectParameters>
                    <asp:ControlParameter ControlID="txtSearch" Name="Param1" PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>        
        </td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle">&nbsp;</td>
      </tr>
      
    </table></td>
  </tr>
</table>
    </form>
</body>
</html>
