<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim v_mode, v_filter, v_recipients

	v_mode = request.querystring("a") 
	v_filter = request.querystring("b")
    v_recipients = "idowuakinde@yahoo.com; "      'GetParentEmails(v_mode, v_filter)

    'loop through the ParentEmails split() array and send emails to all qualifying parents...
    arrEmails = split(ParentEmails, ";")
    for i = LBound(arrEmails) to UBound(arrEmails) + 1
        fromAddress = "postmaster@thechildville.org"
        toAddresses = v_recipients
        ccAddresses = ""
        bccAddresses = ""
        subject = "Your child's result for the September Test at Childville"
        bodyFormat = 1          '1 for text, 0 for html
        body = "Please find attached." & vbcrlf & vbcrlf & "Childville."

        response.redirect "http://Childville.myschool360.info/modules/data/print_student_result_pdf.aspx?a=30003&b=yes"      'server.MapPath(filePath)

        Call SendMail(fromAddress, toAddresses, ccAddresses, bccAddresses, subject, bodyFormat, body, "")
    next

    response.end
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>MySchool360, powered by Smart Systems</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../../inc_functions_js.js" ></script>
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
.style18 {font-size: 14px}
.style22 {font-size: 6px}
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<form id="form1" name="form1" method="post" action="">
        <table width="880"  border="0">
            <tr>
                <td colspan="2">
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="225" align="left" valign="middle"><span class="pageHeaderStyle"><strong>Send Bulk E-mails</strong></span></td>
                            <td align="left" valign="middle">&nbsp;</td>
                        </tr>
                </table>
                </td>
            </tr>
          <tr>
            <td width="15">&nbsp;</td>
            <td align="left">
              <strong>STATUS </strong></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td></td>
          </tr>
          <tr>
              <td>&nbsp;</td>
              <td><table width="850" border="0" cellspacing="0" cellpadding="6">
                  <tr>
                      <td width="200" bgcolor="#FFFF99"><strong>&nbsp;From (Sender):</strong></td>
                      <td><input name="txtFrom" type="text" class="defaultFormElementStyle" id="txtFrom" value="&quot;Postmaster @ Childville&quot; &lt;postmaster@thechildville.org&gt;" size="100" readonly="readonly" /></td>
                  </tr>
                  <tr>
                      <td bgcolor="#FFFF99" valign="top"><strong>&nbsp;To (Recipients):</strong></td>
                      <td><textarea name="txtRecipients" cols="100" rows="5" 
                              class="defaultFormElementStyle" id="txtRecipients"><%= v_recipients %></textarea></td>
                  </tr>
                  <tr>
                      <td bgcolor="#FFFF99"><strong>&nbsp;Cc:</strong></td>
                      <td><textarea name="txtCc" cols="100" rows="2" class="defaultFormElementStyle" id="txtCc"></textarea></td>
                  </tr>
                  <tr>
                      <td bgcolor="#FFFF99"><strong>&nbsp;Bcc:</strong></td>
                      <td><textarea name="txtBcc" cols="100" rows="2" class="defaultFormElementStyle" id="txtBcc"></textarea></td>
                  </tr>
                  <tr>
                      <td bgcolor="#FFFF99"><strong>&nbsp;Subject:</strong></td>
                      <td><input name="txtSubject" type="text" class="defaultFormElementStyle" id="txtSubject" size="100" /></td>
                  </tr>
                  <tr>
                      <td valign="top" bgcolor="#FFFF99"><strong>&nbsp;Message:</strong></td>
                      <td><textarea name="txtMessage" cols="100" rows="10" class="defaultFormElementStyle" id="txtMessage"></textarea></td>
                  </tr>
                  <tr>
                      <td bgcolor="#FFFF99">&nbsp;</td>
                      <td bgcolor="#FFFF99"><input name="btnSubmit" type="submit" class="defaultButtonStyle" id="btnSubmit" value="      Send Message      " />
                        &nbsp;
                        <input name="btnReset" type="reset" class="defaultButtonStyle" id="button" value="Clear All" /></td>
                  </tr>
              </table></td>
          </tr>
            <tr>
                <td colspan="2">&nbsp;
                    </td>
            </tr>
            </table>
</form>
</body>
</html>
