<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageterms.aspx.vb" Inherits="modules_system_setups_metadata_manageterms" %>

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
                        Text=":: Add a New Term"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlTerms" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="TermId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="TermId" HeaderText="TermId:" InsertVisible="False"
                                ReadOnly="True" SortExpression="TermId" />
                            <asp:TemplateField HeaderText="Term Name:" SortExpression="TermName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("TermName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TermName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddTerm" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("TermName") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddTerm" runat="server" 
                                        ControlToValidate="txtAddTerm" ErrorMessage="*Required" Font-Bold="True" 
                                        ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Term Alias:" SortExpression="TermAlias">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TermAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("TermAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddTermAlias" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("TermAlias") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddTermAlias" runat="server" 
                                        ControlToValidate="txtAddTermAlias" ErrorMessage="*Required" 
                                        Font-Bold="True" ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New Term" 
                                ShowInsertButton="True" />
                        </Fields>
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;</td>
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
                        Text=":: Edit Existing Terms"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="TermId" DataSourceID="dsSqlTerms" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="TermId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="TermId" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Term Name" SortExpression="TermName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("TermName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("TermName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Term Alias" SortExpression="TermAlias">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("TermAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("TermAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                            HorizontalAlign="Left" VerticalAlign="Middle" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlTerms" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPTerm" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPTerm" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPTerm" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPTerm" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="TermId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="TermId" Type="Int32" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="TermAlias" Type="String" />
                            <%--<asp:Parameter Name="CurrentTerm" Type="String" />--%>
                            <%--<asp:Parameter Name="Remarks" Type="String" />--%>
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="TermId" Type="Int32" />
                            <asp:Parameter Name="TermName" Type="String" />
                            <asp:Parameter Name="TermAlias" Type="String" />
                            <%--<asp:Parameter Name="CurrentTerm" Type="String" />--%>
                            <%--<asp:Parameter Name="Remarks" Type="String" />--%>
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
