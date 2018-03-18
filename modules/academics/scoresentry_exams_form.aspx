<%@ Page Language="VB" AutoEventWireup="false" CodeFile="scoresentry_exams_form.aspx.vb" Inherits="modules_academics_scoresentry_exams_form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
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
            <td colspan="2"><asp:Label CssClass="pageHeaderStyleAMMA" Font-Bold="True" Font-Size="Small" ID="Label10" runat="server" Text=":: Exam Results Data Entry - Online Form"></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataSourceID="dsSqlExamForm" EmptyDataText="No data." Width="1200px" 
                    CellPadding="4" ForeColor="#333333" GridLines="None">
                    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                    <Columns>
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
                        <asp:TemplateField HeaderText="English">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Social Studies">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Geography">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Science">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="History">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Art">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Rel. Educ.">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Phys. Educ.">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Music">
                            <ItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Columns="5" CssClass="defaultFormElementStyle"></asp:TextBox>
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
                    SelectCommand="SELECT CustomerName as [FullName] , CustomerCode AS MatricNumber, DistrictCode as [StudentLevel] FROM dbo.TEMPCustomers WHERE (DistrictCode = @StudentLevel) ORDER BY FullName">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="IFY" Name="StudentLevel" Type="String" />
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
