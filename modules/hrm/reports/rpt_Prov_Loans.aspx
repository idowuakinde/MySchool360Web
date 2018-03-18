<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_Prov_Loans.aspx.vb" Inherits="modules_reports_rpt_Prov_Loans" %>

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
                        Text="REPORTS > PROVISIONAL PAYROLL REPORTS > LOANS REPORT"></asp:Label>
                    <br />
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b><br />&nbsp;
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
                    <hr color="black" />
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
                            <asp:TemplateField HeaderText="Loan Amount" SortExpression="LoanAmount">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# "&#8358; " & FormatNumber(total, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "LoanAmount"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Instalment" SortExpression="InstalmentAmount">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# "&#8358; " & FormatNumber(total2, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "InstalmentAmount"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Paid Up" SortExpression="PaidUp">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# "&#8358; " & FormatNumber(total3, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "PaidUp"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Outstanding" SortExpression="Outstanding">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# "&#8358; " & FormatNumber(total4, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Outstanding"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                           <asp:TemplateField HeaderText="No Of Times" SortExpression="Instalments">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="Small" Text='<%# FormatNumber(total5, 0) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Instalments") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="ExpiryDate" HeaderText="Expiry Date" 
                                SortExpression="ExpiryDate">
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
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
                    </asp:SqlDataSource><%--SelectCommand="SELECT a.PayrollArchiveId, a.StaffCode, a.StaffName, c.LoanAmount, d.InstalmentAmount, (SELECT SUM(InstalmentAmount) FROM	dbo.HR_PAYROLL_Staff_Company_Loan a INNER JOIN dbo.HR_PAYROLL_Staff_Company_Loan_Instalment b ON a.StaffCompanyLoanId = b.LoanId GROUP BY a.StaffId, b.EffectiveMonth, b.EffectiveYear) AS PaidUp, c.Instalments FROM	dbo.HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffId = b.StaffId INNER JOIN dbo.HR_PAYROLL_Staff_Company_Loan_Shadow c ON b.StaffId = c.StaffId INNER JOIN dbo.HR_PAYROLL_Staff_Company_Loan_Instalment_Shadow d ON c.StaffCompanyLoanId = d.LoanId ORDER BY a.StaffName "--%>
                </td>
            </tr>
            <tr>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td align="center">*Please Note: The entries highlighted in yellow above are those 
                    for which the 'Principal Loan Amount' is unknown; thereby implying
                    <br />
                    that further explanation needs to be provided.</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
