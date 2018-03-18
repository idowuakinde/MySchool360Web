<%@ Page Language="VB" AutoEventWireup="false" CodeFile="rpt.aspx.vb" Inherits="modules_reports_rpt" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Reports</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="100%"  border="0">
  <tr>
    <td valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Reports</span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="5" cellspacing="2">
      
      <tr>
        <td width="3%" align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td width="45%" align="left" valign="middle" class="pageHeaderStyleLASAA"><strong>HR REPORTS</strong></td>
        <td width="3%" align="left" valign="middle">&nbsp;</td>
        <td align="left" valign="middle" class="pageHeaderStyleLASAA"><strong>PAYROLL REPORTS</strong></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="#000000" /></td>
        <td align="left" valign="middle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="black" /></td>
      </tr>
      <tr>
        <td align="left" valign="top" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td colspan="2" align="left"><strong>STAFF LIST:</strong></td>
            </tr>
          <tr>
            <td width="3%" align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport1" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport89" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Designation</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport88" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Department</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport87" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Department &amp; Designation</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport86" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport85" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Department &amp; Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport84" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Department &amp; Designation &amp; Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport83" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Discharge Reason</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport82" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by State of Origin</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport81" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Qualification</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport80" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Discipline</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport79" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Qualification &amp; Discipline</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport78" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Qualification &amp; Discipline &amp; Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport77" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Years of Experience</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport15" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Years of Experience &amp; Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>DEPARTMENT SIZE:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport16" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Departments and their Staff Sizes</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport17" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Specific Department</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>SISTER COMPANIES:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport18" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Sister Companies</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport3" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List by Sister Companies</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport2" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff List in a Specific Sister Company</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>CAREER MOVEMENT:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport21" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Promotions &amp; Demotions</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport22" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Promotions within a Date Range</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport23" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Demotions within a Date Range</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport26" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Promotions/Demotions for a Specific Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>MISCONDUCT:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport24" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Queries</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport27" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Dismissals</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport28" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Demotions</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport25" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Stagnancies (zero movements in 48 months or more)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>PROFESSIONAL TRAINING:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport29" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Trainings within a Date Range</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport30" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All staff who attended a specific training</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>EX-STAFF:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport31" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Ex-Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport32" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All staff exited within a Date Range</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport33" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All staff exited from a Specific Department</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport34" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All staff exited at Specific Designation/Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>LEAVE:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport35" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Leave Calendar (Current Year / Current Month)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport36" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Leave Calendar (Historical)</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport37" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Leave Calendar for Specific Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>LONG SERVICE:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport38" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Define &quot;Long Service&quot;</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport39" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Long-Serving Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport40" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Long-Serving Staff by Department</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport41" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Long-Serving Staff by Designation</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport42" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Long-Serving Staff by Job Level</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport43" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Long-Serving Staff by State of Origin</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>RETIREMENT:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport44" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Retired Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport45" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Staff Retired in the Past 12 / 24 / 36 Months</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport46" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">View Staff Due For Retirement</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport47" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">View Staff Due for Retirement in the Next 12 Months</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport48" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">View Staff Due for Retirement in the Next 24 Months</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport49" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">View Staff Due for Retirement in the Next 36 Months</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>MEDICAL:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport56" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Medical Bills</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport55" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Medical Bills within a Date Range</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport50" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Aggregate Medical Bills by Department</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport51" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Aggregate Medical Bills for Specific Department</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport52" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Medical History</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport53" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">List of Registered Hospitals</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport54" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Medical Bills for Specific Staff</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>STAFF HISTORY:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport57" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Educational History</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport58" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Previous Employment History</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport59" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Job Progression History</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>STAFF DETAILS:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport60" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Biodata</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport61" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Education</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport62" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Previous Employment</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport63" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Languages Spoken</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport64" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Next of Kin</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>WEDDING ANNIVERSARIES:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport65" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Wedding Anniversaries</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport66" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Wedding Anniversaries Coming Up This Month</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport67" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Wedding Anniversaries Coming Up Next 3 Months</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport68" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Wedding Anniversaries Coming Up Next 6 Months</asp:HyperLink>
              </span></td>
            </tr>
          <tr>
            <td colspan="2" align="left"><strong>BIRTHDAYS:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport69" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Birthdays</asp:HyperLink>
            </span></td>
            </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport70" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Birthdays Coming Up This Month</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport5" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Birthdays Coming Up Next 3 Months</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport4" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Birthdays Coming Up Next 6 Months</asp:HyperLink>
              </span></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><strong>OTHERS:</strong></td>
          </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport73" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff Telephones &amp; Emails</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport74" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff Residences</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport75" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff Religions</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport76" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff Employment Dates</asp:HyperLink>
            </span></td>
          </tr>
          </table></td>
        <td align="left" valign="top">&nbsp;</td>
        <td align="left" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="3">
          <tr>
            <td colspan="2" align="left"><strong>STAFF:</strong></td>
          </tr>
          <tr>
            <td width="3%" align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport6" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Medical Bills</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport7" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Loan Deductions</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport8" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Special (Other) Deductions</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport9" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Special Allowances</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport93" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Overtime Allowances</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><strong>CO-OPERATIVE:</strong></td>
          </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport92" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Financial Position</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><strong>PAY SLIP:</strong></td>
          </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport941" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Pay Slip Preview</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport94" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Single Pay Slip</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport95" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Pay Slips</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport96" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">All Pay Slips at Specific Location</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><strong>PAYROLL LEDGER:</strong></td>
          </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport97" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Payroll Ledger Summary</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport98" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Payroll Ledger Details: Bank-by-Bank</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport99" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Payroll Ledger Details: Dept-by-Dept</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport100" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Payroll Ledger Details: Location-by-Location</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport101" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Payroll Ledger Details: Category-by-Category</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport102" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Payroll Ledger Details: Designation-by-Designation</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td colspan="2" align="left"><strong>OTHERS:</strong></td>
            </tr>
          <tr>
            <td align="center">&raquo;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport103" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Union Dues (FOBTOB)</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport104" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Loans Register</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport105" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Loan Re-payments</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport106" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Interest on Loans</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport107" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Pension Deductions</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport108" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Staff Taxes</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport109" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Aggregate Pay Reports: Locations</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport110" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Aggregate Pay Reports: Departments</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport111" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Aggregate Pay Reports: Categories</asp:HyperLink>
            </span></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td><span style="width: 773px">
              <asp:HyperLink ID="hlnkReport112" runat="server" 
                CssClass="cssHyperLink" 
                NavigateUrl="~/modules/reports/rev_currentyear.aspx">Aggregate Pay Reports: Banks</asp:HyperLink>
            </span></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td align="right" class="defaultHeaderTextStyle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="#000000" /></td>
        <td align="left" valign="middle">&nbsp;</td>
        <td align="left" valign="middle"><hr width="100%" noshade="noshade" color="black" /></td>
      </tr>
      </table></td>
  </tr>
</table>
    </form>
</body>
</html>
