<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="modules_help_default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title><%= request.ServerVariables("SERVER_NAME") %></title>
<style type="text/css">
<!--
.style1 {
	color: #FFFFFF;
	font-size: 72px;
}
-->
</style>
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
    <form id="form1" runat="server">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
      <%--<td height="101" colspan="2" align="center" valign="middle" bgcolor='<%= Common.DecodeHTML(Request.Cookies("School")("SchoolColour")) %>' class="style1">Help and Support</td>--%>
      <td height="101" colspan="2" align="center" valign="middle" bgcolor='#000000' class="style1">Help and Support</td>
  </tr>
  <tr>
      <td width="30%" height="400" align="center" valign="middle">
          <img src="../../images/help_icon.jpg" height="200" /></td>
      <td align="left" valign="top" bgcolor="#CCCCCC">
          <br />
          <p>Welcome to <b>MySchool360</b> Help and Support.          </p>
          <p>We are available to assist you via any of the following channels:</p>
          <ul>
              <li>You may send an e-mail (to <strong><a href="mailto:support@smartsystems-ng.com">support@smartsystems-ng.com</a></strong>). 
                  <br />
                  We value your feedback and will respond to you within 24 hours.<br />
                  &nbsp;<br />
                  OR<br />
&nbsp; </li>
              <li>You may  also call us on <strong>(0704) 149 5226</strong> or <strong>(0805) 702 0667</strong>. 
                  <br />
                  Our Customer Support Representatives are eager to help you resolve whatever issues you might be experiencing.</li>
          </ul></td>
  </tr>
  <tr>
      <td colspan="2" align="center" valign="middle">&nbsp;</td>
  </tr>
</table>
    </form>
</body>
</html>
