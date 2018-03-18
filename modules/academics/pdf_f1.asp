<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"  EnableSessionState=FALSE %>
<%
	Set theDoc = Server.CreateObject("ABCpdf5.Doc")
	theDoc.AddImageUrl "http://localhost/myschool360.ahall/modules/academics/f1.asp?a="& request.QueryString("a") & "&b=" & request.QueryString("b")
'	theDoc.Save "C:\basefolder\Data\Projects\API.ABCpdf\formorder1.pdf"
'	'redirect away to another page
'	response.redirect "f1.asp?a="& request.QueryString("a") & "&b=" & request.QueryString("b")

	theData = theDoc.GetData() 
	Response.ContentType = "application/pdf"
	Response.AddHeader "content-length", UBound(theData) - LBound(theData) + 1 
	Response.AddHeader "content-disposition", "inline; filename=MyReportCard.PDF" 
	Response.BinaryWrite theData
	Set theDoc = Nothing
%>
Done