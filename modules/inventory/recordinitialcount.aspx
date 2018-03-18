<%@ Page Language="VB" AutoEventWireup="false" CodeFile="recordinitialcount.aspx.vb" Inherits="modules_inventory_recordinitialcount" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Record Initial Inventory Count"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                <asp:Label ID="lblStatus" runat="server" EnableViewState="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="InventoryCountId"
                        DataSourceID="dsSqlInitialInventoryCount" DefaultMode="Insert" 
                        Height="50px" Width="1000px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="InventoryCountId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="InventoryCountId" />
                            <asp:TemplateField HeaderText="Asset:" SortExpression="AssetRef">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("AssetRef") %>' 
                                        DataSourceID="dsSqlAssets" DataTextField="AssetDescription" 
                                        DataValueField="AssetRef" AutoPostBack="true">
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssetRef") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location:" 
                                SortExpression="InventoryLocationId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlLocations" 
                                        DataTextField="InventoryLocationDescription" 
                                        DataValueField="InventoryLocationId" 
                                        SelectedValue='<%# Bind("InventoryLocationId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("InventoryLocationId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity:" 
                                SortExpression="InventoryCountQuantity">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" 
                                        Text='<%# Bind("InventoryCountQuantity") %>' Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                    <asp:Label ID="lblUnits" runat="server" 
                                        Text=''></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# Bind("InventoryCountQuantity") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time Stamp:" 
                                SortExpression="InventoryCountTimeStamp">
                                <InsertItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Common.GetFriendlyDate(Now()) %>'></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Bind("InventoryCountTimeStamp") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes:" SortExpression="InventoryCountNotes">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" 
                                        Text='<%# Bind("InventoryCountNotes") %>' Columns="80" 
                                        CssClass="defaultFormElementStyle" Rows="10" TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("InventoryCountNotes") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Save Inventory Count" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp;<asp:SqlDataSource ID="dsSqlInitialInventoryCount" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        InsertCommand="STP_INVENTORY_INSERT_INVENTORY_InventoryCount" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_INVENTORY_SELECTALL_INVENTORY_InventoryCount" 
                        SelectCommandType="StoredProcedure">
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="InventoryCountId" 
                                Type="Int32" />
                            <asp:Parameter Name="AssetRef" Type="String" />
<asp:Parameter Name="InventoryLocationId" Type="Int32"></asp:Parameter>
                            <asp:Parameter Name="InventoryCountQuantity" Type="Decimal" />
                            <asp:Parameter Name="InventoryCountNotes" Type="String" />
                            <asp:Parameter Name="InventoryCountTimeStamp" Type="DateTime" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssets" runat="server" 
    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
    
                        SelectCommand="SELECT [AssetId], [AssetRef], [AssetCode], [AssetName], [AssetDescription], [AssetShortDesc] FROM [VW_INVENTORY_AssetLog] ORDER BY [AssetName]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlLocations" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        
                                        
                        SelectCommand="SELECT [InventoryLocationId], [InventoryLocationCode], [InventoryLocationName], InventoryLocationCode + ' (' + InventoryLocationName + ')' AS InventoryLocationDescription FROM [INVENTORY_InventoryLocation] ORDER BY [InventoryLocationName]">
                    </asp:SqlDataSource>
                &nbsp;&nbsp;&nbsp;</td>
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
