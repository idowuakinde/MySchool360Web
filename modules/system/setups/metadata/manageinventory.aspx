<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageinventory.aspx.vb" Inherits="modules_system_setups_metadata_manageinventory" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
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
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Add a New Inventory Item"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ItemId"
                        DataSourceID="dsSqlInventory" DefaultMode="Insert" 
                        Height="50px" Width="800px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="ItemId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ItemId" />
                            <asp:TemplateField HeaderText="Master Item:" SortExpression="ItemMasterId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlMasterItems" 
                                        DataTextField="ItemMasterDesc" DataValueField="ItemMasterId" 
                                        SelectedValue='<%# Bind("ItemMasterId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemMasterId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Serial:" SortExpression="ItemSerial">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="30" 
                                        Text='<%# Bind("ItemSerial") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemSerial") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Condition:" SortExpression="ItemStatus">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("ItemStatus") %>'>
                                        <asp:ListItem Value="N">New</asp:ListItem>
                                        <asp:ListItem Value="F">Fairly Used</asp:ListItem>
                                        <asp:ListItem Value="H">Heavily Used</asp:ListItem>
                                        <asp:ListItem Value="S">Scrap</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemStatus") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Inventory Item" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp;&nbsp;</td>
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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Existing Inventory Items"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ItemId" 
                        DataSourceID="dsSqlInventory" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1000px" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ItemId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ItemId" />
                            <asp:TemplateField HeaderText="Master Item" SortExpression="ItemFullName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6b" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlMasterItems" 
                                        DataTextField="ItemMasterDesc" DataValueField="ItemMasterId" 
                                        SelectedValue='<%# Bind("ItemMasterId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemFullName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Serial" SortExpression="ItemSerial">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Columns="30" 
                                        Text='<%# Bind("ItemSerial") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ItemSerial") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Condition" SortExpression="ItemStatus">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("ItemStatus") %>'>
                                        <asp:ListItem Value="N">New</asp:ListItem>
                                        <asp:ListItem Value="F">Fairly Used</asp:ListItem>
                                        <asp:ListItem Value="H">Heavily Used</asp:ListItem>
                                        <asp:ListItem Value="S">Scrap</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Common.GetInventoryItemCondition(Databinder.Eval(Container.DataItem, "ItemStatus").ToString) %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlInventory" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_INVENTORY_DELETE_INV_Item" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_INVENTORY_INSERT_INV_Item" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_INVENTORY_SELECTALL_INV_Item" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_INVENTORY_UPDATE_INV_Item" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ItemId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ItemId" Type="Int32" />
                            <asp:Parameter Name="ItemMasterId" Type="Int32" />
                            <asp:Parameter Name="ItemSerial" Type="String" />
                            <asp:Parameter Name="ItemStatus" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ItemId" Type="Int32" />
                            <asp:Parameter Name="ItemMasterId" Type="Int32" />
                            <asp:Parameter Name="ItemSerial" Type="String" />
                            <asp:Parameter Name="ItemStatus" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlMasterItems" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand=" SELECT [ItemMasterId], IsNull([ItemFullName], '') + ' (by ' + IsNUll([ItemMakerName], '') + '; Model ''' + IsNull([ItemModelName], '') + ' ' + IsNull([ItemModelNumber], '') + ''')' AS ItemMasterDesc FROM [INV_ItemMaster] a INNER JOIN INV_ItemType b ON a.ItemTYpeId = b.ItemTypeId INNER JOIN INV_ItemMaker c ON a.ItemMakerId = c.ItemMakerId ORDER BY ItemMasterDesc ">
                    </asp:SqlDataSource>
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
