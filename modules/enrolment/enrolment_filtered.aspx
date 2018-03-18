<%@ Page Language="VB" AutoEventWireup="false" CodeFile="enrolment_filtered.aspx.vb" Inherits="modules_enrolment_enrolment_filtered" %>

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
                    <asp:Label ID="Label7" runat="server" Font-Bold="True"></asp:Label>
                    <asp:HyperLink ID="hlkAddNew" runat="server" Font-Bold="True" ForeColor="Red" 
                        NavigateUrl="~/modules/enrolment/enrolment_new.aspx?a=2013/2014">Record New Application</asp:HyperLink>&nbsp;(<%= GridView5.Rows.Count.ToString & " Applications" %>)</td>
            </tr>
            <tr>
                <td></td>
                <td>
                <asp:GridView ID="GridView5" runat="server" AllowSorting="True" 
                    CssClass="borderedTableGrey" DataSourceID="dsSqlStudentProfile" 
                        AutoGenerateColumns="False" CellPadding="4" 
                    DataKeyNames="MatricNumber" ForeColor="#333333" GridLines="None" 
                    Width="1560px" EnableModelValidation="True" PageSize="20" 
                        EmptyDataText="No Applicant records to display.">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" VerticalAlign="Top" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label16" runat="server" Text="<%# serialNumber + 1 %>"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle Width="20px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnDelete" runat="server" 
                                    OnClientClick="return confirm('Are you sure you want to delete this record?');" 
                                    CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" 
                                    ToolTip="Click to delete this record..." />
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:CommandField EditText="Accept or Reject" ShowEditButton="True" >
                        <ItemStyle Width="100px" />
                        </asp:CommandField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hlnkEdit" runat="server" 
                                    NavigateUrl='<%# "enrolment_edit.aspx?a=" & CType(DataBinder.Eval(Container.DataItem, "MatricNumber"), String) %>'>Edit</asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hlnkPrintInvoice" runat="server" 
                                    NavigateUrl='<%# "~/modules/payments/invoice_enrolment.asp?a=" & CType(DataBinder.Eval(Container.DataItem, "MatricNumber"), String) & "&b=" & sessionName %>'>Invoice</asp:HyperLink>
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:HyperLink ID="hlnkSelectSubjects" runat="server" NavigateUrl='<%# "~/modules/data/manage_student_subjects.aspx?a=" & sessionName & "&b=" & CType(DataBinder.Eval(Container.DataItem, "MatricNumber"), String) & "&c=" & CType(DataBinder.Eval(Container.DataItem, "MatricNumber"), String) & "%" %>'>Subjects</asp:HyperLink>
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
                        <asp:TemplateField HeaderText="Accepted?" SortExpression="ApplicationStatus">
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlApplicationStatus" runat="server" 
                                    CssClass="defaultFormElementStyle" 
                                    SelectedValue='<%# Bind("ApplicationStatus") %>'>
                                    <asp:ListItem>Pending</asp:ListItem>
                                    <asp:ListItem>Accepted</asp:ListItem>
                                </asp:DropDownList>
                            </EditItemTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("ApplicationStatus") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Session" SortExpression="SessionName">
                            <ItemTemplate>
                                <asp:Label ID="Label9" runat="server" Text='<%# Eval("SessionName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Class" SortExpression="Class">
                            <ItemTemplate>
                                <asp:Label ID="Label10" runat="server" Text='<%# Eval("Class") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Full Name" SortExpression="FullName">
                            <ItemTemplate>
                                <asp:Label ID="Label2" runat="server" Text='<%# CType(DataBinder.Eval(Container.DataItem, "FullName"), String) & " (" & CType(DataBinder.Eval(Container.DataItem, "Sex"), String) & ")" %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Gender" SortExpression="Sex">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" 
                                    Text='<%# Common.GetMaleOrFemale(CType(Databinder.Eval(Container.DataItem, "Sex"), String)) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="60px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Birth Date" SortExpression="BirthDate">
                            <ItemTemplate>
                                <asp:Label ID="Label4" runat="server" 
                                    Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem, "BirthDate"), DateTime)) %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="80px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Father's Email" SortExpression="EmailAddress">
                            <ItemTemplate>
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("EmailAddress") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label17" runat="server" Text='<%# Bind("PhoneNumber") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Mother's Email" SortExpression="ParentEmail">
                            <ItemTemplate>
                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("ParentEmail") %>'></asp:Label>
                                <br />
                                <asp:Label ID="Label18" runat="server" Text='<%# Bind("Extension") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="State" SortExpression="State">
                            <ItemTemplate>
                                <asp:Label ID="Label6b" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Boarder?" SortExpression="Boarder">
                            <ItemTemplate>
                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("Boarder") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
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
                    SelectCommand=" SELECT [CustomerID], [RefCode], CustomerCode as [MatricNumber], LastName, FirstName, LastName + ' ' + FirstName AS FullName, DistrictCode as [Class], SyncStatus as [Sex], MeterDate as BirthDate, EmailAddress, CurrentBal as ParentEmail, Activated as Boarder, LastPmt as Score, PhoneNumber, Extension, State, BelongToCode as SessionName, ISNULL(ActiveInactive, 'Pending') as ApplicationStatus, StateName FROM dbo.TEMPcustomers_0_Applied a INNER JOIN dbo.Core_State b ON a.State = b.StateId WHERE BelongToCode = @SessionName AND ISNULL(ActiveInactive, 'Pending') = @Status ORDER BY SessionName DESC, MatricNumber, Class, FullName " 
                    DeleteCommand=" INSERT INTO dbo.TEMPcustomers_0_Applied_Deleted (CustomerID, EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, [State], PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, [Password], Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, Notes, SyncStatus) SELECT CustomerID, EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, [State], PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, [Password], Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, Notes, SyncStatus FROM dbo.TEMPcustomers_0_Applied WHERE CustomerCode = @MatricNumber DELETE FROM dbo.TEMPcustomers_0_Applied WHERE CustomerCode = @MatricNumber " 
                    UpdateCommand="STP_DATAENTRY_UPDATE_Applicant_Status" 
                    UpdateCommandType="StoredProcedure">
                    <DeleteParameters>
                        <asp:Parameter Name="MatricNumber" />
                    </DeleteParameters>
                    <SelectParameters>
                        <asp:QueryStringParameter Name="SessionName" QueryStringField="a" />
                        <asp:QueryStringParameter Name="Status" QueryStringField="b" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CustomerCode" Type="String" />
                        <asp:Parameter Name="ActiveInactive" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </form>
</body>
</html>
