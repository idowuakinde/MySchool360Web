<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	dim matricNumber, className, destination
	matricNumber = request.querystring("a")
	className = request.QueryString("b")

	if className = "Nursery" OR className = "Pre-Nursery" OR className = "Playgroup" OR className = "Year 1 Red" OR className = "Year 1 Blue" OR className = "Year 2 Blue" OR className = "Year 2 Red" OR className = "Year 3 Red" OR className = "Year 3 Blue" OR className = "Year 4 Blue" OR className = "Year 4 Red" OR className = "Year 5 Blue" OR className = "Year 5 Red" OR className = "Year 6" then
		destination = "paymentinfo_junior.asp?a=" & matricNumber & "&b=" & className
	elseif className = "Year 7" OR className = "Year 8" OR className = "Year 9" OR className = "Year 10" OR className = "Year 11" then
		destination = "paymentinfo.asp?a=" & matricNumber & "&b=" & className
	end if
	response.Redirect destination
%>
