<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/cnnSmartSchool.asp" -->
<!--#include file="inc_functions_misc.asp" -->
<%  
    schoolId = Request.Cookies("School")("SchoolId") 'request.QueryString("a")
    if Request.Cookies("Parent")("RoleId") <> "" then
        roleId = Request.Cookies("Parent")("RoleId") 'request.QueryString("b")
    else
        roleId = Request.Cookies("User")("RoleId")
    end if

	parentEmail = Request.Cookies("Parent")("UserId") 'request.QueryString("c")
	username = Request.Cookies("User")("Username") 'request.QueryString("d")
    rememberMe = Request.Cookies("Misc")("RememberMe")

    schoolColour = Request.Cookies("School")("SchoolColour")

    if roleId = 20 or RoleId = 18 then 
	    ReLoginCustomer(username)
    else 
	    ReLoginAdmin(username)        
    end if

    firstName = Request.Cookies("User")("Firstname")
    middleName = Request.Cookies("User")("MiddleName")
    surname = Request.Cookies("User")("Surname")
    sex = Request.Cookies("User")("Sex")
    className = Request.Cookies("User")("Class")

	Dim rstSchoolTheme
	Dim rstSchoolTheme_numRows

	Set rstSchoolTheme = Server.CreateObject("ADODB.Recordset")
	rstSchoolTheme.ActiveConnection = MM_cnnSmartSchool_STRING
	rstSchoolTheme.Source = "SELECT SchoolId, SchoolAbbr, SchoolName, ExtensionField1, Website FROM dbo.Core_School WHERE SchoolId = " + schoolId + ""
	rstSchoolTheme.CursorType = 0
	rstSchoolTheme.CursorLocation = 2
	rstSchoolTheme.LockType = 1
	rstSchoolTheme.Open()

	rstSchoolTheme_numRows = 0
%>

<%
	Dim rstChildren
	Dim rstChildren_cmd
	Dim rstChildren_numRows

	Set rstChildren_cmd = Server.CreateObject ("ADODB.Command")
	rstChildren_cmd.ActiveConnection = MM_cnnSmartSchool_STRING
	rstChildren_cmd.CommandText = "SELECT * FROM dbo.TEMPcustomers WHERE CurrentBal = '" & parentEmail & "' "
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

<%
    dim currentSession, currentTerm
    currentSession = GetCurrentSession()
    currentTerm = GetCurrentTerm()
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />

	<script language="JavaScript" type="text/javascript" src="inc_functions_js.js"></script>

    <script type="text/javascript">

        function showlayer(layer) {

            var myLayer = document.getElementById(layer);

            if (myLayer.style.display == "none" || myLayer.style.display == "") {

                myLayer.style.display = "block";

            } else {

                myLayer.style.display = "none";

            }

        }

        function MM_jumpMenu(targ, selObj, restore) { //v3.0
            eval(targ+".location='"+selObj.options[selObj.selectedIndex].value+"'");
        }

    </script>

</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0">

    <form id="form1">

      <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="white">

        <tr>

          <td colspan="2" height="3" bgcolor="<%= schoolColour %>"></td>

        </tr>

        <tr>

          <td colspan="2" height="1" bgcolor="white"></td>

        </tr>

        <tr>

          <td colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">

            <tr>

              <td width="70%" valign="bottom" class="HomePageTitleText2"><table width="100%" border="0" cellspacing="0" cellpadding="0">

                <tr>

                  <td width="90" align="left" valign="bottom"><img src="images/logos/logo.<%= rstSchoolTheme("SchoolId") %>.jpg" height="90" border="3" /></td>

                  <td align="left" valign="bottom"><img src="images/SmartSchool_2_logo_center.gif" alt="" width="312" height="60" /><br />

                    <font color='<%= schoolColour %>'>&nbsp;<%= UCASE(rstSchoolTheme("SchoolName")) %> (<a href='http://<%= UCASE(rstSchoolTheme("Website")) %>' target="_blank"><%= rstSchoolTheme("Website") %></a>)</font>&nbsp;</td>

                </tr>

              </table></td>

              <td align="right" valign="bottom">

                <table width="220" border="0">

                  <tr>

                    <td width="120" align="right" valign="middle" rowspan="3">

                        <a href="modules/help/" target="mainFrame">

                            <img src="images/help_icon.jpg" height="60" />

                        </a></td>

                    <td align="center" valign="middle">powered by:</td>

                  </tr>

                  <tr>

                    <td align="center" valign="middle"><a href="http://www.smartsystems-ng.com/" target="_blank"><img src="images/smartsystems_6_smaller.gif" alt="" height="60" border="0" /></a></td>

                  </tr>

                  <tr>

                    <td align="center" valign="middle"><strong><a href="http://www.smartsystems-ng.com/" target="_blank">Smart Systems</td>

                  </tr>

                </table></td>

            </tr>

          </table></td>

        </tr>

        <tr>

          <td colspan="2" height="1" bgcolor="white"></td>

        </tr>

        <tr bgcolor="<%= schoolColour %>" class="WhiteText">

          <td width="800" height="35" align="left" valign="middle"><strong>		  

              &nbsp;Current User: 

              <% if roleId = 20 or RoleId = 18 then '20 for students and 18 for parents %>      

                  <%= UCASE(firstname) %><% If roleId = 18 Then %><%= "'S PARENT" %><% End If %>

              <% else %>

                  <%= UCASE(firstName & " " & middleName & " " & surname) %>

              <% end if %>

	      <%="&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp; [" & GetLabel(roleId) & " " & username & "; Gender: " & GetSex(sex) & "; " &  GetClassLabel(roleId) & " " & className & "]" %>

          </strong></td>

          <td align="right" valign="middle">

                    <strong><%= currentTerm %>, <%= currentSession %> Session&nbsp;|</strong>&nbsp;

					<% If roleId = 18 Then %>

                        <strong>

                            <select name="lstSwitchChildren" class="defaultFormElementStyle" id="lstSwitchChildren" onchange="MM_jumpMenu('parent',this,0)">

                                <option value='#'>Switch to another child:</option>

								<% 

                                    While ((Repeat1__numRows <> 0) AND (NOT rstChildren.EOF)) 

                                %>

                                    <option value='frameset_top_switch.asp?a=<%= roleId %>&b=<%= schoolId %>&c=<%= rstChildren("CustomerCode") %>&d=<%= rstChildren("DistrictCode") %>&e=<%= parentEmail %>'><%= rstChildren("CustomerName") %></option>

                                <% 

                                    SN = SN + 1

                                    Repeat1__index=Repeat1__index+1

                                    Repeat1__numRows=Repeat1__numRows-1

                                    rstChildren.MoveNext()

                                    Wend

                                %>

                            </select>

                            &nbsp;|

                        </strong>

                        &nbsp;

                    <% End If %>

                        <strong>

                    	    <a href="<%= GetChangePasswordUrl(roleId) %>?a=<%= username %>" target="mainFrame"><font class="WhiteText">Change Password</font></a>

                            &nbsp;|

                        </strong>

                    &nbsp;

                        <strong>

                    	    <a href="modules/help/" target="mainFrame"><font class="WhiteText">Help</font></a>

                            &nbsp;|

                        </strong>

                    &nbsp;

					<% If roleId = 0 Then %>

                        <strong>

                    	    <a href="<%= GetFeedbackUrl(roleId) %>?a=<%= username %>" target="mainFrame"><font class="WhiteText">Feedback</font></a>

                            &nbsp;|

                        </strong>

                    &nbsp;

                    <% End If %>

                    <strong>

                   	<a href="javascript:coreLogOut()"><font class="WhiteText">Logout</font></a>

                        &nbsp;&nbsp;

                    </strong>

          </td>

        </tr>

        <tr>

          <td colspan="2" height="1" bgcolor="white"></td>

        </tr>

        <tr>

          <td colspan="2" height="3" bgcolor="<%= schoolColour %>"></td>

        </tr>

      </table>

    </form>

</body>

</html>

<%

	rstChildren.Close()

	Set rstChildren = Nothing



	rstSchoolTheme.Close()

	Set rstSchoolTheme = Nothing

%>



