<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>

<!--#include file="Connections/cnnSmartSchool.asp" -->

<!--#include file="inc_functions_misc.asp" -->

<%

	pictureCount = 21

	Randomize

 	rndPicture = Int((pictureCount * Rnd) + 1)

%>

<%  

	dim errLoginCustomer, errLoginAdmin, errLoginParent

	

	If Request.Form("btnSubmit") <> "" Then

        rememberMe = CBool(request.Form("chkRememberMe"))

        Response.Cookies("Misc")("RememberMe") = rememberMe

        Response.Cookies("School")("SchoolId") = request.Form("hidSchoolId")

	    Response.Cookies("School")("SchoolColour") = request.Form("hidSchoolColour")

        If rememberMe then 

            Response.Cookies("School").Expires = Now() + 365

            Response.Cookies("User").Expires = Now() + 365

            Response.Cookies("Misc").Expires = Now() + 365

        End If

		select case request.form("lstRole")

			case 20		'Student

				portalNumber = Replace(request.Form("txtPortalNumber"), "'", "''")

				password = Replace(request.Form("txtPassword"), "'", "''")

				Call LoginCustomer()

				if NOT errLoginCustomer then

					response.Redirect("frameset.asp")

				end if

			case 18		'Parent

				parentEmail = Replace(request.Form("txtPortalNumber"), "'", "''")

				password = Replace(request.Form("txtPassword"), "'", "''")

				Call LoginParent()

				if NOT errLoginParent then

					response.Redirect("homeproc.asp")

				end if

			case else	'Admin

				username = Replace(request.Form("txtPortalNumber"), "'", "''")

				password2 = Replace(request.Form("txtPassword"), "'", "''")

				Call LoginAdmin()

				if NOT errLoginAdmin then

					response.Redirect("frameset.asp")

				end if

		end select

	End If

%>  

<%	

	schoolId = "15"

	

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

%>

<%

	Dim rstRoles

	Dim rstRoles_cmd

	Dim rstRoles_numRows

	

	Set rstRoles_cmd = Server.CreateObject ("ADODB.Command")

	rstRoles_cmd.ActiveConnection = MM_cnnSmartSchool_STRING

	rstRoles_cmd.CommandText = "SELECT * FROM dbo.Core_Role ORDER BY RoleName ASC" 

	rstRoles_cmd.Prepared = true

	

	Set rstRoles = rstRoles_cmd.Execute

	rstRoles_numRows = 0

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >

<head>

    <title>MySchool360 :: <%= UCASE(rstSchoolTheme("SchoolName")) %> :: Monitor your child's school performance from home, office or wherever! - brought to you by Smart Systems Company</title>

    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

    <style type="text/css">

<!--

.style17 {color: #FF0000}

-->

    </style>

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

    <form action="home.asp" method="post" name="frmLogin" id="frmLogin">

      <table width="1000" border="0" align="center" class="borderedTableGrey">

        <tr>

            <td align="center"></td>

          <td align="center"></td>

          <td align="center"></td>

        </tr>

        <tr>

            <td align="center">&nbsp;</td>

          <td width="650" align="center"><a href="http://www.myschool360.info"><img src="images/SmartSchool_2_logo.gif" width="646" 

                  height="60" /></a></td>

          <td align="center">&nbsp;</td>

        </tr>

        <tr>

            <td align="center">&nbsp;</td>

          <td align="center"><hr width="90%" /></td>

          <td align="center">&nbsp;</td>

        </tr>

        <tr>

            <td width="175" align="center">&nbsp;</td>

          <td align="center"><em class="HomePageTitleText">360-degree school integration for the 21st Century!</em></td>

          <td align="center">&nbsp;</td>

        </tr>

        <tr valign="top">

          <td colspan="3" align="left" valign="top"><table width="100%" border="0" cellspacing="2" cellpadding="2" class="borderedTableThicker" style='border-color:<%= rstSchoolTheme("ExtensionField1") %>'>

            <tr>

              <td width="66%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                  <td width="5%">&nbsp;</td>

                  <td><table width="100%" height="172" border="0">

                    <tr>

                      <td align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">

                        <tr>

                          <td align="left" valign="bottom" class="HomePageTitleText2"><br />

                            <font color='<%= rstSchoolTheme("ExtensionField1") %>'><%= UCASE(rstSchoolTheme("SchoolName")) %></font>

                          </td>

                        </tr>

                      </table>

                        <hr color='<%= rstSchoolTheme("ExtensionField1") %>' />

            <!--<marquee>

            	<strong>OUR VISION</strong>:&nbsp;Childville Schools will be <font color='<%= rstSchoolTheme("ExtensionField1") %>' class="emphasisText">excellent institutions of learning</font>, providing a <font color='<%= rstSchoolTheme("ExtensionField1") %>' class="emphasisText">conducive environment</font> for children ages 2 – 16+ to reach their full potential <font color='<%= rstSchoolTheme("ExtensionField1") %>' class="emphasisText">intellectually, socially, morally and physically</font>. Childville Schools will be known for <font color='<%= rstSchoolTheme("ExtensionField1") %>' class="emphasisText">excellent and all round academic achievement</font> and will therefore become a parent’s first choice in learning and education. Our <font color='<%= rstSchoolTheme("ExtensionField1") %>' class="emphasisText">commitment</font> is to the child. Our <font color='<%= rstSchoolTheme("ExtensionField1") %>' class="emphasisText">orientation</font> is the child.

            </marquee>-->

            			<br /><br />

                        <img src="images/rotate/<%= rndPicture %>.jpg" border="10" height="301" 

                              width="301" />

					  </td>

                    </tr>

                  </table></td>

                  <td width="5%">&nbsp;</td>

                </tr>

              </table></td>

              <td width="2%" align="center" valign="middle"><hr style="width:1px;height:400px;" color='<%= rstSchoolTheme("ExtensionField1") %>' /></td>

              <td align="center" valign="middle"><table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                  <td width="5%">&nbsp;</td>

                  <td><table width="100%" height="172" border="0">

                    <tr>

                      <td align="right" valign="top"><div align="center" class="style17">

                        <%

				  	if errLoginCustomer OR errLoginAdmin OR errLoginParent then

                  		response.write "Login Error.<br/>The username and password that you have provided do not match our records."

					end if

				  %>

                        </div></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle"><br />                        <img src="images/logos/logo.<%= schoolId %>.jpg" height="150" border="3" /></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle" class="loginTextStyle"><strong><font color='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;Username:</font></strong></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle"><input name="txtPortalNumber" type="text" class="defaultFormElementStyleLargeForLoginPage" id="txtPortalNumber" value="" size="27" /></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle" class="loginTextStyle"><strong><font color='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;Password:</font></strong></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle"><input name="txtPassword" type="password" class="defaultFormElementStyleLargeForLoginPage" value="" id="txtPassword" size="27" /></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle" class="loginTextStyle"><strong><font color='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;Log in as:</font></strong></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle"><select name="lstRole" class="defaultFormElementStyleLargeForLoginPage" id="lstRole">

                        <%

While (NOT rstRoles.EOF)

%>

                        <option value="<%=(rstRoles.Fields.Item("RoleId").Value)%>" <%If (Not isNull("20")) Then If (CStr(rstRoles.Fields.Item("RoleId").Value) = CStr("20")) Then Response.Write("selected=""selected""") : Response.Write("")%> ><%=(rstRoles.Fields.Item("RoleName").Value)%></option>

                        <%

  rstRoles.MoveNext()

Wend

If (rstRoles.CursorType > 0) Then

  rstRoles.MoveFirst

Else

  rstRoles.Requery

End If

%>

                      </select></td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle"><input name="chkRememberMe" type="checkbox" id="chkRememberMe" value="1" />

                        &nbsp;Always remember me</td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle">&nbsp;</td>

                    </tr>

                    <tr>

                      <td align="left" valign="middle"><input name="btnSubmit" type="submit" 

                          class="loginButtonStyleForLoginPage" id="btnSubmit" value="   Log In &gt;  " 

                          style='background-color:<%= rstSchoolTheme("ExtensionField1") %>' />

                        &nbsp;&nbsp;&nbsp;&nbsp;

                        <br /><br />

                        <a href="#">Forgot your password?</a>&nbsp; </td>

                    </tr>

                  </table></td>

                  <td width="5%">&nbsp;</td>

                </tr>

              </table></td>

            </tr>

            <tr>

              <td align="center" valign="top">&nbsp;</td>

              <td align="center" valign="middle">&nbsp;</td>

              <td align="center" valign="top">

                    <input name="hidSchoolId" type="hidden" id="hidSchoolId" value="<%= rstSchoolTheme("SchoolId") %>" />

					<input name="hidSchoolName" type="hidden" id="hidSchoolName" value="<%= rstSchoolTheme("SchoolName") %>" />

					<input name="hidSchoolColour" type="hidden" id="hidSchoolName" value="<%= rstSchoolTheme("ExtensionField1") %>" />                  

              </td>

            </tr>

          </table></td>

        </tr>

        <tr>

            <td colspan="3" align="center">

            

            </td>

          </tr>

        <tr>

            <td align="center">&nbsp;</td>

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

                            <td align="center" valign="middle"><a href="http://www.smartsystems-ng.com/" target="_blank"> <img src="images/smartsystems_6_smaller.gif" alt="" height="60" border="0" /></a></td>

                        </tr>

                        <tr>

                            <td align="center" valign="middle"><strong><a href="http://www.smartsystems-ng.com/" target="_blank">Smart Systems</a></strong></td>

                        </tr>

                    </table>

                        <a href="http://www.smartsystems-ng.com/" target="_blank"></a></td>

                </tr>

            </table></td>

            <td align="center">&nbsp;</td>

        </tr>

        </table>

</form>

</body>

</html>

<%

	rstSchoolTheme.Close()

	Set rstSchoolTheme = Nothing

%>

<%

	rstRoles.Close()

	Set rstRoles = Nothing

%>

