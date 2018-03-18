<%@ Page Language="VB" AutoEventWireup="false" CodeFile="print_batch_result_programmes_step2.aspx.vb" Inherits="modules_data_print_batch_result_programmes_step2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td>
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Please select a student from the list below to print their results."></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnPrintBatch" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      PRINT this Batch of Results      " UseSubmitBehavior="False" />
&nbsp;&nbsp;<asp:Button ID="btnEmailBatch" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      E-mail this Batch of Results      " UseSubmitBehavior="False" />
                </td>
            </tr>
            <tr>
                <td align="center">
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="CustomerId" DataSourceID="dsSqlStudents" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1150px" 
                        EnableModelValidation="True" EmptyDataText="No student(s) found." >
            <Columns>
                <asp:TemplateField HeaderText="Actions">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlnkPrincipalComment" runat="server" Font-Bold="True" NavigateUrl='<%# "print_student_result_principal.asp?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>Principal's Comment</asp:HyperLink>
                        <br />&nbsp;<br />
                        <asp:HyperLink ID="hlnkPrint" runat="server" Font-Bold="True" NavigateUrl='<%# "print_student_result.asp?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>Print Result</asp:HyperLink>
                        &nbsp;|&nbsp;<asp:HyperLink ID="hlnkEmail" runat="server" Font-Bold="True" 
                            NavigateUrl='<%# "email_to_parents.aspx?a=single&b=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString %>'>E-mail</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serialNumber + 1 %>"></asp:Label>
                    </ItemTemplate>
                        <HeaderStyle HorizontalAlign="Center" />
                        <ItemStyle Width="20px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                            <asp:Image ID="Image1" runat="server" Height="30px" ToolTip="Click to enlarge." 
                            ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "PortalNumber").ToString & ".jpg")) %>' 
                            Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                        </a><br />
                    </ItemTemplate>
                    <ItemStyle Width="60px" HorizontalAlign="Center" />
                </asp:TemplateField>
                <asp:BoundField DataField="PortalNumber" HeaderText="Portal No." 
                    SortExpression="PortalNumber" />
                <asp:TemplateField HeaderText="Full Name" SortExpression="FirstName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "FirstName").ToString & " <b>" & Databinder.Eval(Container.DataItem, "LastName").ToString & "</b>" %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="250px" />
                </asp:TemplateField>
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    SortExpression="ClassName" />
                <asp:BoundField DataField="ProgrammeName" HeaderText="Programme" 
                    SortExpression="ProgrammeName" />
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" Height="65px" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                    <asp:Button ID="btnPrintBatch0" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      PRINT this Batch of Results      " UseSubmitBehavior="False" />
                    &nbsp;&nbsp;<asp:Button ID="btnEmailBatch0" runat="server" 
                                CssClass="defaultButtonStyle" 
                        Text="      E-mail this Batch of Results      " UseSubmitBehavior="False" />
        <asp:SqlDataSource ID="dsSqlStudents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"                        
                        
                        SelectCommand=" SELECT CustomerId, RefCode, DistrictCode as ClassName, c.ProgrammeName + ' (' + ProgrammeAlias + ')' AS ProgrammeName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPClass b ON a.DistrictCode = b.ClassName INNER JOIN dbo.TEMPProgramme c ON b.Remarks = c.ProgrammeName WHERE c.ProgrammeName = @ProgrammeName ORDER BY CustomerCode  ">
            <SelectParameters>
                <asp:QueryStringParameter Name="ProgrammeName" QueryStringField="a" />
            </SelectParameters>
        </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
						&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
