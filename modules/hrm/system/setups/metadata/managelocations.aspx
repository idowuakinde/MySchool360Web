<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managelocations.aspx.vb" Inherits="modules_system_setups_metadata_managelocations" %>

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
                        Text=":: Manage Existing Locations"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="LocationId" 
                        DataSourceID="dsSqlGetData" Width="800px" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;">
                        <Columns>
                            <asp:CommandField ShowEditButton="True" ShowSelectButton="True" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" OnClientClick="return confirm('Are you sure want to delete this record?');" CommandName="Delete">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="LocationId" HeaderText="Id"
                                SortExpression="LocationId" InsertVisible="False" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Location" SortExpression="LocationName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        Text='<%# Bind("LocationName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("LocationName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State" SortExpression="StateId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStates2" 
                                        DataTextField="StateName" DataValueField="StateId" 
                                        SelectedValue='<%# Bind("StateId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlStates2" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [StateId], [StateName] + ' (' + [CountryName] + ') ' AS StateName FROM [Core_State] a INNER JOIN [Core_Country] b ON a.CountryId = b.CountryId ORDER BY [StateName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("StateName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" 
                                SortExpression="Remark" />
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
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
                        SelectCommand="SELECT [LocationId], [LocationName], a.[StateId], b.StateName, a.[Remark] FROM [dbo].[HR_Location] a INNER JOIN dbo.[Core_State] b ON a.StateId = b.StateId ORDER BY LocationName" 
                        DeleteCommand="STP_HR_DELETE_HR_Location" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_Location" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_HR_UPDATE_HR_Location" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="LocationId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="LocationId" Type="Int32" />
                            <asp:Parameter Name="LocationName" Type="String" />
                            <asp:Parameter Name="StateId" Type="Int32" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="LocationId" Type="Int32" />
                            <asp:Parameter Name="LocationName" Type="String" />
                            <asp:Parameter Name="StateId" Type="Int32" />
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
                    <br />
                    <asp:Label ID="lblAddNew" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Add a New Location"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td><asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="LocationId"
                        DataSourceID="dsSqlGetData" DefaultMode="Insert" Width="600px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        AutoGenerateInsertButton="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="180px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="LocationId" HeaderText="Location Id:" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="LocationId" />
                            <asp:TemplateField HeaderText="Name of Location:" SortExpression="LocationName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LocationName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="40" 
                                        Text='<%# Bind("LocationName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("LocationName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="State:" SortExpression="StateId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StateId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStates" 
                                        DataTextField="StateName" DataValueField="StateId" 
                                        SelectedValue='<%# Bind("StateId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlStates" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [StateId], [StateName] + ' (' + [CountryName] + ') ' AS StateName FROM [Core_State] a INNER JOIN [Core_Country] b ON a.CountryId = b.CountryId ORDER BY [StateName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StateId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark" SortExpression="Remark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="50" Rows="5" 
                                        Text='<%# Bind("Remark") %>' TextMode="MultiLine" 
                                        CssClass="defaultFormElementStyle"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                &nbsp;&nbsp;&nbsp;</td>
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
