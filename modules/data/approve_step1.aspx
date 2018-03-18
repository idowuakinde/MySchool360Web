<%@ Page Language="VB" AutoEventWireup="false" CodeFile="approve_step1.aspx.vb" Inherits="modules_data_approve_step1" %>

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
                    Text=":: All classes are listed below. <br />&nbsp;&nbsp;&nbsp;&nbsp;Please click a class to review the scores obtained by the students in that class."></asp:Label></td>
          </tr>
          <tr>
            <td>
            
        <asp:GridView ID="gvMaster" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsSqlTeachers" AllowSorting="True" 
                    CellPadding="4" ForeColor="#333333" GridLines="None" Width="1230px" 
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
                <asp:TemplateField HeaderText="1st Term&lt;br /&gt;Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1a" runat="server" 
                            NavigateUrl='<%# "approve_step2_1.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Review Results &gt;&gt;</asp:HyperLink>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintBatch1" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintBatch1_Click">Print Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnEmailBatch1" runat="server" Font-Bold="True" 
                            onclick="lbtnEmailBatch1_Click">E-mail Results &gt;&gt;</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="1st Term&lt;br /&gt;After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1b" runat="server" 
                            NavigateUrl='<%# "approve_step2_2.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Review Results &gt;&gt;</asp:HyperLink>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintBatch2" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintBatch2_Click">Print Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnEmailBatch2" runat="server" Font-Bold="True" 
                            onclick="lbtnEmailBatch2_Click">E-mail Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintSkillsBatch1" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintSkillsBatch1_Click">Print Skills Reports &gt;&gt;</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="180px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2nd Term&lt;br /&gt;Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1c" runat="server" 
                            NavigateUrl='<%# "approve_step2_3.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Review Results &gt;&gt;</asp:HyperLink>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintBatch3" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintBatch3_Click">Print Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnEmailBatch3" runat="server" Font-Bold="True" 
                            onclick="lbtnEmailBatch3_Click">E-mail Results &gt;&gt;</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="2nd Term&lt;br /&gt;After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1d" runat="server" 
                            NavigateUrl='<%# "approve_step2_4.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Review Results &gt;&gt;</asp:HyperLink>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintBatch4" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintBatch4_Click">Print Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnEmailBatch4" runat="server" Font-Bold="True" 
                            onclick="lbtnEmailBatch4_Click">E-mail Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintSkillsBatch2" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintSkillsBatch2_Click">Print Skills Reports &gt;&gt;</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="180px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3rd Term&lt;br /&gt;Before Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1e" runat="server" 
                            NavigateUrl='<%# "approve_step2_5.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Review Results &gt;&gt;</asp:HyperLink>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintBatch5" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintBatch5_Click">Print Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnEmailBatch5" runat="server" Font-Bold="True" 
                            onclick="lbtnEmailBatch5_Click">E-mail Results &gt;&gt;</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="3rd Term&lt;br /&gt;After Mid-Term">
                    <ItemTemplate>
                        <asp:HyperLink ID="HyperLink1f" runat="server" 
                            NavigateUrl='<%# "approve_step2_6.aspx?a=" & Databinder.Eval(Container.DataItem, "ClassName").ToString %>' Font-Bold="True">Review Results &gt;&gt;</asp:HyperLink>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintBatch6" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintBatch6_Click">Print Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnEmailBatch6" runat="server" Font-Bold="True" 
                            onclick="lbtnEmailBatch6_Click">E-mail Results &gt;&gt;</asp:LinkButton>
                        <br />
                        <br />
                        <asp:LinkButton ID="lbtnPrintSkillsBatch3" runat="server" Font-Bold="True" 
                            onclick="lbtnPrintSkillsBatch3_Click">Print Skills Reports &gt;&gt;</asp:LinkButton>
                    </ItemTemplate>
                    <ItemStyle Width="180px" />
                </asp:TemplateField>
            </Columns>
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle HorizontalAlign="Left" VerticalAlign="Top" BackColor="#FFFBD6" 
                ForeColor="#333333" Height="30px" />
            <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" 
                HorizontalAlign="Left" />
            <EditRowStyle CssClass="defaultFormElementStyle" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
        </asp:GridView>
        <asp:SqlDataSource ID="dsSqlTeachers" runat="server" ConnectionString="<%$ ConnectionStrings:iTecon %>"
                    SelectCommand="  ">
        </asp:SqlDataSource>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
