<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim matricNumber
	matricNumber = request.querystring("a")	
	term = request.querystring("c")
	dim v_username, v_firstName, v_middleName, v_surname, v_headerId, v_class, v_ClassSize
	Call GetHeader(matricNumber, term): Call GetClassSize()
	
	Dim rstDetail
	Dim rstDetail_numRows
	
	Set rstDetail = Server.CreateObject("ADODB.Recordset")
	rstDetail.ActiveConnection = MM_cnnSmartSchool_STRING
	rstDetail.Source = "SELECT ScoreId, Semester, MatricNumber, a.SubjectId, c.SubjectName, IsNull(ScoreCA1, 0) AS ScoreCA1, IsNull(ScoreCA2, 0) AS ScoreCA2, Effort, Behaviour FROM dbo.TEMPScoreSheet_halfterm a INNER JOIN TEMPSubject c ON a.SubjectId = c.SubjectId WHERE a.MatricNumber = '" & matricNumber & "' AND a.Semester = " & term & ""
	rstDetail.CursorType = 0
	rstDetail.CursorLocation = 2
	rstDetail.LockType = 1
	rstDetail.Open()
	
	rstDetail_numRows = 0
	
	Dim Repeat1__numRows
	Dim Repeat1__index
	
	Repeat1__numRows = -1
	Repeat1__index = 0
	rstDetail_numRows = rstDetail_numRows + Repeat1__numRows
%>
<%
	Dim rstAverage
	Dim rstAverage_numRows
	
	Set rstAverage = Server.CreateObject("ADODB.Recordset")
	rstAverage.ActiveConnection = MM_cnnSmartSchool_STRING
	rstAverage.Source = " SELECT AVG(IsNull(ScoreCA1, 0) + IsNull(ScoreCA2, 0))/2 AS AverageScore FROM dbo.TEMPScoreSheet_halfterm a INNER JOIN dbo.TEMPSubject b ON a.SubjectId = b.SubjectId WHERE a.MatricNumber = '" & matricNumber & "' AND Semester = " & term & ""
	rstAverage.CursorType = 0
	rstAverage.CursorLocation = 2
	rstAverage.LockType = 1
	rstAverage.Open()
	
	v_AverageScore = rstAverage("AverageScore")
	rstAverage_numRows = 0
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
<table width="880"  border="0" class="borderedTableGrey">
  
  <tr>
    <td width="70%" valign="top"><table width="100%" border="0">
      <tr>
        <td align="center" valign="middle">&nbsp;</td>
        <td align="right" valign="middle" colspan="2"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage();document.getElementById('btnPrint').style.display = 'none';" /></td>
      </tr>
      <tr>
        <td width="20%" align="center" valign="middle"><img src="../../images/logos/logo.15.jpg" height="120" border="2" /></td>
        <td align="center" valign="middle" class="pageHeaderStyleAHALL">Childville Schools<br />
          <span class="style18">&nbsp;</span><br />
LAGOS, NIGERIA</td>
        <td align="center" valign="middle" class="pageHeaderStyleAHALL" width="120">&nbsp;</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top" class="pageHeaderStyleAHALL">HALF-TERM  REPORT (SEP - OCT)<br />
    <%= term & "<sup>" & GetOrdinal(term) & "</sup>" %>&nbsp;TERM 2011/2012 SESSION</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td width="10%">&nbsp;</td>
        <td>
               
        <table width="100%" border="0" cellspacing="0" class="borderedTableHeavyTopAndBottom">
          <tr height="50" valign="middle">
            <td width="60%" align="left" class="style16 borderedTable"><strong>&nbsp;<%= UCASE(v_firstName) %> &nbsp;(<%= matricNumber %>)</strong></td>
            <td align="left" class="borderedTable style18">&nbsp;CLASS: <strong><%= UCASE(v_Class) %></strong></td>
            <td width="20%" align="left" class="borderedTable style18">&nbsp;CLASS SIZE:<strong><%= v_ClassSize %></strong></td>
          </tr>
        </table>		</td>
        <td width="10%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0">
          <tr>
            <td width="40%">&nbsp;</td>
            <td align="left" valign="middle">&nbsp;</td>
            <td width="40%" height="22" align="left" valign="middle" class="borderedTable style18">&nbsp;AVERAGE: <strong><%= Round(v_AverageScore,2) %></strong></td>
          </tr>
          </table></td>
        <td>&nbsp;</td>
      </tr>
      
      <tr>
        <td>&nbsp;</td>
        <td><table width="100%" border="0" cellspacing="0" class="borderedTableHeavyTopAndBottom">
          <tr valign="middle">
            <td width="5%" height="30" align="center" class="style18 borderedTable"><strong>S/N</strong></td>
            <td width="35%" align="center" class="style18 borderedTable"><strong>SUBJECT</strong></td>
            <td width="10%" align="center" class="style18 borderedTable"><strong>CA 1 (10) </strong></td>
            <td width="10%" align="center" class="style18 borderedTable"><strong>CA 2 (10) </strong></td>
            <td width="20%" align="center" class="style18 borderedTable"><strong>EFFORT</strong></td>
            <td align="center" class="style18 borderedTable"><strong>BEHAVIOUR</strong></td>
            </tr>
          <% SN = 0
While ((Repeat1__numRows <> 0) AND (NOT rstDetail.EOF)) 
	SN = SN + 1
%>
            <tr>
              <td height="22" align="center" valign="middle" class="borderedTable"><%= SN %>.</td>
              <td align="left" valign="middle" class="borderedTable"><strong>&nbsp;<%= UCASE(rstDetail("SubjectName")) %></strong></td>
              <td align="center" valign="middle" class="borderedTable"><strong><%= cint(rstDetail("ScoreCA1")) %></strong></td>
              <td align="center" valign="middle" class="borderedTable"><strong><%= cint(rstDetail("ScoreCA2")) %></strong></td>
              <td align="center" valign="middle" class="borderedTable"><strong><%= UCASE(rstDetail("Effort")) %></strong>&nbsp;</td>
              <td align="center" valign="middle" class="borderedTable"><strong><%= UCASE(rstDetail("Behaviour")) %></strong>&nbsp;</td>
            </tr>
            <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  rstDetail.MoveNext()
Wend
%>

          <tr>
            <td height="22" align="center" valign="middle" class="borderedTable">&nbsp;</td>
            <td align="left" valign="middle" class="borderedTable">&nbsp;</td>
            <td align="center" valign="middle" class="borderedTable">&nbsp;</td>
            <td align="center" valign="middle" class="borderedTable">&nbsp;</td>
            <td align="center" valign="middle" class="borderedTable">&nbsp;</td>
            <td align="center" valign="middle" class="borderedTable">&nbsp;</td>
            </tr>
          <tr>
            <td height="22" colspan="6" align="center" valign="middle" class="borderedTable"><span class="smallTextStyle">For further information/discussion about any of the scores shown above, <br />please feel free to call the School's Front Desk on <b>01-270-8300</b> and ask for the <b><%= v_class %> Co-ordinator</b>.</span></td>
            </tr>
          
          
        </table></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>
        <table width="100%" border="0">
          <tr>
            <td colspan="2" class="defaultHeaderTextStyle">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" colspan="2" valign="bottom">__________________________________________________________</td>
          </tr>
          <tr>
            <td width="50%" valign="bottom"><span class="defaultHeaderTextStyle">MR. MARK RICHARD-BROWN</span></td>
            <td valign="bottom">&nbsp;</td>
          </tr>
          
        </table>
        
          <strong>&nbsp;ACTING PRINCIPAL</strong>
                
        </td>
        <td>&nbsp;</td>
      </tr>
      
      
    </table></td>
  </tr>
  <tr>
    <td align="left" valign="top">&nbsp;</td>
  </tr>
</table>
</body>
</html>
<%
	rstAverage.Close()
	rstDetail.Close()
	Set rstAverage = Nothing
	Set rstDetail = Nothing
%>
<%
 	Sub GetHeader(matricNumber,termNumber)
		Set rstHeader = Server.CreateObject("ADODB.Recordset")
		rstHeader.ActiveConnection = MM_cnnSmartSchool_STRING
		rstHeader.Source = "SELECT TOP 1 * FROM TEMPCustomers WHERE right(CustomerCode,5) = '" & matricNumber & "' "
		rstHeader.CursorType = 0
		rstHeader.CursorLocation = 2
		rstHeader.LockType = 1
		rstHeader.Open()
		
		if rstHeader.EOF AND rstHeader.BOF then
			errLoginCustomer=true
		else
			v_username = matricNumber
			v_firstName = rstHeader("CustomerName")
			v_middleName = rstHeader("FirstName")
			v_surname = rstHeader("LastName")
			v_headerId = rstHeader("CustomerId")
			v_class = rstHeader("DistrictCode")
		end if
	
		rstHeader.Close()
		Set rstHeader = Nothing
	end Sub
 	Sub GetClassSize()
		Set rstClassSize = Server.CreateObject("ADODB.Recordset")
		rstClassSize.ActiveConnection = MM_cnnSmartSchool_STRING
		rstClassSize.Source = "select DistrictCode as Class, count(*) as ClassCount from dbo.TEMPCustomers where DistrictCode = '" & v_Class & "' group by DistrictCode "
		rstClassSize.CursorType = 0
		rstClassSize.CursorLocation = 2
		rstClassSize.LockType = 1
		rstClassSize.Open()
		
		v_ClassSize = rstClassSize("ClassCount")
	
		rstClassSize.Close()
		Set rstClassSize = Nothing
	end Sub
	
%>
