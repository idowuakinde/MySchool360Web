<%@ Page Language="VB" AutoEventWireup="false" CodeFile="manage_student_browse.aspx.vb" Inherits="modules_profiles_manage_student_browse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
        <frameset cols="240,*" rows="*" frameborder="yes" border="1" framespacing="0">
            <frame src='manage_student.aspx?a=<%= Request.QueryString("a") %>' name="allEditorsFrame" scrolling="auto" id="allEditorsFrame" title="allEditorsFrame" />
            <frame class="frameBottom" src="about:blank" name="singleEditorFrame" id="singleEditorFrame" title="singleEditorFrame" scrolling="auto" />
        </frameset>
<noframes>
Sorry, your browser does not support frames.
</noframes>
</html>
