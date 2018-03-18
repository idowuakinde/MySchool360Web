<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt_menu_student.aspx.vb" Inherits="modules_reports_rpt_menu_student" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Reports</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style17
        {
            height: 19px;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="100%"  border="0">
  <tr>
    <td valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: My Results</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="2">
      
      <tr>
        <td align="left" valign="top" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td colspan="2" align="left"><strong>1ST TERM:</strong></td>
            </tr>
          <tr>
            <td width="3%" align="center" class="style17">&raquo;</td>
            <td class="style17">
                <span>
                  <asp:HyperLink ID="hlnkTerm1Aggregate0" runat="server" 
                    CssClass="cssHyperLink">Mid-Term Report</asp:HyperLink>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <asp:HyperLink ID="hlnkTerm1Aggregate" runat="server" CssClass="cssHyperLink">Term-End Report</asp:HyperLink>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <asp:HyperLink ID="hlnkTerm1BehaviouralReport" runat="server" CssClass="cssHyperLink">Report</asp:HyperLink>
                </span>
            </td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td colspan="2" align="left"><strong>2ND TERM:</strong></td>
            </tr>
            <tr>
            <td width="3%" align="center" class="style17">&raquo;</td>
            <td class="style17">
                <span>
                  <asp:HyperLink ID="hlnkTerm2Aggregate0" runat="server" 
                    CssClass="cssHyperLink">Mid-Term Report</asp:HyperLink>
                  &nbsp;&nbsp;|&nbsp;&nbsp;
                  <asp:HyperLink ID="hlnkTerm2Aggregate" runat="server" CssClass="cssHyperLink">Term-End Report</asp:HyperLink>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <asp:HyperLink ID="hlnkTerm2BehaviouralReport" runat="server" CssClass="cssHyperLink">Behavioural Report</asp:HyperLink>
                </span>
            </td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td>&nbsp;</td>
            </tr>
            <tr>
            <td colspan="2" align="left"><strong>3RD TERM:</strong></td>
            </tr>
            <tr>
            <td width="3%" align="center" class="style17">&raquo;</td>
            <td class="style17">
                <span>
                  <asp:HyperLink ID="hlnkTerm3Aggregate0" runat="server" 
                    CssClass="cssHyperLink">Mid-Term Report</asp:HyperLink>
                  &nbsp;&nbsp;|&nbsp;&nbsp;
                  <asp:HyperLink ID="hlnkTerm3Aggregate" runat="server" CssClass="cssHyperLink">Term-End Report</asp:HyperLink>
                &nbsp;&nbsp;|&nbsp;&nbsp;
                <asp:HyperLink ID="hlnkTerm3BehaviouralReport" runat="server" CssClass="cssHyperLink">Behavioural Report</asp:HyperLink>
                </span>
            </td>
            </tr>
            <tr>
            <td colspan="2" align="left">&nbsp;</td>
            </tr>
            <tr>
            <td colspan="2" align="left"><strong>ANNUAL:</strong></td>
            </tr>
            <tr>
            <td width="3%" align="center" class="style17">&raquo;</td>
            <td class="style17">
                <span>
                  <asp:HyperLink ID="hlnkAnnualAggregate" runat="server" 
                    CssClass="cssHyperLink">My Annual Aggregate</asp:HyperLink>
                  &nbsp;&nbsp;|&nbsp;
                  <asp:HyperLink ID="hlnkMayTest0" runat="server" CssClass="cssHyperLink">My Transcript</asp:HyperLink>
                </span>
            </td>
            </tr>
            <tr>
            <td width="3%" align="center" class="style17">&nbsp;</td>
            <td class="style17">
                &nbsp;</td>
            </tr>
            </table></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="#000000" /></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td colspan="2" align="left"><strong>SUBJECTS:</strong></td>
            </tr>
          <tr>
            <td width="3%" align="center" class="style17" valign="top">&nbsp;</td>
            <td class="style17">
                <span></span>
                <asp:GridView ID="gvSubjects" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="dsSqlStudentSubjects" EnableModelValidation="True" 
                    Width="800px" BorderColor="White" BorderStyle="None" BorderWidth="2px" 
                    ShowHeader="False">
                    <Columns>
                        <asp:TemplateField HeaderText="S/N" InsertVisible="False" 
                            SortExpression="StudentSubjectId">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='»'></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <ItemStyle HorizontalAlign="Center" Width="10px" />
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Subject" SortExpression="SubjectShortName">
                            <ItemTemplate>
                                &nbsp;<asp:Label ID="Label2" runat="server" 
                                    Text='<%# Eval("SubjectShortName") %>' Font-Bold="True"></asp:Label>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" Width="125px" BorderColor="White" BorderStyle="Solid" BorderWidth="2px" />
                        </asp:TemplateField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                &nbsp;<asp:HyperLink ID="HyperLink3" runat="server" CssClass="cssHyperLink" 
                                    Text='Term 1'></asp:HyperLink>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink 
                                    ID="hlnkSubjectScores" runat="server" CssClass="cssHyperLink" Text='Term 2'></asp:HyperLink>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink 
                                    ID="HyperLink1" runat="server" CssClass="cssHyperLink" Text='Term 3'></asp:HyperLink>&nbsp;&nbsp;|&nbsp;&nbsp;<asp:HyperLink 
                                    ID="HyperLink2" runat="server" CssClass="cssHyperLink" Text='Annual Aggregate'></asp:HyperLink>
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Left" />
                            <ItemStyle HorizontalAlign="Left" />
                        </asp:TemplateField>
                    </Columns>
                    <RowStyle Height="30px" BorderColor="White" BorderStyle="Solid" 
                        BorderWidth="2px" />
                </asp:GridView>
                <asp:SqlDataSource ID="dsSqlStudentSubjects" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:iTecon %>" 
                    SelectCommand="  ">
                    <SelectParameters>
                        <asp:QueryStringParameter Name="PortalNumber" QueryStringField="a" 
                            Type="String" />
                        <asp:Parameter Name="SessionName" />
                    </SelectParameters>
                </asp:SqlDataSource>
              </td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td>&nbsp;</td>
            </tr>
            </table></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle">&nbsp;</td>
      </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
