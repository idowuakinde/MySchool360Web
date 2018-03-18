<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/cnnSmartSchool.asp" -->
<!--#include file="inc_functions_misc.asp" -->
<%    
    If request.cookies("User")("Username") = "" AND request.cookies("Parent")("Username") = "" Then 
        'Response.Write "Cannot find cookie for 'Username'": Response.End()
        Server.Transfer("home.asp")
    End If %>
<%  
    if Request.Cookies("User")("RoleId") <> "" then
	    roleId = Request.Cookies("User")("RoleId")          ' request.QueryString("a")
    else
        roleId = Request.Cookies("Parent")("RoleId")
    End If

	schoolId = Request.Cookies("School")("SchoolId")        ' request.querystring("b")
    if schoolId = "" then 
        server.Transfer "logoff.asp"
    end if
	username = Request.Cookies("User")("Username")          ' request.QueryString("c")
	dept = Request.Cookies("User")("Class")                 ' request.QueryString("d")
	parentEmail = Request.Cookies("Parent")("UserId")       ' request.QueryString("e")

	Dim rstSchoolTheme
	Dim rstSchoolTheme_numRows
	
	Set rstSchoolTheme = Server.CreateObject("ADODB.Recordset")
	rstSchoolTheme.ActiveConnection = MM_cnnSmartSchool_STRING
	rstSchoolTheme.Source = "SELECT SchoolId, SchoolAbbr, SchoolName, ExtensionField1 FROM dbo.Core_School WHERE SchoolId = " + schoolId + ""
	rstSchoolTheme.CursorType = 0
	rstSchoolTheme.CursorLocation = 2
	rstSchoolTheme.LockType = 1
	rstSchoolTheme.Open()
	
	rstSchoolTheme_numRows = 0

	schoolName=rstSchoolTheme("SchoolName")

	rstSchoolTheme.Close()
	Set rstSchoolTheme = Nothing
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
    <title>MySchool360 :: <%= UCASE(schoolName) %> :: Monitor your child's school performance from home, office or wherever! - brought to you by Smart Systems Company</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="inc_functions_js.js" type="text/javascript"></script>
</head>
		<%
			dim destinationPage
			Select Case roleId
				Case 20, 18                     'student, parent
					destinationPage = "frameset_welcome.aspx"
                Case 21, 34, 35                 'Subject Teacher, Class Teacher, PE Teacher
                    destinationPage = "frameset_welcome_teacher.aspx"
                Case 32, 33, 29, 30, 28, 1      'Head of Junior School, Head of Senior School, Head of School, School Administrator, Proprietress, Sys-Admin
                    destinationPage = "frameset_welcome_s.aspx"
				Case Else                       'all other generic (non-academic and non-executive) users...
					destinationPage = "frameset_welcome_g.aspx"
			End Select
		%>

<frameset rows="140,*" cols="*" frameborder="yes" border="1" framespacing="0">
  <frame src="frameset_top.asp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="210,*" frameborder="yes" border="1" framespacing="0">
    <frame class="frameLeft" src="frameset_left.asp?a=<%=username%>&b=<%=destinationPage%>&c=<%=roleId%>&d=<%=schoolId%>" name="leftFrame" scrolling="auto" noresize="noresize" id="leftFrame" title="leftFrame" />
	<frame class="frameBottom" src="<%=destinationPage%>?a=<%=username%>&b=<%=schoolId%>&c=<%=dept%>" name="mainFrame" id="mainFrame" title="mainFrame" scrolling="auto" />
  </frameset>
</frameset>

<noframes>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    We're sorry. Your browser does not support frames.<br />Please use a browser that supports frames.
    </form>
</body>
</noframes>
</html>
