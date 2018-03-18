<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageclasses.aspx.vb" Inherits="modules_system_setups_metadata_manageclasses" %>

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
                        Text=":: Add a New Class"></asp:Label></td>
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
                            <asp:BoundField DataField="ClassId" HeaderText="ClassId:" InsertVisible="False"
                                ReadOnly="True" SortExpression="ClassId" />
                            <asp:TemplateField HeaderText="Class Abbr.:" SortExpression="ClassName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ClassName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddClass" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ClassName") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddClass" runat="server" 
                                        ControlToValidate="txtAddClass" ErrorMessage="*Required" Font-Bold="True" 
                                        ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class Full Name:" SortExpression="ClassAlias">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClassAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ClassAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddClassAlias" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ClassAlias") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddClassAlias" runat="server" 
                                        ControlToValidate="txtAddClassAlias" ErrorMessage="*Required" 
                                        Font-Bold="True" ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ClassColor" HeaderText="Class Color:" 
                                SortExpression="ClassColor" Visible="False" />
                            <asp:TemplateField HeaderText="Teacher-in-Charge:" SortExpression="Teacher">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Teacher") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Teacher") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlEditTeacher" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddTeacher" 
                                        DataTextField="TeacherName" DataValueField="Username" 
                                        SelectedValue='<%# Bind("Teacher") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlAddTeacher" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT Username , [Firstname] + ' ' + [MiddleName] + ' ' + [Surname] AS TeacherName FROM dbo.[Core_User]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Parent Programme:" SortExpression="Remarks">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Remarks") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddProgrammes" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlProgrammes" 
                                        DataTextField="ProgrammeAlias" DataValueField="ProgrammeName" 
                                        SelectedValue='<%# Bind("Remarks") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Minimum Pass Mark:" 
                                SortExpression="ClassColor">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ClassColor") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ClassColor") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="10" CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("ClassColor") %>'></asp:TextBox>
                                    %
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Next Class (for Promotion):" SortExpression="Remark2">
                                <ItemTemplate>
                                    <asp:Label ID="Label4b" runat="server" Text='<%# Bind("Remark2") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4b" runat="server" Text='<%# Bind("Remark2") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlAddPromotionClass" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("Remark2") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ButtonType="Button" InsertText="Add New Class" 
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
                        Text=":: Edit Existing Classes"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="ClassId" DataSourceID="dsSqlClasses" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1200px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" OnClientClick="return confirm('Are you sure you want to delete this record?');" CommandName="Delete" Height="16px" ImageUrl="~/images/delete.png" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" />
                            <asp:BoundField DataField="ClassId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="ClassId" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Class Abbr." SortExpression="ClassName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ClassName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class Full Name" SortExpression="ClassAlias">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="20" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ClassAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClassAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="150px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teacher-in-Charge" SortExpression="Teacher">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditTeacher" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlEditTeacher" 
                                        DataTextField="TeacherName" DataValueField="Username" 
                                        SelectedValue='<%# Bind("Teacher") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlEditTeacher" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT Username , [Firstname] + ' ' + [MiddleName] + ' ' + [Surname] AS TeacherName FROM dbo.[Core_User]">
                                    </asp:SqlDataSource>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Teacher") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme" SortExpression="Remarks">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("Remarks") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlProgrammes" 
                                        DataTextField="ProgrammeAlias" DataValueField="ProgrammeName" 
                                        SelectedValue='<%# Bind("Remarks") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Pass Mark" 
                                SortExpression="ClassColor">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ClassColor") %>'></asp:Label>
                                    %
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="5" 
                                        CssClass="defaultFormElementStyleRightAligned" Text='<%# Bind("ClassColor") %>'></asp:TextBox>
                                    %
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Next Class" SortExpression="Remark2">
                                <ItemTemplate>
                                    <asp:Label ID="Label4b" runat="server" Text='<%# Bind("Remark2") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlEditPromotionClass" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("Remark2") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
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
                        DeleteCommand="STP_METADATA_DELETE_TEMPClass" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPClass" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPClass" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPClass" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ClassId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ClassId" Type="Int32" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="ClassAlias" Type="String" />
                            <asp:Parameter Name="ClassColor" Type="String" />
                            <asp:Parameter Name="Teacher" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ClassId" Type="Int32" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="ClassAlias" Type="String" />
                            <asp:Parameter Name="ClassColor" Type="String" />
                            <asp:Parameter Name="Teacher" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlProgrammes" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ProgrammeName], [ProgrammeName] + ' (' + [ProgrammeAlias] + ')' AS ProgrammeAlias FROM [TEMPProgramme] ORDER BY [ProgrammeAlias]">
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
