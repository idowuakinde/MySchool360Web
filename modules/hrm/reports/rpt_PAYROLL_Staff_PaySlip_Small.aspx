<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_PAYROLL_Staff_PaySlip_Small.aspx.vb" Inherits="modules_reports_rpt_PAYROLL_Staff_PaySlip_Small" %>

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
        <table border="0" width="880" class="borderedTableGrey" cellpadding="0" cellspacing="0">
            <tr>
              <td><table id="tableToHoldButton" width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="85%">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text="REPORTS > PAYROLL REPORTS > PAYSLIP "></asp:Label>
                    <br />
                    PRINTED ON: <b><%=FormatDateTime(Now, DateFormat.LongDate).ToUpper & " " & FormatDateTime(Now, DateFormat.LongTime).ToUpper%></b> FOR <b><%=MonthName(activeMonth, False).ToUpper & " " & activeYear.ToString%> PAYROLL</b>
                      <br />
                      <b>Find: </b>
                      <asp:TextBox ID="txtSearch" runat="server" Columns="50" 
                          CssClass="defaultFormElementStyle"></asp:TextBox>
                    &nbsp;<asp:Button ID="btnSearch" runat="server" CssClass="defaultButtonStyle" 
                          Text="   Search >   " />
                    <br />
                  </td>
                  <td align="right" valign="top"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage();document.getElementById('tableToHoldButton').style.display = 'none';" /></td>
                </tr>
              </table></td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvUsers" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="StaffId" DataSourceID="dsSqlGetData" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                        PageSize="2" ShowHeader="False" >
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="paySlipTextStyle">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0">
            <tr>
                <td align="center">
                    &nbsp;</td>
            </tr>
            <tr>
                <td align="center">
                    <b>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;PAYSLIP 
                    FOR:
                    <asp:Label ID="Label6" runat="server" 
                        Text='<%# MonthName(CType(DataBinder.Eval(Container.DataItem, "EffectiveMonth"), Int32), false).ToString.ToUpper & " " & CType(Databinder.Eval(Container.DataItem, "EffectiveYear"), Int32).ToString %>'></asp:Label>
                    </b>&nbsp;</td>
            </tr>
          <tr>
            <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("StaffName") %>'></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("StaffCode") %>'></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label7" runat="server" 
                    Text='<%# Databinder.Eval(Container.DataItem, "LocationName").ToString.ToUpper %>'></asp:Label>
              </td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td align="center"><b>WEST AFRICAN SEASONING COMPANY LIMITED</b></td>
      </tr>
        <tr>
            <td>
                <table border="0" cellpadding="0" cellspacing="0" class="borderedTable" 
                    width="100%">
                    <tr>
                        <td valign="top" width="10%">
                            &nbsp;</td>
                        <td valign="top" width="40%">
                            <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                <tr>
                                    <td align="center" class="defaultHeaderTextStyle" colspan="2">
                                        TAXABLE PAY</td>
                                </tr>
                                <tr>
                                    <td align="left" width="60%">
                                        <b>BASIC:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label8" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Basic"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>FUNCTIONAL:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label9" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Functional"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>TRANSPORT:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label10" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TransportTaxable"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>HOUSING:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label11" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "HousingTaxable"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>OVERTIME R1:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label13" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Overtime1"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>OVERTIME R2:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label14" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Overtime2"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="right">
                                        <hr style="color:Black;width=100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>TOTAL TAXABLE PAY:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label32" runat="server" style="font-weight: 700" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TotalTaxablePay"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="right">
                                        <hr style="color:Black;width=100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" class="defaultHeaderTextStyle" colspan="2">
                                        NON-TAXABLE PAY</td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>TRANSPORT:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label15" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TransportNonTaxable"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>HOUSING:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label16" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "HousingNonTaxable"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>LUNCH:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label17" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Lunch"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>CLOTHING:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label18" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Clothing"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>UTILITY:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label19" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Utility"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>NIGHT SHIFT:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label20" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "NiteShift"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <b>OTHER:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label21" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "OtherTaxable"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="right">
                                        <hr style="color:Black;width=100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>TOTAL NON-TAXABLE PAY:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label34" runat="server" style="font-weight: 700" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TotalNonTaxablePay"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        &nbsp;</td>
                                    <td align="right">
                                        <hr style="color:Black;width=100%" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            <table border="0" cellpadding="2" cellspacing="0" width="100%">
                                <tr>
                                    <td align="center" class="defaultHeaderTextStyle" colspan="2">
                                        DEDUCTIONS</td>
                                </tr>
                                <tr>
                                    <td width="60%">
                                        <b>CO-OP:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label23" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "COOP"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>LOAN:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label24" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Loan"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>FOBTOB:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label25" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "FOBTOB"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>PAYE:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label33" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "PAYE"), DOuble), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>PENSION:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label27" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Pension"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>UNION DUES:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label28" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "OtherDeduction"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <b>OTHER DEDUCTION:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label29" runat="server" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "UnionDues"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="pageHeaderStyleLASAA">
                                        &nbsp;</td>
                                    <td align="right" class="pageHeaderStyleLASAA">
                                        <hr style="color:Black;width=100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>TOTAL DEDUCTIONS:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label30" runat="server" style="font-weight: 700" 
                                            Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TotalDeductions"), Double), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        <hr style="color:Black;width=100%" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                    </td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b></b>
                                    </td>
                                    <td align="right">
                                        <b></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>TAX PAID TO DATE:</b></td>
                                    <td align="right">
                                        <asp:Label ID="Label35" runat="server" style="font-weight: 700" 
                                            Text='<%# "&#8358; " & FormatNumber(CType(Databinder.Eval(Container.DataItem, "PAYE"), DOuble) * CType(DataBinder.Eval(Container.DataItem, "EffectiveMonth"), Int32), 2) %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>LEAVE DAYS ALLOWABLE:</b></td>
                                    <td align="right">
                                        --</td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>LEAVE DAYS SPENT:</b></td>
                                    <td align="right">
                                        <b>&nbsp; --</b></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        <b>LEAVE DAYS BALANCE:</b></td>
                                    <td align="right">
                                        <b>&nbsp; --</b></td>
                                </tr>
                                <tr>
                                    <td align="right">
                                        &nbsp;</td>
                                    <td align="right">
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top" width="10%">
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td valign="top">
                            &nbsp;</td>
                        <td colspan="2" valign="top">
                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="50%">
                                        <table border="0" cellpadding="4" cellspacing="4" width="100%">
                                            <tr>
                                                <td align="right" class="pageHeaderStyleLASAA" width="60%">
                                                    GROSS PAY:</td>
                                                <td align="right">
                                                    <asp:Label ID="Label22" runat="server" CssClass="pageHeaderStyleLASAA" 
                                                        Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TotalTaxablePay"), Double) + CType(Databinder.Eval(Container.DataItem, "TotalNonTaxablePay"), Double), 2) %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="4" cellspacing="4" width="100%">
                                            <tr>
                                                <td align="right" class="pageHeaderStyleLASAA" width="60%">
                                                    NET PAY:</td>
                                                <td align="right">
                                                    <asp:Label ID="Label31" runat="server" CssClass="pageHeaderStyleLASAA" 
                                                        Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TotalTaxablePay"), Double) + CType(Databinder.Eval(Container.DataItem, "TotalNonTaxablePay"), Double) - CType(Databinder.Eval(Container.DataItem, "TotalDeductions"), Double), 2) %>'></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td valign="top">
                            &nbsp;</td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td height="30">
                &nbsp;</td>
        </tr>
        <tr>
            <td height="30">
                &nbsp;</td>
        </tr>
        <tr>
            <td height="30">
                &nbsp;</td>
        </tr>
        <tr>
            <td height="30">
                &nbsp;</td>
        </tr>
    </table></td>
  </tr>
</table>

                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlGetAllStaff" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT '0' AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT a.StaffCode as StaffId, LTRIM(UPPER(IsNull(a.Surname, '')) + ' ' + UPPER(IsNull(a.OtherNames, '')) + ' | ' + UPPER(IsNull(a.StaffCode, '')) + ' | (' + UPPER(b.DepartmentName) + ' Department)') AS StaffDetails FROM dbo.HR_Staff_Base a INNER JOIN dbo.Core_Department b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) ORDER BY StaffDetails ">
                    </asp:SqlDataSource>
                </td>
            </tr>
            </table>
    
      </div>
    </form>
</body>
</html>
