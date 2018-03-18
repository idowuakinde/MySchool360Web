<%@ Page Language="VB" AutoEventWireup="false" CodeFile="sell_inventory.aspx.vb" Inherits="modules_inventory_sell_inventory" Trace="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js_CalendarPopup_Combined.js" type="text/javascript"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Sell Inventory"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="InventorySaleId"
                        DataSourceID="dsSqlInventorySales" DefaultMode="Insert" 
                        Height="50px" Width="900px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="InventorySaleId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True" SortExpression="InventorySaleId" />
                            <asp:TemplateField HeaderText="Buyer:" SortExpression="Buyer">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlCustomers" 
                                        DataTextField="CustomerName" DataValueField="CustomerCode" 
                                        SelectedValue='<%# Bind("Buyer") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Buyer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Inventory Item:" SortExpression="AssetRef">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList10" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlInventory" 
                                        DataTextField="AssetDescription" DataValueField="AssetRef" 
                                        SelectedValue='<%# Bind("AssetRef") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssetRef") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity:" SortExpression="Quantity">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList12" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjQuantities" 
                                        SelectedValue='<%# Bind("Quantity") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time Stamp:" 
                                SortExpression="InventorySaleTimeStamp">
                                <InsertItemTemplate>
                                    <asp:Label ID="Label10" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(Now()) %>'></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Bind("InventorySaleTimeStamp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks:" SortExpression="Remarks">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Rows="10" Text='<%# Bind("Remarks") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Sell Inventory" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp;&nbsp;&nbsp;</td>
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
                        Text=":: Review Previously-Sold Inventory"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <strong>Please select an Asset to show its history: </strong>
                    <asp:DropDownList ID="DropDownList9" runat="server" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlInventory" 
                        DataTextField="AssetDescription" DataValueField="AssetRef" 
                        AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Value="0">Please select an Asset</asp:ListItem>
                    </asp:DropDownList>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="InventorySaleId" 
                        DataSourceID="dsSqlInventorySales" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1500px" EnableModelValidation="True" 
                        
                        
                        
                        EmptyDataText="No Inventory Sales History to display for the selected item." 
                        ShowFooter="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="InventorySaleId" HeaderText="Id" 
                                InsertVisible="False" SortExpression="InventorySaleId" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Date of Sale" 
                                SortExpression="InventorySaleTimeStamp">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(COntainer.DataItem, "InventorySaleTimeStamp"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Inventory Item Picture" 
                                SortExpression="AssetRef">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                                        Height="80px" 
                                        ImageUrl='<%# "~\images\_assets\" & Databinder.Eval(Container.DataItem, "AssetPictureLocation").ToString %>' 
                                        Width="80px" />
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Inventory Item" 
                                SortExpression="AssetDescription" FooterText="TOTALS:">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Bind("AssetDescription") %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                <FooterTemplate>
                                    <asp:Label ID="Label15" runat="server" 
                                        Text='<%# FormatNumber(totalUnits, 2) & " Units" %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "Quantity"), Double), 2) & " " & CType(Databinder.Eval(Container.DataItem, "InventoryMeasureName"), String) %>'></asp:Label>
                                    <br />
                                    <br />
                                    @
                                    <br />
                                    <br />
                                    &#8358; <asp:Label ID="Label7" runat="server" 
                                        Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) & " Per Unit" %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value of Sale">
                                <FooterTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# "&#8358; " & FormatNumber(totalValue, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    &#8358; <asp:Label ID="Label14" runat="server" 
                                        Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "Quantity"), Double) * CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" Width="150px" Font-Bold="True" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Sold To" SortExpression="Buyer">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Buyer") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
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
                    <asp:SqlDataSource ID="dsSqlInventorySales" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        InsertCommand="STP_INVENTORY_INSERT_INVENTORY_InventorySale" 
                        InsertCommandType="StoredProcedure" 
                        SelectCommand="STP_INVENTORY_SELECTALL_INVENTORY_InventorySale_By_AssetRef" 
                        SelectCommandType="StoredProcedure" 
                        DeleteCommand="STP_INVENTORY_DELETE_INVENTORY_InventorySale" 
                        DeleteCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="InventorySaleId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="InventorySaleId" Type="Int32" />
                            <asp:Parameter Name="InventorySaleTimeStamp" Type="DateTime" />
                            <asp:Parameter Name="AssetRef" Type="String" />
                            <asp:Parameter Name="Quantity" Type="Int32" />
                            <asp:Parameter Name="Buyer" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList9" Name="AssetRef" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlInventory" runat="server" 
    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [AssetId], [AssetRef], [AssetCode], [AssetName], [AssetDescription], [AssetShortDesc] FROM [VW_INVENTORY_InventoryCurrentPosition] ORDER BY [AssetName]">
                    </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjQuantities" runat="server" 
                        SelectMethod="GetIntegerSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="minimum" Type="Int32" />
                            <asp:Parameter DefaultValue="100" Name="maximum" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:SqlDataSource ID="dsSqlCustomers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [CustomerId] as CustomerCode, '[' + CustomerRole + '] ' + [CustomerFullName] as CustomerName FROM dbo.[VW_INV_Customers] ORDER BY CustomerName"></asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlInventoryConditions" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [AssetConditionId], [AssetConditionTitle] + ' (' + [AssetConditionDescription] + ')' AS AssetCondition FROM [INVENTORY_AssetCondition] ORDER BY [AssetConditionId]">
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
