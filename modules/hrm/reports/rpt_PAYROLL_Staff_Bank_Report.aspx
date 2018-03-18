<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_PAYROLL_Staff_Bank_Report.aspx.vb" Inherits="modules_reports_rpt_PAYROLL_Staff_Bank_Report" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="880" class="borderedTableGrey">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80%">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text='REPORTS > PAYROLL REPORTS > BANK REPORT FOR: '></asp:Label>
                  <asp:DropDownList ID="ddlChooser" runat="server" AutoPostBack="True" 
                      CssClass="defaultFormElementStyle" DataSourceID="dsSqlBanks" 
                      DataTextField="Bankcode" DataValueField="Bankcode" AppendDataBoundItems="True">
                      <asp:ListItem Value="0">ALL</asp:ListItem>
                  </asp:DropDownList>
                    <br />
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b> FOR <b><%=MonthName(activeMonth, False).ToUpper & " " & activeYear.ToString%> PAYROLL</b>
                    <br />&nbsp;
                  </td>
                  <td align="right" valign="top">
                  <input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" />
                  <asp:Button ID="btnExportXLS" runat="server" CssClass="defaultButtonStyle" Text="     Export to XLS   " />
                  <asp:Button ID="btnExportPDF" runat="server" CssClass="defaultButtonStyle" Text="    Export to PDF   " />
                  </td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="PayrollArchiveId" 
                        DataSourceID="dsSqlGetData" Width="100%" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        ShowFooter="True">
                        <Columns>
                            <asp:TemplateField HeaderText="S/N">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# serial+1 %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="5%" />
                            </asp:TemplateField>
                           <asp:BoundField DataField="PayrollArchiveId" HeaderText="PayrollArchiveId"
                                SortExpression="PayrollArchiveId" InsertVisible="False" ReadOnly="True" 
                                Visible="False" />
                            <asp:BoundField DataField="StaffCode" HeaderText="Staff Code" 
                                SortExpression="StaffCode" />
                            <asp:BoundField DataField="StaffName" HeaderText="Staff Name" 
                                SortExpression="StaffName" />
                            <asp:BoundField DataField="BankName" HeaderText="Bank Name" 
                                SortExpression="BankName" />
                            <asp:BoundField DataField="BankAccountNumber" HeaderText="Account Number" 
                                SortExpression="BankAccountNumber" FooterText="TOTAL:" >
                            <FooterStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="NetPay">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# "&#8358; " & FormatNumber(total, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "NetPay"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlChooser" Name="BankCode" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlBanks" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT DISTINCT ShortName AS BankCode FROM dbo.[HR_Bank] ORDER BY [bankcode]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td align="center">*Please Note: The entries highlighted in yellow above are those 
                    for which the 'Staff Code' is unknown; thereby implying
                    <br />
                    that further explanation needs to be provided.</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
