<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="Connections/cnnSmartSchool.asp" -->
<!--#include file="inc_functions_misc.asp" -->
<%
	schoolId = request.QueryString("d")
	roleId = request.QueryString("c")
	username = request.QueryString("a")
    homePageLocation = request.QueryString("b")
    rememberMe = Request.Cookies("Misc")("RememberMe")
    
    schoolColour = Request.Cookies("School")("SchoolColour")
    if roleId = 20 or RoleId = 18 then 
	    ReLoginCustomer(username)
    else 
	    ReLoginAdmin(username)        
    end if

    firstName = Request.Cookies("User")("Firstname") ': response.write "'" & firstname & "'" : response.End
    middleName = Request.Cookies("User")("MiddleName")
    surname = Request.Cookies("User")("Surname")
    sex = Request.Cookies("User")("Sex")
    className = Request.Cookies("User")("Class")
	
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
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
rstMenu_numRows = rstMenu_numRows + Repeat1__numRows
%>
<%
	Dim rstSettings
	Dim rstSettings_numRows
    dim showPosition
	
	Set rstSettings = Server.CreateObject("ADODB.Recordset")
	rstSettings.ActiveConnection = MM_cnnSmartSchool_STRING
	rstSettings.Source = " SELECT SettingValue FROM dbo.Core_Setting WHERE SettingTitle = 'Show Positions' "
	rstSettings.CursorType = 0
	rstSettings.CursorLocation = 2
	rstSettings.LockType = 1
	rstSettings.Open()

    showPosition = UCASE(trim(rstSettings("SettingValue")))

    rstSettings_numRows = 0

    Set rstSettings = Nothing
%>	

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
<!--
.style2 {
	font-size: 12px;
	font-weight: bold;
}
.style28 {
	color: #FFFFFF;
	font-weight: bold;
}
.style29 {color: #FFFFFF}
-->
<!--
body {
	background-color: <%= schoolColour %>;
}
        .style30
        {
            width: 100%;
        }
-->
    </style>
	<script language="JavaScript" type="text/javascript" src="inc_functions_js.js"></script>
</head>
<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0" <% If username = "" Then %> onLoad="javascript:parent.document.location.href = 'logoff.asp';" <% End If %> class="NoBorders" >
    <form id="form1" runat="server">
      <table width="100%" border="0" cellspacing="0" cellpadding="3">
        <tr>
          <td colspan="2">
              <table cellpadding="0" cellspacing="0" class="style30">
                  <tr>
                      <td width="90%">
                          <span class="style2"><font color="white">
		                  <% if roleId = 20 or roleId = 18 then %>
                            <%= UCASE(firstName)%>
                          <% else %>
                            <%= UCASE(firstName & " " & middleName & " " & surname)%>
                          <% end if %>
                          </font></span>
                      </td>
                      <td align="right">
                          &nbsp;</td>
                  </tr>
              </table>
            </td>
        </tr>
          <tr>
            <td colspan="2"><span class="style2"><font color="white"><%= Request.Cookies("User")("Rolename") %></font></span></td>
          </tr>
          <tr>
              <td width="5%">              </td>
              <td>
                    <% if CInt(roleId) = 20 or CInt(roleId) = 18 then %>          
                        <img src='<%= ShowPhotograph("images/pp/" & username & ".jpg", Server.MapPath("images/pp/" & username & ".jpg")) %>' width="100" height="107" border="2" />
                    <%  else %>
                        <img src='<%= ShowPhotograph("images/pp_staff/" & username & ".jpg", Server.MapPath("images/pp_staff/" & username & ".jpg")) %>' width="100" height="107" border="2" />
                    <% end if %>
              </td>
          </tr>
          <tr>
              <td width="5%"></td>
              <td>
              <a href="<%= homePageLocation %>?a=<%= username %>&b=<%=schoolId%>&c=<%=Request.Cookies("User")("Class")%>" target="mainFrame"><font color="white">Home</font></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><a href="modules/calendar/calendar.aspx" target="mainFrame"><font color="white">My Calendar</font></a></td>
          </tr>
 
			<%= ShowTimetableLink(username, roleId) %>

          <tr>
            <td>&nbsp;</td>
            <td><a href="_uploads/Project for Term 2 2014.pdf" target="mainFrame"><font color="white">This Term's Project</font></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><a href="modules/academics/duty_rosters_menu.aspx" target="mainFrame"><font color="white">This Term's Duty Rosters</font></a></td>
          </tr>
 
			<%= ShowExamTimetableLink(roleId, Request.Cookies("User")("Class")) %>
 
          <tr>
            <td>&nbsp;</td>
            <td><a href="http://50.56.227.124:8080/m_blog_chi/?tag=pta" target="mainFrame"><font color="white">PTA Meeting Minutes</font></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><a href="http://50.56.227.124:8080/m_blog_chi/?tag=newsletter" target="mainFrame"><font color="white">Newsletters</font></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><a href="http://50.56.227.124:8080/m_blog_chi/" target="mainFrame"><font color="white">The Childville Blog</font></a></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><a href="modules/help/" target="mainFrame"><font color="white">Help and Support</font></a></td>
          </tr>
<% if CInt(roleId) <> 20 AND CInt(roleId) <> 18 then %>
    <% set rstMenu = GetMenuItems(2,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                <tr>
                  <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'><span class="style29">&nbsp;<strong>Business&nbsp;Intelligence</strong></span></td>
                </tr>
                <tr>
                  <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                            <td nowrap="nowrap">
                            <a target="mainFrame" href='<%= rstMenu("MenuUrl") %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                          </tr>
                         <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                  </table></td>
                </tr>
              </table></td>
            </tr>
    <% end if %>
<% end if %>
<% if CInt(roleId) <> 20  AND CInt(roleId) <> 18 then %>
    <% set rstMenu = GetMenuItems(8,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                  <tr>
                    <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;<span class="style28">School Administration</span></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                          <td nowrap="nowrap"><a target="mainFrame" href='<%= rstMenu("MenuUrl") %>?a=<%= username %>&b=<%= right(schoolColour,6) %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                        </tr>
                        <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
    <% end if %>
<% end if %>
<% if CInt(roleId) <> 20  AND CInt(roleId) <> 18 then %>
    <% set rstMenu = GetMenuItems(3,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td>            
                <table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                  <tr>
                    <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;<span class="style28">Reports</span></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                            <td nowrap="nowrap">
                            <a target="mainFrame" href='<%= rstMenu("MenuUrl") %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                      </tr>
                         <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                    </table></td>
                  </tr>
                </table></td>
            </tr>
    <% end if %>
<% end if %>        
<% if CInt(roleId) <> 20 then %>
    <% set rstMenu = GetMenuItems(4,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                    <tr>
                      <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;<span class="style28">Profile</span></td>
                    </tr>
                    <tr>
                      <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                            <td nowrap="nowrap">
                            <a target="mainFrame" href='<%= rstMenu("MenuUrl") & "?a=" & username & "&b=" & right(schoolColour,6) %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a></td>
                          </tr>
                         <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                      </table></td>
                    </tr>
                  </table></td>
            </tr>
    <% end if %>
<% end if %>        
<% 'if CInt(roleId) = 18 then %>
    <% set rstMenu = GetMenuItems(1,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                  <tr>
                    <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;<span class="style28">Payments</span></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                          <td nowrap="nowrap"><a target="mainFrame" href='<%= rstMenu("MenuUrl")& "?a=" & username & "&b=" & Request.Cookies("User")("Class") %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                        </tr>
                        <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                    </table></td>
                  </tr>
              </table></td>
            </tr>
    <% end if %>
<% 'end if %>
<% if CInt(roleId) = 20 or CInt(roleId) = 18 then %>
    <% set rstMenu = GetMenuItems(6,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                  <tr>
                    <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'>&nbsp;<span class="style28">Academics</span></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                            <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                              <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                                <td nowrap="nowrap">
                                <a target="mainFrame" href='<%= rstMenu("MenuUrl") & "&a=" & username & "&b=" & Request.Cookies("User")("Class") & "&d=" & Right(Request.Cookies("School")("SchoolColour"), 6) %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                              </tr>
                         <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                    </table></td>
                  </tr>
                </table></td>
            </tr>
    <% end if %>
<% end if %>
<% if CInt(roleId) = 20 then %>
    <% set rstMenu = GetMenuItems(7,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                  <tr>
                    <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'><span class="style28">&nbsp;OpenCourseware</span></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                            <td nowrap="nowrap">
                            <a target="mainFrame" href='<%= rstMenu("MenuUrl") %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                          </tr>
                         <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                    </table></td>
                  </tr>
                </table></td>
            </tr>
    <% end if %>
<% end if %>
<% if CInt(roleId) <> 20 AND CInt(roleId) <> 18 then %>        
    <% set rstMenu = GetMenuItems(5,roleId, showPosition) %>
    <% if GetRecordsetCount(rstMenu) > 0 then %>
            <tr>
              <td>&nbsp;</td>
              <td><table  border="0" cellpadding="0" cellspacing="0" class="borderedTableWhite">
                  <tr>
                    <td align="left" valign="top" bgcolor='<%= rstSchoolTheme("ExtensionField1") %>'><span class="style28">&nbsp;Setups</span></td>
                  </tr>
                  <tr>
                    <td align="left" valign="top"><table id="Table2" cellspacing="1" cellpadding="1" width="160" border="0" bgcolor="white">
					    <% set rstMenu = GetMenuItems(5,roleId, showPosition) %>
                        <% 
						    While (NOT rstMenu.EOF)
					    %>
                        <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                          <td width="10" nowrap="nowrap"><img src="images/norm2.gif" width="12" height="12" /></td>
                            <td nowrap="nowrap">
                            <a target="mainFrame" href='<%= rstMenu("MenuUrl") %>' title='<%= rstMenu("MenuName") %>' ><%= rstMenu("MenuName") %></a> </td>
                          </tr>
                         <% 
						      rstMenu.MoveNext()
						    Wend
					    %>
                    </table></td>
                  </tr>
                </table></td>
            </tr>
    <% end if %>
<% end if %>        
            <tr>
              <td>&nbsp;</td>
              <td><a href="javascript:coreLogOut()"><font class="WhiteText">Logout</font></a></td>
            </tr>
      </table>
    </form>
</body>
</html>
<%
	rstSchoolTheme.Close()
	Set rstSchoolTheme = Nothing
%>
