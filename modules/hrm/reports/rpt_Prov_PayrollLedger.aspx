<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_Prov_PayrollLedger.aspx.vb" Inherits="modules_reports_rpt_Prov_PayrollLedger" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
    <style type="text/css">
        .style1
        {
            width: 100%;
            float: left;
            border-color: #c0c0c0;
            border-width: 0;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="2400" class="borderedTableGrey">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80%">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text="REPORTS > PROVISIONAL PAYROLL REPORTS > PAYROLL LEDGER"></asp:Label>
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b>
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage()" /></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="PayrollArchiveId" 
                        DataSourceID="dsSqlGetData" Width="100%" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        ShowFooter="True" Font-Size="X-Small">
                        <Columns>
                            <asp:BoundField DataField="PayrollArchiveId" HeaderText="PayrollArchiveId"
                                SortExpression="PayrollArchiveId" InsertVisible="False" ReadOnly="True" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="S/N">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# serial+1 %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Center" Wrap="False" />
                                <ItemStyle HorizontalAlign="Center" Wrap="False" Width="20px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffCode" HeaderText="Staff Code" 
                                SortExpression="StaffCode" >
                            <ItemStyle Width="70px" />
                            </asp:BoundField>
                            <asp:BoundField DataField="StaffName" HeaderText="Staff Name" 
                                SortExpression="StaffName" FooterText="TOTALS:" >
                            <FooterStyle Font-Size="XX-Small" HorizontalAlign="Right" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Basic" SortExpression="Basic">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Basic"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Functional" SortExpression="Functional">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total2, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Functional"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Overtime1" SortExpression="Overtime1">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total3, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Overtime1"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Overtime2" SortExpression="Overtime2">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total4, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Overtime2"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OtherTaxable" SortExpression="OtherTaxable">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total5, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "OtherTaxable"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TaxableHousing" SortExpression="TaxableHousing">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total6, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "TaxableHousing"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TaxableTransport" SortExpression="TaxableTransport">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total7, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "TaxableTransport"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Housing" SortExpression="Housing">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total8, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Housing"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Transport" SortExpression="Transport">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total9, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Transport"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Lunch" SortExpression="Lunch">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total10, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Lunch"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Clothing" SortExpression="Clothing">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total11, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Clothing"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Utility" SortExpression="Utility">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total12, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Utility"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NightShift" SortExpression="NightShift">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total13, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "NightShift"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PAYE" SortExpression="PAYE">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total14, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "PAYE"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Loan" SortExpression="Loan">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total15, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Loan"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UnionDues" SortExpression="UnionDues">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total16, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "UnionDues"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FOBTOB" SortExpression="FOBTOB">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total17, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "FOBTOB"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="COOP" SortExpression="COOP">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total18, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "COOP"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OtherDeduction" SortExpression="OtherDeduction">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total19, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "OtherDeduction"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pension" SortExpression="Pension">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total20, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "Pension"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="GrossPay" SortExpression="GrossPay">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total21, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "GrossPay"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="TotalDeduction" SortExpression="TotalDed">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total22, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "TotalDed"), Double), 2).ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NetPay" SortExpression="NetPay">
                                <FooterTemplate>
                                    <asp:Label ID="lblTotal" runat="server" Font-Bold="True" Font-Size="XX-Small" Text='<%# "&#8358; " & FormatNumber(total23, 2) %>'></asp:Label>
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
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            Font-Size="X-Small" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="">
                    </asp:SqlDataSource><%--SelectCommand="SELECT a.PayrollArchiveId, a.StaffCode, a.StaffName, c.FresherFee, c.MonthlyContribution, c.LoanDeduction, (c.FresherFee + c.MonthlyContribution + c.LoanDeduction) AS TotalDeduction FROM dbo.HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffId = b.StaffId INNER JOIN dbo.HR_PAYROLL_Staff_Coop_Shadow c ON b.StaffId = c.StaffId ORDER BY a.StaffName"--%>
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
            <tr>
                <td class="pageHeaderStyleLASAA">TOTAL STAFF ON PAYROLL: <%=serial%>
                    </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <table cellpadding="0" cellspacing="0" class="style1">
                        <tr>
                            <td width="50%">
                                Prepared By: 
                                ...........................................................................................</td>
                            <td>
                                Authorized By: 
                                ...........................................................................................</td>
                        </tr>
                        <tr>
                            <td width="50%">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="50%">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td width="50%">
                                Checked By: 
                                ...........................................................................................</td>
                            <td>
                                Approved By: 
                                ...........................................................................................</td>
                        </tr>
                    </table>
                </td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
