<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managesessions.aspx.vb" Inherits="modules_system_setups_metadata_managesessions" %>

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
                        Text=":: Add a New Session"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlSessions" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="SessionId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="SessionId" HeaderText="SessionId:" InsertVisible="False"
                                ReadOnly="True" SortExpression="SessionId" />
                            <asp:TemplateField HeaderText="Session Name:" SortExpression="SessionName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SessionName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SessionName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddSession" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("SessionName") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddSession" runat="server" 
                                        ControlToValidate="txtAddSession" ErrorMessage="*Required" Font-Bold="True" 
                                        ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Session Alias:" SortExpression="SessionAlias">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SessionAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SessionAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddSessionAlias" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("SessionAlias") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddSessionAlias" runat="server" 
                                        ControlToValidate="txtAddSessionAlias" ErrorMessage="*Required" 
                                        Font-Bold="True" ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New Session" 
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
                        Text=":: Edit Existing Sessions"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="SessionId" DataSourceID="dsSqlSessions" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="SessionId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="SessionId" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Session Name" SortExpression="SessionName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("SessionName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SessionName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Session Alias" SortExpression="SessionAlias">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("SessionAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SessionAlias") %>'></asp:Label>
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
                    <asp:SqlDataSource ID="dsSqlSessions" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPSession" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPSession" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPSession" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPSession" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="SessionId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="SessionId" Type="Int32" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="SessionAlias" Type="String" />
                            <%--<asp:Parameter Name="CurrentSession" Type="String" />--%>
                            <%--<asp:Parameter Name="Remarks" Type="String" />--%>
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="SessionId" Type="Int32" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="SessionAlias" Type="String" />
                            <%--<asp:Parameter Name="CurrentSession" Type="String" />--%>
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
