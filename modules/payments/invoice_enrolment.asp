<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../inc_functions_misc.asp" -->
<%
	dim matricNumber, sessionName, sn, amount, totalAmount
	matricNumber = request.querystring("a")	
	sessionName = request.querystring("b")
	dim v_invoiceNumber, v_username, v_firstName, v_middleName, v_surname, v_class, v_boarder, v_customerId, v_gender, v_dateOfBirth
	Call GetStudentProfile(matricNumber)
%>
<%
	Dim rstFeeStream
	Dim rstFeeStream_cmd
	Dim rstFeeStream_numRows
	
	Set rstFeeStream_cmd = Server.CreateObject ("ADODB.Command")
	rstFeeStream_cmd.ActiveConnection = MM_cnnSmartSchool_STRING
	rstFeeStream_cmd.CommandText = "SELECT * FROM dbo.TEMPFeeStream WHERE ClassName = ? AND SessionName = ? AND Remark1 <> 'GBP'" 
	rstFeeStream_cmd.Prepared = true
	rstFeeStream_cmd.Parameters.Append rstFeeStream_cmd.CreateParameter("param1", 200, 1, 50, v_class) ' adVarChar
	rstFeeStream_cmd.Parameters.Append rstFeeStream_cmd.CreateParameter("param2", 200, 1, 50, sessionName) ' adVarChar
	
	Set rstFeeStream = rstFeeStream_cmd.Execute
	rstFeeStream_numRows = 0
%>
<% 'response.write "'" & v_class & ", " & sessionName & "'"': response.End() %>
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
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="880"  border="0" class="borderedTableGrey">
  
  <tr>
    <td width="70%" valign="top"><table width="100%" border="0">
      <tr>
        <td width="20%" rowspan="2" align="center" valign="middle"><img src="../../images/logos/logo.23.jpg" height="120" border="2" /></td>
        <td align="right" valign="middle"><input name="btnPrint" type="button" class="defaultButtonStyle" id="btnPrint" value="   Print This Page   " onclick="javascript:PrintPage();document.getElementById('btnPrint').style.display = 'none';" /></td>
      </tr>
      <tr>
        <td align="center" valign="middle" class="pageHeaderStyleAHALL">
            <span class="pageHeaderStyleAHALL">OXBRIDGE TUTORIAL COLLEGE</span><br />
            <span class="style18">&nbsp;</span><br />
            <span class="smallTextStyle"><strong>49, Sobo Arobiodu Street, GRA Ikeja - Lagos, Nigeria<br />
                Tel: 01-7943654, 01-7407577<br />
                E-mail: oxbridge@oxbridgecoll.com<br />
            www.oxbridgecoll.com</strong></span><br />
            <span class="style18">&nbsp;</span><br />
            <span class="pageHeaderStyleAHALL"><u>INVOICE FOR <%= UCASE(sessionName) %> ACADEMIC YEAR</u></span>
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td align="center" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="50%" align="left" valign="bottom"><table width="375" border="0" cellpadding="3" cellspacing="0" class="borderedTable">
          <tr>
            <td align="left"><strong>Bill To:</strong><strong></strong></td>
            </tr>
          <tr>
            <td align="center"><hr color="#CCCCCC" width="100%" /></td>
          </tr>
          <tr>
            <td align="left"><strong>&nbsp;<%= matricNumber %><br />
                <br />
              &nbsp;<%= UCASE(v_surname) %><br />
              &nbsp;<%= UCASE(v_firstname & " " & v_middlename & " " & v_surname) %></strong><br />
<br />
              &nbsp;<br />
              &nbsp;</td>
            </tr>
        </table></td>
        <td align="right"><table width="250" border="0" cellpadding="3" cellspacing="0" class="borderedTable">
          <tr>
            <td width="50%" align="center"><strong>Date</strong></td>
            <td align="center"><strong>Invoice #</strong></td>
          </tr>
          <tr>
            <td colspan="2" align="center"><hr color="#CCCCCC" width="100%" /></td>
            </tr>
          <tr>
            <td align="center"><%= GetFriendlyDateShort(Now()) %>&nbsp;</td>
            <td align="center"><%= v_invoiceNumber %>&nbsp;</td>
          </tr>
        </table>
          &nbsp;
          <table width="375" border="0" cellpadding="3" cellspacing="0" class="borderedTable">
            <tr>
              <td width="33%" align="center"><strong>P.O. No.</strong></td>
              <td width="33%" align="center"><strong>Terms</strong></td>
              <td align="center"><strong>Project</strong></td>
              </tr>
            <tr>
              <td colspan="3" align="center"><hr color="#CCCCCC" width="100%" /></td>
              </tr>
            <tr>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              <td align="center">&nbsp;</td>
              </tr>
          </table></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="0">
      
      <tr>
        <td colspan="3"><table width="100%" border="0" cellpadding="3" cellspacing="0" class="borderedTable">
          <tr>
            <td width="3%" align="center"><strong>SN</strong></td>
            <td width="10%" align="center"><strong>Quantity</strong><strong></strong></td>
            <td colspan="2" align="left"><strong>Description</strong></td>
            <td width="15%" align="right"><strong>Rate&nbsp;</strong></td>
            <td width="20%" align="right"><strong>Amount&nbsp;</strong></td>
          </tr>
          <tr align="center">
            <td colspan="6"><hr color="#CCCCCC" width="100%" /></td>
          </tr>
        <%
			sn = 0
			totalAmount = 0
		%>
		<% If (rstFeeStream.BOF AND rstFeeStream.EOF) then %>
          <tr>
            <td align="center">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td colspan="2" align="left">No data to display.</td>
            <td align="center">--</td>
            <td align="center">--</td>
          </tr>
        <% Else %>
        <% While NOT rstFeeStream.EOF %>
        <% amount = CDbl(rstFeeStream("Instalment1")) * GetCurrencyConversionRatio(rstFeeStream("Remark1")) %>
          <tr>
            <td align="center"><%= sn + 1 %></td>
            <td align="left">&nbsp;</td>
            <td width="1%" align="left"><input name="chkFeeStream" type="checkbox" id="chkFeeStream" checked="checked" value='<%= amount %>' onchange="javascript:ChangeElementContents('lblTotalAmount', GetFeeStreamsTotal('chkFeeStream', 'txtCustomInvoiceItemAmount'));ChangeElementContents('lblRate_<%= sn + 1 %>', 0);ChangeElementContents('lblAmount_<%= sn + 1 %>', 0);" /></td>
            <td align="left"><%= UCASE(rstFeeStream("FeeStream")) %>&nbsp;</td>
            <td align="right"><span id='lblRate_<%= sn + 1 %>'><%= GetCurrencySymbol(rstFeeStream("Remark1")) & " " & FormatNumber(rstFeeStream("Instalment1"), 2) %></span>&nbsp;</td>
            <td align="right"><span id='lblAmount_<%= sn + 1 %>'><%= GetCurrencySymbol("NGN") & " " & FormatNumber(amount, 2) %></span>&nbsp;</td>
          </tr>
        <%
			sn = sn + 1
			totalAmount = totalAmount + amount
			rstFeeStream.MoveNext
        	Wend 
		%>
		<% End If %>
          <tr>
            <td align="center"><%= sn + 1 %></td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left"><input id="txtCustomInvoiceItemDesc" class="defaultFormElementStyle" type="text" size="70" /></td>
            <td align="right">&nbsp;</td>
            <td align="right"><%= GetCurrencySymbol("NGN") %>&nbsp;<input id="txtCustomInvoiceItemAmount" class="defaultFormElementStyleRightAligned" type="text" size="15" value="0" onchange="javascript:ChangeElementContents('lblTotalAmount', GetFeeStreamsTotal('chkFeeStream', 'txtCustomInvoiceItemAmount'));" /></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="right">&nbsp;</td>
            <td align="right">&nbsp;</td>
          </tr>
          <tr>
            <td align="center"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="right"><hr color="#CCCCCC" width="100%" /></td>
          </tr>
          <tr>
            <td align="center">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="left"><input name="btnReCalc" type="button" class="defaultButtonStyle" id="btnReCalc" onclick="javascript:ChangeElementContents('lblTotalAmount', GetFeeStreamsTotal('chkFeeStream', 'txtCustomInvoiceItemAmount'));" value="Re-Calculate" /></td>
            <td align="left" class="HomePageTitleText2"><strong>TOTAL:</strong></td>
            <td align="right" class="HomePageTitleText2"><strong><%= GetCurrencySymbol("NGN") %>&nbsp;<span id="lblTotalAmount"><%= formatNumber(totalAmount, 2) %></span></strong>&nbsp;</td>
          </tr>
          <tr>
            <td align="center"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="left"></td>
            <td align="right"><hr color="#CCCCCC" width="100%" /></td>
          </tr>
<% if Left(v_class, 3) = "IFY" then %>
          <tr>
            <td align="center">&nbsp;</td>
            <td align="left">&nbsp;</td>
            <td align="center" class="smallTextStyle" colspan="3"><strong>PLEASE NOTE: The Application & Examination Processing Fee is <%= GetCurrencySymbol("GBP") %>550 
                only.</strong></td>
            <td align="right">&nbsp;</td>
          </tr>
<% End If %>
          </table></td>
        </tr>
      <tr>
        <td width="10%">&nbsp;</td>
        <td>&nbsp;</td>
        <td width="10%">&nbsp;</td>
      </tr>
      </table></td>
  </tr>
  </table>
</body>
</html>
<%
 	Sub GetStudentProfile(matricNumber)
		Set rstProfile = Server.CreateObject("ADODB.Recordset")
		rstProfile.ActiveConnection = MM_cnnSmartSchool_STRING
		rstProfile.Source = "SELECT * FROM dbo.TEMPCustomers_0_Applied WHERE CustomerCode = '" & matricNumber & "' "
		rstProfile.CursorType = 0
		rstProfile.CursorLocation = 2
		rstProfile.LockType = 1
		rstProfile.Open()
		
		if rstProfile.EOF AND rstProfile.BOF then
			response.write "An eror occurred and the specified Student's profile could not be loaded. Please try again or contact an Administrator.": response.end()
		else
			v_username = matricNumber
			v_invoiceNumber = rstProfile("CustomerId")
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
<%
	rstFeeStream.Close()
	Set rstFeeStream = Nothing
%>
