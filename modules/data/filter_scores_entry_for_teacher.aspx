<%@ Page Language="VB" AutoEventWireup="false" CodeFile="filter_scores_entry_for_teacher.aspx.vb" Inherits="modules_data_filter_scores_entry_for_teacher" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../inc_functions_js.js"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: Please click a subject that you teach below:"></asp:Label></td>
          </tr>
          <tr>
            <td>
            
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="UserSubjectId" DataSourceID="dsSqlTeacherSubjects" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="960px" EnableModelValidation="True" 
                    EmptyDataText="No subject(s) found." >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" />
                    <ItemStyle HorizontalAlign="Center" Width="30px" />
                </asp:TemplateField>
                <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                    SortExpression="SubjectName" />
                <asp:TemplateField HeaderText="Class" SortExpression="ClassName">
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("ClassName") %>'></asp:Label>
                        <br /><br />
                        <asp:Label ID="Label2e" runat="server" Text='Approval Status:'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Term 1">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" Font-Bold="True" NavigateUrl='<%# Common.GetDataEntryPage(Databinder.Eval(Container.DataItem, "ClassName").ToString, "1st Term") & "?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>Before Mid-Term</asp:HyperLink>
                        <br /><br />
                        <asp:Label ID="Label2" runat="server" Text='<%# Common.IsBatchApproved(Databinder.Eval(Container.DataItem, "ClassName").ToString, Databinder.Eval(Container.DataItem, "ShortName").ToString, sessionName, "1st Term") %>'></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle Height="40px" />
                    <ItemStyle Width="100px" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Term 1">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1b" runat="server" Font-Bold="True" NavigateUrl='<%# Common.GetDataEntryPage2(Databinder.Eval(Container.DataItem, "ClassName").ToString, "1st Term") & "?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>After Mid-Term</asp:HyperLink>
                        
                         <br /><br />
                        <asp:Label ID="Label2c" runat="server" Text='<%# Common.IsBatch2Approved(Databinder.Eval(Container.DataItem, "ClassName").ToString, Databinder.Eval(Container.DataItem, "ShortName").ToString, sessionName, "1st Term") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Term 2">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlnk2ndTermBefore" runat="server" Font-Bold="True" NavigateUrl='<%# Common.GetDataEntryPage(Databinder.Eval(Container.DataItem, "ClassName").ToString, "2nd Term") & "?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>Before Mid-Term</asp:HyperLink>
                        <br /><br />
                        <asp:Label ID="lbl2ndTermBefore" runat="server" Text='<%# Common.IsBatchApproved(Databinder.Eval(Container.DataItem, "ClassName").ToString, Databinder.Eval(Container.DataItem, "ShortName").ToString, sessionName, "2nd Term") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Term 2">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1c" runat="server" Font-Bold="True" NavigateUrl='<%# Common.GetDataEntryPage2(Databinder.Eval(Container.DataItem, "ClassName").ToString, "2nd Term") & "?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>After Mid-Term</asp:HyperLink>
                        
                         <br /><br />
                        <asp:Label ID="Label2d" runat="server" Text='<%# Common.IsBatch2Approved(Databinder.Eval(Container.DataItem, "ClassName").ToString, Databinder.Eval(Container.DataItem, "ShortName").ToString, sessionName, "2nd Term") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Term 3">
                    <ItemTemplate>
                        <asp:HyperLink ID="hlnk3rdTermBefore" runat="server" Font-Bold="True" NavigateUrl='<%# Common.GetDataEntryPage(Databinder.Eval(Container.DataItem, "ClassName").ToString, "3rd Term") & "?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>Before Mid-Term</asp:HyperLink>
                        <br /><br />
                        <asp:Label ID="lbl3rdTermBefore" runat="server" Text='<%# Common.IsBatchApproved(Databinder.Eval(Container.DataItem, "ClassName").ToString, Databinder.Eval(Container.DataItem, "ShortName").ToString, sessionName, "3rd Term") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" VerticalAlign="Top" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Term 3">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1f" runat="server" Font-Bold="True" NavigateUrl='<%# Common.GetDataEntryPage2(Databinder.Eval(Container.DataItem, "ClassName").ToString, "3rd Term") & "?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>After Mid-Term</asp:HyperLink>
                        
                         <br /><br />
                        <asp:Label ID="lbl3rdTermAfter" runat="server" Text='<%# Common.IsBatch2Approved(Databinder.Eval(Container.DataItem, "ClassName").ToString, Databinder.Eval(Container.DataItem, "ShortName").ToString, sessionName, "3rd Term") %>'></asp:Label>
                    </ItemTemplate>
                    <ItemStyle Width="100px" VerticalAlign="Top" />
                </asp:TemplateField>
           </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Middle" BackColor="#FFFBD6" 
                ForeColor="#333333" Height="30px" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsSqlTeacherSubjects" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                        SelectCommand=" SELECT [UserSubjectId], a.[UserId], b.Username, a.[SubjectId], c.SubjectName, c.ShortName, a.[ClassName] FROM [dbo].[TEMPUserSubject] a INNER JOIN dbo.Core_User b ON a.UserId = b.UserId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId INNER JOIN dbo.TEMPClass d ON a.ClassName = d.ClassName WHERE b.Username = @Username ORDER BY ListingOrder, a.ClassName, c.SubjectName ">
            <SelectParameters>
                <asp:QueryStringParameter Name="Username" QueryStringField="a" />
            </SelectParameters>
        </asp:SqlDataSource>
            
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
