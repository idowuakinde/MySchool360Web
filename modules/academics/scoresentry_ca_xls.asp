<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<!--#include file="../../Connections/cnnSmartSchool.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<style>
all.clsMenuItemNS, .clsMenuItemIE{text-decoration: none; font: bold 12px Arial; color: white; cursor: hand; z-index:100}
#MainTable A:hover {color: yellow;}
</style>
</head>

<body topmargin="2" leftmargin="4" marginheight="0" marginwidth="0">
<table width="100%"  border="0">
  <tr>
    <td width="70%" valign="top"> <span class="pageHeaderStyleAMMA">&nbsp;:: CA (Continuous Assessment)  Data-Entry - EXCEL file Upload </span></td>
  </tr>
  
  <tr>
    <td valign="top">
	<table width="100%"  border="0">
		<form id="frmResultsExam" name="frmResultsExam" method="post" action="">
      <tr>
        <td width="30" align="center" valign="top">&nbsp;</td>
        <td valign="top">
          <p><strong>Please select an EXCEL file from your computer containing students CA (Continuous Assessment) scores:</strong><br />
  &nbsp;</p>
          </td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
        <td valign="top"><input name="filePassport" type="file" class="defaultFormElementStyle" id="filePassport" size="100" /></td>
      </tr>
      <tr>
        <td align="center" valign="top">&nbsp;</td>
        <td valign="top">
            <input name="btnUpload" type="submit" class="loginButtonStyle" id="btnUpload" value="Upload &gt;" />
          &nbsp;
          <input name="btnReset" type="reset" class="loginButtonStyle" id="btnReset" value="Reset" />
        </td>
      </tr>
        </form>
    </table></td>
  </tr>
</table>
</body>
</html>
