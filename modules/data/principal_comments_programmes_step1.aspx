<%@ Page Language="VB" AutoEventWireup="false" CodeFile="principal_comments_programmes_step1.aspx.vb" Inherits="modules_data_principal_comments_programmes_step1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../inc_functions_js.js"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: All Programmes are listed below. <br />&nbsp;&nbsp;&nbsp;&nbsp;Please click a programme to proceed."></asp:Label></td>
          </tr>
          <tr>
            <td>
            
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsSqlProgrammes" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="540px" 
                        SelectedIndex="0" EnableModelValidation="True" 
                    EmptyDataText="No subject(s) found." DataKeyNames="ProgrammeName" >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Programme" SortExpression="ProgrammeName">
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "ProgrammeName").ToString & " (" & Databinder.Eval(Container.DataItem, "ProgrammeAlias").ToString & ")" %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" 
                            NavigateUrl='<%# "principal_comments_programmes_step2.aspx?a=" & Databinder.Eval(Container.DataItem, "ProgrammeName").ToString %>' Font-Bold="True">Principal's Comments &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#FFFBD6" 
                ForeColor="#333333" Height="30px" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsSqlProgrammes" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    
                    SelectCommand="SELECT [ProgrammeName], [ProgrammeAlias] FROM [TEMPProgramme] ORDER BY [ProgrammeName]">
        </asp:SqlDataSource>
            
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
