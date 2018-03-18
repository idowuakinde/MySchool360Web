<%@ Page Language="VB" AutoEventWireup="false" CodeFile="broadsheets_all_download.aspx.vb" Inherits="modules_academics_broadsheets_all_download" %>

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
                    
                    Text=":: All classes are listed below. &lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;Please click a class to download the Broadsheets for that class."></asp:Label></td>
          </tr>
          <tr>
            <td>
            
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsSqlTeachers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1140px" 
                        SelectedIndex="0" EnableModelValidation="True" 
                    EmptyDataText="No subject(s) found." >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" Width="30px" />
                </asp:TemplateField>
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    ReadOnly="True" SortExpression="ClassName" />
                <asp:TemplateField HeaderText="1st Term&lt;br /&gt;Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1a" runat="server" 
                            NavigateUrl='<%# "~/modules/reports/export_admin_broadsheet_CA1.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Download &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="1st Term&lt;br /&gt;After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1b" runat="server" 
                            NavigateUrl='<%# "~/modules/reports/export_admin_broadsheet_CA2.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Download &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2nd Term&lt;br /&gt;Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1c" runat="server" 
                            NavigateUrl='<%# "~/modules/reports/export_admin_broadsheet_CA3.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Download &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2nd Term&lt;br /&gt;After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1d" runat="server" 
                            NavigateUrl='<%# "~/modules/reports/export_admin_broadsheet_CA4.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Download &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3rd Term&lt;br /&gt;Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1e" runat="server" 
                            NavigateUrl='<%# "~/modules/reports/export_admin_broadsheet_CA5.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Download &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3rd Term&lt;br /&gt;After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1f" runat="server" 
                            NavigateUrl='<%# "~/modules/reports/export_admin_broadsheet_CA6.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Download &gt;&gt;</asp:HyperLink>
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
        <asp:SqlDataSource ID="dsSqlTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="  ">
        </asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
