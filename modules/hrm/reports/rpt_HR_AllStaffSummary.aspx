<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_HR_AllStaffSummary.aspx.vb" Inherits="modules_reports_rpt_HR_AllStaffSummary" %>

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
        <table border="0" width="1300" class="borderedTableGrey">
            <tr>
              <td><table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="80%">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text="REPORTS > HR REPORTS > ALL STAFF SUMMARY"></asp:Label>
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
                        CssClass="noBorderedMenuTable" 
                        DataSourceID="dsSqlGetData" Width="100%" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                        ShowFooter="True" Font-Size="X-Small">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffGUID" HeaderText="StaffGUID"
                                SortExpression="StaffGUID" 
                                Visible="False" />
                            <asp:BoundField DataField="StaffCode" HeaderText="Staff Code" 
                                SortExpression="StaffCode" >
                            </asp:BoundField>
                            <asp:BoundField DataField="StaffName" HeaderText="Staff Name" 
                                SortExpression="StaffName" ReadOnly="True" >
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Gender" SortExpression="Gender">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Common.GetMaleOrFemale(Databinder.Eval(Container.DataItem, "Gender").ToString) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Date of Birth" SortExpression="DateOfBirth">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "DateOfBirth"), datetime)) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DateOfBirth") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Marital Status" SortExpression="MaritalStatus">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Common.GetFullMaritalStatus(Databinder.Eval(Container.DataItem, "MaritalStatus").ToString) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("MaritalStatus") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Wedding Date" SortExpression="WeddingDate">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "WeddingDate"), datetime)) %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("WeddingDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LocationName" HeaderText="Location" 
                                SortExpression="LocationName" />
                            <asp:BoundField DataField="Department" HeaderText="DeptCode" 
                                SortExpression="Department" Visible="False" />
                            <asp:BoundField DataField="DepartmentName" HeaderText="Department" 
                                SortExpression="DepartmentName" />
                            <asp:BoundField DataField="JobLevelName" HeaderText="Job Level " 
                                SortExpression="JobLevelName" />
                            <asp:BoundField DataField="DesignationName" HeaderText="Designation" 
                                SortExpression="DesignationName" />
                            <asp:TemplateField HeaderText="Phys. Challenged?" SortExpression="Challenged" 
                                Visible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Challenged") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("Challenged") %>'></asp:Label>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="AreaOfInterest" HeaderText="Area of Interest" 
                                SortExpression="AreaOfInterest" ReadOnly="True" Visible="False" />
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
                        SelectCommand="SELECT a.StaffGUID, a.StaffCode, RTRIM(LTRIM(UPPER(IsNull(a.Surname,'')) + ' ' + IsNull(a.OtherNames,''))) AS StaffName, IsNull(Gender, '') as Gender, DateOfBirth, IsNull(MaritalStatus, '') as MaritalStatus, WeddingDate, a.LocationId, LocationName, a.Department, f.DepartmentName, a.JobLevelId, JobLevelName, a.DesignationId, d.DesignationName, a.LgaOfOriginId, e.LgaName, IsNull(BloodGroup, '') as Bloodgroup, IsNull(Genotype, '') as Genotype, IsNull(AreaOfInterest, '') as AreaOfInterest, IsNull(Hobbies, '') as Hobbies, IsNull(Visa, '') as Challenged FROM dbo.HR_Staff_Base a INNER JOIN dbo.HR_Location b ON a.LocationId = b.LocationId INNER JOIN dbo.HR_JobLevel c ON a.JobLevelId = c.JobLevelId INNER JOIN dbo.HR_Designation d ON a.DesignationId = d.DesignationId INNER JOIN dbo.Core_Lga e ON a.LgaOfOriginId = e.LgaId INNER JOIN dbo.Core_Department f ON a.Department = left(f.DepartmentName, charindex('.', f.DepartmentName) - 1) ORDER BY StaffName  ">
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
            </table>
    
    </div>
    </form>
</body>
</html>
