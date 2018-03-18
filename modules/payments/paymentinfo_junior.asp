<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim matricNumber
	matricNumber = request.querystring("a")	
	v_Class = request.querystring("b")
	'v_Class = left(v_Class,InStr(v_Class,".")-1)		': response.Write(v_Class): response.End()
%>
<%
	Dim rstMainFees
	Dim rstMainFees_numRows
	
	Set rstMainFees = Server.CreateObject("ADODB.Recordset")
	rstMainFees.ActiveConnection = MM_cnnSmartSchool_STRING
	rstMainFees.Source = " SELECT FeeId, a.ClassId, b.ClassName, TermId, TuitionFee, FullBoardingFee, WeeklyBoardingFee, FeeDescription FROM dbo.TEMPFeeStructure a INNER JOIN dbo.TEMPClass b ON a.ClassId = b.ClassId WHERE a.ClassId > 5 AND b.ClassName = '" & left(v_Class,GetPeriodPosition(v_Class)) & "' "
	'response.write rstMainFees.Source: response.end
	rstMainFees.CursorType = 0
	rstMainFees.CursorLocation = 2
	rstMainFees.LockType = 1
	rstMainFees.Open()
	
	rstMainFees_numRows = 0
	
	Dim Repeat1__numRows
	Dim Repeat1__index
	
	Repeat1__numRows = -1
	Repeat1__index = 0
	rstMainFees_numRows = rstMainFees_numRows + Repeat1__numRows
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
        <td align="right" valign="middle"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage();document.getElementById('btnPrint').style.display = 'none';" /></td>
      </tr>
      <tr>
        <td width="20%" align="center" valign="middle"><img src="../../images/logos/logo.15.jpg" height="120" border="2" /></td>
        <td align="center" valign="middle" class="pageHeaderStyleAHALL">Childville Schools<br />
          <span class="style18">&nbsp;</span><br />
LAGOS, NIGERIA</td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><span class="pageHeaderStyleAHALL"><u>FEES FOR 2011-2012 ACADEMIC YEAR</u></span><br />
      <span class="style16">&nbsp;</span><em><span class="style18">Please Note: Fees are payable also in Naira equivalent at school rates</span></em><br />&nbsp;<br />
      <span class="pageHeaderStyleAHALL">SENIOR SCHOOL - <%= UCASE(v_Class) %></span></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td>&nbsp;</td>
        <td align="center">&nbsp;<br />
          <strong><font color="red">REGISTRATION FEE: &pound;50<br />
          &nbsp;<br />
          DEVELOPMENT FUND PAYABLE ONLY ONCE: <%= GetCurrencySymbol("NGN") %> 150,000</font></strong><br />
          &nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td width="10%">&nbsp;</td>
        <td><table width="100%" border="1"  bordercolor="#CCCCCC" class="borderedTable">
          <tr>
            <td align="center" valign="top"><strong>TERM</strong></td>
            <td width="50%" align="center" valign="middle"><strong>FEE</strong></td>
            </tr>
<% 
		Total = 0
		While ((Repeat1__numRows <> 0) AND (NOT rstMainFees.EOF)) 
			Total = Total + rstMainFees("TuitionFee")
%>
          <tr>
            <td height="25" align="center" valign="middle"><strong><%= GetPosition(rstMainFees("TermId")) %> Term&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstMainFees("FeeDescription")) & " " & FormatNumber(rstMainFees("TuitionFee"), 2) %></strong></td>
            </tr>
<% 
			Repeat1__index=Repeat1__index+1
			Repeat1__numRows=Repeat1__numRows-1
			rstMainFees.MoveNext()
		Wend
%>
          <tr bgcolor="#CCCCCC" class="style18">
            <td height="30" align="center" valign="middle"><strong>TOTAL <br />
              ANNUAL FEES</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol("GBP") & " " & FormatNumber(Total, 2) %>&nbsp;</strong></td>
            </tr>
          <tr valign="middle">
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            </tr>
          </table></td>
        <td width="10%">&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
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
	rstMainFees.Close()
	Set rstMainFees = Nothing
%>
