<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageassetmanufacturers.aspx.vb" Inherits="modules_system_setups_metadata_manageassetmanufacturers" %>

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
                        Text=":: Add a New Asset Manufacturer"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="AssetManufacturerId"
                        DataSourceID="dsSqlAssetManufacturers" DefaultMode="Insert" 
                        Height="50px" Width="600px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="Id:" SortExpression="AssetManufacturerId" 
                                InsertVisible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssetManufacturerId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssetManufacturerId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Manufacturer:" 
                                SortExpression="AssetManufacturerTitle">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        Text='<%# Bind("AssetManufacturerTitle") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("AssetManufacturerTitle") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description:" 
                                SortExpression="AssetManufacturerDescription">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Rows="5" 
                                        Text='<%# Bind("AssetManufacturerDescription") %>' TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# Bind("AssetManufacturerDescription") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Asset Manufacturer" />
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
                        Text=":: Edit Existing Asset Manufacturers"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="AssetManufacturerId" 
                        DataSourceID="dsSqlAssetManufacturers" CellPadding="4" 
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
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="AssetManufacturerId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssetManufacturerId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("AssetManufacturerId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Manufacturer" 
                                SortExpression="AssetManufacturerTitle">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="30" 
                                        Text='<%# Bind("AssetManufacturerTitle") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" 
                                        Text='<%# Bind("AssetManufacturerTitle") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" 
                                SortExpression="AssetManufacturerDescription">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="5" 
                                        Text='<%# Bind("AssetManufacturerDescription") %>' TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("AssetManufacturerDescription") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlAssetManufacturers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_INVENTORY_DELETE_INVENTORY_AssetManufacturer" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_INVENTORY_INSERT_INVENTORY_AssetManufacturer" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_INVENTORY_SELECTALL_INVENTORY_AssetManufacturer" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_INVENTORY_UPDATE_INVENTORY_AssetManufacturer" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="AssetManufacturerId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AssetManufacturerId" Type="Int32" />
                            <asp:Parameter Name="AssetManufacturerTitle" Type="String" />
                            <asp:Parameter Name="AssetManufacturerDescription" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="AssetManufacturerId" 
                                Type="Int32" />
                            <asp:Parameter Name="AssetManufacturerTitle" Type="String" />
                            <asp:Parameter Name="AssetManufacturerDescription" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
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
