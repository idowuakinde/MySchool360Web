<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<%
	matricNumber = request.QueryString("a")
	studentClass = request.QueryString("b")
	term = request.QueryString("c")
%>
<%
	Dim rstSubjects
	Dim rstSubjects_numRows
	
	Set rstSubjects = Server.CreateObject("ADODB.Recordset")
	rstSubjects.ActiveConnection = MM_cnnSmartSchool_STRING
	rstSubjects.Source = "SELECT * FROM dbo.TEMPSubject where SubjectId IN (SELECT SubjectId FROM dbo.TEMPScoreSheet WHERE MatricNumber = '" & matricNumber & "') "
	rstSubjects.CursorType = 0
	rstSubjects.CursorLocation = 2
	rstSubjects.LockType = 1
	rstSubjects.Open()
	
	rstSubjects_numRows = 0
%>
<%
	Dim Repeat1__numRows
	Dim Repeat1__index
	
	Repeat1__numRows = -1
	Repeat1__index = 0
	rstSubjects_numRows = rstSubjects_numRows + Repeat1__numRows
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

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="100%"  border="0">
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA">&nbsp;:: Student's Subject Position Monitor </span></td>
  </tr>
  
  <tr>
    <td valign="top"><table width="100%"  border="0">
      <tr>
        <td width="30" align="center" valign="top">&nbsp;</td>
        <td rowspan="2" valign="top">
          <strong>Click a subject below to proceed:          </strong>
          <ul>
            <% 
While ((Repeat1__numRows <> 0) AND (NOT rstSubjects.EOF)) 
%>
              <li>
			    <strong>
				<a href="classposition_subject.aspx?a=<%= matricNumber %>&amp;b=<%= studentClass %>&amp;c=<%= rstSubjects("SubjectName") %>&amp;d=<%= rstSubjects("SubjectId") %>"><%= rstSubjects("SubjectName") %></a>
				</strong>
				<br />&nbsp;
			  </li>
              <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rstSubjects.MoveNext()
Wend
%>

            </ul>
          </td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
	rstSubjects.Close()
	Set rstSubjects = Nothing
%>
