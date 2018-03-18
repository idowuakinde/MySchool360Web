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
	rstStudentScores.Source = "Select * FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '"& matricNumber & "' AND SessionName = '"& v_session & "' AND TermName = '"& v_term & "' "
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
<table width="1100" border="0" cellpadding="0" cellspacing="0" class="borderedTableGrey">
    <tr>
        <td width="20">&nbsp;</td>
        <td>&nbsp;</td>
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
                        <td width="290" align="right" valign="middle"><img src="../../images/logos/logo.15.jpg" alt="" height="120" border="2" /></td>
                        <td align="center" valign="middle"><span class="pageHeaderStyleAHALL">Childville Schools</span><br />
                            <span class="style18">&nbsp;</span><br />
                            <span class="smallTextStyle"><strong>49, Sobo Arobiodu Street, GRA Ikeja - Lagos, Nigeria<br />
                                Tel: 01-7943654, 01-7407577<br />
                                E-mail: childville@thechildville.org<br />
                                www.thechildville.org</strong></span></td>
                        <td align="center" valign="middle" class="pageHeaderStyleAHALL" width="200">&nbsp;</td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td align="center" valign="top"><span class="defaultHeaderTextStyle">&nbsp;</span><br />
                    <span class="pageHeaderStyleAHALL"><font color="#000000">ACADEMIC TRANSCRIPT</font></span><br />
                    <span class="defaultHeaderTextStyle">&nbsp;</span></td>
            </tr>
            <tr>
                <td valign="top"><table width="100%" border="0" cellpadding="3" cellspacing="3">
                    <tr>
                        <td width="50%" height="40"><span class="style16"><font color="#000000"><strong>NAME: <%= UCASE(v_surname) & " " & v_FirstName %></strong></font></span></td>
                        <td>&nbsp;</td>
                        </tr>
                    <tr>
                        <td height="40"><span class="style16"><font color="#000000"><strong>CLASS: <%= v_class %></strong></font></span></td>
                        <td><span class="style16"><font color="#000000"><strong>BOARDER?: <%= GetYesOrNo(v_boarder) %></strong></font></span></td>
                        </tr>
                    <tr>
                        <td height="40"><span class="style16"><font color="#000000"><strong>SEX: <%= GetSex(v_gender) %></strong></font></span></td>
                        <td><span class="style16"><font color="#000000"><strong>PORTAL NUMBER: <%= matricNumber %></strong></font></span></td>
                        </tr>
                    <tr>
                        <td height="40"><span class="style16"><font color="#000000"><strong>YEAR OF ADMISSION: 2012</strong></font></span></td>
                        <td><span class="style16"><font color="#000000"><strong>YEAR OF COMPLETION: 2013</strong></font></span></td>
                        </tr>
                    </table></td>
            </tr>
            <tr>
                <td valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td valign="top"><table width="100%" border="0" cellspacing="3" cellpadding="3">
                    <tr>
                        <td width="50%" height="25"><span class="pageHeaderStyle"><font color="#000000"><strong><%= GetTermDescription("1st Term") & " " & v_session %></strong></font></span></td>
                        <td><span class="pageHeaderStyle"><font color="#000000"><strong><%= GetTermDescription("2nd Term") & " " & v_session %></strong></font></span></td>
                    </tr>
                    <tr>
                        <td height="25">
                        <table width="480" border="0" cellpadding="1" cellspacing="1">
                            <tr>
                                <td height="30" align="left" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">&nbsp;Subjects</span></td>
                                <td width="40" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">Marks (%) Sep</span></td>
                                <td width="40" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">Marks (%) Oct</span></td>
                                <td width="40" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">Marks (%) Nov</span></td>
                                <td width="50" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">Term-End Exam</span></td>
                                <td width="40" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">Total<br />(%)</span></td>
                                <td width="40" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">Grade</span></td>
                                <td width="40" align="center" valign="middle" class="borderedTableGrey"><span class="smallerTextStyle">GPA</span></td>
                            </tr>
						<% if rstStudentScores.BOF AND rstStudentScores.EOF then %>
                            <tr>
                                <td height="30" colspan="8" align="left" valign="middle" class="borderedTableGrey">&nbsp;Sorry. No subject scores were found for this student in the specified term.</td>
                                </tr>
						<% else %>
							<% 
                            While ((Repeat1__numRows <> 0) AND (NOT rstStudentScores.EOF)) 
                            %>
                                <tr>
                                    <td height="30" align="left" valign="middle" class="borderedTableGrey">&nbsp;<%= rstStudentScores("SubjectShortName") %></td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;<%= rstStudentScores("Score") %></td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                    <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                </tr>
                            <% 
                              Repeat1__index=Repeat1__index+1
                              Repeat1__numRows=Repeat1__numRows-1
                              rstStudentScores.MoveNext()
                            Wend
                            %>
						<% end if %>
                            <tr>
                                <td height="30" align="left" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                                <td align="center" valign="middle" class="borderedTableGrey">&nbsp;</td>
                            </tr>
                            </table>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table></td>
            </tr>
            <tr>
                <td valign="top">&nbsp;</td>
            </tr>
            <tr>
                <td align="left" valign="top">&nbsp;</td>
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
</body>
</html>
<%
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
