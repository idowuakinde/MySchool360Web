﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="recordinventorytransfer.aspx.vb" Inherits="modules_inventory_recordinventorytransfer" Trace="false" %>

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
                <td>
					<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Record Batch Transfer Details"></asp:Label>
                </td>
            </tr>
            <tr>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="InventoryBatchId" DataSourceID="dsSqlBatches" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        SelectedIndex="0" EnableModelValidation="True" 
                        EmptyDataText="No record(s) found." >
            <Columns>
                <asp:TemplateField HeaderText="SN">
                    <ItemTemplate>
                        <asp:Label ID="lblSerial" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="BATCH" SortExpression="InventoryBatchFullName">
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" 
                            Text='<%# Bind("InventoryBatchFullName") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:CommandField SelectText='Show Batch' ShowSelectButton="True">
                <ItemStyle Width="100px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="BATCH TRANSFER DETAILS">
                    <ItemTemplate>
                        <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" 
                            CellPadding="4" CssClass="noBorderedMenuTable" 
                            DataKeyNames="InventoryBatchTransferId" DataSourceID="dsSqlGetDetail" 
                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No record(s) to display.&lt;br /&gt;&amp;nbsp;" 
                            ForeColor="#333333" GridLines="None" Visible="False" Width="100%" 
                            Font-Bold="False" EnableModelValidation="True" 
                            OnRowDataBound="gvDetail_RowDataBound" ShowFooter="True">
                            <Columns>
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:ImageButton ID="imgbtnDelete" runat="server" CommandName="Delete" 
                                            Height="16px" ImageUrl="~/images/delete.png" 
                                            OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                    </ItemTemplate>
                                    <ItemStyle Width="20px" />
                                </asp:TemplateField>
                                <asp:CommandField ShowEditButton="True" >
                                <ItemStyle Width="20px" />
                                </asp:CommandField>
                                <asp:TemplateField HeaderText="SN" 
                                    InsertVisible="False">
                                    <ItemTemplate>
                                        <asp:Label ID="Label20" runat="server" Text="<%# serialInner + 1 %>" 
                                            style="font-weight: 700"></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:Label ID="Label21" runat="server" style="font-weight: 700" 
                                            Text="<%# serialInner + 1 %>"></asp:Label>
                                    </EditItemTemplate>
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle Width="25px" HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Inventory Item" SortExpression="AssetName" 
                                    FooterText="TOTALS:">
                                    <ItemTemplate>
                                        <strong>Asset Name:
                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssetName") %>'></asp:Label>
                                        </strong>
                                        <br />
                                        <asp:Label ID="Label13" runat="server" Text='<%# Eval("AssetRef") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label18" runat="server" Text='<%# Bind("InventoryBatchTransferTimeStamp") %>'></asp:Label>
                                        &nbsp;-
                                        <asp:Label ID="Label16" runat="server" Text='<%# Eval("InventoryBatchId") %>'></asp:Label>
                                        &nbsp;-
                                        <asp:Label ID="Label4" runat="server" 
                                            Text='<%# Eval("InventoryBatchTransferId") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <strong>Asset Name:
                                        <asp:Label ID="Label7" runat="server" Text='<%# Eval("AssetName") %>'></asp:Label>
                                        </strong>
                                        <br />
                                        <asp:Label ID="Label8" runat="server" 
                                            Text='<%# Bind("AssetRef") %>'></asp:Label>
                                        <br />
                                        <asp:Label ID="Label19" runat="server" 
                                            Text='<%# Bind("InventoryBatchTransferTimeStamp") %>'></asp:Label>
                                        &nbsp;-
                                        <asp:Label ID="Label17" runat="server" Text='<%# Bind("InventoryBatchId") %>'></asp:Label>
                                        &nbsp;-
                                        <asp:Label ID="Label2" runat="server" 
                                            Text='<%# Bind("InventoryBatchTransferId") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity" SortExpression="Quantity">
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" 
                                            Text='<%# FormatNumber(Databinder.Eval(Container.DataItem, "Quantity"), 0) %>'></asp:Label>
                                        <asp:Label ID="Label12" runat="server" 
                                            Text='<%# Eval("InventoryMeasureName") %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList9" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjQuantities" 
                                            SelectedValue='<%# Bind("Quantity") %>'>
                                        </asp:DropDownList>
                                        &nbsp; <asp:Label ID="Label9" runat="server" Text='<%# Eval("InventoryMeasureName") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterTemplate>
                                        <asp:Label ID="Label14" runat="server" Text='<%# FormatNumber(totalQuantityInner, 0) & " items" %>'></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" Width="75px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit Value" SortExpression="ValuePerUnit">
                                    <ItemTemplate>
                                        ₦
                                        <asp:Label ID="Label3" runat="server" 
                                            Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label>
                                    </ItemTemplate>
                                    <EditItemTemplate>
                                        ₦
                                        <asp:Label ID="Label10" runat="server" 
                                            Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label>
                                    </EditItemTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" Width="75px" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Total Value">
                                    <ItemTemplate>
                                       <b>&#8358; <asp:Label ID="Label11" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "Quantity"), Double) * CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label></b>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        &#8358; <asp:Label ID="Label15" runat="server" Text="<%# FormatNumber(totalValueInner, 2) %>"></asp:Label>
                                    </FooterTemplate>
                                    <FooterStyle HorizontalAlign="Right" />
                                    <HeaderStyle HorizontalAlign="Right" />
                                    <ItemStyle HorizontalAlign="Right" Width="100px" />
                                </asp:TemplateField>
                            </Columns>
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Top" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Left" VerticalAlign="Top" />
                            <EditRowStyle CssClass="defaultFormElementStyle" />
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:GridView>
                   <br />
                        <asp:Label ID="lblAddNew" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Add a New Detail To This Batch" CssClass="defaultHeaderTextStyle" 
                            Visible="False"></asp:Label>
                        <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CellPadding="4" 
                            DataKeyNames="StaffSpouseId" DataSourceID="dsSqlGetDetail" DefaultMode="Insert" 
                            ForeColor="#333333" GridLines="None" Width="100%" Visible="False" 
                            OnItemInserted="DetailsViewItemInserted" EnableModelValidation="True" 
                            oniteminserting="DetailsView1_ItemInserting" >
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Middle" Wrap="True" />
                            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" VerticalAlign="Top" 
                                Width="220px" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="InventoryBatchTransferId" HeaderText="Id" 
                                    InsertVisible="False" ReadOnly="True" 
                                    SortExpression="InventoryBatchTransferId" />
                                <asp:TemplateField HeaderText="Batch:" SortExpression="InventoryBatchName">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList10" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlBatchSelected" 
                                            DataTextField="InventoryBatchFullName" DataValueField="InventoryBatchId" 
                                            SelectedValue='<%# Bind("InventoryBatchId") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Inventory Item:" 
                                    SortExpression="AssetRef">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList11" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssets" 
                                            DataTextField="AssetName" DataValueField="AssetRef" 
                                            SelectedValue='<%# Bind("AssetRef") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Quantity Transferred:" 
                                    SortExpression="Quantity">
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList12" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjQuantities" 
                                            SelectedValue='<%# Bind("Quantity") %>'>
                                        </asp:DropDownList>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Quantity") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:CommandField 
                                    ShowInsertButton="True" ButtonType="Button" 
                                    InsertText="   Add To Batch   " />
                            </Fields>
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
                   </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsSqlBatches" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand=" SELECT DISTINCT [InventoryBatchId], [InventoryBatchTimeStamp], [CurrentSession], [CurrentTerm], [InventoryBatchName], ISNULL(InventoryBatchConfirmStatus, '') AS InventoryBatchConfirmStatus, REPLACE(CurrentSession, '-', '') + '-' + REPLACE(CurrentTerm, '-', '') + '-' + InventoryBatchName AS InventoryBatchFullName FROM [INVENTORY_InventoryBatch] ORDER BY InventoryBatchTimeStamp ">
        </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlGetDetail" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand=" SELECT [InventoryBatchTransferId], [InventoryBatchTransferTimeStamp], a.[InventoryBatchId], a.[AssetRef], CAST([Quantity] AS INT) AS Quantity, a.[Remark1], a.[Remark2], a.[Remark3], ISNULL(b.InventoryBatchConfirmStatus, '') AS InventoryBatchConfirmStatus, b.InventoryBatchName, c.AssetCode, c.AssetName, c.AssetDescription, c.AssetShortDesc, c.InventoryMeasureName, c.InventoryMeasureAbbreviation, c.ValuePerUnit FROM [dbo].[INVENTORY_InventoryBatchTransfer] a INNER JOIN dbo.INVENTORY_InventoryBatch b ON a.InventoryBatchId = b.InventoryBatchId INNER JOIN dbo.VW_INVENTORY_AssetLog c ON a.AssetRef = c.AssetRef WHERE (a.[InventoryBatchId] = @InventoryBatchId) ORDER BY InventoryBatchTransferTimeStamp " 
                        DeleteCommand="STP_INVENTORY_DELETE_INVENTORY_InventoryBatchTransfer" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_INVENTORY_INSERT_INVENTORY_InventoryBatchTransfer" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_INVENTORY_UPDATE_INVENTORY_InventoryBatchTransfer" 
                        UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaster" Name="InventoryBatchId" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="InventoryBatchTransferId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="InventoryBatchTransferId" Type="Int32" />
                            <asp:Parameter Name="InventoryBatchTransferTimeStamp" Type="DateTime" />
                            <asp:Parameter Name="InventoryBatchId" Type="Int32" />
                            <asp:Parameter Name="AssetRef" Type="String" />
                            <asp:Parameter Name="Quantity" Type="Decimal" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="InventoryBatchTransferId" 
                                Type="Int32" />
                            <asp:Parameter Name="InventoryBatchTransferTimeStamp" Type="DateTime" />
                            <asp:Parameter Name="InventoryBatchId" Type="Int32" />
                            <asp:Parameter Name="AssetRef" Type="String" />
                            <asp:Parameter Name="Quantity" Type="Decimal" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjQuantities" runat="server" 
                        SelectMethod="GetIntegerSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="minimum" Type="Int32" />
                            <asp:Parameter DefaultValue="1000" Name="maximum" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:SqlDataSource ID="dsSqlBatchSelected" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand=" SELECT DISTINCT [InventoryBatchId], [InventoryBatchTimeStamp], REPLACE(CurrentSession, '-', '') + '-' + REPLACE(CurrentTerm, '-', '') + '-' + InventoryBatchName AS InventoryBatchFullName FROM [INVENTORY_InventoryBatch] WHERE InventoryBatchId = @InventoryBatchId ORDER BY InventoryBatchTimeStamp ">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaster" Name="InventoryBatchId" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssets" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [AssetId], [AssetRef], [AssetName] FROM [VW_INVENTORY_InventoryCurrentPosition] ORDER BY [AssetName]">
                    </asp:SqlDataSource>
                </td>
            </tr>
            <tr>
                <td>&nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
