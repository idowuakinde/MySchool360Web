<%@ Page Language="VB" AutoEventWireup="false" CodeFile="photo_zoom.aspx.vb" Inherits="modules_hr_photo_zoom" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../../StyleSheet.css" rel="stylesheet" type="text/css" />
<script language="javascript" type="text/javascript">
// <!CDATA[

function TABLE1_onclick() {

}

// ]]>
</script>
</head>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" id="TABLE1" onclick="return TABLE1_onclick()">
            <tr>
            <td>
                <asp:Image ID="imgPassport" runat="server" BorderWidth="3px" Height="285px" 
                    Width="285px" />
                </td>
          </tr>
      </table>
      </div>
    </form>
</body>
</html>
