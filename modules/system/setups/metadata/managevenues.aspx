<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managevenues.aspx.vb" Inherits="modules_system_setups_metadata_managevenues" %>

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
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Add a New Teaching Location"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlVenues" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="VenueId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="VenueId" HeaderText="VenueId" InsertVisible="False"
                                ReadOnly="True" SortExpression="VenueId" />
                            <asp:TemplateField HeaderText="Name of Teaching Location:" 
                                SortExpression="VenueName">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("VenueName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("VenueName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("VenueName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short Name:" SortExpression="ShortName">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark1" HeaderText="Remark1" 
                                SortExpression="Remark1" Visible="False" />
                            <asp:BoundField DataField="Remark2" HeaderText="Remark2" 
                                SortExpression="Remark2" Visible="False" />
                            <asp:BoundField DataField="Remark3" HeaderText="Remark3" 
                                SortExpression="Remark3" Visible="False" />
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Teaching Location" />
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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Edit Existing Teaching Locations"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="VenueId" DataSourceID="dsSqlVenues" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="VenueId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="VenueId" />
                            <asp:TemplateField HeaderText="Name of Teaching Location" 
                                SortExpression="VenueName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("VenueName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("VenueName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short Name" SortExpression="ShortName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="10" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark1" HeaderText="Remark1" 
                                SortExpression="Remark1" Visible="False" />
                            <asp:BoundField DataField="Remark2" HeaderText="Remark2" 
                                SortExpression="Remark2" Visible="False" />
                            <asp:BoundField DataField="Remark3" HeaderText="Remark3" 
                                SortExpression="Remark3" Visible="False" />
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
                    <asp:SqlDataSource ID="dsSqlVenues" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_Core_TuitionVenue" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_Core_TuitionVenue" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_Core_TuitionVenue" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_Core_TuitionVenue" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="VenueId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="VenueId" Type="Int32" />
                            <asp:Parameter Name="VenueName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="VenueId" Type="Int32" />
                            <asp:Parameter Name="VenueName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;&nbsp;
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
