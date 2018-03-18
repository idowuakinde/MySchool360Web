<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim matricNumber
	matricNumber = request.querystring("a")	
	v_Class = request.querystring("b")
	'v_Class = left(request.querystring("b"),InStr(request.querystring("b"),".")-1)		': response.Write(v_Class): response.End()
%>
<%
	Dim rstMainFees
	Dim rstMainFees_numRows
	
	Set rstMainFees = Server.CreateObject("ADODB.Recordset")
	rstMainFees.ActiveConnection = MM_cnnSmartSchool_STRING
	rstMainFees.Source = " SELECT FeeId, a.ClassId, b.ClassName, TermId, TuitionFee, FullBoardingFee, WeeklyBoardingFee, FeeDescription FROM dbo.TEMPFeeStructure a INNER JOIN dbo.TEMPClass b ON a.ClassId = b.ClassId WHERE a.ClassId BETWEEN 1 AND 5 AND b.ClassName = '" & v_Class & "' "
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
<%
	Dim rstAncillaryFees
	Dim rstAncillaryFees_numRows
	
	Set rstAncillaryFees = Server.CreateObject("ADODB.Recordset")
	rstAncillaryFees.ActiveConnection = MM_cnnSmartSchool_STRING
	rstAncillaryFees.Source = " SELECT FeeId, a.ClassId, b.ClassName, FeeType, FeeTypeDescription, AncillaryFeeValue, FeeDescription FROM dbo.TEMPFeeStructureAncillary a INNER JOIN dbo.TEMPClass b ON a.ClassId = b.ClassId WHERE a.ClassId BETWEEN 1 AND 5 AND b.ClassName = '" & v_Class & "' "
	rstAncillaryFees.CursorType = 0
	rstAncillaryFees.CursorLocation = 2
	rstAncillaryFees.LockType = 1
	rstAncillaryFees.Open()
	
	rstAncillaryFees_numRows = 0
	
	Dim Repeat2__numRows
	Dim Repeat2__index
	
	Repeat2__numRows = -1
	Repeat2__index = 0
	rstAncillaryFees_numRows = rstAncillaryFees_numRows + Repeat2__numRows
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
        <td width="10%">&nbsp;</td>
        <td><table width="100%" border="1"  bordercolor="#CCCCCC" class="borderedTable">
          <tr>
            <td align="center" valign="top">&nbsp;</td>
            <td width="16%" align="center" valign="middle"><strong>TUITION</strong></td>
            <td width="16%" align="center" valign="middle"><strong>FULL <br />
              BOARDING</strong></td>
            <td width="16%" align="center" valign="middle"><strong>WEEKLY <br />
              BOARDING</strong></td>
            <td width="16%" align="center" valign="middle"><strong>TUITION <br />
              AND <br />
              FULL BOARDING</strong></td>
            <td width="16%" align="center" valign="middle"><strong>TUITION <br />
              AND <br />
              WEEKLY BOARDING</strong></td>
          </tr>
<% 
		tuitionTotal = 0: fullBoardingTotal = 0: weeklyBoardingTotal = 0: sum1Total = 0: sum2Total = 0
		While ((Repeat1__numRows <> 0) AND (NOT rstMainFees.EOF)) 
			tuitionTotal = tuitionTotal + rstMainFees("TuitionFee")
			fullBoardingTotal = fullBoardingTotal + rstMainFees("fullBoardingFee")
			weeklyBoardingTotal = weeklyBoardingTotal + rstMainFees("weeklyBoardingFee")
			sum1Total = tuitionTotal + fullBoardingTotal
			sum2Total = tuitionTotal + weeklyBoardingTotal
%>
          <tr>
            <td height="25" align="center" valign="middle"><strong><%= GetPosition(rstMainFees("TermId")) %> Term&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstMainFees("FeeDescription")) & " " & FormatNumber(rstMainFees("TuitionFee"), 2) %></strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstMainFees("FeeDescription")) & " " & FormatNumber(rstMainFees("FullBoardingFee"), 2) %></strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstMainFees("FeeDescription")) & " " & FormatNumber(rstMainFees("WeeklyBoardingFee"), 2) %></strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstMainFees("FeeDescription")) & " " & FormatNumber(rstMainFees("TuitionFee") + rstMainFees("FullBoardingFee"), 2) %></strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstMainFees("FeeDescription")) & " " & FormatNumber(rstMainFees("TuitionFee") + rstMainFees("WeeklyBoardingFee"), 2) %></strong></td>
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
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol("USD") & " " & FormatNumber(tuitionTotal, 2) %>&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol("USD") & " " & FormatNumber(fullBoardingTotal, 2) %>&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol("USD") & " " & FormatNumber(weeklyBoardingTotal, 2) %>&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol("USD") & " " & FormatNumber(sum1Total, 2) %>&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol("USD") & " " & FormatNumber(sum2Total, 2) %>&nbsp;</strong></td>
          </tr>
          <tr valign="middle">
            <td height="25" align="center"><strong>Lunch Fee<br />
              (Day Students Only)<br />
              (Per Term)</strong></td>
            <td align="center"><strong>$300</strong></td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
          </tr>
<% 
		While ((Repeat2__numRows <> 0) AND (NOT rstAncillaryFees.EOF)) 
%>
          <tr>
            <td height="25" align="center" valign="middle"><strong><%= rstAncillaryFees("FeeTypeDescription") %>&nbsp;</strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstAncillaryFees("FeeDescription")) & " " & FormatNumber(rstAncillaryFees("AncillaryFeeValue"), 2) %></strong></td>
            <td align="center" valign="middle">&nbsp;</td>
            <td align="center" valign="middle">&nbsp;</td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstAncillaryFees("FeeDescription")) & " " & FormatNumber(rstAncillaryFees("AncillaryFeeValue"), 2) %></strong></td>
            <td align="center" valign="middle"><strong><%= GetCurrencySymbol(rstAncillaryFees("FeeDescription")) & " " & FormatNumber(rstAncillaryFees("AncillaryFeeValue"), 2) %></strong></td>
          </tr>
<% 
			Repeat2__index=Repeat2__index+1
			Repeat2__numRows=Repeat2__numRows-1
			rstAncillaryFees.MoveNext()
		Wend
%>
          <tr valign="middle">
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
            <td align="center">&nbsp;</td>
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
        <td class="defaultHeaderTextStyle">Please note the following:</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td><ul>
          <li><em><strong>The Development Fee is payable only once for each student upon admission</strong></em><br />
            &nbsp; </li>
          <li><strong><em>Fees are subject to change without prior notice.</em></strong><br />
            &nbsp; </li>
          <li><strong><em>Please note that the 2nd &amp; 3rd term fees for year 11 should be paid fully by the 2nd term</em></strong><em></em><br />
            &nbsp; </li>
        </ul></td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td class="borderedTableGrey"><ol>
          <li>A non-refundable application fee of <strong>N10, 000 (Ten Thousand Naira)</strong> is required to purchase the School Admission Form.<br />
&nbsp;          </li>
          <li> Tuition and Boarding Fees for each Academic Year are payable in three installments. Tuition Fees does <strong>NOT</strong> include <strong>school books</strong>. For new students, the first installment is due on July 29th, 2011. The remaining installments can be paid at the latest one week before the beginning of the relevant term. Failure to do so may result in the exclusion of the student from the school. <strong>Year 11 students would pay the 2nd &amp; 3rd term fees fully at the beginning of the 2nd term</strong>.<br />
&nbsp;          </li>
          <li> <strong>*A 10% discount</strong> on the year&rsquo;s tuition fees is automatically available to parents who choose to pay a full year&rsquo;s tuition fees in advance. *There is  a <strong>5% discount</strong> on tuition fees for a second child and <strong>10% discount</strong> for third and subsequent children.<br />
&nbsp;          </li>
          <li> Please note that Tuition Fees are not inclusive of the Examination Fees required for the external Cambridge International Examination, taken by students of the school in years 9 &amp; 11.<br />
&nbsp;          </li>
          <li> An initial deposit of <strong>N200,000 (Two Hundred Thousand Naira Only)</strong> is due upon admittance to the school as the Development Levy.<br />
&nbsp;          </li>
          <li> The <strong>Caution fee of $500</strong> shall be returned in full when the child leaves the school, unless a deduction has been made due to the following; inadequate notice for withdrawal, damage/ breakage of school property, un-returned or damaged library books etc. <br />
&nbsp;          </li>
          <li> The Skill Development and Leadership Training Fee is for the following; Leadership Training, Local Excursions, Co-Curricular and Year Book.<br />
&nbsp;          </li>
          <li> All fees (except for Medical Screening) can be paid at any Oceanic Bank branches nationwide, accompanied by the school&rsquo;s deposit slip. Bank deposit slips are available at the school. Copies of the deposit slips evidencing the payments should then be forwarded to the school accountant as soon as possible. It is also possible to make bank transfers &ndash; details with the school accountant.<br />
&nbsp;          </li>
          <li> Students who join the school in the course of a commenced term will be charged as follows:                                                *A full Terms Fees if joining before mid-term, if joining after mid-term, 50% deduction from Boarding Fees only for that term.<br />
&nbsp;          </li>
          <li> Once a student has commenced a term, fees for such term cannot be refunded.<br />
&nbsp;          </li>
          <li> Development Fee and Fee for school uniform are non-refundable.<br />
&nbsp;          </li>
          <li> Once a student has enrolled at the school, a term&rsquo;s notice in writing to the Admissions Office is required before withdrawal. Failure to do so will result in forfeiting a Terms Fee/Caution Fee.<br />
&nbsp;          </li>
          <li> Pocket money for boarders should be left with the school administration and should not exceed N10, 000 (Ten Thousand Naira) for a term. This money shall be made available to the students for their personal expenses throughout the term, and shall be monitored by the Matron/House Master.<br />
&nbsp;          </li>
        </ol></td>
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
	rstAncillaryFees.Close()
	Set rstAncillaryFees = Nothing
%>
