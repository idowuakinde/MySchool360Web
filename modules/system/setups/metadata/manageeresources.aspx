<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageeresources.aspx.vb" Inherits="modules_system_setups_metadata_manageeresources" %>

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
                        Text=":: Add a New e-Resource"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlResources" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="ResourceId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="Resource Id:" SortExpression="ResourceId" 
                                InsertVisible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResourceId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Title:" SortExpression="ResourceTitle">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ResourceTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="30" 
                                        Text='<%# Bind("ResourceTitle") %>'></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource URL:" SortExpression="ResourceURL">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ResourceURL") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="50" 
                                        Text='<%# Bind("ResourceURL") %>'></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Category:" 
                                SortExpression="ResourceCategory">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ResourceCategory") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("ResourceCategory") %>'>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Teacher</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Description:" 
                                SortExpression="ResourceDescription">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ResourceDescription") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ResourceDescription") %>' 
                                        Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New e-Resource" 
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
                        Text=":: Edit Existing e-Resources"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="ResourceId" DataSourceID="dsSqlResources" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1200px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" >
                            <ItemStyle Width="80px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Id" SortExpression="ResourceId" 
                                InsertVisible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ResourceId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResourceId") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="5px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title" SortExpression="ResourceTitle">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="45" 
                                        Text='<%# Bind("ResourceTitle") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ResourceTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="URL" SortExpression="ResourceURL">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="45" 
                                        Text='<%# Bind("ResourceURL") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ResourceURL") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Category" SortExpression="ResourceCategory">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" 
                                        SelectedValue='<%# Bind("ResourceCategory") %>'>
                                        <asp:ListItem>Student</asp:ListItem>
                                        <asp:ListItem>Teacher</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ResourceCategory") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Description" 
                                SortExpression="ResourceDescription">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ResourceDescription") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" 
                                        Text='<%# Bind("ResourceDescription") %>' Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
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
                    <asp:SqlDataSource ID="dsSqlResources" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMP_eResource" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMP_eResource" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMP_eResource" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMP_eResource" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ResourceId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ResourceId" Type="Int32" />
                            <asp:Parameter Name="ResourceTitle" Type="String" />
                            <asp:Parameter Name="ResourceURL" Type="String" />
                            <asp:Parameter Name="ResourceCategory" Type="String" />
                            <asp:Parameter Name="ResourceDescription" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ResourceId" Type="Int32" />
                            <asp:Parameter Name="ResourceTitle" Type="String" />
                            <asp:Parameter Name="ResourceURL" Type="String" />
                            <asp:Parameter Name="ResourceCategory" Type="String" />
                            <asp:Parameter Name="ResourceDescription" Type="String" />
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
