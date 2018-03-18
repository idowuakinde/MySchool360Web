<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student.aspx.vb" Inherits="modules_profiles_manage_student" %>

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
                    Text=":: Manage Student Information"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/modules/enrolment/enrolment_all.aspx" Target="singleEditorFrame">View/Edit Enrolments</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Basic Info</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="hlnkStudentSubjects" runat="server" NavigateUrl='manage_student_subjects.aspx' Target="singleEditorFrame">View/Edit Students&#39; Subjects</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='~/modules/academics/results_student_browse.aspx' Target="singleEditorFrame">View/Edit Students&#39; Results</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Financial Transactions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Pastoral Care</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Attendance</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Homework</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Promotions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Library Interactions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Misdemeanours</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Clubs</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Boarding House</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Sports</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Medicals</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Excursions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Previous Schools</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Parent-Teacher Chats</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Lesson Plans</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="about:blank" 
                        Target="singleEditorFrame">View/Edit Students' Miscellaneous Info</asp:HyperLink></td>
              </tr>
              </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
