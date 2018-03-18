<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageovertimerates.aspx.vb" Inherits="modules_system_setups_metadata_manageovertimerates" %>

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
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" Text=":: Manage Existing Overtime Rates"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" AutoGenerateEditButton="True" AutoGenerateSelectButton="True"
                        CssClass="noBorderedMenuTable" DataKeyNames="RateId" 
                        DataSourceID="dsSqlGetData" Width="800px" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" 
                        
                        
                        
                        
                        
                        EmptyDataText="&amp;nbsp;&lt;br /&gt;No records to display.&lt;br /&gt;&amp;nbsp;">
                        <Columns>
                            <asp:BoundField DataField="RateId" HeaderText="Id"
                                SortExpression="RateId" InsertVisible="False" ReadOnly="True" />
                            <asp:TemplateField HeaderText="Job Level" SortExpression="JobLevelId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlJobLevels" 
                                        DataTextField="JobLevelName" DataValueField="JobLevelId" 
                                        SelectedValue='<%# Bind("JobLevelId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlJobLevels" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [JobLevelId], [JobLevelName] FROM [HR_JobLevel] ORDER BY [JobLevelName]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("JobLevelName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rate 1" SortExpression="R1">
                                <EditItemTemplate>
                                    N
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="10" Text='<%# Bind("R1") %>' 
                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    N
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("R1") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rate 2" SortExpression="R2">
                                <EditItemTemplate>
                                    N
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="10" Text='<%# Bind("R2") %>' 
                                        CssClass="defaultFormElementStyleRightAligned"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    N
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("R2") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle VerticalAlign="Middle" />
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remark" HeaderText="Remark" 
                                SortExpression="Remark" Visible="False" />
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
                        SelectCommand="SELECT [RateId], a.[JobLevelId], [JobLevelName], [R1], [R2], a.[Remark] FROM [dbo].[HR_PAYROLL_OvertimeRate] a INNER JOIN dbo.[HR_JobLevel] b ON a.JobLevelId = b.JobLevelId" 
                        DeleteCommand="STP_HR_DELETE_HR_PAYROLL_OvertimeRate" 
                        DeleteCommandType="StoredProcedure" 
                        InsertCommand="STP_HR_INSERT_HR_PAYROLL_OvertimeRate" 
                        InsertCommandType="StoredProcedure" 
                        UpdateCommand="STP_HR_UPDATE_HR_PAYROLL_OvertimeRate" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="RateId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="RateId" Type="Int32" />
                            <asp:Parameter Name="JobLevelId" Type="Int32" />
                            <asp:Parameter Name="R1" Type="Decimal" />
                            <asp:Parameter Name="R2" Type="Decimal" />
                            <asp:Parameter Name="Remark" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="RateId" Type="Int32" />
                            <asp:Parameter Name="JobLevelId" Type="Int32" />
                            <asp:Parameter Name="R1" Type="Decimal" />
                            <asp:Parameter Name="R2" Type="Decimal" />
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
                    </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>&nbsp;&nbsp;&nbsp;</td>
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
