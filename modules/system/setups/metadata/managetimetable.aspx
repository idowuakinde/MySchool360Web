<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managetimetable.aspx.vb" Inherits="modules_system_setups_metadata_managetimetable" %>

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
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Add a New Timetable Period"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlPeriods" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="PeriodId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="PeriodId" HeaderText="PeriodId" InsertVisible="False"
                                ReadOnly="True" SortExpression="PeriodId" />
                            <asp:TemplateField HeaderText="Day of the Week:" SortExpression="DayOfWeek">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddDayOfWeek" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("DayOfWeek") %>'>
                                        <asp:ListItem Value="1">Monday</asp:ListItem>
                                        <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                        <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                        <asp:ListItem Value="4">Thursday</asp:ListItem>
                                        <asp:ListItem Value="5">Friday</asp:ListItem>
                                        <asp:ListItem Enabled="False" Value="6">Saturday</asp:ListItem>
                                        <asp:ListItem Enabled="False" Value="7">Sunday</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("DayOfWeek") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DayOfWeek") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Period:" SortExpression="PeriodNumber">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddPeriod" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("PeriodNumber") %>'>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("PeriodNumber") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PeriodNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme:" SortExpression="ClassId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddClass" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddClass" 
                                        DataTextField="ClassName" DataValueField="ClassId" 
                                        SelectedValue='<%# Bind("ClassId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlAddClass" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [ClassId], [ClassName] FROM [TEMPClass] ORDER BY [ClassName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ClassId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddSubject" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddSubject" 
                                        DataTextField="SubjectName" DataValueField="SubjectId" 
                                        SelectedValue='<%# Bind("SubjectId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlAddSubject" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [SubjectId], [SubjectName] FROM [TEMPSubject] ORDER BY [SubjectName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("SubjectId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("SubjectId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Location:" SortExpression="RoomId">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddLocation" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddLocations" 
                                        DataTextField="VenueName" DataValueField="VenueId" 
                                        SelectedValue='<%# Bind("RoomId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlAddLocations" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [VenueId], [VenueName] FROM [Core_TuitionVenue] ORDER BY [VenueName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("RoomId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("RoomId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teacher:" SortExpression="Remark1">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddTeacher" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddTeacher" 
                                        DataTextField="TeacherName" DataValueField="Username" 
                                        SelectedValue='<%# Bind("Remark1") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlAddTeacher" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT Username , [Firstname] + ' ' + [Surname] AS TeacherName FROM dbo.[Core_User]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("Remark1") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Remark1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Timetable Period" />
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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Edit Existing Timetable Periods"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="PeriodId" DataSourceID="dsSqlPeriods" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" />
                            <asp:BoundField DataField="PeriodId" HeaderText="PeriodId" InsertVisible="False"
                                ReadOnly="True" SortExpression="PeriodId" Visible="False" />
                            <asp:BoundField DataField="DayOfWeek" HeaderText="DayOfWeek" 
                                SortExpression="DayOfWeek" Visible="False" />
                            <asp:TemplateField HeaderText="Day of the Week" SortExpression="DayOfWeekName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditDayOfWeek" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("DayOfWeek") %>'>
                                        <asp:ListItem Value="1">Monday</asp:ListItem>
                                        <asp:ListItem Value="2">Tuesday</asp:ListItem>
                                        <asp:ListItem Value="3">Wednesday</asp:ListItem>
                                        <asp:ListItem Value="4">Thursday</asp:ListItem>
                                        <asp:ListItem Value="5">Friday</asp:ListItem>
                                        <asp:ListItem Enabled="False" Value="6">Saturday</asp:ListItem>
                                        <asp:ListItem Enabled="False" Value="7">Sunday</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("DayOfWeekName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Period" SortExpression="PeriodNumber">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditPeriod" runat="server" 
                                        CssClass="defaultFormElementStyle" SelectedValue='<%# Bind("PeriodNumber") %>'>
                                        <asp:ListItem>1</asp:ListItem>
                                        <asp:ListItem>2</asp:ListItem>
                                        <asp:ListItem>3</asp:ListItem>
                                        <asp:ListItem>4</asp:ListItem>
                                        <asp:ListItem>5</asp:ListItem>
                                        <asp:ListItem>6</asp:ListItem>
                                        <asp:ListItem>7</asp:ListItem>
                                        <asp:ListItem>8</asp:ListItem>
                                        <asp:ListItem>9</asp:ListItem>
                                        <asp:ListItem>10</asp:ListItem>
                                        <asp:ListItem>11</asp:ListItem>
                                        <asp:ListItem>12</asp:ListItem>
                                        <asp:ListItem>13</asp:ListItem>
                                        <asp:ListItem>14</asp:ListItem>
                                        <asp:ListItem>15</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("PeriodNumber") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ClassId" HeaderText="ClassId" 
                                SortExpression="ClassId" Visible="False" />
                            <asp:TemplateField HeaderText="Programme" SortExpression="ClassName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditClass" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditClass" 
                                        DataTextField="ClassName" DataValueField="ClassId" 
                                        SelectedValue='<%# Bind("ClassId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlEditClass" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [ClassId], [ClassName] FROM [TEMPClass] ORDER BY [ClassName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="SubjectId" HeaderText="SubjectId" 
                                SortExpression="SubjectId" Visible="False" />
                            <asp:TemplateField HeaderText="Subject" SortExpression="SubjectName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditSubject" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditSubject" 
                                        DataTextField="SubjectName" DataValueField="SubjectId" 
                                        SelectedValue='<%# Bind("SubjectId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlEditSubject" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [SubjectId], [SubjectName] FROM [TEMPSubject] ORDER BY [SubjectName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="RoomId" HeaderText="RoomId" SortExpression="RoomId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Location" SortExpression="VenueName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditLocation" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditLocations" 
                                        DataTextField="VenueName" DataValueField="VenueId" 
                                        SelectedValue='<%# Bind("RoomId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlEditLocations" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [VenueId], [VenueName] FROM [Core_TuitionVenue] ORDER BY [VenueName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("VenueName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teacher" SortExpression="Remark1">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditTeacher" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditTeacher" 
                                        DataTextField="TeacherName" DataValueField="Username" 
                                        SelectedValue='<%# Bind("Remark1") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlEditTeacher" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT Username , [Firstname] + ' ' + [Surname] AS TeacherName FROM dbo.[Core_User]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("Remark1") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
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
                    <asp:SqlDataSource ID="dsSqlPeriods" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_Core_TimetablePeriod" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_Core_TimetablePeriod" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_Core_TimetablePeriod" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_Core_TimetablePeriod" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="PeriodId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PeriodId" Type="Int32" />
                            <asp:Parameter Name="DayOfWeek" Type="Int32" />
                            <asp:Parameter Name="PeriodNumber" Type="Int32" />
                            <asp:Parameter Name="ClassId" Type="Int32" />
                            <asp:Parameter Name="SubjectId" Type="Int32" />
                            <asp:Parameter Name="RoomId" Type="Int32" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="PeriodId" Type="Int32" />
                            <asp:Parameter Name="DayOfWeek" Type="Int32" />
                            <asp:Parameter Name="PeriodNumber" Type="Int32" />
                            <asp:Parameter Name="ClassId" Type="Int32" />
                            <asp:Parameter Name="SubjectId" Type="Int32" />
                            <asp:Parameter Name="RoomId" Type="Int32" />
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
