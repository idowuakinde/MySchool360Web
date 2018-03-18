<%@ Page Language="VB" AutoEventWireup="false" CodeFile="staff_leave.aspx.vb" Inherits="modules_selfservice_staff_leave" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">

.defaultFormElementStyle {
	BORDER-RIGHT: silver 1px solid; BORDER-TOP: silver 1px solid; FONT-SIZE: 11px; BORDER-LEFT: silver 1px solid; BORDER-BOTTOM: silver 1px solid; FONT-FAMILY: tahoma; BACKGROUND-COLOR: #ffffff
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: My Past Leave Applications"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" 
                        CellPadding="4" CssClass="noBorderedMenuTable" 
                            DataKeyNames="StaffLeaveId" DataSourceID="dsSqlGetData" 
                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                            ForeColor="#333333" GridLines="None" Width="100%" 
                            AllowSorting="True" Font-Bold="False">
                        <Columns>
                            <asp:TemplateField HeaderText="S/N">
                                <ItemTemplate>
                                    <asp:Label ID="Label35" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="StaffLeaveId" HeaderText="Id" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="StaffLeaveId" 
                                Visible="False" />
                            <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId" 
                                Visible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label20" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label22" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Leave Type" 
                                    SortExpression="LeaveTypeId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList9" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlLeaveTypes2" 
                                            DataTextField="LeaveTypeName" DataValueField="LeaveTypeId" 
                                            SelectedValue='<%# Bind("LeaveTypeId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlLeaveTypes2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [LeaveTypeId], [LeaveTypeName] FROM [HR_LeaveType] ORDER BY [LeaveTypeName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("LeaveTypeName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration" SortExpression="DurationInDays">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox12" runat="server" Columns="3" 
                                            CssClass="defaultFormElementStyleRightAligned" 
                                            Text='<%# Bind("DurationInDays") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label23" runat="server" Text='<%# Bind("DurationInDays") %>'></asp:Label> days
                                </ItemTemplate>
                                <ItemStyle HorizontalAlign="Right" />
                                <HeaderStyle HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start" SortExpression="StartDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="10" 
                                            Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem,"StartDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resume" SortExpression="ResumptionDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Columns="10" 
                                            Text='<%# Bind("ResumptionDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" 
                                        Text='<%# Common.GetFriendlyDateShort(CType(Databinder.Eval(Container.DataItem,"ResumptionDate"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Address While Away" 
                                SortExpression="ContactAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Columns="20" 
                                            CssClass="defaultFormElementStyle" Rows="5" 
                                            Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                    <asp:TextBox ID="TextBox8" runat="server" Columns="10" 
                                            Text='<%# Bind("ContactTelephone") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("ContactAddress") %>'></asp:Label>
                                    (<asp:Label ID="Label8" runat="server" Text='<%# Bind("ContactTelephone") %>'></asp:Label>
                                    )
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hand Over To:" 
                                    SortExpression="HandoverStaffId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList4_3" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetAllStaff_3" 
                                            DataTextField="StaffDetails" DataValueField="StaffId" 
                                            SelectedValue='<%# Bind("HandoverStaffId") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlGetAllStaff_3" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT 0 AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT [StaffId], UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER([DepartmentName]) + ' Department)' FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) ">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" 
                                            Text='<%# Bind("StaffDetails") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="1st Appr?" 
                                    SortExpression="ApprovedBySuperior">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7_2" runat="server" 
                                            CssClass="defaultFormElementStyle" 
                                            SelectedValue='<%# Bind("ApprovedBySuperior") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label21" runat="server" 
                                        Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "ApprovedBySuperior").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="2nd Appr?" 
                                    SortExpression="ApprovedByHRManager">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList7_3" runat="server" 
                                            CssClass="defaultFormElementStyle" 
                                            SelectedValue='<%# Bind("ApprovedByHRManager") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label11" runat="server" 
                                        Text='<%# Common.GetYesOrNo(Databinder.Eval(Container.DataItem, "ApprovedByHRManager").ToString) %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark" SortExpression="Remark" Visible="False">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox23" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label24" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Top" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                HorizontalAlign="Left" VerticalAlign="Top" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetData" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT [StaffLeaveId], a.[StaffId], a.[LeaveTypeId], b.LeaveTypeName, [DurationInDays], [StartDate], [ResumptionDate], [ContactAddress], [ContactTelephone], a.[HandoverStaffId], UPPER(c.[Surname]) + ' ' + UPPER(c.[OtherNames]) + ' | ' + UPPER(c.[StaffCode]) + ' | (' + UPPER(d.[DepartmentName]) + ' Department)' AS StaffDetails, [ApprovedBySuperior], [ApprovedByHRManager], a.[Remark] FROM [dbo].[HR_Staff_Leave] a INNER JOIN dbo.[HR_LeaveType] b ON a.LeaveTypeId = b.LeaveTypeId INNER JOIN dbo.[HR_Staff_Base] c ON a.HandoverStaffId = c.StaffId INNER JOIN dbo.[Core_Department] d ON c.Department = left(d.DepartmentName, charindex('.', d.DepartmentName) - 1) WHERE a.StaffId = (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode)" 
                        DeleteCommand="STP_HR_DELETE_HR_Staff_Leave" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_Staff_Leave" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_HR_UPDATE_HR_Staff_Leave" 
                        UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="StaffLeaveId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StaffLeaveId" Type="Int32" />
                            <asp:Parameter Name="StaffId" Type="Int32" />
                            <asp:Parameter Name="LeaveTypeId" Type="Int32" />
                            <asp:Parameter Name="DurationInDays" Type="Int32" />
                            <asp:Parameter Name="StartDate" Type="DateTime" />
                            <asp:Parameter Name="ResumptionDate" Type="DateTime" />
                            <asp:Parameter Name="ContactAddress" Type="String" />
                            <asp:Parameter Name="ContactTelephone" Type="String" />
                            <asp:Parameter Name="HandoverStaffId" Type="String" />
                            <asp:Parameter Name="ApprovedBySuperior" Type="String" />
                            <asp:Parameter Name="ApprovedByHRManager" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="StaffLeaveId" Type="Int32" />
                            <asp:Parameter Name="StaffId" Type="Int32" />
                            <asp:Parameter Name="LeaveTypeId" Type="Int32" />
                            <asp:Parameter Name="DurationInDays" Type="Int32" />
                            <asp:Parameter Name="StartDate" Type="DateTime" />
                            <asp:Parameter Name="ResumptionDate" Type="DateTime" />
                            <asp:Parameter Name="ContactAddress" Type="String" />
                            <asp:Parameter Name="ContactTelephone" Type="String" />
                            <asp:Parameter Name="HandoverStaffId" Type="String" />
                            <asp:Parameter Name="ApprovedBySuperior" Type="String" />
                            <asp:Parameter Name="ApprovedByHRManager" Type="String" />
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
                        Text=":: Make a Fresh Leave Application"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" 
                            AutoGenerateInsertButton="True" AutoGenerateRows="False" CellPadding="4" 
                            DataKeyNames="StaffLeaveId" DataSourceID="dsSqlGetData" DefaultMode="Insert" 
                            ForeColor="#333333" GridLines="None" Width="100%" 
                            Font-Bold="False" >
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Middle" Wrap="True" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" VerticalAlign="Top" 
                                Width="250px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="StaffLeaveId" HeaderText="StaffLeaveId" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="StaffLeaveId" />
                            <asp:TemplateField HeaderText="Staff Concerned:" SortExpression="StaffId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("StaffId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList5" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetSingleStaff" 
                                            DataTextField="StaffDetails" DataValueField="StaffId" 
                                            SelectedValue='<%# Bind("StaffId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlGetSingleStaff" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [StaffId], UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER([DepartmentName]) + ' Department)' AS StaffDetails FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) WHERE StaffId = (SELECT StaffId FROM dbo.HR_Staff_Base WHERE StaffCode = @StaffCode)">
                                        <SelectParameters>
                                            <asp:QueryStringParameter Name="StaffCode" QueryStringField="a" />
                                        </SelectParameters>
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label32" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Leave Type:" SortExpression="LeaveTypeId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("LeaveTypeId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList6" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlLeaveTypes" 
                                            DataTextField="LeaveTypeName" DataValueField="LeaveTypeId" 
                                            SelectedValue='<%# Bind("LeaveTypeId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlLeaveTypes" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            
                                            
                                        SelectCommand="SELECT [LeaveTypeId], [LeaveTypeName] FROM [HR_LeaveType] ORDER BY [LeaveTypeName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label33" runat="server" Text='<%# Bind("LeaveTypeId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Duration:" SortExpression="DurationInDays">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("DurationInDays") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox24" runat="server" Columns="5" 
                                            CssClass="defaultFormElementStyleRightAligned" 
                                            Text='<%# Bind("DurationInDays") %>'></asp:TextBox>
                                    &nbsp;day(s)
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label34" runat="server" Text='<%# Bind("DurationInDays") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Start Date:" SortExpression="StartDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox25" runat="server" Text='<%# Bind("StartDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlDateStart_Month" runat="server" AutoPostBack="True" 
                                            CssClass="defaultFormElementStyle">
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlDateStart_Day" runat="server" AutoPostBack="True" 
                                            CssClass="defaultFormElementStyle">
                                        <asp:ListItem value="1">1</asp:ListItem>
                                        <asp:ListItem value="2">2</asp:ListItem>
                                        <asp:ListItem value="3">3</asp:ListItem>
                                        <asp:ListItem value="4">4</asp:ListItem>
                                        <asp:ListItem value="5">5</asp:ListItem>
                                        <asp:ListItem value="6">6</asp:ListItem>
                                        <asp:ListItem value="7">7</asp:ListItem>
                                        <asp:ListItem value="8">8</asp:ListItem>
                                        <asp:ListItem value="9">9</asp:ListItem>
                                        <asp:ListItem value="10">10</asp:ListItem>
                                        <asp:ListItem value="11">11</asp:ListItem>
                                        <asp:ListItem value="12">12</asp:ListItem>
                                        <asp:ListItem value="13">13</asp:ListItem>
                                        <asp:ListItem value="14">14</asp:ListItem>
                                        <asp:ListItem value="15">15</asp:ListItem>
                                        <asp:ListItem value="16">16</asp:ListItem>
                                        <asp:ListItem value="17">17</asp:ListItem>
                                        <asp:ListItem value="18">18</asp:ListItem>
                                        <asp:ListItem value="19">19</asp:ListItem>
                                        <asp:ListItem value="20">20</asp:ListItem>
                                        <asp:ListItem value="21">21</asp:ListItem>
                                        <asp:ListItem value="22">22</asp:ListItem>
                                        <asp:ListItem value="23">23</asp:ListItem>
                                        <asp:ListItem value="24">24</asp:ListItem>
                                        <asp:ListItem value="25">25</asp:ListItem>
                                        <asp:ListItem value="26">26</asp:ListItem>
                                        <asp:ListItem value="27">27</asp:ListItem>
                                        <asp:ListItem value="28">28</asp:ListItem>
                                        <asp:ListItem value="29">29</asp:ListItem>
                                        <asp:ListItem value="30">30</asp:ListItem>
                                        <asp:ListItem value="31">31</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlDateStart_Year" runat="server" AutoPostBack="True" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsObjYears">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblStartDate" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label25" runat="server" Text='<%# Bind("StartDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resumption Date:" 
                                    SortExpression="ResumptionDate">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox26" runat="server" Text='<%# Bind("ResumptionDate") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlDateEnd_Month" runat="server" AutoPostBack="True" 
                                            CssClass="defaultFormElementStyle">
                                        <asp:ListItem Value="1">January</asp:ListItem>
                                        <asp:ListItem Value="2">February</asp:ListItem>
                                        <asp:ListItem Value="3">March</asp:ListItem>
                                        <asp:ListItem Value="4">April</asp:ListItem>
                                        <asp:ListItem Value="5">May</asp:ListItem>
                                        <asp:ListItem Value="6">June</asp:ListItem>
                                        <asp:ListItem Value="7">July</asp:ListItem>
                                        <asp:ListItem Value="8">August</asp:ListItem>
                                        <asp:ListItem Value="9">September</asp:ListItem>
                                        <asp:ListItem Value="10">October</asp:ListItem>
                                        <asp:ListItem Value="11">November</asp:ListItem>
                                        <asp:ListItem Value="12">December</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlDateEnd_Day" runat="server" AutoPostBack="True" 
                                            CssClass="defaultFormElementStyle">
                                        <asp:ListItem value="1">1</asp:ListItem>
                                        <asp:ListItem value="2">2</asp:ListItem>
                                        <asp:ListItem value="3">3</asp:ListItem>
                                        <asp:ListItem value="4">4</asp:ListItem>
                                        <asp:ListItem value="5">5</asp:ListItem>
                                        <asp:ListItem value="6">6</asp:ListItem>
                                        <asp:ListItem value="7">7</asp:ListItem>
                                        <asp:ListItem value="8">8</asp:ListItem>
                                        <asp:ListItem value="9">9</asp:ListItem>
                                        <asp:ListItem value="10">10</asp:ListItem>
                                        <asp:ListItem value="11">11</asp:ListItem>
                                        <asp:ListItem value="12">12</asp:ListItem>
                                        <asp:ListItem value="13">13</asp:ListItem>
                                        <asp:ListItem value="14">14</asp:ListItem>
                                        <asp:ListItem value="15">15</asp:ListItem>
                                        <asp:ListItem value="16">16</asp:ListItem>
                                        <asp:ListItem value="17">17</asp:ListItem>
                                        <asp:ListItem value="18">18</asp:ListItem>
                                        <asp:ListItem value="19">19</asp:ListItem>
                                        <asp:ListItem value="20">20</asp:ListItem>
                                        <asp:ListItem value="21">21</asp:ListItem>
                                        <asp:ListItem value="22">22</asp:ListItem>
                                        <asp:ListItem value="23">23</asp:ListItem>
                                        <asp:ListItem value="24">24</asp:ListItem>
                                        <asp:ListItem value="25">25</asp:ListItem>
                                        <asp:ListItem value="26">26</asp:ListItem>
                                        <asp:ListItem value="27">27</asp:ListItem>
                                        <asp:ListItem value="28">28</asp:ListItem>
                                        <asp:ListItem value="29">29</asp:ListItem>
                                        <asp:ListItem value="30">30</asp:ListItem>
                                        <asp:ListItem value="31">31</asp:ListItem>
                                    </asp:DropDownList>
                                    <asp:DropDownList ID="ddlDateEnd_Year" runat="server" AutoPostBack="True" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjYears">
                                    </asp:DropDownList>
                                    <asp:Label ID="lblEndDate" runat="server" Text='<%# Bind("ResumptionDate") %>'></asp:Label>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label26" runat="server" Text='<%# Bind("ResumptionDate") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Address (while on leave):" 
                                    SortExpression="ContactAddress">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox27" runat="server" Text='<%# Bind("ContactAddress") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox28" runat="server" Columns="50" 
                                            CssClass="defaultFormElementStyle" Rows="5" 
                                            Text='<%# Bind("ContactAddress") %>' TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label27" runat="server" Text='<%# Bind("ContactAddress") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Contact Telephone (while on leave):" 
                                    SortExpression="ContactTelephone">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox29" runat="server" 
                                            Text='<%# Bind("ContactTelephone") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox30" runat="server" Columns="40" 
                                            Text='<%# Bind("ContactTelephone") %>'></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label28" runat="server" Text='<%# Bind("ContactTelephone") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Staff to take over (while on leave):" 
                                    SortExpression="HandoverStaffId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox31" runat="server" 
                                            Text='<%# Bind("HandoverStaffId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList4_2" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlGetAllStaff_2" 
                                            DataTextField="StaffDetails" DataValueField="StaffId" 
                                            SelectedValue='<%# Bind("HandoverStaffId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlGetAllStaff_2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            
                                            
                                        SelectCommand="SELECT 0 AS StaffId, ' Please select a staff ' AS StaffDetails UNION ALL SELECT [StaffId], UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER([DepartmentName]) + ' Department)' FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = left(b.DepartmentName, charindex('.', b.DepartmentName) - 1) ">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label29" runat="server" Text='<%# Bind("HandoverStaffId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Approved by Superior ?:" 
                                    SortExpression="ApprovedBySuperior">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox9" runat="server" 
                                            Text='<%# Bind("ApprovedBySuperior") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList7" runat="server" 
                                            CssClass="defaultFormElementStyle" 
                                            SelectedValue='<%# Bind("ApprovedBySuperior") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label9" runat="server" Text='<%# Bind("ApprovedBySuperior") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Approved by HR Manager ?:" 
                                    SortExpression="ApprovedByHRManager">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox10" runat="server" 
                                            Text='<%# Bind("ApprovedByHRManager") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList8" runat="server" 
                                            CssClass="defaultFormElementStyle" 
                                            SelectedValue='<%# Bind("ApprovedByHRManager") %>'>
                                        <asp:ListItem Value="N">No</asp:ListItem>
                                        <asp:ListItem Value="Y">Yes</asp:ListItem>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label30" runat="server" 
                                            Text='<%# Bind("ApprovedByHRManager") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remark:" SortExpression="Remark">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox11" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox32" runat="server" Columns="50" 
                                            CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Remark") %>' 
                                            TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                                VerticalAlign="Top" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
        <asp:ObjectDataSource ID="dsObjYears" runat="server" 
            SelectMethod="GetYearSeries" TypeName="Common">
        </asp:ObjectDataSource>
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