<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageassetconditions.aspx.vb" Inherits="modules_system_setups_metadata_manageassetconditions" %>

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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Existing Asset Conditions"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="AssetConditionId" 
                        DataSourceID="dsSqlAssetCondition" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1000px" EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="AssetConditionId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("AssetConditionId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AssetConditionId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Asset Condition" 
                                SortExpression="AssetConditionTitle">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="30" 
                                        Text='<%# Bind("AssetConditionTitle") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("AssetConditionTitle") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" 
                                SortExpression="AssetConditionDescription">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="5" 
                                        Text='<%# Bind("AssetConditionDescription") %>' TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# Bind("AssetConditionDescription") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlAssetCondition" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="STP_INVENTORY_SELECTALL_INVENTORY_AssetCondition" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_INVENTORY_UPDATE_INVENTORY_AssetCondition" 
                        UpdateCommandType="StoredProcedure">
                        <UpdateParameters>
                            <asp:Parameter Name="AssetConditionId" Type="Int32" />
                            <asp:Parameter Name="AssetConditionTitle" Type="String" />
                            <asp:Parameter Name="AssetConditionDescription" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
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
