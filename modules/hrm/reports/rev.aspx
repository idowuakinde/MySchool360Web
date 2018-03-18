<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rev.aspx.vb" Inherits="modules_reports_rev" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Revenue Reports</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="100%"  border="0">
  <tr>
    <td valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Reports Panel</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="2">
      
      <tr>
        <td width="3%" align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td width="45%" align="left" valign="middle" class="pageHeaderStyleLASAA"><strong>HR 
            REPORTS</strong></td>
        <td width="3%" align="left" valign="middle">&nbsp;</td>
        <td align="left" valign="middle" class="pageHeaderStyleLASAA">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="#000000" /></td>
        <td align="left" valign="middle">&nbsp;</td>
        <td align="left" valign="middle">&nbsp;</td>
      </tr>
      <tr>
        <td align="left" valign="top" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td width="3%" align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport1" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_AllStaffSummary.aspx">All Staff Summary (Global)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport85" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_StaffDetails.aspx">Staff Details</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport84" runat="server" 
                CssClass="cssHyperLink" NavigateUrl="rpt_HR_StaffCareerMovements.aspx">Staff Career Movement</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport89" runat="server" 
                CssClass="cssHyperLink" NavigateUrl="#">Staff Turnover (Global)*</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport88" runat="server" 
                CssClass="cssHyperLink" NavigateUrl="#">Staff Turnover (by Department)*</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport87" runat="server" 
                CssClass="cssHyperLink" NavigateUrl="#">Staff Recruitments (Global)*</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport86" runat="server" 
                CssClass="cssHyperLink" NavigateUrl="#">Staff Cessation (Global)*</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport83" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_StaffListByYearsInService.aspx">Staff List (by Years in Service)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport82" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_StaffListByDesignation.aspx">Staff List (by Designation)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport101" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_StaffListByAgeBracket.aspx">Staff List (by Age Bracket)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport102" runat="server" 
                CssClass="cssHyperLink" NavigateUrl="#">Staff List (by Qualification)*</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport103" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_StaffListByDepartment.aspx">Staff List (by Department)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport104" runat="server" 
                CssClass="cssHyperLink" 
                    NavigateUrl="~/modules/reports/rpt_HR_StaffListByCategory.aspx">Staff List (by Grade Level)</asp:HyperLink>
              </span></td>
            </tr>
          </table></td>
        <td align="left" valign="top">&nbsp;</td>
        <td align="left" valign="top">&nbsp;</td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="#000000" /></td>
        <td align="left" valign="middle">&nbsp;</td>
        <td align="left" valign="middle">&nbsp;</td>
      </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
