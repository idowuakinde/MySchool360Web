<%@ Page Language="VB" AutoEventWireup="false" CodeFile="managevirtualclassroomreplies.aspx.vb" Inherits="modules_system_setups_metadata_managevirtualclassroomreplies" %>

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
                        
                        Text=":: View/Edit Various Students' Replies to Your Online Assignment (Most Recent First)"></asp:Label></td>
            </tr>
            <tr>
                <td width="1%">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:Label ID="Label13" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text="Selected Assignment:"></asp:Label>&nbsp;<asp:DropDownList 
                        ID="DropDownList1" runat="server" CssClass="defaultFormElementStyle" 
                        DataSourceID="dsSqlSelectedResource" DataTextField="ResourceDescription" 
                        DataValueField="ResourceId">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:GridView ID="gvUsers" runat="server" AllowSorting="True" AutoGenerateColumns="False"
                        CssClass="noBorderedMenuTable" DataKeyNames="ReplyId" 
                        DataSourceID="dsSqlVCReplies" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" 
                        Width="1200px" EnableModelValidation="True" 
                        
                        EmptyDataText="No results to show. &lt;br /&gt;&amp;nbsp;&lt;br /&gt;In other words, no one has replied to this assignment.">
                        <Columns>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:HyperLink ID="hlnkDownload" runat="server" Height="16px" 
                                        ImageUrl="~/images/download2.jpg" Target="_blank">HyperLink</asp:HyperLink>
                                    <br />
                                    <br />
                                    <br />
                                </ItemTemplate>
                                <ItemStyle Width="20px" HorizontalAlign="Center" VerticalAlign="Top" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="SN" InsertVisible="False">
                                <ItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="Label10" runat="server" Text='<%# serial + 1 %>'></asp:Label>
                                </EditItemTemplate>
                                <HeaderStyle HorizontalAlign="Right" />
                                <ItemStyle Width="20px" HorizontalAlign="Right" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Timestamp" 
                                SortExpression="ReplyTimeStamp">
                                <EditItemTemplate>
                                    <asp:Label ID="Label12" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "ReplyTimeStamp"), Date)) %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label4" runat="server" 
                                        Text='<%# Common.GetFriendlyDate(CType(Databinder.Eval(Container.DataItem, "ReplyTimeStamp"), Date)) %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="100px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Student" SortExpression="StudentDescription">
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox1" runat="server" 
                                        Text='<%# Bind("StudentDescription") %>'></asp:TextBox>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label6" runat="server" Text='<%# Bind("StudentDescription") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Resource" SortExpression="ResourceId">
                                <EditItemTemplate>
                                    <asp:DropDownList ID="DropDownList1b" runat="server" 
                                        CssClass="defaultFormElementStyle" DataSourceID="dsSqlSelectedResource" 
                                        DataTextField="ResourceDescription" DataValueField="ResourceId" 
                                        SelectedValue='<%# Bind("ResourceId") %>'>
                                    </asp:DropDownList>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label2" runat="server" Text='<%# Eval("ResourceDescription") %>'></asp:Label>
                                </ItemTemplate>
                                <ItemStyle Width="200px" />
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Message" SortExpression="ReplyText">
                                <ItemTemplate>
                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("ReplyText") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox2" runat="server" 
                                        Text='<%# Bind("ReplyText") %>' Columns="70" 
                                        CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Remarks" 
                                SortExpression="ReplyRemarks">
                                <ItemTemplate>
                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("ReplyRemarks") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="TextBox4" runat="server" 
                                        Text='<%# Bind("ReplyRemarks") %>' Columns="40" 
                                        CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                </EditItemTemplate>
                                <ItemStyle Width="150px" />
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
                    <asp:SqlDataSource ID="dsSqlVCReplies" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        DeleteCommand="STP_METADATA_DELETE_TEMPVirtualClassroomResourceReply" DeleteCommandType="StoredProcedure"
                        InsertCommand="STP_METADATA_INSERT_TEMPVirtualClassroomResourceReply" InsertCommandType="StoredProcedure"
                        SelectCommand="SELECT [ReplyId], a.[ResourceId], IsNull(ResourceTitle, '') + ' (' + IsNull(TopicArea, '') + ')' AS ResourceDescription, [ReplyText], [ReplyTimeStamp], [ReplyRemarks], a.[Remark1], a.[Remark2], c.MatricNumber as PortalNumber, c.FullName, c.Class, c.Sex as Gender, c.FullName + ' (' + c.MatricNumber + ', ' + c.Class + ', ' + c.Sex + ')' as StudentDescription, a.[Remark3] FROM [dbo].[TEMPVirtualClassroomResourceReply] a INNER JOIN dbo.TEMPVirtualClassroomResource b ON a.ResourceId = b.ResourceId INNER JOIN dbo.VW_StudentProfiles c ON a.Remark2 = c.MatricNumber WHERE a.ResourceId = @ResourceId ORDER BY ReplyTimeStamp DESC"
                        UpdateCommand="STP_METADATA_UPDATE_TEMPVirtualClassroomResourceReply" 
                        UpdateCommandType="StoredProcedure">
                        <DeleteParameters>
                            <asp:Parameter Name="ReplyId" Type="Int32" />
                        </DeleteParameters>
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ResourceId" QueryStringField="a" />
                        </SelectParameters>
                        <UpdateParameters>
                            <asp:Parameter Name="ReplyId" Type="Int32" />
                            <asp:Parameter Name="ResourceId" Type="Int32" />
                            <asp:Parameter Name="ReplyText" Type="String" />
                            <%--<asp:Parameter Name="ReplyTimeStamp" Type="DateTime" />--%>
                            <asp:Parameter Name="ReplyRemarks" Type="String" />
                            <%--<asp:Parameter Name="Remark1" Type="String" />--%>
                            <%--<asp:Parameter Name="Remark2" Type="String" />--%>
                            <%--<asp:Parameter Name="Remark3" Type="String" />--%>
                        </UpdateParameters>
                        <InsertParameters>
                            <asp:Parameter Direction="InputOutput" Name="ReplyId" 
                                Type="Int32" />
                            <asp:Parameter Name="ResourceId" Type="Int32" />
                            <asp:Parameter Name="ReplyText" Type="String" />
                            <asp:Parameter Name="ReplyTimeStamp" Type="DateTime" />
                            <asp:Parameter Name="ReplyRemarks" Type="String" />
                            <asp:Parameter Name="Remark1" Type="String" />
                            <asp:Parameter Name="Remark2" Type="String" />
                            <asp:Parameter Name="Remark3" Type="String" />
                        </InsertParameters>
                    </asp:SqlDataSource>
                    <asp:SqlDataSource ID="dsSqlSelectedResource" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                        SelectCommand=" SELECT [ResourceId], [ResourceTitle], [TopicArea], IsNull(ResourceTitle, '') + ' (' + IsNull(TopicArea, '') + ')' AS ResourceDescription FROM [TEMPVirtualClassroomResource] WHERE ([ResourceId] = @ResourceId) ORDER BY [ResourceTitle] ">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="ResourceId" QueryStringField="a" />
                        </SelectParameters>
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
