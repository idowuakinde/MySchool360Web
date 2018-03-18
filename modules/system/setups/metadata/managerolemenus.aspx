<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managerolemenus.aspx.vb" Inherits="modules_system_setups_metadata_managerolemenus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Assign a New Menu to an Existing Role"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlRoleMenus" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="RoleMenuId" SortExpression="RoleMenuId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("RoleMenuId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text="<-- to be auto-generated by the database -->"></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("RoleMenuId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role:" SortExpression="RoleName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" CssClass="defaultFormElementStyle"
                                        DataSourceID="dsSqlRolenames" DataTextField="RoleName" DataValueField="RoleId"
                                        SelectedValue='<%# Bind("RoleId") %>'>
                                    </asp:DropDownList><asp:SqlDataSource ID="dsSqlRolenames" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                                        SelectCommand="SELECT DISTINCT [RoleId], [RoleName] FROM [Core_Role] ORDER BY [RoleName], [RoleId]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Menu:" SortExpression="MenuName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("MenuName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" CssClass="defaultFormElementStyle"
                                        DataSourceID="dsSqlMenunames" DataTextField="MenuName" DataValueField="MenuId"
                                        SelectedValue='<%# Bind("MenuId") %>'>
                                    </asp:DropDownList><asp:SqlDataSource ID="dsSqlMenunames" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                                        SelectCommand="SELECT DISTINCT [MenuId], [MenuName] FROM [Core_Menu] ORDER BY [MenuName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" Text='<%# Bind("MenuName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Assign Selected Menu to the Selected Role" />
                        </Fields>
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Edit Existing Role / Menu Assignments"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        AutoGenerateDeleteButton="True" AutoGenerateSelectButton="True" 
                        CssClass="noBorderedMenuTable" DataSourceID="dsSqlRoleMenus" 
                        DataKeyNames="RoleMenuId" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        Width="100%" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField HeaderText="Id" SortExpression="RoleMenuId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("RoleMenuId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("RoleMenuId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Role" SortExpression="RoleName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("RoleName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("RoleName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Menu" SortExpression="MenuName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("MenuName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("MenuName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlRoleMenus" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_ROLEMENU" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_ROLEMENU" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECT_MENU_PER_ROLE_ALL" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_ROLEMENU" UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:ControlParameter ControlID="gvUsers" Name="RoleMenuId" PropertyName="SelectedValue"
                                Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="RoleMenuId" Type="Int32" />
                            <asp:Parameter Name="RoleId" Type="Int32" />
                            <asp:Parameter Name="MenuId" Type="Int32" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="RoleMenuId" Type="Int32" />
                            <asp:Parameter Name="RoleId" Type="Int32" />
                            <asp:Parameter Name="MenuId" Type="Int32" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    &nbsp; &nbsp;
                    &nbsp; &nbsp;&nbsp;
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
