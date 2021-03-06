﻿<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageprogrammes.aspx.vb" Inherits="modules_system_setups_metadata_manageprogrammes" %>

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
                        Text=":: Add a New Programme"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlProgrammes" DefaultMode="Insert" Height="50px" 
                        Width="600px" CellPadding="4" ForeColor="#333333" GridLines="None" 
                        DataKeyNames="ProgrammeId" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:BoundField DataField="ProgrammeId" HeaderText="ProgrammeId:" InsertVisible="False"
                                ReadOnly="True" SortExpression="ProgrammeId" />
                            <asp:TemplateField HeaderText="Programme Abbr.:" SortExpression="ProgrammeName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("ProgrammeName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ProgrammeName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddProgramme" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ProgrammeName") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddProgramme" runat="server" 
                                        ControlToValidate="txtAddProgramme" ErrorMessage="*Required" Font-Bold="True" 
                                        ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme Full Name:" SortExpression="ProgrammeAlias">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProgrammeAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("ProgrammeAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="txtAddProgrammeAlias" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ProgrammeAlias") %>' 
                                        ValidationGroup="vgInsert"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="vldAddProgrammeAlias" runat="server" 
                                        ControlToValidate="txtAddProgrammeAlias" ErrorMessage="*Required" 
                                        Font-Bold="True" ValidationGroup="vgInsert"></asp:RequiredFieldValidator>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ProgrammeColor" HeaderText="Programme Color:" 
                                SortExpression="ProgrammeColor" Visible="False" />
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
                            <asp:BoundField DataField="Remarks" HeaderText="Remarks:" 
                                SortExpression="Remarks" Visible="False" />
                            <asp:CommandField ButtonType="Button" InsertText="Add New Programme" 
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
                        Text=":: Edit Existing Programmes"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" 
                        AutoGenerateColumns="False" CssClass="noBorderedMenuTable"
                        DataKeyNames="ProgrammeId" DataSourceID="dsSqlProgrammes" 
                        CellPadding="4" ForeColor="#333333" GridLines="None" Width="1000px" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" 
                                ShowSelectButton="True" >
                            <ItemStyle Width="100px" />
                            </asp:CommandField>
                            <asp:BoundField DataField="ProgrammeId" HeaderText="Id" InsertVisible="False"
                                ReadOnly="True" SortExpression="ProgrammeId" >
                            <ItemStyle Width="50px" />
                            </asp:BoundField>
                            <asp:TemplateField HeaderText="Programme Abbr." SortExpression="ProgrammeName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Columns="30" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ProgrammeName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ProgrammeName") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Programme Full Name" SortExpression="ProgrammeAlias">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Text='<%# Bind("ProgrammeAlias") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ProgrammeAlias") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="300px" />
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
                    <asp:SqlDataSource ID="dsSqlProgrammes" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPProgramme" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPProgramme" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPProgramme" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPProgramme" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ProgrammeId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ProgrammeId" Type="Int32" />
                            <asp:Parameter Name="ProgrammeName" Type="String" />
                            <asp:Parameter Name="ProgrammeAlias" Type="String" />
                            <asp:Parameter Name="ProgrammeColor" Type="String" />
                            <asp:Parameter Name="Teacher" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ProgrammeId" Type="Int32" />
                            <asp:Parameter Name="ProgrammeName" Type="String" />
                            <asp:Parameter Name="ProgrammeAlias" Type="String" />
                            <asp:Parameter Name="ProgrammeColor" Type="String" />
                            <asp:Parameter Name="Teacher" Type="String" />
                            <asp:Parameter Name="Remarks" Type="String" />
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
