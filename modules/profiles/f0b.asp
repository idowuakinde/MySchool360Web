<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	dim matricNumber, className, destination
	matricNumber = request.querystring("a")
	className = request.QueryString("b")
	term = request.QueryString("c")

<!--	'if className = "Nursery" OR className = "Pre-Sch" OR className = "Reception" OR className = "Year 1" OR className = "Year 2" OR className = "Year 3" OR className = "Year 4" OR className = "Year 5" OR className = "Year 6" then
		destination = "newsletter_js_oct2011.asp"
	'elseif className = "Year 7.1" OR className = "Year 7.2" OR className = "Year 8.1" OR className = "Year 8.2" OR className = "Year 8.3" OR className = "Year 9.1" OR className = "Year 10.1" OR className = "Year 10.2" OR className = "Year 11.1" OR className = "Year 11.2" then
		destination = "newsletter_oct2011_hs_page1.htm"
	'end if
-->

	destination = "newsletter_oct2011_hs_page1.htm"
    response.Redirect destination
%>
