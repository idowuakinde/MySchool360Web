<%@ Page Language="VB" AutoEventWireup="false" CodeFile="subjectentry_exams_form_maths.aspx.vb" Inherits="modules_academics_subjectentry_exams_form_maths" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="../../inc_functions_js.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>
</head>
<body topmargin="20" leftmargin="20">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
          <tr>
            <td colspan="2"><asp:Label CssClass="pageHeaderStyleAMMA" Font-Bold="True" Font-Size="Small" ID="Label10" runat="server" Text=":: Data Entry - Online Form - MATHEMATICS"></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataSourceID="dsSqlExamForm" EmptyDataText="No data." Width="1000px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" 
                    EnableModelValidation="True">
                    <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                        ForeColor="#333333" />
                    <Columns>
                        <asp:TemplateField HeaderText="S/N">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text="<%# serialNumber %>"></asp:Label>
                            </ItemTemplate>
                             <ItemStyle Width="20px" />
                       </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <a href="<%# "javascript:window.open('photo_zoom.aspx?a=" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" %>">
                                    <asp:Image ID="Image1" runat="server" Height="30px" ToolTip="Click to enlarge." 
                                    ImageUrl='<%# Common.ShowPhotograph("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & ".jpg", Server.MapPath("..\..\images\pp\" & Databinder.Eval(Container.DataItem, "MatricNumber").ToString & ".jpg")) %>' 
                                    Width="30px" BorderColor="Black" BorderStyle="Solid" BorderWidth="2px" />
                                </a>
                            </ItemTemplate>
                            <ItemStyle Width="60px" HorizontalAlign="Center" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="FullName" HeaderText="Student's Name" SortExpression="FullName" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="Portal Number" SortExpression="MatricNumber" />
                        <asp:BoundField DataField="StudentLevel" HeaderText="Class" SortExpression="StudentLevel" />
                        <asp:TemplateField HeaderText="Maths">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject Teacher's Comments">
                            <ItemTemplate>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr valign="top">
                                        <td width="310">
                                        <asp:TextBox ID="txtAddSubjectComment" runat="server" Columns="50" 
                                                CssClass="defaultFormElementStyle" Rows="5" TextMode="MultiLine"></asp:TextBox>
                                        &nbsp;</td>
                                        <td width="310">
                                            <font color="red"><strong>Double-click a comment below...</strong></font><br />
                                        <asp:ListBox ID="lstCommentSelector" runat="server" 
                                                CssClass="defaultFormElementStyle" DataSourceID="dsSqlAddCommentSelector" 
                                                DataTextField="CommentText" DataValueField="CommentText" Rows="10" 
                                                Width="300px" onchange="javascript:CopyStandardComment(this, GridView2_ctl02_txtAddSubjectComment);"></asp:ListBox>
                                            &nbsp;</td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                    <HeaderStyle BackColor="#990000" ForeColor="White" HorizontalAlign="Left" 
                        Font-Bold="True" />
                    <AlternatingRowStyle BackColor="White" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlExamForm" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT CustomerName as [FullName] , CustomerCode AS MatricNumber, DistrictCode as [StudentLevel] FROM dbo.TEMPCustomers WHERE (DistrictCode = @StudentLevel) ORDER BY MatricNumber">
                    <SelectParameters>
                        <asp:QueryStringParameter DefaultValue="" Name="StudentLevel" 
                            QueryStringField="a" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="dsSqlAddCommentSelector" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="SELECT [CommentId], [CommentText] FROM [TEMPComments] WHERE ([Activated] = @Activated)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="True" Name="Activated" Type="Boolean" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;</td>
          </tr>
            <tr>
                <td colspan="2">
                    <input id="Button1" type="button" value="Submit >" class="defaultButtonStyle" /></td>
            </tr>
            <tr>
                <td colspan="2">
                </td>
            </tr>
      </table>
      </div>
    </form>
</body>
</html>
