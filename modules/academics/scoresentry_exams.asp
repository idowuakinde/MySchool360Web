<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<% 
    dim username
    dim classInChargeOf

    username = Request.QueryString("a")
	Dim rstClassInChargeOf
	Dim rstClassInChargeOf_numRows
		
	Set rstClassInChargeOf = Server.CreateObject("ADODB.Recordset")
	rstClassInChargeOf.ActiveConnection = MM_cnnSmartSchool_STRING
    rstClassInChargeOf.Source = " SELECT ClassName FROM dbo.TEMPClass WHERE Teacher = '" & username & "' "
	rstClassInChargeOf.CursorType = 0
	rstClassInChargeOf.CursorLocation = 2
	rstClassInChargeOf.LockType = 1
	rstClassInChargeOf.Open()
		
	rstClassInChargeOf_numRows = 0

    If rstClassInChargeOf.BOF AND rstClassInChargeOf.EOF then
        classInChargeOf = ""
    else
        classInChargeOf = rstClassInChargeOf("ClassName")
    End If

	set rstClassInChargeOf = Nothing
%>

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

<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
<table width="100%"  border="0">
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA"><br />&nbsp;:: CA and Exam Results Data-Entry 
        Options</span></td>
  </tr>
  
  <tr>
    <td valign="top"><table width="100%"  border="0">
      <tr>
        <td width="30" align="center" valign="top">&nbsp;</td>
        <td rowspan="2" valign="top">
            <ul>
            <li><strong><a href="scoresentry_exams_xls.asp">Upload an EXCEL file</a></strong> <br />&nbsp;</li>
            <li><strong><a href="subjectentry_exams_form_maths.aspx?a=<%= classInChargeOf %>">Fill MATHEMATICS scores for all students at once using an online form</a></strong> <br />&nbsp;</li>
            <li><strong><a href="subjectentry_exams_form_eng.aspx?a=<%= classInChargeOf %>">Fill ENGLISH scores for all students at once using an online form</a></strong> <br />&nbsp;</li>
            <li><strong><a href="subjectentry_exams_form_history.aspx?a=<%= classInChargeOf %>">Fill HISTORY scores for all students at once using an online form</a></strong> <br />&nbsp;</li>
          </ul>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
    </form>
</body>
</html>