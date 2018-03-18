<%@LANGUAGE="VBSCRIPT" CODEPAGE="1252"%>
<%
	dim matricNumber
	matricNumber = request.querystring("a")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>
<style type="text/css">
<!--
.style17 {
	font-size: small;
	font-weight: bold;
}
-->
</style>
</head>
<body topmargin="20" leftmargin="20">
        <table width="100%"  border="0" onclick="return TABLE1_onclick()" id="TABLE1">
            <tr>
                <td colspan="2">        </td>
            </tr>
            <tr>
                <td colspan="2"><span class="style17">:: My Passport Photograph</span>                 </td>
            </tr>
            
            <tr>
              <td>&nbsp;</td>
              <td>This is your current passport photograph</td>
            </tr>
          <tr>
            <td width="10">&nbsp;</td>
            <td><img src="../../images/pp/<%= matricNumber %>.jpg" width="232" height="248" border="2" /> </td>
          </tr>
          <tr>
            <td colspan="2"></td>
          </tr>
          <tr>
            <td colspan="2"></td>
          </tr>
          <tr>
            <td colspan="2"><table width="100%" border="0">
              <tr>
                <td width="25%">You can upload another one by clicking here:</td>
                <td><form id="form1" name="form1" enctype="multipart/form-data" method="post" action="">
                  <input name="filePassport" type="file" class="defaultFormElementStyle" id="filePassport" size="60" />
                </form>                </td>
              </tr>
            </table></td>
          </tr>
          <tr>
            <td colspan="2">&nbsp;</td>
          </tr>
</table>
</body>
</html>
