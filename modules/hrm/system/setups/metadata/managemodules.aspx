<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managemodules.aspx.vb" Inherits="modules_system_setups_metadata_managemodules" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Manage Existing Modules"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False" AutoGenerateSelectButton="True"
                        CssClass="noBorderedMenuTable" DataKeyNames="ModuleId" DataSourceID="dsSqlModules">
                        <Columns>
                            <asp:BoundField DataField="ModuleId" HeaderText="ModuleId" InsertVisible="False"
                                ReadOnly="True" SortExpression="ModuleId" />
                            <asp:BoundField DataField="ModuleName" HeaderText="ModuleName" SortExpression="ModuleName" />
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <SelectedRowStyle BackColor="#D0D4DB" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlModules" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT [ModuleId], [ModuleName] FROM [Core_Module]"></asp:SqlDataSource>
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <hr color="black" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
