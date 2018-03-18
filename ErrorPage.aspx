<%@ Page Language="VB" AutoEventWireup="false" CodeFile="ErrorPage.aspx.vb" Inherits="ErrorPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style17
        {
            width: 100%;
        }
    </style>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table border="0" width="100%">
            <tr>
                <td colspan="2">
                    <br />
                    <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" 
                        Text=":: An Error Occurred"></asp:Label>
                    <br />
&nbsp;</td>
            </tr>
            <tr bgcolor="#005782">
                <td align="left" height="40" 
                    style="color: #FFFFFF; font-size: small; font-weight: bold;" colspan="2">
                    <table align="left" class="style17">
                        <tr>
                            <td align="center" width="70">
                                <img alt="" height="50" src="images/info_icon.png" /></td>
                            <td>
                    Oops... An unexpected event just occurred.</td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" width="10%">
                    &nbsp;</td>
                <td valign="top">
                    <br />
                    <br />
                    <asp:Label ID="lblErrorMessage" runat="server" Font-Bold="True" Font-Size="Large" 
                        Text="ex.Message"></asp:Label><hr align="left" color="black" 
                        noshade="noshade" width="100%" />
                    <br />
                    <br />
                    At:
                    <asp:Label ID="lblErrorSource" runat="server" Font-Bold="True" Text="ex.Source"></asp:Label>
&nbsp;<br />
                    <br />
                    <br />
                    Sorry, but 
                    an unexpected error occurred while trying to serve your request.<br />
                    <br />
                    <br />
                    Details of this error have been automatically logged and an e-mail message has already been sent to our Technical Services and Support 
                    Team, notifying them of the issue. If this problem is not solved within the next 
                    twenty-four (24) hours, please contact your System Administrator to escalate its priority.<br />
                    <br />
                    <br />
                    <asp:Label ID="lblNextSteps" runat="server" Font-Bold="True" Font-Size="Small" 
                        Text="Next Steps:"></asp:Label>
                    <br />

                    <table id="Table2" cellspacing="1" cellpadding="1" width="800px" border="0" bgcolor="white">
                        <tr>
                          <td width="50" nowrap="nowrap" align="right" height="25" valign="middle"><img src="http://localhost/MySchool360.Childville/images/norm2.gif" width="12" height="12" /></td>
                          <td nowrap="nowrap" valign="middle"><a target="_blank" href='http://support.smartsystems-ng.com' >Submit a help request (on our Support Portal - support.smartsystems-ng.com)</a> </td>
                        </tr>
                        <tr>
                          <td align="right" height="25" valign="middle"><img src="http://localhost/MySchool360.Childville/images/norm2.gif" width="12" height="12" /></td>
                          <td nowrap="nowrap" valign="middle"><a href='mailto:support@smartsystems-ng.com' >Send us an e-mail (support@smartsystems-ng.com)</a> </td>
                        </tr>
                        <tr>
                          <td align="right" height="25" valign="middle"><img src="http://localhost/MySchool360.Childville/images/norm2.gif" width="12" height="12" /></td>
                          <td nowrap="nowrap" valign="middle"><a href='tel:+234.805.702.0667' >Call us (+234.1.295.6793, +234.704.149.5226, +234.805.702.0667)</a> </td>
                        </tr>
                        <%--<tr>
                          <td align="right" height="25" valign="middle"><img src="http://localhost/MySchool360.Childville/images/norm2.gif" width="12" height="12" /></td>
                          <td nowrap="nowrap" valign="middle"><a href='#' >View more detailed technical information</a> </td>
                        </tr>--%>
                    </table>

                    <br />
                    </td>
            </tr>
            <tr>
                <td colspan="2" valign="top">
                    &nbsp;</td>
            </tr>
            </table>
    
    </div>
    </form>
</body>
</html>
