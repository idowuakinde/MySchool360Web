<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profile_student_all.aspx.vb" Inherits="modules_profiles_profile_student_all" EnableEventValidation="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
        <table width="100%"  border="0" id="TABLE1">
            <tr>
                <td width="5">&nbsp;</td>
                <td>
                    <asp:HyperLink ID="hlkAddNew" runat="server" Font-Bold="True" ForeColor="Red" 
                        NavigateUrl="#">Enrol New Student</asp:HyperLink>&nbsp;|
                    <asp:HyperLink ID="hlkAddNew0" runat="server" Font-Bold="True" ForeColor="Red" 
                        NavigateUrl="~/modules/reports/rpt_Enrolments_AllStudents.aspx" 
                        Target="singleStudentFrame">Enrolment Reports</asp:HyperLink>&nbsp;(<%= GridView5.Rows.Count.ToString & " Students" %>)</td>
            </tr>
            <tr>
                <td></td>
                <td>
                <asp:GridView ID="GridView5" runat="server" AllowSorting="True" 
                    CssClass="borderedTableGrey" DataSourceID="dsSqlStudentProfile" 
                        AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="MatricNumber" ForeColor="#333333" GridLines="None" 
                    Width="400px" EnableModelValidation="True" PageSize="20" 
                        EmptyDataText="No Student records to display.">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                    <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="#" SortExpression="MatricNumber">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# CType(DataBinder.Eval(Container.DataItem, "MatricNumber"), String) %>'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="60px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Class" HeaderText="Prog" 
                            SortExpression="Class" >
                        <ItemStyle Width="120px" />
                        </asp:BoundField>
                        <asp:TemplateField HeaderText="Full Name" SortExpression="FullName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# CType(DataBinder.Eval(Container.DataItem, "FullName"), String) & " (" & CType(DataBinder.Eval(Container.DataItem, "Sex"), String) & ")" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                        HorizontalAlign="Left" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                </td>
            </tr>
          <tr>
            <td>&nbsp;</td>
            <td>
                <asp:SqlDataSource ID="dsSqlStudentProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand=" SELECT [CustomerID], [RefCode], CustomerCode as MatricNumber, LastName, FirstName, LastName + ' ' + FirstName AS FullName, DistrictCode as [Class], SyncStatus as [Sex], BillingAddress FROM dbo.TEMPCustomers_2012 ORDER BY MatricNumber " 
                    DeleteCommand=" INSERT INTO dbo.TEMPCustomers_Deleted (CustomerID, EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, [State], PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, [Password], Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, Notes, SyncStatus) SELECT CustomerID, EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, [State], PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, [Password], Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, Notes, SyncStatus FROM dbo.TEMPCustomers WHERE CustomerCode = @MatricNumber DELETE FROM dbo.TEMPCustomers_2012 WHERE CustomerCode = @MatricNumber ">
                    <DeleteParameters>
                        <asp:Parameter Name="MatricNumber" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </form>
</body>
</html>
