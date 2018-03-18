<%@ Page Language="VB" AutoEventWireup="false" CodeFile="pr_batch_result_step0.aspx.vb" Inherits="modules_data_print_batch_result_step0" %>

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
                    Text=":: How would you like to print student results?&lt;br /&gt;&nbsp;&nbsp;&nbsp;&nbsp;You can print result individually for each student, or for batches at once: either grouped by Class, by Programme, or by Subject Offered."></asp:Label></td>
          </tr>
          <tr>
            <td>
                <table cellpadding="3" cellspacing="3" width="100%">
                    <tr>
                        <td width="20" align="center">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20" align="center">
                            <strong>&raquo;</strong></td>
                        <td>
                <span>
                  <asp:HyperLink ID="hlnkAllStudents" runat="server" CssClass="cssHyperLink" 
                                NavigateUrl='~/modules/data/print_batch_result_allstudents.aspx'>ALL STUDENTS</asp:HyperLink>
                </span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20" align="center">
                            <strong>&raquo;</strong></td>
                        <td>
                <span>
                  <asp:HyperLink ID="hlnkStudentClasses" runat="server" CssClass="cssHyperLink" 
                                NavigateUrl='~/modules/data/print_batch_result_classes_step1.aspx'>ALL STUDENTS GROUPED BY CLASS</asp:HyperLink>
                </span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20" align="center">
                            <strong>&raquo;</strong></td>
                        <td>
                <span>
                  <asp:HyperLink ID="hlnkStudentProgrammes" runat="server" CssClass="cssHyperLink" 
                                NavigateUrl='~/modules/data/print_batch_result_programmes_step1.aspx'>ALL STUDENTS GROUPED BY PROGRAMME</asp:HyperLink>
                </span>
                        </td>
                    </tr>
                    <tr>
                        <td width="20">
                            &nbsp;</td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td width="20" align="center">
                            <strong>&raquo;</strong></td>
                        <td>
                <span>
                  <asp:HyperLink ID="hlnkStudentSubjects" runat="server" CssClass="cssHyperLink" 
                                NavigateUrl='~/modules/data/approve_step1.aspx'>ALL STUDENTS GROUPED BY SUBJECT</asp:HyperLink>
                </span>
                        </td>
                    </tr>
                </table>
              </td>
          </tr>
          <tr>
            <td>&nbsp;</td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
