<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../../Connections/cnnSmartSchool.asp" -->
<!--#include file="../../../inc_functions_misc.asp" -->
<%
	portalNumber = request.QueryString("a")
%>
<%
	Dim rstPayer
	Dim rstPayer_numRows
	
	Set rstPayer = Server.CreateObject("ADODB.Recordset")
	rstPayer.ActiveConnection = MM_cnnSmartSchool_STRING
	rstPayer.Source = "SELECT TOP 1 CustomerID, DistrictCode, CustomerName, BillingAddress, SyncStatus, c.TuitionFee, FeeDescription FROM dbo.TEMPcustomers a INNER JOIN dbo.TEMPClass b ON a.DistrictCode = b.ClassName INNER JOIN dbo.TEMPFeeStructure c ON c.ClassId = b.ClassId WHERE right(CustomerCode,5) = '" & Replace(portalNumber, "'", "''") & "'"
	rstPayer.CursorType = 0
	rstPayer.CursorLocation = 2
	rstPayer.LockType = 1
	rstPayer.Open()
	
	rstPayer_numRows = 0
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
</style>
</head>

<body topmargin="20" leftmargin="20">
<table width="100%"  border="0">
  <tr>
    <td width="70%" valign="top"><span class="pageHeaderStyleAMMA">&nbsp;:: Pay My Current School Fees</span></td>
  </tr>
  <tr>
    <td valign="top">&nbsp;</td>
  </tr>
  <tr>
    <td valign="top"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="5%">&nbsp;</td>
        <td>
		<table width="100%"  border="0">
		<!--<form>-->
          <tr>
            <td width="30%" valign="top" class="defaultHeaderTextStyle">Portal Number:</td>
            <td><%= portalNumber %></td>
          </tr>
          <tr>
            <td valign="top" class="defaultHeaderTextStyle">Student Name:</td>
            <td><%= rstPayer("CustomerName") %></td>
          </tr>
          <tr>
            <td valign="top" class="defaultHeaderTextStyle">Class:</td>
            <td><%= rstPayer("DistrictCode") %></td>
          </tr>
          <tr>
            <td valign="top" class="defaultHeaderTextStyle">Sex:</td>
            <td><%= rstPayer("SyncStatus") %></td>
          </tr>
          <tr>
            <td valign="top" class="defaultHeaderTextStyle"> Address:</td>
            <td><%= rstPayer("BillingAddress") %></td>
          </tr>
          <tr>
            <td class="defaultHeaderTextStyle">Payment Purpose:</td>
            <td><label>
              <select name="lstPaymentHeads" class="defaultFormElementStyle" id="lstPaymentHeads">
                <option value="School Fees">School Fees</option>
              </select>
            </label></td>
          </tr>
          <tr>
            <td valign="top" class="defaultHeaderTextStyle"> Applicable Amount:</td>
            <td>&nbsp;&#8358;&nbsp;<input name="txtAmount" type="text" class="defaultFormElementStyle" id="txtAmount" value="<%= FormatNumber(rstPayer("TuitionFee"), 2) %>" size="30" maxlength="15" /></td>
          </tr>
          <tr>
            <td colspan="2" class="defaultHeaderTextStyle"><hr /></td>
          </tr>
          <tr>
            <td valign="top" class="defaultHeaderTextStyle">Choose a Payment Method:</td>
            <td><table width="50%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td width="19%"><input name="rdoPayMethod" type="radio" value="ISW" checked="checked" /></td>
                <td width="81%">Interswitch Debit Card </td>
              </tr>
              <tr>
                <td><input name="rdoPayMethod" type="radio" value="ETR" /></td>
                <td>e-Tranzact Debit Card </td>
              </tr>
              <tr>
                <td><input name="rdoPayMethod" type="radio" value="CHA" /></td>
                <td>ChamsSwitch Debit Card </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2" class="defaultHeaderTextStyle"><hr /></td>
          </tr>
          <tr>
            <td class="defaultHeaderTextStyle">&nbsp;</td>
            <td><input name="Submit" type="submit" class="loginButtonStyle" value="Submit &gt;" disabled />
              &nbsp;&nbsp;
                <input id="btnReset2" class="loginButtonStyle" name="reset" type="reset" value="Reset" disabled /></td>
          </tr>
        <!--</form>-->
		</table></td>
      </tr>
    </table></td>
  </tr>
</table>
</body>
</html>
<%
	rstPayer.Close()
	Set rstPayer = Nothing
%>
