<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<%
	dim matricNumber
	matricNumber = request.querystring("a")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MySchool360, powered by Smart Systems</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
.style18 {font-size: 14px}
.style22 {font-size: 6px}
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="900"  border="0" class="borderedTableGrey">
  <tr>
    <td width="70%" align="center" valign="top">&nbsp;<br />
      You selected an invalid link.<br />
      &nbsp;<br />
    The &quot;2nd Order Form&quot; is not applicable in the 2nd term, because the term is a brief one.<br />
    Please click <a href="reportcard_senior.asp?a=<%= request.QueryString("a") %>&amp;b=<%= request.QueryString("b") %>">here</a> to go to the &quot;<a href="reportcard_senior.asp?a=<%= request.QueryString("a") %>&amp;b=<%= request.QueryString("b") %>">1st Order Form</a>&quot; or <a href="reportcard.asp">here</a> to go to the <a href="reportcard.asp">&quot;Final Report Card&quot;</a> for the current term.<br />
    &nbsp;<br />
    &nbsp;</td>
  </tr>
</table>
</body>
</html>
