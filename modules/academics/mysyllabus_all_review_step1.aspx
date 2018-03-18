<%@ Page Language="VB" AutoEventWireup="false" CodeFile="mysyllabus_all_review_step1.aspx.vb" Inherits="modules_academics_mysyllabus_all_review_step1" %>

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
        <table width="1000"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td align="left" valign="bottom" width="700">
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    
                    Text=""></asp:Label></td>
            <td align="right" valign="bottom">
                <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" AutoPostBack="True" CssClass="defaultFormElementStyle" DataSourceID="dsSqlSessions" DataTextField="SessionName" DataValueField="SessionAlias">
                    <asp:ListItem Value="0">Change the active session...</asp:ListItem>
                </asp:DropDownList>
              </td>
          </tr>
          <tr>
            <td colspan="2">
            
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsSqlTeachers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="100%" 
                        SelectedIndex="0" EnableModelValidation="True" 
                    EmptyDataText="No subject(s) found." >
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="S/N">
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text="<%# serial + 1 %>"></asp:Label>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Right" />
                    <ItemStyle HorizontalAlign="Right" Width="30px" />
                </asp:TemplateField>
                <asp:BoundField DataField="ClassName" HeaderText="Class" 
                    ReadOnly="True" SortExpression="ClassName" />
                <asp:TemplateField HeaderText="Review&lt;br /&gt;Lesson Notes">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1a" runat="server" 
                            NavigateUrl='<%# "mysyllabus_all_review.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString & "&b=1st Term" & "&c=" & sessionName %>' Font-Bold="True">1st Term &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Review&lt;br /&gt;Lesson Notes">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1b" runat="server" 
                            NavigateUrl='<%# "mysyllabus_all_review.aspx?a=" & DataBinder.Eval(Container.DataItem, "ClassName").ToString & "&b=2nd Term" & "&c=" & sessionName%>' Font-Bold="True">2nd Term &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Review&lt;br /&gt;Lesson Notes">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1c" runat="server" 
                            NavigateUrl='<%# "mysyllabus_all_review.aspx?a=" & DataBinder.Eval(Container.DataItem, "ClassName").ToString & "&b=3rd Term" & "&c=" & sessionName%>' Font-Bold="True">3rd Term &gt;&gt;</asp:HyperLink>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
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
        <asp:SqlDataSource ID="dsSqlTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="  ">
        </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlSessions" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="SELECT [SessionName] + ' Session' as SessionName, [SessionAlias] FROM [TEMPSession] ORDER BY SessionName DESC"></asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
