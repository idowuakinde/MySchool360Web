<%@ Page Language="VB" AutoEventWireup="false" CodeFile="principal_comments_subjects_step2.aspx.vb" Inherits="modules_data_principal_comments_subjects_step2" %>

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
                    Text=":: Thank you. <br />&nbsp;&nbsp;&nbsp;&nbsp;The teacher you selected teaches the following subjects. <br />&nbsp;&nbsp;&nbsp;&nbsp;Please click a subject to comment on the scores entered for that subject:"></asp:Label></td>
          </tr>
          <tr>
            <td>
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataKeyNames="UserSubjectId" DataSourceID="dsSqlTeacherSubjects" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="540px" 
                        SelectedIndex="0" EnableModelValidation="True" 
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
                <asp:BoundField DataField="UserSubjectId" HeaderText="UserSubjectId" 
                    InsertVisible="False" ReadOnly="True" SortExpression="UserSubjectId" 
                    Visible="False" />
                <asp:BoundField DataField="UserId" HeaderText="UserId" SortExpression="UserId" 
                    Visible="False" />
                <asp:BoundField DataField="Username" HeaderText="Username" 
                    SortExpression="Username" Visible="False" />
                <asp:BoundField DataField="SubjectId" HeaderText="SubjectId" 
                    SortExpression="SubjectId" Visible="False" />
                <asp:BoundField DataField="SubjectName" HeaderText="Subject" 
                    SortExpression="SubjectName" />
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    SortExpression="ClassName" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# "principal_comments_subjects_step3.aspx?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Comment on Teacher's Scores</asp:HyperLink>
                        <br />
                        <br />
                        <asp:HyperLink ID="HyperLink2" runat="server" Font-Bold="True" NavigateUrl='<%# "principal_reviewteachercomments_subjects.aspx?a=" & Request.Querystring("a") & "&b=" & Databinder.Eval(Container.DataItem, "ShortName").ToString & "&c=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>'>Print Teacher's Scores</asp:HyperLink>
                    </ItemTemplate>
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
                        SelectCommand="SELECT [UserSubjectId], a.[UserId], b.Username, a.[SubjectId], c.SubjectName, c.ShortName, [ClassName] FROM [dbo].[TEMPUserSubject] a INNER JOIN dbo.Core_User b ON a.UserId = b.UserId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId WHERE b.Username = @Username ORDER BY ClassName, c.SubjectName">
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
