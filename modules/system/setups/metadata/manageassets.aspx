<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageassets.aspx.vb" Inherits="modules_system_setups_metadata_manageassets" %>

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
                        Text=":: Add a New Asset"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="AssetId"
                        DataSourceID="dsSqlAssets" DefaultMode="Insert" 
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
                            <asp:BoundField DataField="AssetId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="AssetId" />
                            <asp:TemplateField HeaderText="Asset Code:" SortExpression="AssetCode">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("AssetCode") %>' 
                                        Columns="40"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssetCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Picture:" 
                                SortExpression="AssetPictureLocation">
                                <InsertItemTemplate>
                                    <asp:FileUpload ID="FileUpload1" runat="server" Width="270px" />
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("AssetPictureLocation") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Name:" SortExpression="AssetName">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="50" 
                                        Text='<%# Bind("AssetName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("AssetName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Class:" SortExpression="AssetClassId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetClasses" 
                                        DataTextField="AssetClassTitle" DataValueField="AssetClassId" 
                                        SelectedValue='<%# Bind("AssetClassId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("AssetClassId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Manufacturer:" 
                                SortExpression="AssetManufacturerId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetManufacturers" 
                                        DataTextField="AssetManufacturerTitle" DataValueField="AssetManufacturerId" 
                                        SelectedValue='<%# Bind("AssetManufacturerId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("AssetManufacturerId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Condition:" 
                                SortExpression="AssetConditionId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetConditions" 
                                        DataTextField="AssetCondition" DataValueField="AssetConditionId" 
                                        SelectedValue='<%# Bind("AssetConditionId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("AssetConditionId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unit of Measure:" 
                                SortExpression="InventoryMeasureId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList4" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlUnitOfMeasure" 
                                        DataTextField="InventoryMeasureName" DataValueField="InventoryMeasureId" 
                                        SelectedValue='<%# Bind("InventoryMeasureId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("InventoryMeasureId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value per Unit:" SortExpression="ValuePerUnit">
                                <InsertItemTemplate>
                                    ₦
                                    <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("ValuePerUnit") %>' 
                                        Columns="10" CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("ValuePerUnit") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Low Qty Threshold:" 
                                SortExpression="LowQuantityThreshold">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" 
                                        Text='<%# Bind("LowQuantityThreshold") %>' Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                    &nbsp;<strong>Units of Measure</strong>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" 
                                        Text='<%# Bind("LowQuantityThreshold") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="High Qty Threshold:" 
                                SortExpression="HighQuantityThreshold">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" 
                                        Text='<%# Bind("HighQuantityThreshold") %>' Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                    &nbsp;<strong>Units of Measure</strong>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" 
                                        Text='<%# Bind("HighQuantityThreshold") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New Asset" 
                                ShowInsertButton="True" />
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
                        Text=":: Edit Existing Assets"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="AssetId" 
                        DataSourceID="dsSqlAssets" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="2000px" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="AssetId" HeaderText="Id" InsertVisible="False" 
                                ReadOnly="True" SortExpression="AssetId" />
                            <asp:TemplateField HeaderText="Asset Ref &amp; Picture" 
                                SortExpression="AssetRef">
                                <EditItemTemplate>
                                    <asp:Label ID="Label3b" runat="server" Text='<%# Bind("AssetRef") %>'></asp:Label>
                                    <br />
                                    <asp:Image ID="Image1" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                                        Height="80px" 
                                        ImageUrl='<%# "~\images\_assets\" & Databinder.Eval(Container.DataItem, "AssetPictureLocation").ToString %>' 
                                        Width="80px" />
                                    <br />
                                    <asp:Label ID="Label11" runat="server" 
                                        Text='<%# Bind("AssetPictureLocation") %>' Width="80px"></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("AssetRef") %>'></asp:Label>
                                    <br />
                                    <asp:Image ID="Image1" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                                        Height="80px" 
                                        ImageUrl='<%# "~\images\_assets\" & Databinder.Eval(Container.DataItem, "AssetPictureLocation").ToString %>' 
                                        Width="80px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Code" SortExpression="AssetCode">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="30" 
                                        Text='<%# Bind("AssetCode") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("AssetCode") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Name" SortExpression="AssetName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="40" 
                                        Text='<%# Bind("AssetName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("AssetName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Class" SortExpression="AssetClassTitle">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetClasses" 
                                        DataTextField="AssetClassTitle" DataValueField="AssetClassId" 
                                        SelectedValue='<%# Bind("AssetClassId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("AssetClassTitle") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Manufacturer" 
                                SortExpression="AssetManufacturerTitle">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetManufacturers" 
                                        DataTextField="AssetManufacturerTitle" DataValueField="AssetManufacturerId" 
                                        SelectedValue='<%# Bind("AssetManufacturerId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" 
                                        Text='<%# Bind("AssetManufacturerTitle") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Condition" SortExpression="AssetConditionTitle">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetConditions" 
                                        DataTextField="AssetCondition" DataValueField="AssetConditionId" 
                                        SelectedValue='<%# Bind("AssetConditionId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("AssetConditionTitle") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Unit of Measure" 
                                SortExpression="InventoryMeasureName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList8" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlUnitOfMeasure" 
                                        DataTextField="InventoryMeasureName" DataValueField="InventoryMeasureId" 
                                        SelectedValue='<%# Bind("InventoryMeasureId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" 
                                        Text='<%# Bind("InventoryMeasureName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value Per Unit" SortExpression="ValuePerUnit">
                                <EditItemTemplate>
                                    &#8358; <asp:TextBox ID="TextBox10" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("ValuePerUnit") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    &#8358; <asp:Label ID="Label10" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Low Qty Threshold" 
                                SortExpression="LowQuantityThreshold">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("LowQuantityThreshold") %>'></asp:TextBox>
                                    <strong>&nbsp;Units</strong>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" 
                                        Text='<%# Bind("LowQuantityThreshold") %>'></asp:Label>
                                    &nbsp;Units
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="High Qty Threshold" 
                                SortExpression="HighQuantityThreshold">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("HighQuantityThreshold") %>'></asp:TextBox>
                                    <strong>&nbsp;Units</strong>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" 
                                        Text='<%# Bind("HighQuantityThreshold") %>'></asp:Label>
                                    &nbsp;Units
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
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
                    <asp:SqlDataSource ID="dsSqlAssets" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_INVENTORY_DELETE_INVENTORY_Asset" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_INVENTORY_INSERT_INVENTORY_Asset" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_INVENTORY_SELECTALL_INVENTORY_Asset" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_INVENTORY_UPDATE_INVENTORY_Asset" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="AssetId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AssetId" Type="Int32" />
                            <asp:Parameter Name="AssetRef" Type="String" />
                            <asp:Parameter Name="AssetCode" Type="String" />
                            <asp:Parameter Name="AssetName" Type="String" />
                            <asp:Parameter Name="AssetClassId" Type="Int32" />
                            <asp:Parameter Name="AssetManufacturerId" Type="Int32" />
                            <asp:Parameter Name="AssetPictureLocation" Type="String" />
                            <asp:Parameter Name="AssetConditionId" Type="Int32" />
                            <asp:Parameter Name="InventoryMeasureId" Type="Int32" />
                            <asp:Parameter Name="ValuePerUnit" Type="Decimal" />
                            <asp:Parameter Name="LowQuantityThreshold" Type="Decimal" />
                            <asp:Parameter Name="HighQuantityThreshold" Type="Decimal" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="AssetId" 
                                Type="Int32" />
                            <asp:Parameter Name="AssetRef" Type="String" />
                            <asp:Parameter Name="AssetCode" Type="String" />
                            <asp:Parameter Name="AssetName" Type="String" />
                            <asp:Parameter Name="AssetClassId" Type="Int32" />
                            <asp:Parameter Name="AssetManufacturerId" Type="Int32" />
                            <asp:Parameter Name="AssetPictureLocation" Type="String" />
                            <asp:Parameter Name="AssetConditionId" Type="Int32" />
                            <asp:Parameter Name="InventoryMeasureId" Type="Int32" />
                            <asp:Parameter Name="ValuePerUnit" Type="Decimal" />
                            <asp:Parameter Name="LowQuantityThreshold" Type="Decimal" />
                            <asp:Parameter Name="HighQuantityThreshold" Type="Decimal" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssetClasses" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [AssetClassId], [AssetClassTitle] FROM [INVENTORY_AssetClass] ORDER BY [AssetClassTitle]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssetManufacturers" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [AssetManufacturerId], [AssetManufacturerTitle] FROM [INVENTORY_AssetManufacturer] ORDER BY [AssetManufacturerTitle]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssetConditions" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [AssetConditionId], [AssetConditionTitle] + ' (' + [AssetConditionDescription] + ')' AS AssetCondition FROM [INVENTORY_AssetCondition] ORDER BY [AssetConditionId]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlUnitOfMeasure" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [InventoryMeasureId], [InventoryMeasureName] FROM [INVENTORY_InventoryMeasure] ORDER BY [InventoryMeasureName]">
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
