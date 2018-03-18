<%@ Page Language="VB" AutoEventWireup="false" CodeFile="filter_comments_entry_for_peteacher.aspx.vb" Inherits="modules_data_filter_comments_entry_for_peteacher" %>

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
                    Text=":: Please click an option below to enter your Comments:"></asp:Label></td>
          </tr>
          <tr>
            <td>
            
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="ClassName" DataSourceID="dsSqlPEClasses" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="660px" EnableModelValidation="True" 
                    EmptyDataText="No subject(s) found." >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Class" SortExpression="ClassName">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/modules/data/comments_PE_primary_CA1.aspx">Enter PE Comments</asp:HyperLink>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl="~/modules/data/comments_PE_primary_CA2.aspx">Enter PE Comments</asp:HyperLink>
                    </ItemTemplate>
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
        <asp:SqlDataSource ID="dsSqlPEClasses" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand=" SELECT 'All Classes' AS ClassName ">
        </asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
