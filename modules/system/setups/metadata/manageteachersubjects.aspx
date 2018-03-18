<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manageteachersubjects.aspx.vb" Inherits="modules_system_setups_metadata_manageteachersubjects" %>

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
                    &nbsp;<asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Assign a New Subject to a Teacher"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" 
                        CssClass="noBorderedMenuTable" DefaultMode="Insert" Height="50px" Width="600px" 
                        DataSourceID="dsSqlTeacherSubjects" CellPadding="4" ForeColor="#333333" 
                        GridLines="None" EnableModelValidation="True">
                        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <EditRowStyle Wrap="True" />
                        <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                        <CommandRowStyle BackColor="#FFFFC0" Font-Bold="True" />
                        <RowStyle HorizontalAlign="Left" VerticalAlign="Top" Wrap="True" 
                            BackColor="#FFFBD6" ForeColor="#333333" />
                        <FieldHeaderStyle BackColor="#FFFF99" Font-Bold="True" />
                        <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                        <Fields>
                            <asp:TemplateField HeaderText="UserSubjectId" SortExpression="UserSubjectId" 
                                InsertVisible="False">
                                <EditItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("UserSubjectId") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("UserSubjectId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Teacher:" SortExpression="UserId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("UserId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList1" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlUsernames" 
                                        DataTextField="Username" DataValueField="UserId" 
                                        SelectedValue='<%# Bind("UserId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlUsernames" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [UserId], [Username] FROM [Core_User] ORDER BY [Username]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("UserId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class:" SortExpression="ClassName">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("ClassName") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList3" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlClasses" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [ClassName] FROM [TEMPClass] ORDER BY [ClassName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectId">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("SubjectId") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="DropDownList2" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectName" DataValueField="SubjectId" 
                                        SelectedValue='<%# Bind("SubjectId") %>'>
                                    </asp:DropDownList>
                                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                                        SelectCommand="SELECT [SubjectId], [SubjectName] FROM [TEMPSubject] ORDER BY [SubjectName]">
                                    </asp:SqlDataSource>
                                </InsertItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("SubjectId") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Assign Selected Subject to the Selected Teacher" />
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
                    &nbsp;
                    <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text=":: Edit Existing Teachers &amp; Their Assigned Subjects"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        AutoGenerateDeleteButton="True" AutoGenerateSelectButton="True" CssClass="noBorderedMenuTable"
                        DataSourceID="dsSqlTeacherSubjects" DataKeyNames="UserSubjectId" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" Width="100%" 
                        EnableModelValidation="True">
                        <Columns>
                            <asp:BoundField DataField="UserSubjectId" HeaderText="Id" 
                                SortExpression="UserSubjectId" InsertVisible="False" ReadOnly="True" />
                            <asp:BoundField DataField="Username" HeaderText="Teacher" 
                                SortExpression="Username" />
                            <asp:BoundField DataField="ClassName" HeaderText="Class" 
                                SortExpression="ClassName" />
                            <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                                SortExpression="SubjectName" />
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
                    <asp:SqlDataSource ID="dsSqlTeacherSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPUserSubject" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPUserSubject" InsertCommandType="StoredProcedure"
                        SelectCommand="STP_METADATA_SELECTALL_TEMPUserSubject" SelectCommandType="StoredProcedure"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPUserSubject" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
<%--                            <asp:Parameter Direction="ReturnValue" Name="RETURN_VALUE" Type="Int32" />
--%>                            
                            <asp:Parameter Name="UserSubjectId" Type="Int32" />
                        </DeleteParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="UserSubjectId" Type="Int32" />
                            <asp:Parameter Name="UserId" Type="Int32" />
                            <asp:Parameter Name="SubjectId" Type="Int32" />
                            <asp:Parameter Name="ClassName" Type="String" />
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="UserSubjectId" Type="Int32" />
                            <asp:Parameter Name="UserId" Type="Int64" />
                            <asp:Parameter Name="SubjectId" Type="Int32" />
                            <asp:Parameter Name="ClassName" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    &nbsp; &nbsp;&nbsp;
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
