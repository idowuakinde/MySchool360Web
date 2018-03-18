<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="100%"  border="0">
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA">&nbsp;:: Exam Results Data-Entry</span></td>
  </tr>
  
  <tr>
    <td valign="top"><table width="100%"  border="0">
      <tr>
        <td width="30" align="center" valign="top">&nbsp;</td>
        <td rowspan="2" valign="top">
          <strong>How would you like to input exam scores?</strong>
		  <br />&nbsp;
          <ul>
            <li><strong><a href="scoresentry_exams_xls.asp">Upload an EXCEL file</a></strong> <br />&nbsp;</li>
            <li><strong><a href="scoresentry_exams_form.aspx">Fill the scores manually for each student using an online form</a></strong> <br />
              &nbsp;</li>
          </ul>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
