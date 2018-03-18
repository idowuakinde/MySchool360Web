<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	dim matricNumber, className, destination
	matricNumber = request.querystring("a")
	className = request.QueryString("b")

	if UCASE(left(className,1)) = "J" then
		destination = "formorder2j.asp?a=" & matricNumber & "&b=" & className
		response.Redirect destination
	elseif UCASE(left(className,1)) = "S" then
		destination = "formorder2s.asp?a=" & matricNumber & "&b=" & className
		response.redirect destination
	end if
%>
