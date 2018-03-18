<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_PAYROLL_Staff_SpecialAllowances.aspx.vb" Inherits="modules_reports_rpt_PAYROLL_Staff_SpecialAllowances" %>

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
                        Text="REPORTS > PAYROLL REPORTS > STAFF SPECIAL ALLOWANCES REPORT"></asp:Label>
                    <br />
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b> FOR <b><%=MonthName(activeMonth, False).ToUpper & " " & activeYear.ToString%> PAYROLL</b>
                    <br />&nbsp;
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
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
                                SortExpression="StaffName" FooterText="TOTAL:" >
                            <FooterStyle Font-Size="Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Amount" SortExpression="Amount">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# "&#8358; " & FormatNumber(total, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Amount"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Purpose" HeaderText="Purpose" 
                                SortExpression="Purpose">
                            <ItemStyle Width="25%" />
                            </asp:BoundField>
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
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
