<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managemenuitems.aspx.vb" Inherits="modules_system_setups_metadata_managemenuitems" %>

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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Manage Existing Menu-Items"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        AutoGenerateSelectButton="True" CssClass="noBorderedMenuTable" DataKeyNames="MenuId"
                        DataSourceID="dsSqlMenuItems">
                        <Columns>
                            <asp:BoundField DataField="MenuId" HeaderText="MenuId" InsertVisible="False" ReadOnly="True"
                                SortExpression="MenuId" />
                            <asp:BoundField DataField="MenuName" HeaderText="MenuName" SortExpression="MenuName" />
                            <asp:BoundField DataField="MenuUrl" HeaderText="MenuUrl" SortExpression="MenuUrl" />
                            <asp:BoundField DataField="MenuTarget" HeaderText="MenuTarget" SortExpression="MenuTarget" />
                            <asp:BoundField DataField="MenuOrder" HeaderText="MenuOrder" SortExpression="MenuOrder" />
                            <asp:BoundField DataField="ModuleId" HeaderText="ModuleId" SortExpression="ModuleId" />
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <SelectedRowStyle BackColor="#D0D4DB" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlMenuItems" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_MENU" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_MENU" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECT_MENU_ALL" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_MENU" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="MenuId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="MenuId" Type="Int32" />
                            <asp:Parameter Name="MenuName" Type="String" />
                            <asp:Parameter Name="MenuUrl" Type="String" />
                            <asp:Parameter Name="MenuTarget" Type="String" />
                            <asp:Parameter Name="MenuOrder" Type="Int32" />
                            <asp:Parameter Name="ModuleId" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="MenuId" Type="Int32" />
                            <asp:Parameter Name="MenuName" Type="String" />
                            <asp:Parameter Name="MenuUrl" Type="String" />
                            <asp:Parameter Name="MenuTarget" Type="String" />
                            <asp:Parameter Name="MenuOrder" Type="Int32" />
                            <asp:Parameter Name="ModuleId" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
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
