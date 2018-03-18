<%@ Page Language="VB" AutoEventWireup="false" CodeFile="hrm_browse.aspx.vb" Inherits="modules_hrm_hrm_browse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
    <frameset cols="240,*" rows="*" frameborder="yes" border="1" framespacing="0">
        <frame src="hrm_all.aspx" name="allHRFrame" scrolling="auto" id="allHRFrame" title="allHRFrame" />
        <frame class="frameBottom" src="frameset_main_admin.aspx?b=1" name="singleHRFrame" id="singleHRFrame" title="singleHRFrame" scrolling="auto" />
    </frameset>
<noframes>
Sorry, your browser does not support frames.
</noframes>
</html>
