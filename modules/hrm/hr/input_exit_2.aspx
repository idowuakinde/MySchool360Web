﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="input_exit_2.aspx.vb" Inherits="modules_hr_input_exit_2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
						<asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Staff Exit"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">&nbsp;
                    </td>
                <td>
        <asp:GridView ID="gvMaster" runat="server" CssClass="noBorderedMenuTable" AutoGenerateColumns="False" 
                    DataKeyNames="StaffId" DataSourceID="dsoUsers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        SelectedIndex="0" PageSize="50" 
                        
                        EmptyDataText="&lt;br /&gt;&lt;br /&gt;No staff records found&lt;br /&gt;&lt;br /&gt;&amp;nbsp;" >
            <Columns>
                <asp:TemplateField HeaderText="Staff Code" SortExpression="StaffCode">
                    <EditItemTemplate>
                        <asp:Label ID="TextBox47" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                   </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label49" runat="server" Text='<%# Bind("StaffCode") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="70px" />
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" Height="30px" 
                        ImageUrl='<%# "~\images\pp_staff\" & Databinder.Eval(Container.DataItem, "StaffCode").ToString & ".jpg" %>' 
                        Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" /><br /><asp:Label ID="Label49_2" runat="server" Text='<%# Databinder.Eval(Container.DataItem, "Surname").ToString.ToUpper & " " & Databinder.Eval(Container.DataItem, "OtherNames").ToString.ToUpper %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="60px" />
                </asp:TemplateField>
                <asp:CommandField SelectText="Show Exit Details" ShowSelectButton="True">
                <ItemStyle Width="100px" />
                </asp:CommandField>
                <asp:TemplateField HeaderText="EXIT DETAILS">
                    <ItemTemplate>
                        <asp:GridView ID="gvDetail" runat="server" AutoGenerateColumns="False" 
                            AutoGenerateDeleteButton="True" AutoGenerateEditButton="True" 
                            AutoGenerateSelectButton="True" CellPadding="4" CssClass="noBorderedMenuTable" 
                            DataKeyNames="StaffExitId" DataSourceID="dsSqlGetDetail" 
                            EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;" 
                            ForeColor="#333333" GridLines="None" Visible="False" Width="100%" 
                            AllowSorting="True" Font-Bold="false">
                            <Columns>
                                <asp:BoundField DataField="StaffExitId" HeaderText="Id" InsertVisible="False" 
                                    ReadOnly="True" SortExpression="StaffExitId" />
                                <asp:TemplateField HeaderText="Staff Id" SortExpression="StaffId">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exit Reason" SortExpression="ExitReasonId">
                                    <EditItemTemplate>
                                        <asp:DropDownList ID="DropDownList6_2" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlExitReasons1_2" 
                                            DataTextField="DischargeTypeName" DataValueField="DischargeTypeId" 
                                            SelectedValue='<%# Bind("ExitReasonId") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsSqlExitReasons1_2" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT [DischargeTypeId], [DischargeTypeName] FROM [HR_DischargeType] ORDER BY [DischargeTypeName]">
                                        </asp:SqlDataSource>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label8" runat="server" Text='<%# Bind("DischargeTypeName") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Effective Date" SortExpression="ExitDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox60" runat="server" Columns="30" 
                                            Text='<%# Bind("ExitDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label9" runat="server" 
                                            Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "ExitDate"), Date)) %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments" SortExpression="Comments">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox61" runat="server" Columns="30" 
                                            CssClass="defaultFormElementStyle" Rows="3" Text='<%# Bind("Comments") %>' 
                                            TextMode="MultiLine"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label10" runat="server" 
                                            Text='<%# Bind("Comments") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Remark" HeaderText="Remark" SortExpression="Remark" 
                                    Visible="False" />
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
             <%  If CType(gvMaster.SelectedRow.FindControl("gvDetail"), GridView).Rows.Count = 0 Then%>
                   <br />
                        <asp:Label ID="lblAddNew" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Add Exit Details for the Current Staff" 
                            CssClass="defaultHeaderTextStyle" Visible="False"></asp:Label>
                        <asp:DetailsView ID="DetailsView1" runat="server" 
                            AutoGenerateInsertButton="True" AutoGenerateRows="False" CellPadding="4" 
                            DataKeyNames="StaffExitId" DataSourceID="dsSqlGetDetail" DefaultMode="Insert" 
                            ForeColor="#333333" GridLines="None" Visible="False" Width="100%" Font-Bold="false" OnItemInserted="DetailsViewItemInserted">
                            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" HorizontalAlign="Left" 
                                VerticalAlign="Middle" Wrap="True" />
                            <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" VerticalAlign="Top" 
                                Width="220px" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <Fields>
                                <asp:BoundField DataField="StaffExitId" HeaderText="StaffExitId" 
                                    InsertVisible="False" ReadOnly="True" SortExpression="StaffExitId" />
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
                                            SelectCommand="SELECT [StaffId], UPPER([Surname]) + ' ' + UPPER([OtherNames]) + ' | ' + UPPER([StaffCode]) + ' | (' + UPPER(b.[DepartmentName]) + ' Department)' AS StaffDetails FROM [HR_Staff_Base] a INNER JOIN [Core_Department] b ON a.Department = b.DepartmentCode WHERE StaffId = @StaffId">
                                            <SelectParameters>
                                                <asp:ControlParameter ControlID="gvMaster" Name="StaffId" 
                                                    PropertyName="SelectedValue" />
                                            </SelectParameters>
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("StaffId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exit Reason:" SortExpression="ExitReasonId">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ExitReasonId") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="DropDownList6" runat="server" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsSqlExitReasons1" 
                                            DataTextField="DischargeTypeName" DataValueField="DischargeTypeId" 
                                            SelectedValue='<%# Bind("ExitReasonId") %>'>
                                        </asp:DropDownList>
                                        <asp:SqlDataSource ID="dsSqlExitReasons1" runat="server" 
                                            ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                            SelectCommand="SELECT [DischargeTypeId], [DischargeTypeName] FROM [HR_DischargeType] ORDER BY [DischargeTypeName]">
                                        </asp:SqlDataSource>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("ExitReasonId") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Exit Date:" SortExpression="ExitDate">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ExitDate") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:DropDownList ID="ddlDateAction_Month" runat="server" AutoPostBack="True" 
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
                                        <asp:DropDownList ID="ddlDateAction_Day" runat="server" AutoPostBack="True" 
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
                                        <asp:DropDownList ID="ddlDateAction_Year" runat="server" AutoPostBack="True" 
                                            CssClass="defaultFormElementStyle" DataSourceID="dsObjYears">
                                        </asp:DropDownList>
                                        <asp:Label ID="lblActionDate" runat="server" Text='<%# Bind("ExitDate") %>'></asp:Label>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ExitDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Comments:" SortExpression="Comments">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Comments") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox58" runat="server" Columns="50" 
                                            CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Comments") %>' 
                                            TextMode="MultiLine"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("Comments") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Remark:" SortExpression="Remark">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("Remark") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <InsertItemTemplate>
                                        <asp:TextBox ID="TextBox59" runat="server" Columns="50" 
                                            CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Remark") %>' 
                                            TextMode="MultiLine"></asp:TextBox>
                                    </InsertItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Fields>
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <AlternatingRowStyle BackColor="White" />
                        </asp:DetailsView>
             <%  End If%>
                   </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Left" VerticalAlign="Top" />
                    <ItemStyle HorizontalAlign="Left" VerticalAlign="Top" />
                </asp:TemplateField>
            </Columns>
            <EmptyDataRowStyle BorderColor="#CCCCCC" BorderStyle="Solid" BorderWidth="1px" 
                Font-Bold="True" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <AlternatingRowStyle BackColor="White" />
        </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlGetDetail" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        DeleteCommand="STP_HR_DELETE_HR_Staff_Exit" DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_Staff_Exit" InsertCommandType="StoredProcedure" 
                        SelectCommand="SELECT [StaffExitId], [StaffId], a.[ExitReasonId], b.DischargeTypeName, CAST(IsNull([ExitDate], 0) AS DATETIME) AS ExitDate, [Comments], a.[Remark] FROM [dbo].[HR_Staff_Exit] a INNER JOIN dbo.[HR_DischargeType] b ON a.ExitReasonId = b.DischargeTypeId WHERE StaffId = @StaffId " 
                        UpdateCommand="STP_HR_UPDATE_HR_Staff_Exit" UpdateCommandType="StoredProcedure">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="gvMaster" Name="StaffId" 
                                PropertyName="SelectedValue" />
                        </SelectParameters>
                        <DeleteParameters>
                            <asp:Parameter Name="StaffExitId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="StaffExitId" Type="Int32" />
                            <asp:Parameter Name="StaffId" Type="Int32" />
                            <asp:Parameter Name="ExitReasonId" Type="Int32" />
                            <asp:Parameter Name="ExitDate" Type="DateTime" />
                            <asp:Parameter Name="Comments" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="StaffExitId" Type="Int32" />
                            <asp:Parameter Name="StaffId" Type="Int32" />
                            <asp:Parameter Name="ExitReasonId" Type="Int32" />
                            <asp:Parameter Name="ExitDate" Type="DateTime" />
                            <asp:Parameter Name="Comments" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
        <asp:SqlDataSource ID="dsoUsers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand="SELECT [StaffId], [StaffGUID], [StaffCode], [MaritalStatus], CAST(IsNull([WeddingDate], 0) AS DATETIME) AS WeddingDate, [Gender], [DateOfBirth], [ConfirmationStatus], [RetirementStatus], [Surname], [OtherNames], [Department], b.DepartmentName AS DepartmentName, CAST(IsNull([DateOfEmployment], 0) AS DATETIME) AS DateOfEmployment, [Email], a.[DesignationId], c.DesignationName, a.[JobLevelId], d.JobLevelName, a.[LocationId], e.LocationName, [Residence], [PermanentResidence], [Telephone], a.[ReligionId], f.ReligionName, [Hometown], a.[LGAOfOriginId], g.LgaName + ' LGA (' + h.StateName + ')' AS LgaName, a.[BankId], i.BankName, [BankAccountNumber], [Visa], [EyeColour], [Height], [Weight], [TrouserLength], [ShoeSize], [BloodGroup], [Genotype], [Hobbies], a.[AreaOfInterest], [VisaType], [Coop_MonthlyDeduction], [Coop_LoanRepayment], [MaxMedical], [NextOfKinName], [NextOfKinAddress], [NextOfKinRelationship] FROM [dbo].[HR_Staff_Base] a INNER JOIN dbo.[Core_Department] b ON a.Department = b.DepartmentCode LEFT JOIN dbo.[HR_Designation] c ON a.DesignationId = c.DesignationId LEFT JOIN dbo.[HR_JobLevel] d ON a.JobLevelId = d.JobLevelId LEFT JOIN dbo.[HR_Location] e ON a.LocationId = e.LocationId LEFT JOIN dbo.[HR_Religion] f ON a.ReligionId = f.ReligionId LEFT JOIN dbo.[Core_Lga] g ON a.LgaOfOriginId = g.LgaId LEFT JOIN dbo.[Core_State] h ON g.StateId = h.StateId LEFT JOIN dbo.[HR_Bank] i ON a.BankId = i.BankId ORDER BY Surname, OtherNames">
        </asp:SqlDataSource>
                    <asp:ObjectDataSource ID="dsObjYears" runat="server" 
                        SelectMethod="GetYearSeries" TypeName="Common">
                    </asp:ObjectDataSource>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;
                    </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>