<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim fromAddresses, toAddresses, ccAddresses, bccAddresses, subject, bodyFormat, body, attachment
    
    fromAddresses = request.QueryString("a")
    toAddresses = request.QueryString("b")
    ccAddresses = request.QueryString("c")
    bccAddresses = request.QueryString("d")
    subject = request.QueryString("e")
    bodyFormat = request.QueryString("f")
    body = request.QueryString("g")
    attachment = request.QueryString("h")

    Call SendMail(fromAddresses, toAddresses, ccAddresses, bccAddresses, subject, bodyFormat, body, attachment)
%>
E-mails sent successfully. <br /><br />Please be mindful to monitor the default sender address (<%= fromAddresses %>) for notifications of possible delivery failures.