<% Option Explicit %>
<% Response.Buffer = True %>
<% Response.Expires = -1 %>
<% Response.CacheControl = "Public" %>
<!--#include file="functions/functions_chat.asp"-->
<!--#include file="functions/functions_users.asp"-->
<%
If Request.Querystring("Reset") = "True" Then

	Call Reset()

End If
%>
<html>
<head>
<title>Chatroom</title>

<noscript><meta HTTP-EQUIV="refresh" CONTENT="0; url=noenter.htm"></noscript>

<link rel="stylesheet" href="includes/style.css">

<script>
<!-- Hide from older browsers...

function PopUpWindow(w,h) {
	var winl = (screen.width - w) / 2;
	var wint = (screen.height - h) / 2;

	window.open('', 'ChatWindow2', 'toolbar=0,location=0,status=0,menubar=0,scrollbars=0,resizable=1,width=700,height=460,top='+wint+',left='+winl)
}
// -->
</script>

</head>

<body bgcolor="#3B71B6">


<table height="100%" width="100%">
 <tr>
  <td height="100%" align="center">

<table width="400" cellpadding="6" cellspacing="0" align="center" style="border: 2px solid #1B467D;">
 <tr>
  <td bgcolor="#D1E0F8" rowspan="3">&nbsp;</td>
  <td bgcolor="#D1E0F8" width="100%" class="chatBorderText">Live Chat</td>
  <td bgcolor="#D1E0F8" rowspan="3">&nbsp;</td>
 </tr>
<form action="chatroom.asp" method="GET">
 <tr>
  <td bgcolor="#FFFFFF" style="padding: 10px; border: 1px solid #1B467D" align="center">
  <center>
    <b>Click below to enter the chat room:</b>
  </center>
  <br><br>
  <table cellspacing="10" style="border: 1px solid #1B467D;">
   <tr>
    <td>Username:</td>
    <td class="chatBorderText"><strong><%=request.QueryString("a")%></strong></td>
   </tr>
   <tr>
    <td align="center" colspan="2">
		<input type="hidden" size="20" name="txtUsername" value="<%=request.QueryString("a")%>">
		<input type="submit" value="Login">
	</td>
   </tr>
  </table>
  <br>
  <table width="100%">
   <tr>
    <td><b>Users Online:</b><hr size=1></td>
   </tr>
   <tr>
    <td>
<%
'Get the array
If IsArray(Application(ApplicationUsers)) Then
	saryActiveUsers = Application(ApplicationUsers)
Else
	ReDim saryActiveUsers(6, 0)
End If

Call RemoveUnActive()

If UBound(saryActiveUsers, 2) = 0 Then
	Call Reset()

	Response.Write(vbCrLf & "No users online")
Else
	Dim intArrayPass

	For intArrayPass = 1 To UBound(saryActiveUsers, 2)
		Response.Write(vbCrLf & saryActiveUsers(1, intArrayPass) & "<br>")
	Next
End If
%>
    </td>
   </tr>
  </table>
  </td>
 </tr>
</form>
 <tr>
  <td bgcolor="#D1E0F8" colspan="5">&nbsp;</td>
 </tr>
</Table>
<br>
  </td>
 </tr>
</table>

</body>
</html>