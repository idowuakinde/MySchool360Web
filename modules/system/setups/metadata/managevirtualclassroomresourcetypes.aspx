<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managevirtualclassroomresourcetypes.aspx.vb" Inherits="modules_system_setups_metadata_managevirtualclassroomresourcetypes" %>

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
                        Text=":: Add a New Virtual Classroom Resource Type"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ResourceId"
                        DataSourceID="dsSqlResourceTypes" DefaultMode="Insert" 
                        Height="50px" Width="800px" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" 
                        EnableModelValidation="True">
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" Width="200px" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="ResourceTypeId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ResourceTypeId" />
                            <asp:TemplateField HeaderText="Resource Type Name:" 
                                SortExpression="ResourceTypeName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResourceTypeName") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        Text='<%# Bind("ResourceTypeName") %>'></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Resource Type" />
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
                        Text=":: Edit Existing Virtual Classroom Resource Types"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ResourceTypeId" 
                        DataSourceID="dsSqlResourceTypes" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="600px" EnableModelValidation="True">
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
                            <asp:TemplateField HeaderText="Resource Type Id" InsertVisible="False" 
                                SortExpression="ResourceTypeId">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ResourceTypeId") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("ResourceTypeId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Type Name" 
                                SortExpression="ResourceTypeName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ResourceTypeName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Columns="40" 
                                        Text='<%# Bind("ResourceTypeName") %>'></asp:TextBox>
                                </EditItemTemplate>
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
                    <asp:SqlDataSource ID="dsSqlResourceTypes" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPVirtualClassroomResourceType" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPVirtualClassroomResourceType" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPVirtualClassroomResourceType" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPVirtualClassroomResourceType" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ResourceTypeId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ResourceTypeId" Type="Int32" />
                            <asp:Parameter Name="ResourceTypeName" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                            <%--<asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />--%>
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ResourceTypeId" 
                                Type="Int32" />
                            <asp:Parameter Name="ResourceTypeName" Type="String" />
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
