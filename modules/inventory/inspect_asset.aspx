<%@ Page Language="VB" AutoEventWireup="false" CodeFile="inspect_asset.aspx.vb" Inherits="modules_inventory_inspect_asset" %>

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
                        Text=":: Inspect an Asset"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="AssetTransactionId"
                        DataSourceID="dsSqlAssetInspection" DefaultMode="Insert" 
                        Height="50px" Width="900px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="300px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="AssetInspectionId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True" SortExpression="AssetInspectionId" />
                            <asp:TemplateField HeaderText="Asset:" SortExpression="AssetRef">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList10" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssets" 
                                        DataTextField="AssetDescription" DataValueField="AssetRef" 
                                        SelectedValue='<%# Bind("AssetRef") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssetRef") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Current Asset Condition:" 
                                SortExpression="CurrentAssetConditionId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList11" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssetConditions" 
                                        DataTextField="AssetCondition" DataValueField="AssetConditionId" 
                                        SelectedValue='<%# Bind("CurrentAssetConditionId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("CurrentAssetConditionId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Time Stamp:" 
                                SortExpression="AssetInspectionTimeStamp">
                                <InsertItemTemplate>
                                    <asp:Label ID="Label10" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(Now()) %>'></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Bind("AssetInspectionTimeStamp") %>'></asp:Label>
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
                                InsertText="Save Inspection" />
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
                        Text=":: Review Previous Asset Inspections"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <strong>Please select an Asset to show its history: </strong>
                    <asp:DropDownList ID="DropDownList9" runat="server" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAssets" 
                        DataTextField="AssetDescription" DataValueField="AssetRef" 
                        AppendDataBoundItems="True" AutoPostBack="True">
                        <asp:ListItem Value="0">Please select an Asset</asp:ListItem>
                    </asp:DropDownList>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="AssetInspectionId" 
                        DataSourceID="dsSqlAssetInspection" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1500px" EnableModelValidation="True" 
                        EmptyDataText="No Asset Inspection History to display.">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="AssetInspectionId" HeaderText="Id" 
                                InsertVisible="False" SortExpression="AssetInspectionId" />
                            <asp:TemplateField HeaderText="Date of Inspection" 
                                SortExpression="AssetInspectionTimeStamp">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(COntainer.DataItem, "AssetInspectionTimeStamp"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Ref &amp; Picture" 
                                SortExpression="AssetRef">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("AssetRef") %>'></asp:Label>
                                    <br />
                                    <asp:Image ID="Image1" runat="server" BorderStyle="Ridge" BorderWidth="2px" 
                                        Height="80px" 
                                        ImageUrl='<%# "~\images\_assets\" & Databinder.Eval(Container.DataItem, "AssetPictureLocation").ToString %>' 
                                        Width="80px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset" SortExpression="AssetDescription">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Bind("AssetDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Current Asset Condition" 
                                SortExpression="CurrentAssetConditionId">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("AssetConditionFullDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" SortExpression="Remarks">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlAssetInspection" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        InsertCommand="STP_INVENTORY_INSERT_INVENTORY_AssetInspection" 
                        InsertCommandType="StoredProcedure" 
                        SelectCommand="STP_INVENTORY_SELECTALL_INVENTORY_AssetInspection_By_AssetRef" 
                        SelectCommandType="StoredProcedure" 
                        DeleteCommand="STP_INVENTORY_DELETE_INVENTORY_AssetInspection" 
                        DeleteCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="AssetInspectionId" Type="Int32" />
                        </DeleteParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="AssetInspectionId" Type="Int32" />
                            <asp:Parameter Name="AssetRef" Type="String" />
                            <asp:Parameter Name="AssetInspectionTimeStamp" Type="DateTime" />
                            <asp:Parameter Name="CurrentAssetConditionId" Type="Int32" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="DropDownList9" Name="AssetRef" 
                                PropertyName="SelectedValue" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssets" runat="server" 
    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
    
                        SelectCommand="SELECT [AssetId], [AssetRef], [AssetCode], [AssetName], [AssetDescription], [AssetShortDesc] FROM [VW_INVENTORY_AssetLog] ORDER BY [AssetName]">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlAssetConditions" runat="server" 
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
