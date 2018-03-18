<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageinventorytransactiontype.aspx.vb" Inherits="modules_system_setups_metadata_manageinventorytransactiontype" %>

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
                        Text=":: Add a New Inventory Transaction Type"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ItemTransactionTypeId"
                        DataSourceID="dsSqlTransactionTypes" DefaultMode="Insert" Height="50px" Width="600px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="ItemTransactionTypeId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ItemTransactionTypeId" />
                            <asp:BoundField DataField="ItemTransactionTypeName" HeaderText="Transaction Type:" 
                                SortExpression="ItemTransactionTypeName" />
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Transaction Type" />
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
                        Text=":: Edit Existing Inventory Transaction Types"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ItemTransactionTypeId" 
                        DataSourceID="dsSqlTransactionTypes" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        Width="100%" EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:CommandField ShowSelectButton="True" />
                            <asp:BoundField DataField="ItemTransactionTypeId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ItemTransactionTypeId" />
                            <asp:BoundField DataField="ItemTransactionTypeName" HeaderText="Transaction Type" 
                                SortExpression="ItemTransactionTypeName" />
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
                    <asp:SqlDataSource ID="dsSqlTransactionTypes" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_INVENTORY_DELETE_INV_ItemTransactionType" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_INVENTORY_INSERT_INV_ItemTransactionType" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_INVENTORY_SELECTALL_INV_ItemTransactionType" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_INVENTORY_UPDATE_INV_ItemTransactionType" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ItemTransactionTypeId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ItemTransactionTypeId" Type="Int32" />
                            <asp:Parameter Name="ItemTransactionTypeName" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ItemTransactionTypeId" 
                                Type="Int32" />
                            <asp:Parameter Name="ItemTransactionTypeName" Type="String" />
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
