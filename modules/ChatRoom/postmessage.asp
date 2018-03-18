<% Option Explicit %>
<!--#include file="functions/functions_chat.asp"-->
<!--#include file="functions/functions_users.asp"-->
<!--#include file="functions/functions_ban.asp"-->
<%
Application.Lock

Dim saryMessages
Dim saryTempArray
Dim intArrayPass

Dim blnAdmin
Dim blnFormatText

strUsername = Session("Username")
blnAdmin = CBool(Session("Admin"))
blnFormatText = CBool(Session("FormatText"))

'If strUsername = "" OR CheckIfBanned(getIP()) Then Response.End

'Get the array
If IsArray(Application(ApplicationMsg)) Then
	saryMessages = Application(ApplicationMsg)
Else
	ReDim saryMessages(5, 0)

	Application(ApplicationMsg) = saryMessages
End If

Dim strMessage
Dim strColor
Dim strFormat
Dim intLastMessageID
Dim intType
Dim strCommand
Dim blnPrivateMessage
Dim saryUserMsgTo

blnPrivateMessage = False
intType = 0
saryUserMsgTo = 0

strMessage = Request.Form("message")
strColor = Request.Form("color")
strFormat = Request.Form("format")

If Mid(strMessage, 1, 1) = "/" Then
	If Mid(strMessage, 1, 10) = "/password " Then
		strCommand = Trim(Mid(CleanMessage(strMessage), 10, Len(CleanMessage(strMessage))))

		If strCommand = AdminPassword Then
			Session("Admin") = True
			strMessage = "Logged in as admin."
		Else
			strMessage = "Failed to login. Password given: " & strCommand
		End If

		saryUserMsgTo = Array(strUsername)
		intType = 1
	ElseIf Mid(strMessage, 1, 7) = "/logout" Then
		Session("Admin") = False

		If blnAdmin Then
			strMessage = "Logged out."
		Else
			strMessage = "You where never logged in."
		End If

		saryUserMsgTo = Array(strUsername)
		intType = 1
	ElseIf Mid(strMessage, 1, 7) = "/alert " Then
		strCommand = Trim(Mid(strMessage, 7, Len(strMessage)))

		If blnAdmin Then
			strMessage = "alert('" & strCommand & "');"

			saryUserMsgTo = 0
			intType = 2
		Else
			strMessage = "You do not have permission to use this command."

			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	ElseIf Mid(strMessage, 1, 8) = "/kickall" Then
		If blnAdmin Then
			strMessage = "alert('You have been kicked!');parent.location=""default.asp"";"

			saryUserMsgTo = 0
			intType = 2
		Else
			strMessage = "You do not have permission to use this command."

			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	ElseIf Mid(strMessage, 1, 6) = "/kick " Then
		strCommand = Trim(Mid(strMessage, 6, Len(strMessage)))

		If blnAdmin Then
			If KickUser(strCommand) Then
				strMessage = strCommand & " has been kicked."
			Else
				strMessage = strCommand & " username not found."
			End If

			saryUserMsgTo = Array(strUsername)
			intType = 1
		Else
			strMessage = "You do not have permission to use this command."

			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	ElseIf Mid(strMessage, 1, 5) = "/ban " Then
		strCommand = Trim(Mid(strMessage, 5, Len(strMessage)))

		If blnAdmin Then
			If CheckIfBanned(strCommand) Then
				strMessage = strCommand & " is already in the ban list."
			Else
				Call BanUser(strCommand)
				strMessage = strCommand & " has been added to the ban list."
			End If

			saryUserMsgTo = Array(strUsername)
			intType = 1
		Else
			strMessage = "You do not have permission to use this command."

			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	ElseIf Mid(strMessage, 1, 7) = "/unban " Then
		strCommand = Trim(Mid(strMessage, 7, Len(strMessage)))

		If blnAdmin Then
			If CheckIfBanned(strCommand) Then
				Call UnBanUser(strCommand)
				strMessage = strCommand & " was removed from the ban list."
			Else
				strMessage = strCommand & " was not found in the ban list."
			End If

			saryUserMsgTo = Array(strUsername)
			intType = 1
		Else
			strMessage = "You do not have permission to use this command."

			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	ElseIf Mid(strMessage, 1, 8) = "/banlist" Then
		If blnAdmin Then
			Dim intBanLoop

			saryBanList = GetBanList()

			strMessage = "<hr size=1><b><u>Ban List (" & UBound(saryBanList) & "):</u></b><br>"


			If UBound(saryBanList) = 0 Then
				strMessage = strMessage & "No bans."
			Else
				For intBanLoop = 0 TO UBound(saryBanList) - 1
					strMessage = strMessage & saryBanList(intArrayPass) & " - <a onclick=\""insertText('/unban " & saryBanList(intArrayPass) & "')\"" style=\""cursor: hand\"">Unban</a><br>"
				Next
			End If

			strMessage = strMessage & "<hr size=1>"


			saryUserMsgTo = Array(strUsername)
			intType = 1
		Else
			strMessage = "You do not have permission to use this command."

			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	ElseIf Mid(strMessage, 1, 6) = "/name " Then
		strCommand = Trim(Mid(strMessage, 6, Len(strMessage)))

		Session("Username") = strCommand

		strMessage = strUsername & " changed username to " & strCommand

		saryUserMsgTo = 0
		intType = 1
	ElseIf Mid(strMessage, 1, 7) = "/format" Then
		If blnFormatText Then
			Session("FormatText") = False
			strMessage = "Text formating turned off."
		Else
			Session("FormatText") = True
			strMessage = "Text formating turned on."
		End If

		saryUserMsgTo = Array(strUsername)
		intType = 1
	ElseIf Mid(strMessage, 1, 9) = "/commands" Then

		strMessage = "<hr size=1><table><tr><td colspan=2><b><u>Admin Commands:</u></b></td></tr>" & _
			"<tr><td><b>Login:</b></td><td>/password [Password]</td></tr>" & _
			"<tr><td><b>Logout:</b></td><td>/logout</td></tr>" & _
			"<tr><td><b>Kick:</b></td><td>/kick [Username]</td></tr>" & _
			"<tr><td><b>Ban List:</b></td><td>/banlist</td></tr>" & _
			"<tr><td><b>Ban:</b></td><td>/ban [IP]</td></tr>" & _
			"<tr><td><b>Unban:</b></td><td>/unban [IP]</td></tr>" & _
			"<tr><td><b>Alert:</b></td><td>/alert [Message]</td></tr>" & _
			"<tr><td colspan2><br><b><u>User Commands:</u></b></td></tr>" & _
			"<tr><td><b>Private Message:</b></td><td>/[Username] [Message]</td></tr>" & _
			"<tr><td><b>Change Name:</b></td><td>/name [Username]</td></tr>" & _
			"<tr><td><b>Text Formating on/off:</b></td><td>/format</td></tr>" & _
			"<tr><td colspan=2><br><b><u>Smilies:</u></b></td></tr>" & _
			"<tr><td colspan=2><table cellspacing=1 cellpadding=4 bgcolor=\""#EAEAEA\"">" & _
			"<tr><td bgcolor=white><img src=smilies/on_1.gif align=absmiddle></td><td bgcolor=white align=center>:huh?</td>" & _
			"<td bgcolor=white><img src=smilies/on_2.gif align=absmiddle></td><td bgcolor=white align=center>:s</td>" & _
			"<td bgcolor=white><img src=smilies/on_3.gif align=absmiddle></td><td bgcolor=white align=center>:P</td>" & _
			"<td bgcolor=white><img src=smilies/on_4.gif align=absmiddle></td><td bgcolor=white align=center>}:)</td>" & _
			"<tr><td bgcolor=white><img src=smilies/on_5.gif align=absmiddle></td><td bgcolor=white align=center>:D</td>" & _
			"<td bgcolor=white><img src=smilies/on_6.gif align=absmiddle></td><td bgcolor=white align=center>}:|</td>" & _
			"<td bgcolor=white><img src=smilies/on_7.gif align=absmiddle></td><td bgcolor=white align=center>:)</td>" & _
			"<td bgcolor=white><img src=smilies/on_8.gif align=absmiddle></td><td bgcolor=white align=center>:oops</td>" & _
			"<tr><td bgcolor=white><img src=smilies/on_9.gif align=absmiddle></td><td bgcolor=white align=center>;)</td>" & _
			"<td bgcolor=white><img src=smilies/on_10.gif align=absmiddle></td><td bgcolor=white align=center>:pff</td>" & _
			"<td bgcolor=white><img src=smilies/on_11.gif align=absmiddle></td><td bgcolor=white align=center>:/</td>" & _
			"<td bgcolor=white><img src=smilies/on_12.gif align=absmiddle></td><td bgcolor=white align=center>:0</td></tr></table></td></tr></table><hr size=1>"

		saryUserMsgTo = Array(strUsername)
		intType = 1
	ElseIf Mid(strMessage, 1, 7) = "/color " Then
		strCommand = Replace(strMessage, "/color ", "")

		Response.Redirect("message.asp?Color=" & strCommand & "&Format=" & strFormat)
	Else
		'Dim saryActiveUsers
		'Dim blnPrivateMessage

		blnPrivateMessage = False

		'Get the array
		If IsArray(Application(ApplicationUsers)) Then
			saryActiveUsers = Application(ApplicationUsers)

			For intArrayPass = 1 TO UBound(saryActiveUsers, 2)
				If Instr(strMessage, "/" & saryActiveUsers(1, intArrayPass) & " ") <> 0 Then

					strMessage = Replace(strMessage, "/" & saryActiveUsers(1, intArrayPass) & " ", "")

					saryUserMsgTo = Array(saryActiveUsers(1, intArrayPass), strUsername)
					intType = 3

					blnPrivateMessage = True
					Exit For
				End If
			Next
		End If

		If blnPrivateMessage = False Then
			strMessage = "You typed a unknown command. Type /commands for help."
			saryUserMsgTo = Array(strUsername)
			intType = 1
		End If
	End If
Else
	If strColor <> "" Then strMessage = "[color=" & strColor & "]" & strMessage & "[/color]"
	If strFormat <> "" Then strMessage = "[" & strFormat & "]" & strMessage & "[/" & strFormat & "]"
End If

strMessage = Trim(strMessage)

If strMessage <> "" Then
	'Array Legend
	'0 = Author
	'1 = Message
	'2 = Date
	'3 = Type
	'4 = User ID, 0 = All
	'5 = Message ID

	Dim intTempSize

	intTempSize = UBound(saryMessages, 2)

	If intTempSize = 0 Then
		intLastMessageID = 0
	Else
		intLastMessageID = Clng(saryMessages(5, intTempSize))
	End If

	intTempSize = intTempSize + 1

	Response.Write(vbCrLf & intTempSize)

	ReDim Preserve saryMessages(5, intTempSize)

	saryMessages(0, intTempSize) = strUsername
	saryMessages(1, intTempSize) = strMessage
	saryMessages(2, intTempSize) = CDbl(Now())
	saryMessages(3, intTempSize) = intType
	saryMessages(4, intTempSize) = saryUserMsgTo
	saryMessages(5, intTempSize) = (intLastMessageID + 1)

	Application(ApplicationMsg) = saryMessages

	'******************************************
	'***   	Trim array if over 40 messages	***
	'******************************************
	If UBound(saryMessages, 2) => 20 Then
		'put array in a temp array so we can update it
		ReDim saryTempArray(5, 0)

		'cut the array in half
		For intArrayPass = 10 TO UBound(saryMessages, 2)
			ReDim Preserve saryTempArray(5, UBound(saryTempArray, 2) + 1)

			saryTempArray(0, UBound(saryTempArray, 2)) = saryMessages(0, intArrayPass)
			saryTempArray(1, UBound(saryTempArray, 2)) = saryMessages(1, intArrayPass)
			saryTempArray(2, UBound(saryTempArray, 2)) = saryMessages(2, intArrayPass)
			saryTempArray(3, UBound(saryTempArray, 2)) = saryMessages(3, intArrayPass)
			saryTempArray(4, UBound(saryTempArray, 2)) = saryMessages(4, intArrayPass)
			saryTempArray(5, UBound(saryTempArray, 2)) = saryMessages(5, intArrayPass)
		Next

		'Transfer array to update
		saryMessages = saryTempArray

		Application(ApplicationMsg) = saryMessages
	End If
End If

Application.UnLock

Response.Redirect("message.asp?Color=" & strColor & "&Format=" & strFormat)

Function KickUser(strUsername)
	KickUser = False

	Dim intArrayPass
	Dim saryActiveUsers

	Application.Lock

	'Get the array
	If IsArray(Application(ApplicationUsers)) Then
		saryActiveUsers = Application(ApplicationUsers)
	Else
		ReDim saryActiveUsers(6, 0)
	End If

	For intArrayPass = 1 TO UBound(saryActiveUsers, 2)
		If saryActiveUsers(1, intArrayPass) = strUsername AND saryActiveUsers(3, intArrayPass) <> getIP() Then
			saryActiveUsers(6, intArrayPass) = "kick"

			KickUser = True

			Application(ApplicationUsers) = saryActiveUsers

			Exit For
		End If
	Next

	Application.UnLock
End Function
%>