<%@ Page Language="VB" AutoEventWireup="false" CodeFile="edit_inventory.aspx.vb" Inherits="modules_inventory_edit_inventory" %>

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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Inventory"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="AssetRef" 
                        DataSourceID="dsSqlEditInventory" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1600px" EnableModelValidation="True" 
                        EmptyDataText="No records to show." ShowFooter="True">
                        <Columns>
                            <asp:TemplateField HeaderText="SN">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>

                                    <table width="100%" border="0" cellspacing="1" cellpadding="1" 
                                        class="borderedTable">
                                        <tr>
                                          <td width="100" align="left" valign="top" bgcolor="#CCFF99"><strong>Increase</strong>:</td>
                                            <td width="200" align="left" valign="top" bgcolor="#CCFF99">
                                              <asp:DropDownList ID="ddlInventoryIncrease" runat="server" 
                                                    CssClass="defaultFormElementStyle" DataSourceID="dsObjQuantities">
                                              </asp:DropDownList>
                                                <asp:Label ID="Label6" runat="server" 
                                                    Text='<%# Eval("InventoryMeasureName") %>'></asp:Label>
                                              </td>
                                            <td width="100" align="left" valign="top" bgcolor="#FF9966"><strong>Decrease</strong>:<br></td>
                                            <td align="left" valign="top" width="200" bgcolor="#FF9966"><asp:DropDownList ID="ddlInventoryDecrease" runat="server" 
                                                CssClass="defaultFormElementStyle" datasourceid="dsObjQuantities"> </asp:DropDownList>
                                                <asp:Label ID="Label7" runat="server" 
                                                    Text='<%# Eval("InventoryMeasureName") %>'></asp:Label>
                                              <br>
                                              </td>
                                            <td width="100" align="left" valign="top" bgcolor="#FFFF99"><strong>From</strong>:<br>
                                              </td>
                                            <td align="left" valign="top" bgcolor="#FFFF99"><asp:Label ID="Label2" runat="server" 
                                                Text='<%# "<b>" & DataBinder.Eval(Container.DataItem, "InventoryLocationCode").ToString & "</b>" %>' ToolTip='<%# GetInventoryLocationName(DataBinder.Eval(Container.DataItem, "InventoryLocationCode").ToString) %>'></asp:Label>
                                                &nbsp;<strong>To</strong>
                                                <asp:DropDownList ID="ddlInventoryMove" runat="server" 
                                                    CssClass="defaultFormElementStyle" datasourceid="dsSqlInventoryLocations" 
                                                    DataTextField="InventoryLocationCode" DataValueField="InventoryLocationCode" 
                                                    ondatabound="ddlInventoryMove_DataBound">
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                          <td align="left" valign="top" bgcolor="#CCFF99">Notes:<asp:HiddenField 
                                                  ID="hidLocationCode" runat="server" 
                                                  Value='<%# Eval("InventoryLocationCode") %>' />
                                            </td>
                                          <td align="left" valign="top" bgcolor="#CCFF99"><asp:TextBox ID="txtInventoryIncrease" runat="server" Columns="25" 
                                                    CssClass="defaultFormElementStyle" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                                          <td align="left" valign="top" bgcolor="#FF9966">Notes:</td>
                                          <td align="left" valign="top" bgcolor="#FF9966"><asp:TextBox ID="txtInventoryDecrease" runat="server" Columns="25" 
                                                CssClass="defaultFormElementStyle" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                                          <td align="left" valign="top" bgcolor="#FFFF99">Notes:</td>
                                          <td align="left" valign="top" bgcolor="#FFFF99"><asp:TextBox ID="txtInventoryMove" runat="server" Columns="25" 
                                                CssClass="defaultFormElementStyle" Rows="4" TextMode="MultiLine"></asp:TextBox></td>
                                        </tr>
                                        <tr>
                                          <td align="left" valign="top" bgcolor="#CCFF99">
                                              <asp:HiddenField ID="hidAssetRef" runat="server" 
                                                  Value='<%# Eval("AssetRef") %>' />
                                            </td>
                                          <td align="left" valign="top" bgcolor="#CCFF99"><asp:Button ID="btnInventoryIncrease" runat="server" 
                                                    CssClass="defaultButtonStyle" Text="Increase Inventory" 
                                                    OnClick="btnInventoryIncrease_Click" /></td>
                                          <td align="left" valign="top" bgcolor="#FF9966">
                                              <asp:HiddenField ID="hidQty" runat="server" 
                                                  Value='<%# Eval("NewQuantity") %>' />
                                            </td>
                                          <td align="left" valign="top" bgcolor="#FF9966"><asp:Button ID="btnInventoryDecrease" runat="server" 
                                                CssClass="defaultButtonStyle" Text="Decrease Inventory" 
                                                OnClick="btnInventoryDecrease_Click" /></td>
                                          <td align="left" valign="top" bgcolor="#FFFF99">
                                              <asp:HiddenField ID="hidAssetCode" runat="server" 
                                                  Value='<%# Eval("AssetCode") %>' />
                                            </td>
                                          <td align="left" valign="top" bgcolor="#FFFF99"><asp:Button ID="btnInventoryMove" 
                                                  runat="server" CssClass="defaultButtonStyle" 
                                                Text="Relocate Inventory" OnClick="btnInventoryMove_Click" /></td>
                                        </tr>
                                    </table>

                                </ItemTemplate>
                                <ItemStyle Width="700px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="AssetRef" HeaderText="AssetRef" 
                                SortExpression="AssetRef" Visible="False" />
                            <asp:TemplateField HeaderText="Asset Picture" 
                                SortExpression="AssetPictureLocation">
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                                        Height="80px" 
                                        ImageUrl='<%# "~\images\_assets\" & Databinder.Eval(Container.DataItem, "AssetPictureLocation").ToString %>' 
                                        Width="80px" />
                                </ItemTemplate>
                                <ItemStyle Width="90px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset" SortExpression="AssetCode">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# "<b>Asset Code</b>: <br />" & Databinder.Eval(Container.DataItem, "AssetCode").ToString %>'></asp:Label>
                                    <hr width="100%" shading="noshading" color="black" />
                                    <asp:Label ID="Label8b" runat="server" 
                                        Text='<%# "<b>Asset Name</b>: <br />" & Databinder.Eval(Container.DataItem, "AssetName").ToString %>'></asp:Label>
                                    <hr width="100%" shading="noshading" color="black" />
                                    <asp:Label ID="Label9b" runat="server" 
                                        Text='<%# "<b>Asset Class</b>: <br />" & Databinder.Eval(Container.DataItem, "AssetClassTitle").ToString %>'></asp:Label>
                                    <hr width="100%" shading="noshading" color="black" />
                                    <asp:Label ID="Label10b" runat="server" 
                                        Text='<%# "<b>Asset Condition</b>: <br />" & Databinder.Eval(Container.DataItem, "AssetConditionTitle").ToString %>'></asp:Label>
                                    <hr width="100%" shading="noshading" color="black" />
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location" SortExpression="InventoryLocationCode" 
                                FooterText="TOTALS:">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# "<b>Location Code</b>: <br />" & Databinder.Eval(Container.DataItem, "InventoryLocationCode").ToString %>'></asp:Label>
                                    <hr width="100%" shading="noshading" color="black" />
                                    <asp:Label ID="Label5" runat="server" 
                                        Text='<%# "<b>Location Name</b>: <br />" & GetInventoryLocationName(Databinder.Eval(Container.DataItem, "InventoryLocationCode").ToString) %>'></asp:Label>
                                    <hr width="100%" shading="noshading" color="black" />
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Quantity" SortExpression="NewQuantity">
                                <FooterTemplate>
                                    <asp:Label ID="Label15" runat="server" Text='<%# FormatNumber(totalInventoryQuantity, 2) & " Items" %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "NewQuantity"), Double), 2) & " " & Databinder.Eval(Container.DataItem, "InventoryMeasureName").ToString %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Value Per Unit" SortExpression="ValuePerUnit">
                                <ItemTemplate>
                                    &#8358; <asp:Label ID="Label11" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Gross Value">
                                <FooterTemplate>
                                    <asp:Label ID="Label16" runat="server" Text='<%# "&#8358; " & FormatNumber(totalInventoryValue, 2) %>'></asp:Label>
                                </FooterTemplate>
                                <ItemTemplate>
                                    &#8358; <asp:Label ID="Label14" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "NewQuantity"), Double) * CType(Databinder.Eval(Container.DataItem, "ValuePerUnit"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <FooterStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="100px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Low" 
                                SortExpression="LowQuantityThreshold">
                                <ItemTemplate>
                                    <asp:Label ID="Label12" runat="server" 
                                        Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "LowQuantityThreshold"), Double), 2) & " " & Databinder.Eval(Container.DataItem, "InventoryMeasureName").ToString %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="50px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="High" 
                                SortExpression="HighQuantityThreshold">
                                <ItemTemplate>
                                    <asp:Label ID="Label13" runat="server" 
                                        Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "HighQuantityThreshold"), Double), 2) & " " & Databinder.Eval(Container.DataItem, "InventoryMeasureName").ToString %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="50px" HorizontalAlign="Right" />
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
                    <asp:SqlDataSource ID="dsSqlEditInventory" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT * FROM [VW_INVENTORY_InventoryCurrentPosition] ORDER BY [AssetCode]">
                    </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjQuantities" runat="server" 
                        SelectMethod="GetIntegerSeries" TypeName="Common">
                        <SelectParameters>
                            <asp:Parameter DefaultValue="1" Name="minimum" Type="Int32" />
                            <asp:Parameter DefaultValue="100" Name="maximum" Type="Int32" />
                            <asp:Parameter DefaultValue="1" Name="interval" Type="Int32" />
                        </SelectParameters>
                    </asp:ObjectDataSource>
                    <asp:SqlDataSource ID="dsSqlInventoryLocations" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [InventoryLocationId], [InventoryLocationCode], [InventoryLocationName] FROM [INVENTORY_InventoryLocation] ORDER BY [InventoryLocationName]">
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
