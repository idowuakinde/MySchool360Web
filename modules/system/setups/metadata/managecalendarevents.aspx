<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managecalendarevents.aspx.vb" Inherits="modules_system_setups_metadata_managecalendarevents" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style17
        {
            width: 100%;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Add a New Calendar Event"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlEvents" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="EventId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="EventId" HeaderText="EventId" InsertVisible="False"
                                ReadOnly="True" SortExpression="EventId" />
                            <asp:TemplateField HeaderText="Event:" SortExpression="EventName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("EventName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("EventName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("EventName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short Title:" SortExpression="ShortName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From:" SortExpression="StartDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    &nbsp;
                                    <table cellpadding="0" cellspacing="0" class="style17">
                                        <tr>
                                            <td align="left" valign="top" width="8%">
                                                <strong>From:</strong></td>
                                            <td align="left" valign="top" width="38%">
                                                <asp:Calendar ID="calAddStartDate" runat="server" 
                                                    SelectedDate='<%# Bind("StartDate") %>' VisibleDate="<%# Now.Today %>">
                                                </asp:Calendar>
                                            </td>
                                            <td align="left" valign="top" width="5%">
                                                <strong>To:</strong></td>
                                            <td align="left" valign="top">
                                                <asp:Calendar ID="calAddEndDate" runat="server" 
                                                    SelectedDate='<%# Bind("EndDate") %>' VisibleDate="<%# Now.Today %>">
                                                </asp:Calendar>
                                            </td>
                                        </tr>
                                    </table>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Event Type:" SortExpression="Remark1">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Remark1") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddEventType" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Remark1") %>'>
                                        <asp:ListItem>Event</asp:ListItem>
                                        <asp:ListItem>Holiday</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Remark1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Calendar Event" />
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
                        Text=":: Edit Existing Calendar Events"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="EventId" DataSourceID="dsSqlEvents" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="EventId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="EventId" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Event" SortExpression="EventName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("EventName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("EventName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Short Title" SortExpression="ShortName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ShortName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ShortName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="From" SortExpression="StartDate">
                                <EditItemTemplate>
                                    <asp:Calendar ID="calEditStartDate" runat="server" 
                                        SelectedDate='<%# Bind("StartDate") %>' VisibleDate='<%# Eval("StartDate") %>'>
                                    </asp:Calendar>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# FormatDateTime(CType(Databinder.Eval(Container.DataItem, "StartDate"), Date), DateFormat.LongDate) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="170px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="To" SortExpression="EndDate">
                                <EditItemTemplate>
                                    <asp:Calendar ID="calEditEndDate" runat="server" 
                                        SelectedDate='<%# Bind("EndDate") %>' VisibleDate='<%# Eval("EndDate") %>'>
                                    </asp:Calendar>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# FormatDateTime(CType(Databinder.Eval(Container.DataItem, "EndDate"), Date), DateFormat.LongDate) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="170px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# (DateDiff(DateInterval.Day, CType(Databinder.Eval(Container.DataItem, "StartDate"), Date), CType(Databinder.Eval(Container.DataItem, "EndDate"), Date)) + 1).ToString & " day(s)" %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="Remark1">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditEventType" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("Remark1") %>'>
                                        <asp:ListItem>Event</asp:ListItem>
                                        <asp:ListItem>Holiday</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("Remark1") %>'></asp:Label>
                                </ItemTemplate>
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
                    <asp:SqlDataSource ID="dsSqlEvents" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_Core_CalendarEvent" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_Core_CalendarEvent" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_Core_CalendarEvent" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_Core_CalendarEvent" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="EventId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="EventId" Type="Int32" />
                            <asp:Parameter Name="EventName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter Name="StartDate" Type="DateTime" />
                            <asp:Parameter Name="EndDate" Type="DateTime" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="EventId" Type="Int32" />
                            <asp:Parameter Name="EventName" Type="String" />
                            <asp:Parameter Name="ShortName" Type="String" />
                            <asp:Parameter Name="StartDate" Type="DateTime" />
                            <asp:Parameter Name="EndDate" Type="DateTime" />
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
