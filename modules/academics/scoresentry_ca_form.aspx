<%@ Page Language="VB" AutoEventWireup="false" CodeFile="scoresentry_ca_form.aspx.vb" Inherits="modules_academics_scoresentry_ca_form" %>

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
            <td colspan="2"><asp:Label CssClass="pageHeaderStyleAMMA" Font-Bold="True" Font-Size="Small" ID="Label10" runat="server" Text=":: Continuous Assessments Data Entry - Online Form"></asp:Label></td>
          </tr>
          <tr>
            <td colspan="2">
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataSourceID="dsSqlExamForm" EmptyDataText="No data." Width="1200px">
                    <Columns>
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
                    <HeaderStyle BackColor="Black" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlExamForm" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT TOP 30 [FullName] , substring([MatricNumber],6,5) AS MatricNumber, [StudentLevel] FROM [VW_EXAM_RESULTS] WHERE ([StudentLevel] = @StudentLevel) ORDER BY FullName">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="JSS2" Name="StudentLevel" Type="String" />
                    </SelectParameters>
                </asp:SqlDataSource>
                &nbsp;</td>
          </tr>
            <tr>
                <td colspan="2">
                    <input id="Button1" class="loginButtonStyle" type="button" value="Submit >" /></td>
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
