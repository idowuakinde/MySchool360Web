<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managecomments.aspx.vb" Inherits="modules_system_setups_metadata_managecomments" %>

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
                        Text=":: Add a New Standard Comment"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlClasses" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="ClassId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="CommentId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="CommentId" />
                            <asp:TemplateField HeaderText="Text:" SortExpression="CommentText">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="70" 
                                        CssClass="defaultFormElementStyle" Rows="7" Text='<%# Bind("CommentText") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("CommentText") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CommentText") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Activated?:" SortExpression="Activated">
                                <InsertItemTemplate>
                                    <asp:CheckBox ID="chkAddActivated" runat="server" 
                                        Checked='<%# Bind("Activated") %>' />
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Activated") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Activated") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New Standard Comment" 
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
                        Text=":: Edit Existing Standard Comments"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="CommentId" DataSourceID="dsSqlClasses" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="CommentId">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("CommentId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CommentId") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Text" SortExpression="CommentText">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="70" 
                                        CssClass="defaultFormElementStyle" Rows="7" Text='<%# Bind("CommentText") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("CommentText") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Activated?" SortExpression="Activated">
                                <EditItemTemplate>
                                    <asp:CheckBox ID="chkEditActivated" runat="server" 
                                        Checked='<%# Bind("Activated") %>' />
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Activated") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
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
                    <asp:SqlDataSource ID="dsSqlClasses" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPComments" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPComments" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPComments" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPComments" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="CommentId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="CommentId" Type="Int32" />
                            <asp:Parameter Name="CommentText" Type="String" />
                            <asp:Parameter Name="Activated" Type="Boolean" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="CommentId" Type="Int32" />
                            <asp:Parameter Name="CommentText" Type="String" />
                            <asp:Parameter Name="Activated" Type="Boolean" />
                            <asp:Parameter Name="Remark1" Type="String" />
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
