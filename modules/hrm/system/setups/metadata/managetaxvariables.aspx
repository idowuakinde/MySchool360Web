<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managetaxvariables.aspx.vb" Inherits="modules_system_setups_metadata_managetaxvariables" %>

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
                        Text=":: Update the Internal Tax Calculation Variables"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" 
                        AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateSelectButton="True"
                        CssClass="noBorderedMenuTable" DataKeyNames="TaxVariableId" 
                        DataSourceID="dsSqlGetData" Width="800px" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;">
                        <Columns>
                            <asp:BoundField DataField="TaxVariableId" HeaderText="Id"
                                SortExpression="TaxVariableId" InsertVisible="False" ReadOnly="True" />
                            <asp:TemplateField HeaderText="PENSION" SortExpression="Pension">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("Pension") %>'></asp:TextBox>%
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Pension") %>'></asp:Label>%
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="FOBTOB" SortExpression="FOBTOB">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("FOBTOB") %>'></asp:TextBox>%
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("FOBTOB") %>'></asp:Label>%
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="UNION DUES" SortExpression="UnionDues">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("UnionDues") %>'></asp:TextBox>%
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("UnionDues") %>'></asp:Label>%
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="PAYE" SortExpression="PAYE">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("PAYE") %>'></asp:TextBox>%
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("PAYE") %>'></asp:Label>%
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="OTHERS" SortExpression="Others">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("Others") %>'></asp:TextBox>%
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Others") %>'></asp:Label>%
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
                        SelectCommand="STP_HR_SELECTALL_HR_TaxVariables" 
                        DeleteCommand="STP_HR_DELETE_HR_TaxVariables" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_TaxVariables" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_HR_UPDATE_HR_TaxVariables" 
                        UpdateCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="TaxVariableId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TaxVariableId" Type="Int32" />
                            <asp:Parameter Name="Pension" Type="Decimal" />
                            <asp:Parameter Name="FOBTOB" Type="Decimal" />
                            <asp:Parameter Name="UnionDues" Type="Decimal" />
                            <asp:Parameter Name="PAYE" Type="Decimal" />
                            <asp:Parameter Name="Others" Type="Decimal" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="TaxVariableId" Type="Int32" />
                            <asp:Parameter Name="Pension" Type="Decimal" />
                            <asp:Parameter Name="FOBTOB" Type="Decimal" />
                            <asp:Parameter Name="UnionDues" Type="Decimal" />
                            <asp:Parameter Name="PAYE" Type="Decimal" />
                            <asp:Parameter Name="Others" Type="Decimal" />
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
