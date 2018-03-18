<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/cnnSmartSchool.asp" -->
<!--#include file="inc_functions_misc.asp" -->
<%
	roleId = Request.Cookies("Parent")("RoleId") ' request.QueryString("a")
	schoolId = Request.Cookies("School")("SchoolId") ' request.querystring("b")
	parentEmail = Request.Cookies("Parent")("UserId") ' request.QueryString("c")
	dept = Request.Cookies("Parent")("Class") ' request.QueryString("d")
    rememberMe = Request.Cookies("Misc")("RememberMe")

	If Request.Form("btnLoginChild") <> "" Then
        'set cookies for PortalNumber and Class and move on to frameset.asp
        Response.Cookies("User")("Username") = request.Form("hidPortalNumber")      ': response.write "I have reset the username": response.end
        Response.Cookies("User")("Class") = request.Form("hidClass")
        if RememberMe then
            Response.Cookies("User").Expires = Now() + 365
            Response.Cookies("Parent").Expires = Now() + 365
            Response.Cookies("School").Expires = Now() + 365
            Response.Cookies("Misc").Expires = Now() + 365
        End If
        response.Redirect("frameset.asp")
	End If

	Dim rstSchoolTheme
	Dim rstSchoolTheme_numRows
	
	Set rstSchoolTheme = Server.CreateObject("ADODB.Recordset")
	rstSchoolTheme.ActiveConnection = MM_cnnSmartSchool_STRING
	rstSchoolTheme.Source = "SELECT SchoolId, SchoolAbbr, SchoolName, ExtensionField1 FROM dbo.Core_School WHERE SchoolId = " + schoolId + ""
	rstSchoolTheme.CursorType = 0
	rstSchoolTheme.CursorLocation = 2
	rstSchoolTheme.LockType = 1
	rstSchoolTheme.Open()
	
	rstSchoolTheme_numRows = 0

	schoolName=rstSchoolTheme("SchoolName")
%>
<%
	Dim rstChildren
	Dim rstChildren_cmd
	Dim rstChildren_numRows
	
	Set rstChildren_cmd = Server.CreateObject ("ADODB.Command")
	rstChildren_cmd.ActiveConnection = MM_cnnSmartSchool_STRING
	rstChildren_cmd.CommandText = "SELECT * FROM dbo.TEMPcustomers WHERE (CurrentBal = '" & parentEmail & "' OR EmailAddress = '" & parentEmail & "')"
	rstChildren_cmd.Prepared = true
	
	Set rstChildren = rstChildren_cmd.Execute
	rstChildren_numRows = 0
%>
<%
	Dim Repeat1__numRows
	Dim Repeat1__index
	
	Repeat1__numRows = -1
	Repeat1__index = 0
	rstChildren_numRows = rstChildren_numRows + Repeat1__numRows
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>MySchool360 :: <%= UCASE(rstSchoolTheme("SchoolName")) %> :: Monitor your child's school performance from home, office or wherever! - brought to you by Smart Systems Company</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">
      <br />
        <table border="0" align="center">
        <tr>
          <td align="center"></td>
        </tr>
        <tr>
          <td align="center"><img src="images/SmartSchool_2_logo.gif" width="646" 
                  height="60" /></td>
        </tr>
        <tr>
          <td align="center"><hr width="90%" /></td>
        </tr>
        <tr>
          <td align="center"><em class="HomePageTitleText">Monitor your child's school performance from home, office or wherever!</em></td>
        </tr>
        <tr>
          <td align="center">&nbsp;</td>
        </tr>
        <tr>
          <td>
<table width="100%" border="0" cellspacing="0" cellpadding="0"  class="borderedTableThicker" style='border-color:<%= rstSchoolTheme("ExtensionField1") %>'>
                  <tr>
                    <td width="5%">&nbsp;</td>
                    <td>
<table width="100%" border="0">
                <tr>
                  <td align="center" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr>
                      <td align="left" valign="bottom" class="HomePageTitleText2"><br /><font color='<%= rstSchoolTheme("ExtensionField1") %>'><%= UCASE(rstSchoolTheme("SchoolName")) %></font></td>
                      </tr>
                  </table><hr color='<%= rstSchoolTheme("ExtensionField1") %>' /></td>
                </tr>
                </table>                    
                    </td>
                    <td width="5%">&nbsp;</td>
                  </tr>
                  <tr>
                    <td align="center" colspan="3">
<table width="100%" height="172" border="0">
                <tr>
                  <td colspan="2" align="left" valign="top">&nbsp;</td>
                </tr>
                <tr>
                  <td width="40%" align="center" valign="top" height="230">
                      <img src="images/logos/logo.<%= schoolId %>.jpg" height="180" border="3" /></td>
                  <td align="center" valign="top">
<table width="100%" border="0">
    <tr>
      <td align="center" valign="middle" class="pageHeaderStyle style1"><font color='<%= rstSchoolTheme("ExtensionField1") %>'>You have <%= GetChildrenCount(parentEmail) %> enrolled 
          at our school. <br />
          They are listed below, please click any to continue.</font></td>
      </tr>
    <tr>
      <td valign="top"><hr /></td>
    </tr>
<% 
	SN = 1
	While ((Repeat1__numRows <> 0) AND (NOT rstChildren.EOF)) 
%>
    <tr>
        <td>
            <table width="100%" border="0">
            <form action="homeproc.asp" method="post" name="frmChild<%= SN %>" id='frmChild<%= SN %>'>
              <tr>
                  <td width="5%" align="right" valign="middle"><%= SN %>.&nbsp;</td>
                  <td width="40" align="center" valign="middle"><a href="javascript:window.open('modules/academics/photo_zoom.aspx?a=<%= rstChildren("CustomerCode") %>','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');"><img src='<%= ShowPhotograph("images/pp/" & rstChildren("CustomerCode") & ".jpg", Server.MapPath("images/pp/" & rstChildren("CustomerCode") & ".jpg")) %>' width="30" height="30" border="2" /></a></td>
                  <td align="left" valign="middle">
                      <input id="btnLoginChild" name="btnLoginChild" type="submit" value=' Continue to <%= rstChildren("CustomerName") & " (" & rstChildren("DistrictCode") & ", " & rstChildren("CustomerCode") & ")" %> ' class="defaultButtonStyle" />&nbsp;
                      <input id='hidPortalNumber' name="hidPortalNumber" type="hidden" value='<%= rstChildren("CustomerCode") %>' />
                      <input id='hidClass' name="hidClass" type="hidden" value='<%= rstChildren("DistrictCode") %>' />
                  </td>
              </tr>
            </form>
           </table>
        </td>
    </tr>
<% 
	SN = SN + 1
	Repeat1__index=Repeat1__index+1
	Repeat1__numRows=Repeat1__numRows-1
	rstChildren.MoveNext()
	Wend
%> 
    <tr>
        <td>
            <table width="100%" border="0">
            <form action="logoff.asp" method="post" name="frmLogout" id='Form1'>
              <tr>
                  <td width="5%" align="right" valign="middle">&nbsp;</td>
                  <td align="center" valign="middle">
                      <input id="Submit1" name="btnLoginChild" type="submit" value=' Logout ' class="defaultButtonStyle" />&nbsp;
                  </td>
              </tr>
             </form>
          </table>
        </td>
    </tr>
    </table>                  
                  </td>
                </tr>
                </table>                    
                      </td>
                  </tr>
                  </table>          
          </td>
        </tr>
        <tr>
          <td align="center"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td align="center">powered by:</td>
            </tr>
            <tr height="5">
              <td height="5" align="center"></td>
            </tr>
            <tr valign="middle">
              <td align="center"><table width="200" border="0">
              <tr>
                    <td align="center" valign="middle"><a href="http://www.smartsystems-ng.com/" target="_blank">
                        <img src="images/smartsystems_6_smaller.gif" alt="" height="60" border="0" /></a></td>
                  </tr>
                  <tr>
                    <td align="center" valign="middle"><strong><a href="http://www.smartsystems-ng.com/" target="_blank">Smart Systems</a></strong></td>
                  </tr>
                </table>
                <a href="http://www.smartsystems-ng.com/" target="_blank"></a></td>
            </tr>
            <tr valign="middle">
              <td align="center">&nbsp;</td>
            </tr>
          </table></td>
        </tr>
      </table>      



</body>
</html>
<%
	rstChildren.Close()
	Set rstChildren = Nothing
	
	rstSchoolTheme.Close()
	Set rstSchoolTheme = Nothing
%>
