<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageinventorymaster.aspx.vb" Inherits="modules_system_setups_metadata_manageinventorymaster" %>

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
                        Text=":: Add a New Inventory Master Item"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ItemMasterId"
                        DataSourceID="dsSqlMasters" DefaultMode="Insert" 
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
                            <asp:BoundField DataField="ItemMakerId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ItemMakerId" />
                            <asp:TemplateField HeaderText="Full Name:" SortExpression="ItemFullName">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="50" 
                                        Text='<%# Bind("ItemFullName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemFullName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Alias (Short Name):" 
                                SortExpression="ItemShortName">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="30" 
                                        Text='<%# Bind("ItemShortName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Type:" SortExpression="ItemTypeId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlItemTypes" 
                                        DataTextField="ItemTypeName" DataValueField="ItemTypeId" 
                                        SelectedValue='<%# Bind("ItemTypeId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemTypeId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Maker:" SortExpression="ItemMakerId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlMakers" 
                                        DataTextField="ItemMakerName" DataValueField="ItemMakerId" 
                                        SelectedValue='<%# Bind("ItemMakerId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ItemMakerId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Model:" SortExpression="ItemModelName">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="30" 
                                        Text='<%# Bind("ItemModelName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemModelName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Description:" 
                                SortExpression="ItemModelNumber">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Columns="40" 
                                        Text='<%# Bind("ItemModelNumber") %>' CssClass="defaultFormElementStyle" 
                                        Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ItemModelNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Master Item" />
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
                        Text=":: Edit Existing Inventory Master Items"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ItemMasterId" 
                        DataSourceID="dsSqlMasters" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1200px" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="ItemMasterId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemMasterId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ItemMasterId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Full Name" SortExpression="ItemFullName">
                                <EditItemTemplate>
                                    <strong>Full Name:</strong><br />
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        Text='<%# Bind("ItemFullName") %>'></asp:TextBox>
                                    <br />
                                    <br />
                                    <strong>Description:</strong><br />
                                    <asp:TextBox ID="TextBox6" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="5" 
                                        Text='<%# Bind("ItemModelNumber") %>' TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ItemFullName") %>' ToolTip='<%# "Description: " & CType(Databinder.Eval(Container.DataItem, "ItemModelNumber"), String) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Alias" SortExpression="ItemShortName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="20" 
                                        Text='<%# Bind("ItemShortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ItemShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Type" SortExpression="ItemTypeId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1b" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlItemTypes" 
                                        DataTextField="ItemTypeName" DataValueField="ItemTypeId" 
                                        SelectedValue='<%# Bind("ItemTypeId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ItemTypeId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Item Maker" SortExpression="ItemMakerId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2b" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlMakers" 
                                        DataTextField="ItemMakerName" DataValueField="ItemMakerId" 
                                        SelectedValue='<%# Bind("ItemMakerId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ItemMakerId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Model" SortExpression="ItemModelName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="20" 
                                        Text='<%# Bind("ItemModelName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ItemModelName") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlMasters" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_INVENTORY_DELETE_INV_ItemMaster" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_INVENTORY_INSERT_INV_ItemMaster" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_INVENTORY_SELECTALL_INV_ItemMaster" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_INVENTORY_UPDATE_INV_ItemMaster" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ItemMasterId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ItemMasterId" Type="Int32" />
                            <asp:Parameter Name="ItemFullName" Type="String" />
                            <asp:Parameter Name="ItemShortName" Type="String" />
                            <asp:Parameter Name="ItemTypeId" Type="Int32" />
                            <asp:Parameter Name="ItemMakerId" Type="Int32" />
                            <asp:Parameter Name="ItemModelName" Type="String" />
                            <asp:Parameter Name="ItemModelNumber" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ItemMasterId" 
                                Type="Int32" />
                            <asp:Parameter Name="ItemFullName" Type="String" />
                            <asp:Parameter Name="ItemShortName" Type="String" />
                            <asp:Parameter Name="ItemTypeId" Type="Int32" />
                            <asp:Parameter Name="ItemMakerId" Type="Int32" />
                            <asp:Parameter Name="ItemModelName" Type="String" />
                            <asp:Parameter Name="ItemModelNumber" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlItemTypes" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ItemTypeId], [ItemTypeName] FROM [INV_ItemType] ORDER BY [ItemTypeName]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlMakers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ItemMakerId], [ItemMakerName] FROM [INV_ItemMaker] ORDER BY [ItemMakerName]">
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
