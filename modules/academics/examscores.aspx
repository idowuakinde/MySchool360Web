<%@ Page Language="VB" AutoEventWireup="false" CodeFile="examscores.aspx.vb" Inherits="modules_academics_examscores" %>

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
            <td colspan="2"><asp:Label CssClass="pageHeaderStyleAMMA" Font-Bold="True" Font-Size="Small" ID="Label10" runat="server" Text=":: My Exam Scores"></asp:Label></td>
          </tr>
          <tr>
            <td></td>
            <td></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><table width="100%" border="0">
              <tr>
                <td width="33%" valign="top"><asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="ScoreId" DataSourceID="dsSqlAcadProfile" Width="300px" EmptyDataText="No data." ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ScoreId" Visible="False" />
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" SortExpression="MatricNumber"
                            Visible="False" />
                        <asp:TemplateField HeaderText="Subject" SortExpression="SubjectName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Overall Average Score:"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle HorizontalAlign="Right" Font-Bold="True" />
                        </asp:TemplateField>
                       <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" DataFormatString="{0:F0}%" >
                           <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                           <HeaderStyle HorizontalAlign="Right" />
                           <ItemStyle HorizontalAlign="Right" />
                       </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                  <asp:SqlDataSource ID="dsSqlAcadProfile" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [ScoreId], [Term], [MatricNumber], [SubjectName], [Score] FROM [VW_StudentProfilesAcad] WHERE (([MatricNumber] = @MatricNumber) AND ([Term] = @Term))">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" />
                        <asp:Parameter DefaultValue="Term 1" Name="Term" />
                    </SelectParameters>
                  </asp:SqlDataSource>
                </td>
                <td width="33%" valign="top"><asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="ScoreId" DataSourceID="dsSqlAcad2" Width="300px" EmptyDataText="No data." ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ScoreId" Visible="False" />
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" SortExpression="MatricNumber"
                            Visible="False" />
                        <asp:TemplateField HeaderText="Subject" SortExpression="SubjectName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Overall Average Score:"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Score" DataFormatString="{0:F0}%" HeaderText="Score" SortExpression="Score" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlAcad2" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [ScoreId], [Term], [MatricNumber], [SubjectName], [Score] FROM [VW_StudentProfilesAcad] WHERE (([MatricNumber] = @MatricNumber) AND ([Term] = @Term))">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                            <asp:Parameter DefaultValue="Term 2" Name="Term" Type="String" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </td>
                <td valign="top"><asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" CssClass="borderedTableGrey"
                    DataKeyNames="ScoreId" DataSourceID="dsSqlAcad3" Width="300px" EmptyDataText="No data." ShowFooter="True">
                    <Columns>
                        <asp:BoundField DataField="ScoreId" HeaderText="ScoreId" InsertVisible="False" ReadOnly="True"
                            SortExpression="ScoreId" Visible="False" />
                        <asp:BoundField DataField="Term" HeaderText="Term" ReadOnly="True" SortExpression="Term" />
                        <asp:BoundField DataField="MatricNumber" HeaderText="MatricNumber" SortExpression="MatricNumber"
                            Visible="False" />
                        <asp:TemplateField HeaderText="Subject" SortExpression="SubjectName">
                            <EditItemTemplate>
                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:TextBox>
                            </EditItemTemplate>
                            <FooterTemplate>
                                <asp:Label ID="Label3" runat="server" Text="Overall Average Score:"></asp:Label>
                            </FooterTemplate>
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("SubjectName") %>'></asp:Label>
                            </ItemTemplate>
                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:TemplateField>
                        <asp:BoundField DataField="Score" DataFormatString="{0:F0}%" HeaderText="Score" SortExpression="Score" >
                            <HeaderStyle HorizontalAlign="Right" />
                            <ItemStyle HorizontalAlign="Right" />
                            <FooterStyle Font-Bold="True" HorizontalAlign="Right" />
                        </asp:BoundField>
                    </Columns>
                    <HeaderStyle BackColor="Black" Font-Bold="False" ForeColor="White" HorizontalAlign="Left" />
                </asp:GridView>
                    <asp:SqlDataSource ID="dsSqlAcad3" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon_School %>"
                    SelectCommand="SELECT [ScoreId], [Term], [MatricNumber], [SubjectName], [Score] FROM [VW_StudentProfilesAcad] WHERE (([MatricNumber] = @MatricNumber) AND ([Term] = @Term))">
                        <SelectParameters>
                            <asp:QueryStringParameter Name="MatricNumber" QueryStringField="a" Type="String" />
                            <asp:Parameter DefaultValue="Term 3" Name="Term" Type="String" />
                    </SelectParameters>
                  </asp:SqlDataSource></td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
