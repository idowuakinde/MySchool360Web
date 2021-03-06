﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_PAYROLL_Staff_Payslip.aspx.vb" Inherits="modules_reports_rpt_PAYROLL_Staff_Payslip" %>

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
                        Text="REPORTS > PAYROLL REPORTS > STAFF PAYSLIP FOR: "></asp:Label>
                        <asp:DropDownList ID="ddlChooser" runat="server" AutoPostBack="True" 
                      CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetAllStaff" 
                      DataTextField="StaffDetails" DataValueField="StaffId">
                  </asp:DropDownList>
                    
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
        <asp:GridView ID="gvUsers" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="StaffId" DataSourceID="dsSqlGetData" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                        PageSize="2" >
            <Columns>
                <asp:TemplateField HeaderText="PAY SLIP FROM WEST AFRICAN SEASONING COMPANY LIMITED">
                    <ItemTemplate>

<table width="100%" border="0" cellspacing="0" cellpadding="0" class="defaultTextStyle">
  <tr>
    <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td><table width="100%" border="0">
            <tr>
                <td width="50%">
                    <b>Staff Code: </b>
                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("StaffCode") %>'></asp:Label>
                </td>
                <td>
                    <b>Payslip Period: </b>
                  <asp:Label ID="Label6" runat="server" Text='<%# MonthName(CType(DataBinder.Eval(Container.DataItem, "EffectiveMonth"), Int32), false).ToString.ToUpper & " " & CType(Databinder.Eval(Container.DataItem, "EffectiveYear"), Int32).ToString %>'></asp:Label>
                </td>
            </tr>
          <tr>
            <td><b>Staff Name: </b>
              <asp:Label ID="Label3" runat="server" Text='<%# Eval("StaffName") %>'></asp:Label></td>
            <td><b>Location: </b>
                <asp:Label ID="Label7" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "LocationName").ToString.ToUpper %>'></asp:Label>
              </td>
            </tr>
          <tr>
            <td><b>Department: </b>
                <asp:Label ID="Label4" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "DepartmentName").ToString.ToUpper %>'></asp:Label>
              </td>
            <td><b>Designation: </b>
                <asp:Label ID="Label5" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "DesignationName").ToString.ToUpper %>'></asp:Label>
              </td>
            </tr>
          </table></td>
      </tr>
      <tr>
        <td><table width="100%" border="0" cellpadding="0" cellspacing="0" class="borderedTable">
          <tr>
            <td width="10%" valign="top">&nbsp;</td>
            <td width="40%" valign="top"><table width="100%" border="0" cellspacing="4" 
                    cellpadding="4">
              <tr>
                <td align="center" class="defaultHeaderTextStyle" colspan="2">TAXABLE PAY</td>
                </tr>
              <tr>
                <td align="center" colspan="2">
                    <hr style="color:Black;width=100%" />
                  </td>
                </tr>
              <tr>
                <td align="left" width="60%"><b>BASIC:</b></td>
                <td align="right">
                    <asp:Label ID="Label8" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Basic"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>FUNCTIONAL:</b></td>
                <td align="right">
                    <asp:Label ID="Label9" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Functional"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>TRANSPORT:</b></td>
                <td align="right">
                    <asp:Label ID="Label10" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TransportTaxable"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>HOUSING:</b></td>
                <td align="right">
                    <asp:Label ID="Label11" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "HousingTaxable"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>OVERTIME R1:</b></td>
                <td align="right">
                    <asp:Label ID="Label13" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Overtime1"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>OVERTIME R2:</b></td>
                <td align="right">
                    <asp:Label ID="Label14" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Overtime2"), Double), 2) %>'></asp:Label>
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
                <td align="center" colspan="2">
                    <hr style="color:Black;width=100%" />
                  </td>
                </tr>
              <tr>
                <td align="left"><b>TRANSPORT:</b></td>
                <td align="right">
                    <asp:Label ID="Label15" runat="server" 
                        Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "TransportNonTaxable"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>HOUSING:</b></td>
                <td align="right">
                    <asp:Label ID="Label16" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "HousingNonTaxable"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>LUNCH:</b></td>
                <td align="right">
                    <asp:Label ID="Label17" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Lunch"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>CLOTHING:</b></td>
                <td align="right">
                    <asp:Label ID="Label18" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Clothing"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>UTILITY:</b></td>
                <td align="right">
                    <asp:Label ID="Label19" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Utility"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>NIGHT SHIFT:</b></td>
                <td align="right">
                    <asp:Label ID="Label20" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "NiteShift"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="left"><b>OTHER:</b></td>
                <td align="right">
                    <asp:Label ID="Label21" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "OtherTaxable"), Double), 2) %>'></asp:Label>
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
              </table></td>
            <td valign="top"><table width="100%" border="0" cellspacing="4" cellpadding="4">
              <tr>
                <td colspan="2" align="center" class="defaultHeaderTextStyle">DEDUCTIONS</td>
                </tr>
              <tr>
                <td align="center" colspan="2">
                    <hr style="color:Black;width=100%" />
                  </td>
                </tr>
              <tr>
                <td width="60%"><b>CO-OP:</b></td>
                <td align="right">
                    <asp:Label ID="Label23" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "COOP"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td><b>LOAN:</b></td>
                <td align="right">
                    <asp:Label ID="Label24" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Loan"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td><b>FOBTOB:</b></td>
                <td align="right">
                    <asp:Label ID="Label25" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "FOBTOB"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td><b>PAYE:</b></td>
                <td align="right">
                    <asp:Label ID="Label33" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "PAYE"), DOuble), 2) %>'></asp:Label>
                  </td>
                </tr>
                <tr>
                    <td>
                        <b>PENSION:</b></td>
                    <td align="right">
                        <asp:Label ID="Label27" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "Pension"), Double), 2) %>'></asp:Label>
                    </td>
                </tr>
              <tr>
                <td><b>UNION DUES:</b></td>
                <td align="right">
                    <asp:Label ID="Label28" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "OtherDeduction"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td><b>OTHER DEDUCTION:</b></td>
                <td align="right">
                    <asp:Label ID="Label29" runat="server" Text='<%# "&#8358; " & Formatnumber(CType(Databinder.Eval(Container.DataItem, "UnionDues"), Double), 2) %>'></asp:Label>
                  </td>
                </tr>
              <tr>
                <td align="right" class="pageHeaderStyleLASAA">&nbsp;</td>
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
                <td></td>
                <td>
                    <hr style="color:Black;width=100%" />
                  </td>
                </tr>
              <tr>
                <td></td>
                <td>&nbsp;</td>
                </tr>
              <tr>
                <td align="right" class="pageHeaderStyleLASAA">&nbsp;</td>
                <td align="right">&nbsp;</td>
                </tr>
                <tr>
                    <td align="right" class="pageHeaderStyleLASAA">&nbsp;
                        </td>
                    <td align="right">&nbsp;
                        </td>
                </tr>
                <tr>
                    <td align="right" class="pageHeaderStyleLASAA">&nbsp;
                        </td>
                    <td align="right">&nbsp;
                        </td>
                </tr>
                <tr>
                    <td align="right" class="pageHeaderStyleLASAA">&nbsp;
                        </td>
                    <td align="right">&nbsp;
                        </td>
                </tr>
                <tr>
                    <td align="right" class="pageHeaderStyleLASAA">&nbsp;
                        </td>
                    <td align="right">&nbsp;
                        </td>
                </tr>
              </table></td>
            <td width="10%" valign="top">&nbsp;</td>
            </tr>
          <tr>
            <td valign="top">&nbsp;</td>
            <td colspan="2" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td colspan="2">
                    <hr style="color:Black;width=100%" />
                  </td>
              </tr>
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
            </table></td>
            <td valign="top">&nbsp;</td>
          </tr>
          </table></td>
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
                        SelectCommand="SELECT b.TempStaffId as PayrollArchiveId, 7, 2011, b.TempStaffId as StaffId, a.StaffId as StaffCode, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.FirstName,'') + ' ' + IsNull(b.MiddleName,''))) AS StaffName, IsNull(b.GradeLevel, '') as DesignationName, IsNull(b.PlaceOfEmploymt, '') AS LocationName, IsNull(b.CurrentDept, '') as DepartmentName, mBasic, mFunctnal, Overtime, Overtime1, Overtime2, mOtherTax as OtherTaxable, mHouseTax as HousingTaxable, mTransTaxA as TransportTaxable, mHouse as HousingNonTaxable, mTransp as TransportNonTaxable, mLunch as Lunch, mClothing as Clothing, mUtil as Utility, mtax as PAYE, mLoan as Loan, UnionDue as UnionDues, mFOBTOB, IsNull(c.TotalmthDed, 0) as COOP, 0 as OtherDeduction, ((IsNull(a.mBasic, 0) + IsNull(a.mHouse, 0) + IsNull(a.mTransp, 0) + IsNull(a.mHouseTax, 0) + IsNull(a.mTransTaxA, 0))*0.075) AS Pension, (mBasic + mFunctnal + mTransTaxA + mHouseTax + Overtime1 + Overtime2) AS TotalTaxablePay, (mTransp + mHouse + mLunch + mClothing + mUtil + Overtime + mOtherTax) AS TotalNonTaxablePay, (IsNull(c.TotalmthDed, 0) + mLoan + mFOBTOB + ((IsNull(a.mBasic, 0) + IsNull(a.mHouse, 0) + IsNull(a.mTransp, 0) + IsNull(a.mHouseTax, 0) + IsNull(a.mTransTaxA, 0))*0.075) + UnionDue + 0) AS TotalDeductions FROM dbo.HR_TEMP_Payroll_July a INNER JOIN dbo.HR_TEMP_Profiles b ON a.StaffId = b.StaffId LEFT JOIN dbo.HR_TEMP_Coop_July c ON b.StaffId = c.StaffId WHERE a.StaffId = @StaffId ORDER BY a.StaffName ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlChooser" Name="StaffId" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlGetAllStaff" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT 0 AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT a.TempStaffId as StaffId, LTRIM(UPPER(IsNull(a.Surname, '')) + ' ' + UPPER(IsNull(a.FirstName, '')) + ' ' + UPPER(IsNull(a.MiddleName, '')) + ' | ' + UPPER(IsNull(a.StaffId, '')) + ' | (' + UPPER(IsNull(a.CurrentDept, 'UNKNOWN'))) + ' Department)' FROM dbo.HR_TEMP_Profiles a ORDER BY StaffDetails ">
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
