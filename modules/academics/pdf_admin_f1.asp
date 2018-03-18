<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252" %>
<!--#include file="../../inc_functions_misc.asp" -->
<%
	if request.Form("btnSubmit") <> "" then
		'send e-mails to all recipients in the list
		arrRecipients = split(trim(request.form("recipient_list")),",")
		'On Error Resume Next
		for i = lbound(arrRecipients) to ubound(arrRecipients)
			'response.Write request.ServerVariables("PATH_INFO"): response.End()
			matricNumber = "40942"
			className = "JS2"
			savePath = server.mappath(".") & "\MyReportCard_" & matricNumber & ".pdf"
			Set theDoc = Server.CreateObject("ABCpdf5.Doc")
			theDoc.AddImageUrl "http://localhost/myschool360.ahall/modules/academics/f1.asp?a="& matricNumber & "&b=" & className
			'theDoc.AddImageUrl "http://demo.myschool360.net/modules/academics/f1.asp?a="& matricNumber & "&b=" & className
			theDoc.Save savePath
			'send pdf as attachment in an email
			Call SendMail("autobot@myschool360.net",arrRecipients(i),"","","AHall Report Card","",savePath)
			'Call SendMail("Crusader Nigeria Plc <" & "autobot@smartsystems-ng.com" & ">",arrRecipients(i),"","", "Introducing the Crusader Nigeria Plc Hybrid Offer 2008", message)
			'Call SendMail("Crusader Nigeria Plc <" & "autobot@smartsystems-ng.com" & ">","idowuakinde@yahoo.com","","", "Introducing the Crusader Nigeria Plc Hybrid Offer 2008", "xyz",savePath)
		next

		Set theDoc = Nothing
		'post-success
		response.Write "<br><br><center><strong><font color='red'>Thank you! 31 Invitation e-mails were <i>successfully</i> sent to the specified recipients.</font></strong></center><br>"
		'response.end
	end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<meta name="keywords" content="bible, bibles, verses, chapters, daily devotional, confessions, pauline, prayers, faith, building, resources, study, research, concordance, search, parallel, articles, pdf, mp3, sermons, podcasts, videos, webcasts. :: Bibles, bible study, bible research, pdf articles, mp3 sermons, podcasts, videos, webcasts, links, prophecies, christian, christ, jesus, anointed, word of God, God word, God's word, life" />
<meta name="description" content="SmartBibles is an online bible-study portal where you can carry out exhaustive, multi-translation Bible-Concordance searches, read the bible in four versions simultaneously, and download faith-building materials in different formats (pdf articles, mp3 sermons, podcasts, music and sermon videos, and find links to webcasts)." />
<title>Atlantic Hall :: Send Out Report Cards</title>
<link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>

<body <%= body_full_margins %> >
<table width="1050" border="0" cellspacing="4" cellpadding="4">
  <tr>
    <td align="left" valign="top"><font class="pageHeaderStyle">Send Out The Students' Report Cards 
        To Their Parents by E-mail</font>
    <hr align="center" width="100%" noshade="noshade" color="#000000" /></td>
  </tr>
  <tr>
    <td align="left" valign="top"><table width="100%"  border="0">
      <form action="" method="post" enctype="application/x-www-form-urlencoded" name="frmSendMails" id="frmSendMails">
        <tr>
          <td width="20%" align="left" valign="top"><strong class="defaultHeaderTextStyle">From: </strong></td>
          <td width="2%" valign="top">&nbsp;</td>
          <td align="left" valign="top"><input readonly="readonly"  name="txtFrom" type="text" class="defaultFormElementStyle" id="txtFrom" value="Atlantic Hall" size="73" /></td>
        </tr>
        
        <tr>
          <td align="left" valign="top"><p class="defaultHeaderTextStyle">Additional Message               <br />
              (Optional):</p>
            </td>
          <td>&nbsp;</td>
          <td align="left" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="25%" valign="top"><textarea name="recipient_list" cols="70" rows="12" class="defaultFormElementStyle" id="recipient_list"></textarea></td>
                <td valign="top">&nbsp;</td>
              </tr>
          </table></td>
        </tr>
        
        <tr>
          <td align="right" valign="top">&nbsp;</td>
          <td>&nbsp;</td>
          <td align="left" valign="top"><input name="btnSubmit" type="submit" class="defaultFormElementStyle" id="btnSubmit" value="      Send Out Report Cards   &gt;      " /></td>
        </tr>
      </form>
    </table></td>
  </tr>
</table>
</body>
</html>
