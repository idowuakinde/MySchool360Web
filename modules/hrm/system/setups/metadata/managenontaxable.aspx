<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managenontaxable.aspx.vb" Inherits="modules_system_setups_metadata_managenontaxable" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Update the Non-Taxable Payroll Items"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" 
                        AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateSelectButton="True"
                        CssClass="noBorderedMenuTable" DataKeyNames="NonTaxableId" 
                        DataSourceID="dsSqlGetData" Width="800px" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        
                        
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;">
                        <Columns>
                            <asp:BoundField DataField="NonTaxableId" HeaderText="Id"
                                SortExpression="NonTaxableId" InsertVisible="False" ReadOnly="True" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="NON-TAXABLE TRANSPORT (ANNUAL)" 
                                SortExpression="NonTaxableTransport">
                                <EditItemTemplate>
                                    N
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("NonTaxableTransport") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    N
                                    <asp:Label ID="Label2" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "NonTaxableTransport"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="NON-TAXABLE HOUSING (ANNUAL)" 
                                SortExpression="NonTaxableHousing">
                                <EditItemTemplate>
                                    N
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" 
                                        Text='<%# Bind("NonTaxableHousing") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    N
                                    <asp:Label ID="Label1" runat="server" Text='<%# FormatNumber(CType(Databinder.Eval(Container.DataItem, "NonTaxableHousing"), Double), 2) %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                Visible="False" />
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="STP_HR_SELECTALL_HR_PAYROLL_NonTaxableItems" 
                        DeleteCommand="STP_HR_DELETE_HR_PAYROLL_NonTaxableItems" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_PAYROLL_NonTaxableItems" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_HR_UPDATE_HR_PAYROLL_NonTaxableItems" 
                        UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="NonTaxableId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="NonTaxableId" Type="Int32" />
                            <asp:Parameter Name="NonTaxableTransport" Type="Decimal" />
                            <asp:Parameter Name="NonTaxableHousing" Type="Decimal" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="NonTaxableId" Type="Int32" />
                            <asp:Parameter Name="NonTaxableTransport" Type="Decimal" />
                            <asp:Parameter Name="NonTaxableHousing" Type="Decimal" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                </td>
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
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
