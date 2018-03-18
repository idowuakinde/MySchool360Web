<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/cnnSmartSchool.asp" -->
<!--#include file="inc_functions_misc.asp" -->
<%    
    'clear all cookies (effectively log off)
    'Call LogOff()
    'set cookies anew to the values of the child whose profile we're going to...
	Response.Cookies("Parent")("RoleId") = request.QueryString("a")
	Response.Cookies("School")("SchoolId") = request.querystring("b")
	Response.Cookies("User")("Username") = request.QueryString("c")
	Response.Cookies("Parent")("Class") = request.QueryString("d")
	Response.Cookies("Parent")("UserId") = request.QueryString("e")
    'redirect to frameset.asp
    Response.Redirect("frameset.asp")
%>