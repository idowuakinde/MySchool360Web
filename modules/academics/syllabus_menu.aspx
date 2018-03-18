<%@ Page Language="VB" AutoEventWireup="false" CodeFile="syllabus_menu.aspx.vb" Inherits="modules_academics_syllabus_menu" %>

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
                    Text=":: Current Session"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" 
                        NavigateUrl="" 
                        Target="operationFrame"><strong>1ST TERM</strong> Lesson Notes</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink2" runat="server" 
                        NavigateUrl="" 
                        Target="operationFrame"><strong>2ND TERM</strong> Lesson Notes</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3" runat="server" 
                        NavigateUrl="" 
                        Target="operationFrame"><strong>3RD TERM</strong> Lesson Notes</asp:HyperLink></td>
              </tr>
              </table>
            </td>
          </tr>
          <tr>
            <td>
                &nbsp;</td>
          </tr>
          <tr>
            <td>
                                        <hr width="100%" noshade="noshade" color="black" />
            </td>
          </tr>
          <tr>
            <td>
                &nbsp;</td>
          </tr>
          <tr>
            <td>
                <asp:Label ID="lblHeader0" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: From Previous Sessions"></asp:Label>
            </td>
          </tr>
          <tr>
            <td>
                <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False" 
                        DataKeyNames="SessionAlias" DataSourceID="dsSqlSessions" Width="100%" 
                        EmptyDataText="No subjects to display." 
                        EnableModelValidation="True" ShowHeader="False" CellPadding="4" 
                        ForeColor="#333333" GridLines="None" BorderColor="#CCCCCC" 
                    BorderStyle="Solid" BorderWidth="1px" >
                    <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:TemplateField HeaderText="Session" SortExpression="SessionAlias">
                        <ItemTemplate>
                            <asp:Label ID="Label12" runat="server" Text='<%# Bind("SessionAlias") %>' Font-Bold="True"></asp:Label>
                            <br />
                            &nbsp;<br />
                            <table width="100%">
                                <tr>
                                    <td>
                                        <a target="operationFrame" href='managesyllabus_1.aspx?a=<%# username %>&c=<%# Eval("SessionAlias") %>'><strong>1ST TERM</strong> Lesson Notes</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a target="operationFrame" href='managesyllabus_2.aspx?a=<%# username %>&c=<%# Eval("SessionAlias") %>'><strong>2ND TERM</strong> Lesson Notes</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <a target="operationFrame" href='managesyllabus.aspx?a=<%# username %>&c=<%# Eval("SessionAlias") %>'><strong>3RD TERM</strong> Lesson Notes</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                        ForeColor="#333333" />
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle 
                    HorizontalAlign="Left" BackColor="#990000" Font-Bold="True" 
                        ForeColor="White" />
                <EditRowStyle CssClass="defaultFormElementStyle" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            </asp:GridView>
                <asp:SqlDataSource ID="dsSqlSessions" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>" SelectCommand="SELECT [SessionName] + ' Session' as SessionName, [SessionAlias] FROM [TEMPSession] WHERE CurrentSession <> 'Y' ORDER BY SessionName DESC"></asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
