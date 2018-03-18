<% 	
	Function GetFriendlyDateShort(v_date)
        Dim ret
        If v_date = "01/01/1900 00:00:00" Then
            ret = "N/A (Not available)"
        Else
            'ret = "Aug 01, 2011"
			ret = MonthName(Month(v_date), False) & " " & Day(v_date) & ", " & Year(v_date)
        End If

        GetFriendlyDateShort = ret
	End Function
    Function GetTimespanInYears(startDate, endDate)
        Dim ret

		ret = DateDiff("d", endDate, startDate) / 365

        GetTimespanInYears = ret
    End Function
    Function GetTimespanInMonths(startDate, endDate)
        Dim ret

		ret = DateDiff("d", endDate, startDate) / (365 / 12)

        GetTimespanInMonths = ret
    End Function
	function GetPrincipalFromSettings()
		dim ret
		Dim rstSettings
		
		Set rstSettings = Server.CreateObject("ADODB.Recordset")
		rstSettings.ActiveConnection = MM_cnnSmartSchool_STRING
		rstSettings.Source = " SELECT ModuleName, SettingTitle, SettingValue FROM dbo.Core_Setting WHERE SettingTitle = 'Who is the Principal?' "
		rstSettings.CursorType = 0
		rstSettings.CursorLocation = 2
		rstSettings.LockType = 1
		rstSettings.Open()
		
		if (rstSettings.BOF AND rstSettings.EOF) then
			ret = ""
		else
			ret = rstSettings("SettingValue")
		end if

        'username of Principal has been retrieved. Now retrieve the Full name of the Principal
        ret = GetPrincipalFullName(ret)
		
		GetPrincipalFromSettings = ret
	end function
	function GetPrincipalFullName(username)
		dim ret
		Dim rstPrincipal
		
		Set rstPrincipal = Server.CreateObject("ADODB.Recordset")
		rstPrincipal.ActiveConnection = MM_cnnSmartSchool_STRING
		rstPrincipal.Source = " SELECT Username, FirstName + ' ' + MiddleName + ' ' + Surname as TeacherName FROM dbo.Core_User WHERE Username = '" & username & "' ORDER BY TeacherName "
		rstPrincipal.CursorType = 0
		rstPrincipal.CursorLocation = 2
		rstPrincipal.LockType = 1
		rstPrincipal.Open()
		
		if (rstPrincipal.BOF AND rstPrincipal.EOF) then
			ret = ""
		else
			ret = rstPrincipal("TeacherName")
		end if
		
		GetPrincipalFullName = ret
	end function
    Sub SendMail(fromAddresses, toAddresses, ccAddresses, bccAddresses, subject, bodyFormat, body, attachment) 
        On Error Resume Next
	    Dim strBody 
	    Dim CDONTSMail 
	
	    Set CDONTSMail = CreateObject("CDONTS.NewMail") 
	
	    CDONTSMail.From = fromAddresses 
	    CDONTSMail.To = toAddresses 
        CDONTSMail.Cc = ccAddresses 
        CDONTSMail.Bcc = bccAddresses 
        CDONTSMail.Subject = subject 
	    CDONTSMail.Body = body
        CDONTSMail.BodyFormat = bodyFormat
        
        If attachment = "" Then
            'do nothing
        else
            CDONTSMail.AttachFile attachment
            'CDONTSMail.AttachUrl attachment
        End If

	    CDONTSMail.Send 
	
	    set CDONTSMail = Nothing
    End Sub
	Function SavePrincipalComment(matricNumber, sessionName, termName, assessment, comment)	
		dim ret
		Set cmdSaveComment = Server.CreateObject ("ADODB.Command")
		cmdSaveComment.ActiveConnection = MM_cnnSmartSchool_STRING
		
		Select Case GetPrincipalComment(matricNumber, sessionName, termName, assessment)
			Case ""			'no comment yet, so do a fresh insert
				cmdSaveComment.CommandText = "INSERT INTO dbo.TEMPStudentSubjectScorePrincipalComment(PortalNumber, SessionName, TermName, AssessmentType, Comment)  VALUES ('" & matricNumber & "','" & sessionName & "','" & termName &  "','Test','" & comment & "') "
			Case Else		'previously-entered comment exists, so update previous comment
				cmdSaveComment.CommandText = "UPDATE dbo.TEMPStudentSubjectScorePrincipalComment SET Comment = '" & comment & "' WHERE PortalNumber = '" & matricNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName &  "' AND AssessmentType = 'Test' "
		End Select
		
		cmdSaveComment.CommandType = 1
		cmdSaveComment.CommandTimeout = 0
		cmdSaveComment.Prepared = true
		'response.write cmdSaveComment.CommandText: response.end
		cmdSaveComment.Execute ret
		
		SavePrincipalComment = ret
	end Function
	function GetPrincipalComment(matricNumber, sessionName, termName, assessment)
		dim ret
		Dim rstCheckComment
		
		Set rstCheckComment = Server.CreateObject("ADODB.Recordset")
		rstCheckComment.ActiveConnection = MM_cnnSmartSchool_STRING
		rstCheckComment.Source = " SELECT * FROM dbo.TEMPStudentSubjectScorePrincipalComment WHERE PortalNumber = '" & matricNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessment & "' "
		rstCheckComment.CursorType = 0
		rstCheckComment.CursorLocation = 2
		rstCheckComment.LockType = 1
		rstCheckComment.Open()
				
		if (rstCheckComment.BOF AND rstCheckComment.EOF) then
			ret = ""
		else
			ret = rstCheckComment("Comment")
		end if
			
		GetPrincipalComment = ret
	end function
	Function GetClassAverage(className, subjectShortName)
		dim ret
		Dim rstAverage
		Dim rstAverage_numRows
		
		Set rstAverage = Server.CreateObject("ADODB.Recordset")
		rstAverage.ActiveConnection = MM_cnnSmartSchool_STRING
		'rstAverage.Source = " SELECT b.DistrictCode as ClassName, a.SubjectShortName, AVG(Score) AS AverageScore, COUNT(Score) AS ScoreCount FROM dbo.TEMPStudentSubjectScore a INNER JOIN dbo.TEMPCustomers b ON a.PortalNumber = b.CustomerCode WHERE b.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND a.Score > 0 GROUP BY b.DistrictCode, a.SubjectShortName "
		rstAverage.Source = " SELECT b.DistrictCode as ClassName, a.SubjectShortName, AVG(Score) AS AverageScore, COUNT(Score) AS ScoreCount FROM dbo.TEMPStudentSubjectScore a INNER JOIN dbo.TEMPCustomers b ON a.PortalNumber = b.CustomerCode WHERE b.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' GROUP BY b.DistrictCode, a.SubjectShortName "
		rstAverage.CursorType = 0
		rstAverage.CursorLocation = 2
		rstAverage.LockType = 1
		rstAverage.Open()
		
		rstAverage_numRows = 0
		
		if (rstAverage.BOF AND rstAverage.EOF) then
			ret = 0.00
		else
			ret = rstAverage("AverageScore")
		end if

		rstAverage_numRows = 0
	
		GetClassAverage = ret
	End Function
	Function GetTeacherName(subjectShortName, ClassName)
		dim ret
		Dim rstTeacherName
		Dim rstTeacherName_numRows
		
		Set rstTeacherName = Server.CreateObject("ADODB.Recordset")
		rstTeacherName.ActiveConnection = MM_cnnSmartSchool_STRING
		rstTeacherName.Source = " SELECT a.*, b.FirstName + ' ' + UPPER(LEFT(b.MiddleName, 1)) + '. ' + b.Surname as TeacherName, c.SubjectName FROM dbo.TEMPUserSubject a INNER JOIN dbo.Core_User b ON a.UserId = b.UserId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId WHERE a.ClassName = '" & className & "' AND c.ShortName = '" & subjectShortName & "' "
		rstTeacherName.CursorType = 0
		rstTeacherName.CursorLocation = 2
		rstTeacherName.LockType = 1
		rstTeacherName.Open()
		
		rstTeacherName_numRows = 0
		
		if (rstTeacherName.BOF AND rstTeacherName.EOF) then
			ret = ""
		else
			ret = rstTeacherName("TeacherName")
		end if
		
		GetTeacherName = ret
	End Function
	Function GetProgrammeFullName(abbr)
		dim ret
		Dim rstProgramme
		Dim rstProgramme_numRows
		
		Set rstProgramme = Server.CreateObject("ADODB.Recordset")
		rstProgramme.ActiveConnection = MM_cnnSmartSchool_STRING
		rstProgramme.Source = " SELECT ProgrammeAlias FROM dbo.TEMPProgramme WHERE ProgrammeName= '" & abbr & "' "
		rstProgramme.CursorType = 0
		rstProgramme.CursorLocation = 2
		rstProgramme.LockType = 1
		rstProgramme.Open()
		
		rstProgramme_numRows = 0
		
		if (rstProgramme.BOF AND rstProgramme.EOF) then
			ret = ""
		else
			ret = rstProgramme("ProgrammeAlias")
		end if

		GetProgrammeFullName = ret
	End Function
	Function GetProgrammeAbbr(className)
		dim ret
		
		ret = Split(className, ".")(0)
		
		GetProgrammeAbbr = ret
	End Function
	Function GetCurrentTerm()
		dim ret
		Dim rstCurrentTerm
		Dim rstCurrentTerm_numRows
		
		Set rstCurrentTerm = Server.CreateObject("ADODB.Recordset")
		rstCurrentTerm.ActiveConnection = MM_cnnSmartSchool_STRING
		rstCurrentTerm.Source = "SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm= 'Y' "
		rstCurrentTerm.CursorType = 0
		rstCurrentTerm.CursorLocation = 2
		rstCurrentTerm.LockType = 1
		rstCurrentTerm.Open()
		
		rstCurrentTerm_numRows = 0
		
		if (rstCurrentTerm.BOF AND rstCurrentTerm.EOF) then
			ret = ""
		else
			ret = rstCurrentTerm("TermName")
		end if

		GetCurrentTerm = ret
	End Function
	Function GetCurrentSession()
		dim ret
		Dim rstCurrentSession
		Dim rstCurrentSession_numRows
		
		Set rstCurrentSession = Server.CreateObject("ADODB.Recordset")
		rstCurrentSession.ActiveConnection = MM_cnnSmartSchool_STRING
		rstCurrentSession.Source = "SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession= 'Y' "
		rstCurrentSession.CursorType = 0
		rstCurrentSession.CursorLocation = 2
		rstCurrentSession.LockType = 1
		rstCurrentSession.Open()
		
		rstCurrentSession_numRows = 0
		
		if (rstCurrentSession.BOF AND rstCurrentSession.EOF) then
			ret = ""
		else
			ret = rstCurrentSession("SessionName")
		end if

		GetCurrentSession = ret
	End Function
	Function GetQuoteRandom()
		dim ret
		Dim rstQuotes, quoteCount, rndQuote
		
		Set rstQuotes = Server.CreateObject("ADODB.Recordset")
		rstQuotes.ActiveConnection = MM_cnnSmartSchool_STRING
		rstQuotes.Source = " SELECT QuoteId, QuoteText, QuoteAuthor FROM dbo.Core_Quote "
		rstQuotes.CursorType = 1
		rstQuotes.CursorLocation = 2
		rstQuotes.LockType = 1
		rstQuotes.Open()
		
		quoteCount = GetRecordsetCount(rstQuotes)
		
		Randomize
		rndQuote = Int((quoteCount * Rnd) + 1)
		
		rstQuotes.Close
		rstQuotes.Source = " SELECT QuoteId, QuoteText, QuoteAuthor FROM dbo.Core_Quote WHERE QuoteId = " & rndQuote & " "
		rstQuotes.Open()
		
		ret = chr(34) & rstQuotes("QuoteText") & chr(34) & " - " & rstQuotes("QuoteAuthor")
		set rstQuotes = Nothing
				
		GetQuoteRandom = ret
	End Function
    Sub LogOff()
        Response.Cookies("User").Expires = "January 1, 1980"
        Response.Cookies("Parent").Expires = "January 1, 1980"
        Response.Cookies("School").Expires = "January 1, 1980"
        Response.Cookies("Misc").Expires = "January 1, 1980"
    End Sub
    function GetRecordsetCount(recordsetObj)
        dim ret

        'recordsetObj.Close()
        'recordsetObj.MoveLast()
        'recordsetObj.MoveFirst()
        ret = recordsetObj.RecordCount

        GetRecordsetCount = ret
    end function
	function GetMenuItems(moduleId,roleId,showPosition)
		Dim rstMenuItems
		Dim rstMenuItems_numRows
		
		Set rstMenuItems = Server.CreateObject("ADODB.Recordset")
		rstMenuItems.ActiveConnection = MM_cnnSmartSchool_STRING
        Select Case UCASE(trim(showPosition))
            Case "NO"
                rstMenuItems.Source = " SELECT MenuId, MenuName, MenuUrl FROM Vw_MenuPerRole WHERE RoleId = " & roleId & " AND ModuleId = " & moduleId & " AND MenuName NOT LIKE '%Position%' ORDER BY MenuOrder "
            Case "YES"
                rstMenuItems.Source = " SELECT MenuId, MenuName, MenuUrl FROM Vw_MenuPerRole WHERE RoleId = " & roleId & " AND ModuleId = " & moduleId & " ORDER BY MenuOrder "
        End Select
		rstMenuItems.CursorType = 1
		rstMenuItems.CursorLocation = 2
		rstMenuItems.LockType = 1
		rstMenuItems.Open()
		
		rstMenuItems_numRows = 0

		set GetMenuItems = rstMenuItems
	end function
	function ShowTimetableLink(username, roleId)
		dim ret, className

        Select Case roleId
            Case 18, 20  'student or parent
		        className = GetClassName(username)
		        ret = "<tr>"
		        ret = ret & "<td>&nbsp;</td>"
		        ret = ret & "<td><a href='modules/timetable/timetable_class.aspx?a=" & className & "' target='mainFrame'><font color='white'>My Timetable</font></a></td>"
		        ret = ret & "</tr>"
            Case else  'teacher
		        ret = "<tr>"
		        ret = ret & "<td>&nbsp;</td>"
		        ret = ret & "<td><a href='modules/timetable/timetable_teacher.aspx?a=" & username & "' target='mainFrame'><font color='white'>My Timetable</font></a></td>"
		        ret = ret & "</tr>"
        End Select
		
		ShowTimetableLink = ret
	end function
	function ShowExamTimetableLink(roleId, className)
		dim ret

        Select Case roleId
            Case 18, 20         'student or parent
                Select Case className
                    Case "Year 7", "Year 8", "Year 9", "Year 10", "Year 11"         'Senior School
		                ret = "<tr>"
		                ret = ret & "<td>&nbsp;</td>"
		                'ret = ret & "<td><a href='modules/timetable/timetable_exam_2012_term_3_secondary.pdf' target='mainFrame'><font color='white'>My Exam Timetable</font></a></td>"
		                ret = ret & "<td><a href='http://50.56.227.124:8080/m_blog_chi/?tag=timetable-senior' target='mainFrame'><font color='white'>My Cycle Test/Exam Timetables</font></a></td>"
		                ret = ret & "</tr>"
                    Case else       'Junior School
		                ret = "<tr>"
		                ret = ret & "<td>&nbsp;</td>"
		                'ret = ret & "<td><a href='modules/timetable/timetable_exam_2012_term_3_primary.pdf' target='mainFrame'><font color='white'>My Exam Timetable</font></a></td>"
		                ret = ret & "<td><a href='http://50.56.227.124:8080/m_blog_chi/?tag=timetable-junior' target='mainFrame'><font color='white'>My Cycle Test/Exam Timetables</font></a></td>"
		                ret = ret & "</tr>"
                End Select
            Case else           'teacher, admin, etc..
		        ret = "<tr>"
		        ret = ret & "<td>&nbsp;</td>"
		        'ret = ret & "<td><a href='modules/timetable/timetable_exam_2012_term_3_primary.pdf' target='mainFrame'><font color='white'>Junior School Exam Timetable</font></a></td>"
		        ret = ret & "<td><a href='http://50.56.227.124:8080/m_blog_chi/?tag=timetable-junior' target='mainFrame'><font color='white'>Junior Test/Exam Timetables</font></a></td>"
		        ret = ret & "</tr>"
		        ret = ret & "<tr>"
		        ret = ret & "<td>&nbsp;</td>"
		        'ret = ret & "<td><a href='modules/timetable/timetable_exam_2012_term_3_secondary.pdf' target='mainFrame'><font color='white'>Senior School Exam Timetable</font></a></td>"
		        ret = ret & "<td><a href='http://50.56.227.124:8080/m_blog_chi/?tag=timetable-senior' target='mainFrame'><font color='white'>Senior Test/Exam Timetables</font></a></td>"
		        ret = ret & "</tr>"
        End Select
		
		ShowExamTimetableLink = ret
	end function
	function GetClassName(matricNumber)
		dim ret
		Dim rstClassName
		Dim rstClassName_numRows
		
		Set rstClassName = Server.CreateObject("ADODB.Recordset")
		rstClassName.ActiveConnection = MM_cnnSmartSchool_STRING
		rstClassName.Source = "SELECT DistrictCode FROM dbo.TEMPCustomers WHERE CustomerCode = '" & matricNumber & "' "
		rstClassName.CursorType = 0
		rstClassName.CursorLocation = 2
		rstClassName.LockType = 1
		rstClassName.Open()
		
		rstClassName_numRows = 0
		
		if (rstClassName.BOF AND rstClassName.EOF) then
			ret = ""
		else
			ret = rstClassName("DistrictCode")
		end if

		GetClassName = ret
	end function
    function ShowPhotograph(filename, filePath)
        dim ret

        Set fs = CreateObject("Scripting.FileSystemObject") 
        If fs.FileExists(filePath) Then 
           ret = filename
        Else 
           'response.write "Not found": response.end
           ret = "images/pp/anonynous.png"
        End If 
        Set fs = nothing

        ShowPhotograph = ret
    end function
	Sub LoginCustomer()
		Set rstLogin = Server.CreateObject("ADODB.Recordset")
		rstLogin.ActiveConnection = MM_cnnSmartSchool_STRING
		rstLogin.Source = "SELECT * FROM dbo.TEMPCustomers WHERE right(CustomerCode,5) = '" & portalNumber & "' AND ([Password] = '" & password & "') "
		rstLogin.CursorType = 0
		rstLogin.CursorLocation = 2
		rstLogin.LockType = 1
		rstLogin.Open()
		
		if rstLogin.EOF AND rstLogin.BOF then
			errLoginCustomer=true
		else
			Response.Cookies("User")("Username") = right(rstLogin("CustomerCode"),5)
			Response.Cookies("User")("Password") = ""
			Response.Cookies("User")("RoleId") = 20
			Response.Cookies("User")("Class") = rstLogin("DistrictCode")
			Response.Cookies("User")("RoleName") = Request.Cookies("User")("Class") & " Student"
			Response.Cookies("User")("UserId") = rstLogin("CustomerId")
			Response.Cookies("User")("UserCode") = rstLogin("RefCode")
			Response.Cookies("User")("FirstName") = rstLogin("CustomerName")
			Response.Cookies("User")("Middlename") = rstLogin("FirstName")
			Response.Cookies("User")("Surname") = rstlogin("LastName")
			Response.Cookies("User")("Sex") = rstLogin("SyncStatus")
			Response.Cookies("User")("Department") = "Students"
		end if
	
		rstLogin.Close()
		Set rstLogin = Nothing
	end Sub
	Sub ReLoginCustomer(portalNumber)
		Set rstLogin = Server.CreateObject("ADODB.Recordset")
		rstLogin.ActiveConnection = MM_cnnSmartSchool_STRING
		rstLogin.Source = "SELECT * FROM TEMPCustomers WHERE right(CustomerCode,5) = '" & portalNumber & "' "
		rstLogin.CursorType = 0
		rstLogin.CursorLocation = 2
		rstLogin.LockType = 1
		rstLogin.Open()
		
		if rstLogin.EOF AND rstLogin.BOF then
			errLoginCustomer=true
		else
			Response.Cookies("User")("Username") = right(rstLogin("CustomerCode"),5)        ': response.write "Now inside ReLoginCustomer()": response.End
			Response.Cookies("User")("Password") = ""
			Response.Cookies("User")("RoleId") = 20
			Response.Cookies("User")("Class") = rstLogin("DistrictCode")
			Response.Cookies("User")("RoleName") = Request.Cookies("User")("Class") & " Student"
			Response.Cookies("User")("UserId") = rstLogin("CustomerId")
			Response.Cookies("User")("UserCode") = rstLogin("RefCode")
			Response.Cookies("User")("FirstName") = rstLogin("CustomerName")
			Response.Cookies("User")("Middlename") = rstLogin("FirstName")
			Response.Cookies("User")("Surname") = rstlogin("LastName")
			Response.Cookies("User")("Sex") = rstLogin("SyncStatus")
			Response.Cookies("User")("Department") = "Students"
            if RememberMe then
                Response.Cookies("User").Expires = Now() + 365
            End If
		end if
	
		rstLogin.Close()
		Set rstLogin = Nothing
	end Sub
	Sub LoginAdmin()
		Set rstLoginAdmin = Server.CreateObject("ADODB.Recordset")
		rstLoginAdmin.ActiveConnection = MM_cnnSmartSchool_STRING
		rstLoginAdmin.Source = "SELECT * FROM Vw_UserPerRole WHERE Username = '" & username & "' AND Password = '" & password2 & "'"
		rstLoginAdmin.CursorType = 0
		rstLoginAdmin.CursorLocation = 2
		rstLoginAdmin.LockType = 1
		rstLoginAdmin.Open()
		
		if rstLoginAdmin.EOF AND rstLoginAdmin.BOF then
			errLoginAdmin=true
		else
			Response.Cookies("User")("Username") = rstLoginAdmin("Username")
			Response.Cookies("User")("Password") = ""
			Response.Cookies("User")("RoleId") = rstloginAdmin("RoleId")
			Response.Cookies("User")("RoleName") = rstloginAdmin("RoleName")
			Response.Cookies("User")("UserId") = rstloginAdmin("UserId")
			Response.Cookies("User")("UserCode") = rstloginAdmin("UserCode")
			Response.Cookies("User")("FirstName") = rstloginAdmin("FirstName")
			Response.Cookies("User")("MiddleName") = rstloginAdmin("MiddleName")
			Response.Cookies("User")("Surname") = rstloginAdmin("Surname")
			Response.Cookies("User")("Sex") = rstloginAdmin("Sex")
			Response.Cookies("User")("Department") = rstloginAdmin("DepartmentName")
			Response.Cookies("User")("Class") = rstloginAdmin("DepartmentName")
		end if
	
		rstLoginAdmin.Close()
		Set rstLoginAdmin = Nothing
	end sub
	Sub ReLoginAdmin(username)
		Set rstLoginAdmin = Server.CreateObject("ADODB.Recordset")
		rstLoginAdmin.ActiveConnection = MM_cnnSmartSchool_STRING
		rstLoginAdmin.Source = "SELECT * FROM Vw_UserPerRole WHERE Username = '" & username & "' "
		rstLoginAdmin.CursorType = 0
		rstLoginAdmin.CursorLocation = 2
		rstLoginAdmin.LockType = 1
		rstLoginAdmin.Open()
		
		if rstLoginAdmin.EOF AND rstLoginAdmin.BOF then
			errLoginAdmin=true
		else
			Response.Cookies("User")("Username") = rstLoginAdmin("Username")
			Response.Cookies("User")("Password") = ""
			Response.Cookies("User")("RoleId") = rstloginAdmin("RoleId")
			Response.Cookies("User")("RoleName") = rstloginAdmin("RoleName")
			Response.Cookies("User")("UserId") = rstloginAdmin("UserId")
			Response.Cookies("User")("UserCode") = rstloginAdmin("UserCode")
			Response.Cookies("User")("FirstName") = rstloginAdmin("FirstName")
			Response.Cookies("User")("MiddleName") = rstloginAdmin("MiddleName")
			Response.Cookies("User")("Surname") = rstloginAdmin("Surname")
			Response.Cookies("User")("Sex") = rstloginAdmin("Sex")
			Response.Cookies("User")("Department") = rstloginAdmin("DepartmentName")
			Response.Cookies("User")("Class") = rstloginAdmin("DepartmentName")
            if RememberMe then
                Response.Cookies("User").Expires = Now() + 365
            End If
		end if
	
		rstLoginAdmin.Close()
		Set rstLoginAdmin = Nothing
	end sub
	Sub LoginParent()
        On Error Resume Next
		Set rstLoginParent = Server.CreateObject("ADODB.Recordset")
		rstLoginParent.ActiveConnection = MM_cnnSmartSchool_STRING
		rstLoginParent.Source = "SELECT * FROM dbo.TEMPCustomers a WHERE (CurrentBal = '" & parentEmail & "' OR EmailAddress = '" & parentEmail & "') AND (RA = '" & password & "') "
		rstLoginParent.CursorType = 0
		rstLoginParent.CursorLocation = 2
		rstLoginParent.LockType = 1
		rstLoginParent.Open()
		
		if rstLoginParent.EOF AND rstLoginParent.BOF then
			errLoginParent=true
		else
            if IsNull(rstLoginParent("CurrentBal")) then
			    Response.Cookies("Parent")("Username") = rstLoginParent("EmailAddress")
            Else
			    Response.Cookies("Parent")("Username") = rstLoginParent("CurrentBal")             
            End If
			Response.Cookies("Parent")("Password") = ""
			Response.Cookies("Parent")("RoleId") = 18
			Response.Cookies("Parent")("Class") = "Parents"
			Response.Cookies("Parent")("RoleName") = "Parent"
            if IsNull(rstLoginParent("CurrentBal")) then
			    Response.Cookies("Parent")("UserId") = rstLoginParent("EmailAddress")
            Else
			    Response.Cookies("Parent")("UserId") = rstLoginParent("CurrentBal")             
            End If
            if IsNull(rstLoginParent("CurrentBal")) then
			    Response.Cookies("Parent")("UserCode") = rstLoginParent("EmailAddress")
            Else
			    Response.Cookies("Parent")("UserCode") = rstLoginParent("CurrentBal")             
            End If
            Response.Cookies("Parent")("FatherEmail") = rstLoginParent("EmailFather")
			Response.Cookies("Parent")("MotherEmail") = rstLoginParent("EmailMother")
			Response.Cookies("Parent")("FirstName") = ""
			Response.Cookies("Parent")("Middlename") = ""
			Response.Cookies("Parent")("Surname") = "Mr./Mrs./Miss " & rstLoginParent("LastName")
			Response.Cookies("Parent")("Sex") = ""
			Response.Cookies("Parent")("Department") = "Parents"
		end if
	
		rstLoginParent.Close()
		Set rstLoginParent = Nothing
	end Sub
	Function GetChildrenCount(parentId)
		dim numChildren, ret
		Set rstCount = Server.CreateObject("ADODB.Recordset")
		rstCount.ActiveConnection = MM_cnnSmartSchool_STRING
		rstCount.Source = " SELECT COUNT(*) as ChildrenCount FROM dbo.TEMPCustomers WHERE (CurrentBal = '" & parentEmail & "' OR EmailAddress = '" & parentEmail & "') "
		'response.write rstCount.Source: response.end
		rstCount.CursorType = 0
		rstCount.CursorLocation = 2
		rstCount.LockType = 1
		rstCount.Open()
		
		if rstCount.EOF AND rstCount.BOF then
			numChildren = 0
		else
			numChildren = rstCount("ChildrenCount")
		end if
	
		rstCount.Close()
		Set rstCount = Nothing

		if numChildren = 1 then
			ret = numChildren & " child"
		else
			ret = numChildren & " children"
		end if
		
		GetChildrenCount = ret
	end Function
	Function GetChildrenLink(parentEmail)		
		Dim ret
		
		Select Case roleId
			Case 20, 18
				ret = "modules/feedback/sendfeedback.aspx"
			Case Else
				ret = "modules/feedback/managefeedback.aspx"
		End Select
		
		GetChildrenLink = ret
	End Function
	Function GetLabel(roleId)
		Dim ret
		
		Select Case roleId
			Case 20, 18
				ret = "Portal Number:"
			Case Else
				ret = "Username:"
		End Select
		
		GetLabel = ret
	End Function 
	function GetSex(sexId)
		dim ret
		
		select case sexId
			case "M"
				ret = "Male"
			case "F"
				ret = "Female"
			case else
				ret = "Unknown"
		end select
		
		GetSex = ret
	end function
	function GetYesOrNo(abbr)
		dim ret
		
		select case abbr
			case "Y"
				ret = "Yes"
			case "N"
				ret = "No"
			case else
				ret = "Unknown"
		end select
		
		GetYesOrNo = ret
	end function
	Function GetClassLabel(roleId)
		Dim ret
		
		Select Case roleId
			Case 20, 18
				ret = "Class:"
			Case Else
				ret = "Department:"
		End Select
		
		GetClassLabel = ret
	End Function
	Function GetChangePasswordUrl(roleId)		
		Dim ret
		
		Select Case roleId
			Case 20 'students
				ret = "modules/system/setups/users/changepassword_students.aspx"
			Case 18 'parents
				ret = "modules/system/setups/users/changepassword_parents.aspx"
			Case Else
				ret = "modules/system/setups/users/changepassword.aspx"
		End Select
		
		GetChangePasswordUrl = ret
	End Function
	Function GetFeedbackUrl(roleId)		
		Dim ret
		
		Select Case roleId
			Case 18
				ret = "modules/feedback/sendfeedback.aspx"
			Case Else
				ret = "modules/feedback/managefeedback.aspx"
		End Select
		
		GetFeedbackUrl = ret
	End Function
	function GetPeriodPosition(className)
		dim ret, pos
		pos = InStr(className,".")
		
		select case pos
			case 0
				ret = len(className)
			case else
				ret = pos-1
		end select
		
		GetPeriodPosition = ret
	end function
	function GetCurrencySymbol(currencyName)
		dim ret
		
		select case UCASE(currencyName)
			case "USD"
				ret = "$"
			case "GBP"
				ret = "&pound;"
			case "NGN"
				ret = "&#8358"
		end select
	
		GetCurrencySymbol = ret
	end function
	function GetCurrencyConversionRatio(currencyName)
		dim ret

		select case UCASE(currencyName)
			case "USD"
				ret = 160
			case "GBP"
				ret = 250
			case "NGN"
				ret = 1
			case "EURO"
				ret = 210
		end select

		GetCurrencyConversionRatio = ret
	end function
	function GetTermDescription(termAbbr)
		dim ret
		
		select case UCASE(termAbbr)
			case "1ST TERM"
				ret = "First Term"
			case "2ND TERM"
				ret = "Second Term"
			case "3RD TERM"
				ret = "Third Term"
		end select
		
		GetTermDescription = ret
	end function
	function GetPosition(number)
		dim ret
		
		select case number
			case 1
				ret = "First"
			case 2
				ret = "Second"
			case 3
				ret = "Third"
		end select
		
		GetPosition = ret
	end function
	function GetOrdinal(number)
		dim ret
		
		select case number
			case 1,21,31,41,51,61,71,81,91,101
				ret = "st"
			case 2,22,32,42,52,62,72,82,92,102
				ret = "nd"
			case 3,23,33,43,53,63,73,83,93,103
				ret = "rd"
			case 4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
				ret = "th"
			case else
				ret = "th"
		end select
		
		GetOrdinal = ret
	end function
	function SurroundWithSingleQuotes(v_Text)
		dim ret
		
		ret = "'" & v_Text & "'"
		
		SurroundWithSingleQuotes = ret
	end function
	function GetGrade(score)
		dim ret
		
		select case int(score)
			case 85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
				ret = "A1"
			case 75,76,77,78,79,80,81,82,83,84
				ret = "B2"
			case 70,71,72,73,74
				ret = "B3"
			case 65,66,67,68,69
				ret = "C4"
			case 60,61,62,63,64
				ret = "C5"
			case 55,56,57,58,59
				ret = "C6"
			case 45,46,47,48,49
				ret = "P7"
			case 40,41,42,43,44
				ret = "P8"
			case 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39
				ret = "F9"
		end select
		
		GetGrade = ret
	end function
	function GetJuniorGrade(score)
		dim ret
		
		select case int(score)
			case 85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100
				ret = "A"
			case 75,76,77,78,79,80,81,82,83,84
				ret = "A"
			case 70,71,72,73,74
				ret = "A"
			case 65,66,67,68,69
				ret = "C"
			case 60,61,62,63,64
				ret = "C"
			case 55,56,57,58,59
				ret = "C"
			case 45,46,47,48,49
				ret = "P"
			case 40,41,42,43,44
				ret = "P"
			case 0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39
				ret = "F"
		end select
		
		GetJuniorGrade = ret
	end function
	function RemoveSurroundingQuotes(v_Text, v_Quote)
		dim ret
		v_Text = trim(v_Text)
		
		if left(v_Text,1) = v_Quote AND right(v_Text,1) = v_Quote then
			ret = mid(v_Text, 2, len(v_Text)-2)
		else
			ret = v_Text
		end if
		
		RemoveSurroundingQuotes = ret
	end function
	function GetColor(rowNo)
		if rowNo mod 2 = 0 then 
			getColor = "#cccccc"
		else
			'getColor = "#ffcc00"
		end if
	end function
	function GetColorB(rowNo)
		if rowNo mod 2 = 0 then 
			getColorB = "ffffff"
		else
			getColorB = "#eeeeee"
		end if
	end function
	function ShowPreview(v_Text, v_Length)
		dim ret
		if len(v_Text) > v_Length then
			ret = left(v_Text, v_length) & "..."
		else
			ret = v_Text
		end if
		ShowPreview = ret
	end function
	function DecodeURL(strString)
		strString = Replace(strString, "%2F", "/")
		strString = Replace(strString, "%7C", "|")
		strString = Replace(strString, "%3F", "?")
		strString = Replace(strString, "%21", "!")
		strString = Replace(strString, "%40", "@")
		strString = Replace(strString, "%5C", "\")
		strString = Replace(strString, "%23", "#")
		strString = Replace(strString, "%24", "$")
		strString = Replace(strString, "%5E", "^")
		strString = Replace(strString, "%26", "&")
		strString = Replace(strString, "%25", "%")
		strString = Replace(strString, "%2A", "*")
		strString = Replace(strString, "%28", "(")
		strString = Replace(strString, "%29", ")")
		strString = Replace(strString, "%7D", "}")
		strString = Replace(strString, "%3A", ":")
		strString = Replace(strString, "%2C", ",")
		strString = Replace(strString, "%7B", "{")
		strString = Replace(strString, "%2B", "+")
		strString = Replace(strString, "%2E", ".")
		strString = Replace(strString, "%2D", "-")
		strString = Replace(strString, "%7E", "~")
		strString = Replace(strString, "%2D", "-")
		strString = Replace(strString, "%5B", "[")
		strString = Replace(strString, "%5F", "_")
		strString = Replace(strString, "%5D", "]")
		strString = Replace(strString, "%60", "`")
		strString = Replace(strString, "%3D", "=")
		strString = Replace(strString, "%27", "'")
		strString = Replace(strString, "+", " ")
		strString = Replace(strString, "%22", Chr(34))
		DecodeURL = strString
	End Function    
	'sub SendMail(strFrom,strTo,strCc,strBcc,strSubject,strBody,strAttachPath)
'		'On Error Resume Next		
'		Dim objEmail
'		Set objEmail = CreateObject("CDO.Message")
'
'		objEmail.From = strFrom
'		objEmail.To = strTo
'		objEmail.Cc = strCc
'		objEmail.Bcc = strBcc
'		objEmail.Subject = strSubject
'		objEmail.TextBody  = strBody
'		if strAttachPath <> "" then
'			'objEmail.AddAttachment server.mappath("Crusader_prospectus.pdf")
'			objEmail.AddAttachment strAttachPath
'		end if
'		With objEmail.Configuration.Fields
'			.Item("http://schemas.microsoft.com/cdo/configuaration/sendusing") = 2
'			.Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "minnesota.worldispnetwork.com"
'			.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "autobot@smartsystems-ng.com"
'			.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "autobot"
'			.Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 1
'			.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
'			.Update
'		End With
'				
'		objEmail.Send
'
'		Set objEmail = Nothing
'	end sub
 	' ' sub SendMail(strFrom,strTo,strCc,strBcc,strSubject,strBody,strAttachPath)
		' ' 'On Error Resume Next		
		' ' Dim objEmail
		' ' Set objEmail = CreateObject("CDO.Message")

		' ' objEmail.From = strFrom
		' ' objEmail.To = strTo
		' ' objEmail.Cc = strCc
		' ' objEmail.Bcc = strBcc
		' ' objEmail.Subject = strSubject
		' ' objEmail.HTMLBody  = strBody
		' ' if strAttachPath <> "" then
			' ' objEmail.AddAttachment strAttachPath
		' ' end if
		' ' With objEmail.Configuration.Fields
			' ' .Item("http://schemas.microsoft.com/cdo/configuration/sendusing") = 2
			' ' .Item("http://schemas.microsoft.com/cdo/configuration/smtpserver") = "localhost"
			' ' '.Item("http://schemas.microsoft.com/cdo/configuration/sendusername") = "autobot@smartsystems-ng.com"
			' ' '.Item("http://schemas.microsoft.com/cdo/configuration/sendpassword") = "autobot"
			' ' .Item("http://schemas.microsoft.com/cdo/configuration/smtpauthenticate") = 0
			' ' '.Item("http://schemas.microsoft.com/cdo/configuration/smtpserverport") = 587
			' ' .Update
		' ' End With
		' ' objEmail.Send

		' ' Set objEmail = Nothing
	' ' end sub
    'Sub SendMail()
    '    Dim strBody 
    '    Dim CDONTSMail 
    '    Set CDONTSMail = CreateObject("CDONTS.NewMail") 
    '    CDONTSMail.From= "user@example.com" 
    '    CDONTSMail.To= "user@example.com" 
    '    CDONTSMail.Subject="This is a Test email" 
    '    strBody = "This is a test message." & vbCrLf 
    '    CDONTSMail.Body= strBody 
    '    CDONTSMail.Send 
    '    set CDONTSMail=nothing 
    'End Sub
	sub ReportError
		if err.number <> 0 then
			response.write "Error Number: " & err.number & "<br>"
			response.write "Error Description: " & err.description & "<br>"
			Response.End
		end if
	end sub
	function DetectBrowser()
		'netscape navigator, miscrosoft internet explorer, mozilla firefox, gecko, opera,
		browser = request.ServerVariables("HTTP_USER_AGENT")
		'response.write browser: response.End()
		if Instr(1, browser, "MSIE", 1) <> 0 then
			ret = "Microsoft Internet Explorer"
		elseif Instr(1, browser, "Netscape", 1) <> 0 then
			ret = "Netscape Navigator"
		elseif Instr(1, browser, "Firefox", 1) <> 0 then
			ret = "Mozilla Firefox"
		elseif Instr(1, browser, "Gecko", 1) <> 0 then
			ret = "Gecko"
		elseif Instr(1, browser, "Opera", 1) <> 0 then
			ret = "Opera"
		elseif Instr(1, browser, "Safari", 1) <> 0 then
			ret = "Safari"
		elseif Instr(1, browser, "Konqueror", 1) <> 0 then
			ret = "Konqueror"
		elseif Instr(1, browser, "AOL", 1) <> 0 or Instr(1, browser, "America Online", 1) <> 0 or Instr(1, browser, "America Online", 1) <> 0 then
			ret = "America Online"
		elseif Instr(1, browser, "Camino", 1) <> 0 then
			ret = "Camino"
		elseif Instr(1, browser, "AppleWebKit", 1) <> 0 then
			ret = "AppleWebKit"
		end if
		DetectBrowser = ret
	end function
%>