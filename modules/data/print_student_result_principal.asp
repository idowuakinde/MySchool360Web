<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%	
	dim matricNumber
	matricNumber = request.querystring("a")	
	v_session = GetCurrentSession()': response.write v_session: response.end()
	v_term = GetCurrentTerm()': response.write v_term: response.end()
	dim v_username, v_firstName, v_middleName, v_surname, v_class, v_boarder, v_customerId, v_gender, v_dateOfBirth
	Call GetStudentProfile(matricNumber)': Call GetStudentScores(v_username, v_session, v_term)
	
	Dim rstStudentScores
	Dim rstStudentScores_numRows
	
	Set rstStudentScores = Server.CreateObject("ADODB.Recordset")
	rstStudentScores.ActiveConnection = MM_cnnSmartSchool_STRING
	'rstStudentScores.Source = " Select * FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '"& matricNumber & "' AND SessionName = '"& v_session & "' AND TermName = '"& v_term & "' AND Score > 0 "
	rstStudentScores.Source = " Select * FROM dbo.TEMPStudentSubjectScore a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName WHERE PortalNumber = '"& matricNumber & "' AND SessionName = '"& v_session & "' AND TermName = '"& v_term & "' AND Score > 0 "
	rstStudentScores.CursorType = 0
	rstStudentScores.CursorLocation = 2
	rstStudentScores.LockType = 1
	'response.write rststudentscores.source: response.End()
	rstStudentScores.Open()
			
	rstStudentScores_numRows = 0
	
	Dim Repeat1__numRows
	Dim Repeat1__index
	
	Repeat1__numRows = -1
	Repeat1__index = 0
	rstStudentScores_numRows = rstStudentScores_numRows + Repeat1__numRows
%>
<%
	If Request.Form("btnSubmit") <> "" then	'this is a form submit		
		'save the Principal's Comment
		dim status, blnPostBack
		status = SavePrincipalComment(matricNumber, v_session, v_term, "Test", Request.Form("txtPrincipalComment"))
		blnPostBack = true
		'response.write "'" & status & "'": response.end
	End If
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
<table width="880" border="0" cellpadding="0" cellspacing="0" class="borderedTableGrey">
    <tr>
        <td width="20">&nbsp;</td>
        <td align="center">
		<%
			if blnPostBack AND status > 0 then 
				response.write "<strong><font color='green' style='defaultHeaderTextStyle'>Congratulations! Principal's Comments were successfully saved.</font></strong>"
			elseif blnPostBack AND status < 1 then
				response.write "<strong><font color='red' style='defaultHeaderTextStyle'>Sorry. An error occurred during the Save operation. Please try again or contact an Administrator.</font></strong>"
			end if
        %>        
        </td>
        <td width="20">&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td><table width="100%"  border="0">
            <tr>
                <td width="70%" valign="top"><table width="100%" border="0">
                    <tr>
                        <td colspan="2" align="center" valign="middle">&nbsp;</td>
                        <td align="right" valign="middle" colspan="2"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:document.getElementById('btnPrint').style.display = 'none';GenerateDynamicPDF('print_student_result_pdf.aspx?a=<%= matricNumber %>');" /></td>
                    </tr>
                    <tr>
                        <td width="10" align="center" valign="middle">&nbsp;</td>
                        <td width="190" align="right" valign="middle"><img src="../../images/logos/logo.23.jpg" alt="" height="120" border="2" /></td>
                        <td align="center" valign="middle"><span class="pageHeaderStyleAHALL">OXBRIDGE TUTORIAL COLLEGE</span><br />
                            <span class="style18">&nbsp;</span><br />
                            <span class="smallTextStyle"><strong>49, Sobo Arobiodu Street, GRA Ikeja - Lagos, Nigeria<br />
                                Tel: 01-7943654, 01-7407577<br />
                                E-mail: oxbridge@oxbridgecoll.com<br />
                                www.oxbridgecoll.com</strong></span></td>
                        <td align="center" valign="middle" class="pageHeaderStyleAHALL" width="100">&nbsp;</td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td align="center" valign="top"><font color="#000000"><strong><%= GetTermDescription(v_term) & " " & v_session & " Session" %><br />SEPTEMBER TEST<br />
&nbsp;                </strong></font></td>
            </tr>
            <tr>
                <td align="center" valign="top"><table width="100%" border="0" cellspacing="3" cellpadding="3" style="white-space: nowrap;">
                    <tr>
                        <td width="33%" align="left" valign="middle"><span class="style16"><font color="#000000"><strong>Surname: <%= UCASE(v_surname) %></strong></font></span></td>
                        <td width="33%" align="center" valign="middle"><span class="style16"><font color="#000000"><strong>Class: <%= v_class %></strong></font></span></td>
                        <td align="right" valign="middle"><span class="style16"><font color="#000000"><strong>Portal Number: <%= matricNumber %></strong></font></span></td>
                        </tr>
                    <tr>
                        <td align="left" valign="middle"><span class="style16"><font color="#000000"><strong>First Name: <%= v_firstName %></strong></font></span></td>
                        <td align="center" valign="middle"><span class="style16"><font color="#000000"><strong>Gender: <%= GetSex(v_gender) %></strong></font></span></td>
                        <td align="right" valign="middle"><span class="style16"><font color="#000000"><strong>Programme: <%= GetProgrammeAbbr(v_class) %></strong></font></span></td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td align="center" valign="top"><hr color="#990000" size="2" /></td>
            </tr>
<% if rstStudentScores.BOF AND rstStudentScores.EOF then %> 
    <tr>
        <td align="center" valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="1">
            <tr>
                <td height="30" colspan="5" align="left" valign="middle"><span class="style16">Sorry. No subject scores were found for this student in the specified term.</span></td>
            </tr>
        </table></td>
    </tr>
<% else %>
	<% 
    While ((Repeat1__numRows <> 0) AND (NOT rstStudentScores.EOF)) 
    %>
        <tr>
            <td align="center" valign="top"><table width="100%" border="0" cellpadding="1" cellspacing="1">
                <tr>
                    <td height="30" colspan="5" align="left" valign="middle"><span class="pageHeaderStyleAHALL"><%= rstStudentScores("SubjectName") %></span></td>
                </tr>
                <tr>
                    <td width="45%" height="30" align="left" valign="middle" class="borderedTableGrey"><span class="style16">Continuous Assessment - September Test</span></td>
                    <td width="10%" align="center" valign="middle" class="borderedTableGrey"><span class="style16">Total</span></td>
                    <td width="10%" align="center" valign="middle" class="borderedTableGrey"><span class="style16">Grade</span></td>
                    <td width="10%" align="center" valign="middle" class="borderedTableGrey"><span class="style16">Class Av.</span></td>
                    <td align="center" valign="middle" class="borderedTableGrey"><span class="style16">GPA</span></td>
                </tr>
                <tr>
                    <td height="30" align="left" valign="middle" class="borderedTableGrey">&nbsp;</td>
                    <td align="center" valign="middle" class="borderedTableGrey"><span class="style16"><%= FormatNumber(rstStudentScores("Score"), 1) %>%</span></td>
                    <td align="center" valign="middle" class="borderedTableGrey"><span class="style16"><%= Split(GetGradeSchool3(rstStudentScores("Score"), v_class), ",")(0) %></span></td>
                    <td align="center" valign="middle" class="borderedTableGrey"><span class="style16"><%= FormatNumber(GetClassAverage(v_class, rstStudentScores("SubjectShortName")), 1) %>%</span></td>
                    <td align="center" valign="middle" class="borderedTableGrey"><span class="style16"><%= Split(GetGradeSchool3(rstStudentScores("Score"), v_class), ",")(2) %></span></td>
                </tr>
                <tr>
                    <td height="30" colspan="3" align="left" valign="bottom" class="borderedTableGrey"><span class="style16"><font color="#000000"><strong>Remarks:<br /></strong></font><%= rstStudentScores("Comment") %>&nbsp;</span></td>
                    <td colspan="2" align="right" valign="bottom" class="borderedTableGrey"><span class="style16"><font color="#000000"><strong>Subject Teacher:<br />
                    </strong></font><%= GetTeacherName(rstStudentScores("SubjectShortName"), v_class) %></span></td>
                </tr>
            </table></td>
        </tr>
    <% 
      Repeat1__index=Repeat1__index+1
      Repeat1__numRows=Repeat1__numRows-1
      rstStudentScores.MoveNext()
    Wend
    %>
<% end if %>
<tr>
    <td align="center" valign="top"><hr color="#990000" size="2" /></td>
</tr>
<tr>
    <td align="center" valign="top">&nbsp;</td>
</tr>
            <tr>
                <td valign="top"><span class="style16"><font color="#000000"><strong>Principal's Comments:<br />
                        </strong></font><textarea name="txtPrincipalComment" cols="140" rows="10" class="defaultFormElementStyle" id="txtPrincipalComment"><%= GetPrincipalComment(matricNumber, v_session, v_term, "Test") %></textarea>
                        &nbsp;<br />
                </span>
                        <input name="btnSubmit" type="submit" class="defaultButtonStyle" id="btnSubmit" value="          Save Comment &gt;          " />
                    <span class="style16">
                    <input name="btnReset" type="reset" class="defaultButtonStyle" id="button" value="   Clear   " />
                    </span></td>
            </tr>
            <tr>
                <td align="center" valign="top"><hr color="#990000" size="2" /></td>
            </tr>
        </table></td>
        <td>&nbsp;</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
    </tr>
</table>
</form>
</body>
</html>
<%
	rstStudentScores.Close()
	Set rstStudentScores = Nothing
%>
<%
 	Sub GetStudentProfile(matricNumber)
		Set rstProfile = Server.CreateObject("ADODB.Recordset")
		rstProfile.ActiveConnection = MM_cnnSmartSchool_STRING
		rstProfile.Source = "SELECT * FROM dbo.TEMPCustomers WHERE CustomerCode = '" & matricNumber & "' "
		rstProfile.CursorType = 0
		rstProfile.CursorLocation = 2
		rstProfile.LockType = 1
		rstProfile.Open()
		
		if rstProfile.EOF AND rstProfile.BOF then
			response.write "An eror occurred and the specified Student's profile could not be loaded. Please try again or contact an Administrator.": response.end()
		else
			v_username = matricNumber
			v_fullName = rstProfile("CustomerName")
			v_firstName = rstProfile("FirstName")
			v_surname = rstProfile("LastName")
			v_customerId = rstProfile("CustomerId")
			v_class = rstProfile("DistrictCode")
			v_boarder = rstProfile("Activated")
			v_gender = rstProfile("SyncStatus")
			v_dateOfBirth = rstProfile("MeterDate")
		end if
	
		rstProfile.Close()
		Set rstProfile = Nothing
	end Sub
%>
