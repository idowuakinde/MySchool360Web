<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managepromotionexclusions.aspx.vb" Inherits="modules_system_setups_metadata_managepromotionexclusions" trace="false" %>

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
                        Text=":: Add a New Promotion Exclusion"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="PromotionExclusionId"
                        DataSourceID="dsSqlPromotionExclusions" DefaultMode="Insert" 
                        Height="50px" Width="600px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="Id" SortExpression="PromotionExclusionId" 
                                InsertVisible="False">
                                <InsertItemTemplate>
                                    <asp:Label ID="Label3" runat="server" 
                                        Text='<%# Bind("PromotionExclusionId") %>'></asp:Label>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Session:" 
                                SortExpression="SessionName">
                                <InsertItemTemplate>
                                    <asp:Label ID="lblSessionName_Add" runat="server" Text='<%# sessionName %>'></asp:Label>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student:" SortExpression="PortalNumber">
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlStudent_Add" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudents" 
                                        DataTextField="FullDesc" DataValueField="PortalNumber">
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes:" SortExpression="Remark">
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Remark") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Promotion Exclusion" />
                        </Fields>
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:DetailsView>
                    &nbsp; &nbsp;&nbsp;</td>
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
                        Text=":: Edit Existing Promotion Exclusions For The Selected Session"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    Please select a Session to filter the Exclusions list:
                    <asp:DropDownList ID="ddlSessions" runat="server" 
                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSessions" 
                        DataTextField="AcademicSession" DataValueField="AcademicSession" 
                        AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="PromotionExclusionId" 
                        DataSourceID="dsSqlPromotionExclusions" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1000px" EnableModelValidation="True" 
                        
                        EmptyDataText="No promotion exclusion records to show for the selected session.">
                        <Columns>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                            </ItemTemplate>
                            <ItemStyle Width="20px" />
                        </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:TemplateField HeaderText="Id" InsertVisible="False" 
                                SortExpression="PromotionExclusionId">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" 
                                        Text='<%# Bind("PromotionExclusionId") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="10px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Session" SortExpression="SessionName">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSession_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSessions" 
                                        DataTextField="AcademicSession" DataValueField="AcademicSession">
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("SessionName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student" 
                                SortExpression="PortalNumber">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlStudent_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudents" 
                                        DataTextField="FullDesc" DataValueField="PortalNumber" 
                                        SelectedValue='<%# Bind("PortalNumber") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlStudent_ReadOnly" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlStudents" 
                                        DataTextField="FullDesc" DataValueField="PortalNumber" Enabled="False" 
                                        SelectedValue='<%# Bind("PortalNumber") %>'>
                                    </asp:DropDownList>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" SortExpression="Remark">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Remark") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Remark") %>' 
                                        Columns="40" CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="250px" />
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                            ForeColor="#333333" />
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle CssClass="defaultFormElementStyle" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                        <AlternatingRowStyle BackColor="White" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlPromotionExclusions" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPPromotionExclusion" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPPromotionExclusion" InsertCommandType="StoredProcedure"
                        SelectCommand=" SELECT [PromotionExclusionId], [SessionName], [PortalNumber], [Remark], [Remark2], [Remark3] FROM [dbo].[TEMPPromotionExclusion] a WHERE SessionName = @SessionName -- LEFT JOIN dbo.TEMPCustomers b ON a.PortalNumber = b.CustomerCode LEFT JOIN dbo.TEMPcustomers_2012 c ON a.PortalNumber = c.CustomerCode WHERE SessionName = @SessionName "
                        UpdateCommand="STP_METADATA_UPDATE_TEMPPromotionExclusion" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="PromotionExclusionId" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:ControlParameter ControlID="ddlSessions" Name="SessionName" PropertyName="SelectedValue" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="PromotionExclusionId" Type="Int32" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="PortalNumber" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="PromotionExclusionId" Type="Int32" />
                            <asp:Parameter Name="SessionName" Type="String" />
                            <asp:Parameter Name="PortalNumber" Type="String" />
                            <asp:Parameter Name="Remark" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlSessions" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        
                        SelectCommand="SELECT [SessionName] as AcademicSession FROM [TEMPSession] ORDER BY [SessionName] DESC">
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlStudents" runat="server" 
    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
    
                        
                        SelectCommand=" SELECT [DistrictCode] as ClassName, IsNull(UPPER([LastName]), '') + ', ' + IsNull([FirstName], '') AS FullName, IsNull(DistrictCode, '') + ' &gt; ' + IsNull(UPPER([LastName]), '') + ', ' + IsNull([FirstName], '') + ' (' + IsNull(CustomerCode, '') + ')' AS FullDesc, [CustomerCode] as PortalNumber FROM dbo.[TEMPCustomers] a INNER JOIN dbo.TEMPClass b ON a.DistrictCode= b.ClassName ORDER BY [ListingOrder], FullName ">
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
