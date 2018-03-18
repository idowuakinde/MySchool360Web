<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managenoticeboard.aspx.vb" Inherits="modules_system_setups_metadata_managenoticeboard" %>

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
                        Text=":: Add a New Announcement"></asp:Label></td>
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
                            <asp:BoundField DataField="AnnouncementId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="AnnouncementId" />
                            <asp:TemplateField HeaderText="Date Published:" SortExpression="DatePublished">
                                <InsertItemTemplate>
                                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                                        BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" 
                                        Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" 
                                        SelectedDate='<%# Bind("DatePublished") %>' Width="200px">
                                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                                        <NextPrevStyle VerticalAlign="Bottom" />
                                        <OtherMonthDayStyle ForeColor="#808080" />
                                        <SelectedDayStyle BackColor="#666666" Font-Bold="True" ForeColor="White" />
                                        <SelectorStyle BackColor="#CCCCCC" />
                                        <TitleStyle BackColor="#999999" BorderColor="Black" Font-Bold="True" />
                                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                                        <WeekendDayStyle BackColor="#FFFFCC" />
                                    </asp:Calendar>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DatePublished") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DatePublished") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Message:" SortExpression="Message">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="70" 
                                        CssClass="defaultFormElementStyle" Rows="7" Text='<%# Bind("Message") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Message") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expired:" SortExpression="Expired">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Expired") %>'>
                                        <asp:ListItem>N</asp:ListItem>
                                        <asp:ListItem>Y</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Expired") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Expired") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New Announcement" 
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
                        Text=":: Edit Existing Announcements"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="AnnouncementId" DataSourceID="dsSqlClasses" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="AnnouncementId" HeaderText="Id" 
                                InsertVisible="False" ReadOnly="True" SortExpression="AnnouncementId">
                            <ItemStyle Width="5%" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Date Published" 
                                SortExpression="DatePublished">
                                <EditItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# Bind("DatePublished") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("DatePublished") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="20%" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Message" SortExpression="Message">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="70" 
                                        CssClass="defaultFormElementStyle" Rows="7" Text='<%# Bind("Message") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Message") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Expired" SortExpression="Expired">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Expired") %>'>
                                        <asp:ListItem>N</asp:ListItem>
                                        <asp:ListItem>Y</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Expired") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="10%" />
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
                        DeleteCommand="STP_METADATA_DELETE_TEMPAnnouncements" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPAnnouncements" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPAnnouncements" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPAnnouncements" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="AnnouncementId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="AnnouncementId" Type="Int32" />
                            <asp:Parameter Name="DatePublished" Type="DateTime" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="Expired" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="AnnouncementId" Type="Int32" />
                            <asp:Parameter Name="DatePublished" Type="DateTime" />
                            <asp:Parameter Name="Message" Type="String" />
                            <asp:Parameter Name="Expired" Type="String" />
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
