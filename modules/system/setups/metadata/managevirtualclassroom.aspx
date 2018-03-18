<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managevirtualclassroom.aspx.vb" Inherits="modules_system_setups_metadata_managevirtualclassroom" %>

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
                        Text=":: Add a New Virtual Classroom Resource"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:DetailsView ID="DetailsView1" runat="server" AutoGenerateRows="False" DataKeyNames="ResourceId"
                        DataSourceID="dsSqlResources" DefaultMode="Insert" 
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
                            <asp:BoundField DataField="ResourceId" HeaderText="Id:" 
                                InsertVisible="False" ReadOnly="True"
                                SortExpression="ResourceId" />
                            <asp:TemplateField HeaderText="Subject:" SortExpression="SubjectShortName">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlSubjects_New" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectDescription" DataValueField="ShortName" 
                                        SelectedValue='<%# Bind("SubjectShortName") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Class:" SortExpression="ClassName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlClassName_New" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Type:" SortExpression="ResourceTypeId">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ResourceTypeId") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:DropDownList ID="ddlResourceType_New" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlResourceTypes" 
                                        DataTextField="ResourceTypeName" DataValueField="ResourceTypeId" 
                                        SelectedValue='<%# Bind("ResourceTypeId") %>'>
                                    </asp:DropDownList>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Topic Area:" SortExpression="TopicArea">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("TopicArea") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("TopicArea") %>' 
                                        Columns="40" CssClass="defaultFormElementStyle"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Title:" SortExpression="ResourceTitle">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ResourceTitle") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("ResourceTitle") %>' 
                                        Columns="40"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource Location:" 
                                SortExpression="ResourceLocation">
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ResourceLocation") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" 
                                        Text='<%# Bind("ResourceLocation") %>' Columns="40"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Upload Something?">
                                <InsertItemTemplate>
                                    <asp:FileUpload ID="fileResource" runat="server" 
                                        CssClass="defaultFormElementStyle" Width="300px" />
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes:" SortExpression="Notes">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                                </ItemTemplate>
                                <InsertItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Columns="50" 
                                        CssClass="defaultFormElementStyle" Rows="5" Text='<%# Bind("Notes") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
                                </InsertItemTemplate>
                            </asp:TemplateField>
                            <asp:CommandField ShowInsertButton="True" ButtonType="Button" 
                                InsertText="Add New Resource" />
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
                        Text=":: Edit Existing Virtual Classroom Resources"></asp:Label></td>
            </tr>
            <tr>
                <td width="3%">
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ResourceId" 
                        DataSourceID="dsSqlResources" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1200px" EnableModelValidation="True" 
                        EmptyDataText="Sorry. No data to show.">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:ImageButton ID="imgbtnDelete" runat="server" CommandName="Delete" 
                                        Height="16px" ImageUrl="~/images/delete.png" 
                                        OnClientClick="return confirm('Are you sure you want to delete this record?');" />
                                </ItemTemplate>
                                <ItemStyle Width="20px" />
                            </asp:TemplateField>
                            <asp:CommandField ShowEditButton="True" >
                            <ItemStyle Width="40px" />
                            </asp:CommandField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlnkDownload" runat="server" Height="32px" 
                                        ImageUrl="~/images/download2.jpg" Target="_blank" Width="32px">HyperLink</asp:HyperLink>
                                    <br />
                                    <asp:HyperLink ID="hlnkReply" runat="server" 
                                        NavigateUrl='<%# "managevirtualclassroomreplies.aspx?a=" & CType(Databinder.Eval(Container.DataItem, "ResourceId"), String) %>'>View Replies</asp:HyperLink>
                                </ItemTemplate>
                                <ItemStyle Width="20px" HorizontalAlign="Center" VerticalAlign="Top" 
                                    Wrap="False" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN" InsertVisible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="50px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Subject &amp; Class" 
                                SortExpression="SubjectShortName">
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("SubjectShortName") %>'></asp:Label>
                                    <br />
                                    <br />
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlSubjects_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSubjects" 
                                        DataTextField="SubjectDescription" DataValueField="ShortName" 
                                        SelectedValue='<%# Bind("SubjectShortName") %>'>
                                    </asp:DropDownList>
                                    <br />
                                    <br />
                                    <asp:DropDownList ID="ddlClassName_Edit" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlClasses" 
                                        DataTextField="ClassName" DataValueField="ClassName" 
                                        SelectedValue='<%# Bind("ClassName") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Type" SortExpression="ResourceTypeName">
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("ResourceTypeName") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:DropDownList ID="ddlResourceType" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlResourceTypes" 
                                        DataTextField="ResourceTypeName" DataValueField="ResourceTypeId" 
                                        SelectedValue='<%# Bind("ResourceTypeId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemStyle Width="50px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Topic Area" SortExpression="TopicArea">
                                <ItemTemplate>
                                    <asp:Label ID="Label7" runat="server" Text='<%# Bind("TopicArea") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox6" runat="server" Columns="30" 
                                        Text='<%# Bind("TopicArea") %>' CssClass="defaultFormElementStyle" 
                                        Rows="4" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Title &amp; Location" 
                                SortExpression="ResourceTitle">
                                <ItemTemplate>
                                    Title:
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ResourceTitle") %>'></asp:Label>
                                    <br />
                                    <br />
                                    Location:
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("ResourceLocation") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    Title:
                                    <asp:TextBox ID="TextBox4" runat="server" Columns="30" 
                                        Text='<%# Bind("ResourceTitle") %>'></asp:TextBox>
                                    <br />
                                    <br />
                                    Location:
                                    <asp:TextBox ID="TextBox5" runat="server" Columns="30" 
                                        Text='<%# Bind("ResourceLocation") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="400px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Notes" SortExpression="Notes">
                                <ItemTemplate>
                                    <asp:Label ID="Label8" runat="server" Text='<%# Bind("Notes") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox7" runat="server" Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="4" Text='<%# Bind("Notes") %>' 
                                        TextMode="MultiLine"></asp:TextBox>
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
                    <asp:SqlDataSource ID="dsSqlResources" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPVirtualClassroomResource" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPVirtualClassroomResource" InsertCommandType="StoredProcedure"
                        SelectCommand=" SELECT DISTINCT [ResourceId], a.[ResourceTypeId], [ResourceTypeName],  [ResourceTitle], [ResourceLocation], [SubjectShortName], a.[ClassName], [TopicArea], [Notes], b.SubjectName, a.[Remark1], a.[Remark2], a.[Remark3] FROM dbo.TEMPVirtualClassroomResource a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName INNER JOIN dbo.TEMPClass f ON a.ClassName = f.ClassName INNER JOIN dbo.TEMPUserSubject c ON b.SubjectId = c.SubjectId AND f.ClassName = c.ClassName INNER JOIN dbo.Core_User d ON c.UserId = d.UserId INNER JOIN dbo.TEMPVirtualClassroomResourceType e ON a.ResourceTypeId = e.ResourceTypeId WHERE d.Username = @Username ORDER BY b.SubjectName "
                        UpdateCommand="STP_METADATA_UPDATE_TEMPVirtualClassroomResource" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ResourceId" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ResourceId" Type="Int32" />
                            <asp:Parameter Name="ResourceTypeId" Type="Int32" />
                            <asp:Parameter Name="ResourceTitle" Type="String" />
                            <asp:Parameter Name="ResourceLocation" Type="String" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="TopicArea" Type="String" />
                            <asp:Parameter Name="Notes" Type="String" />
                            <%--<asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />--%>
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ResourceId" 
                                Type="Int32" />
                            <asp:Parameter Name="ResourceTypeId" Type="Int32" />
                            <asp:Parameter Name="ResourceTitle" Type="String" />
                            <asp:Parameter Name="ResourceLocation" Type="String" />
                            <asp:Parameter Name="SubjectShortName" Type="String" />
                            <asp:Parameter Name="ClassName" Type="String" />
                            <asp:Parameter Name="TopicArea" Type="String" />
                            <asp:Parameter Name="Notes" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlSubjects" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT DISTINCT a.[SubjectId], ShortName + ' (' + SubjectName + ')' AS SubjectDescription, [ShortName] FROM [TEMPSubject] a INNER JOIN dbo.TEMPUserSubject b ON a.SubjectId = b.SubjectId INNER JOIN dbo.Core_User c ON b.UserId = c.UserId WHERE c.Username = @Username ORDER BY [ShortName]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlClasses" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT DISTINCT [ClassId], a.[ClassName] FROM [TEMPClass] a INNER JOIN dbo.TEMPUserSubject b ON a.ClassName = b.ClassName INNER JOIN dbo.Core_User c ON b.UserId = c.UserId WHERE c.UserName = @Username ORDER BY a.[ClassName]">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="Username" QueryStringField="a" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlResourceTypes" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand="SELECT [ResourceTypeId], [ResourceTypeName] FROM [TEMPVirtualClassroomResourceType] ORDER BY [ResourceTypeName]">
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
