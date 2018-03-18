<%@ Page Language="VB" AutoEventWireup="false" CodeFile="vle_teacher_browse.aspx.vb" Inherits="modules_vle_vle_teacher_browse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
        <frameset cols="240,*" rows="*" frameborder="yes" border="1" framespacing="0">
            <frame src='vle_teacher_menu.aspx?a=<%= Request.QueryString("a") %>&b=<%= Request.QueryString("b") %>' name="menuFrame" scrolling="auto" id="menuFrame" title="menuFrame" />
            <frame class="frameBottom" src='vle_teacher_main.aspx?a=<%= Request.QueryString("a") %>&b=<%= Request.QueryString("b") %>' name="operationFrame" id="operationFrame" title="operationFrame" scrolling="auto" />
        </frameset>
<noframes>
Sorry, your browser does not support frames.
</noframes>
</html>
