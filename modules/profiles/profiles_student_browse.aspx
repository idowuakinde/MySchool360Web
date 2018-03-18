<%@ Page Language="VB" AutoEventWireup="false" CodeFile="profiles_student_browse.aspx.vb" Inherits="modules_profiles_profiles_student_browse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
</head>
<%  If profileOrientation = "Horizontal" Then%>
        <frameset rows="180,*" cols="*" frameborder="yes" border="1" framespacing="0">
            <frame src="profile_student_all.aspx?a=5&b=1&c=<%= sessionName %>" name="allStudentsFrame" scrolling="auto" id="allStudentsFrame" title="allStudentsFrame" />
            <frame class="frameBottom" src="about:blank" name="singleStudentFrame" id="singleStudentFrame" title="singleStudentFrame" scrolling="auto" />
        </frameset>
<%  ElseIf profileOrientation = "Vertical" Then%>
        <frameset cols="400,*" rows="*" frameborder="yes" border="1" framespacing="0">
            <frame src="profile_student_all.aspx?a=19&b=1&c=<%= sessionName %>" name="allStudentsFrame" scrolling="auto" id="allStudentsFrame" title="allStudentsFrame" />
            <frame class="frameBottom" src="about:blank" name="singleStudentFrame" id="singleStudentFrame" title="singleStudentFrame" scrolling="auto" />
        </frameset>
<%  Else%>
        <body topmargin="0" leftmargin="0">
            <form id="form1" runat="server">
            Invalid configuration for the Profile Orientation.<br />Please check the System Settings.
            </form>
        </body>
<%  End if %>
<noframes>
Sorry, your browser does not support frames.
</noframes>
</html>
