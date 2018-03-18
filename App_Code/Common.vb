Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Imports System.Data
Imports WebSupergoo.ABCpdf6
Imports System.Net.Mail
Imports Newtonsoft.Json

Public Class Common
    Public Const CONST_BULKSMS_USERNAME As String = "sms.childville@myschool360.info"
    Public Const CONST_BULKSMS_PASSWORD As String = "password"
    Public Const CONST_BULKSMS_PRICE_PER_UNIT As Double = 1.7

    Public Const CONST_BULKSMS_INFOBIP_USERNAME As String = "mysch.childville"
    Public Const CONST_BULKSMS_INFOBIP_PASSWORD As String = "Zd1N243d"
    Public Const CONST_BULKSMS_INFOBIP_PRICE_PER_UNIT As Double = 1.47

    Public Const CONST_BULKSMS_CHARACTERS_PER_PAGE As Int16 = 160
    Public Const CONST_BULKSMS_REFILL_LEVEL As Int16 = 500

    Public Const CONST_ACADEMICS_DUMMY_SCHOOL_CHAMP As String = "99999"
    Public Const CONST_ACADEMICS_PASSRATES_CUTOFF As Double = 40.0

    Public Const CONST_LITERATUREENCORE_FEED_URL As String = "http://feeds.feedburner.com/literatureencore"
    Public Const CONST_KHANACADEMY_FEED_URL As String = "http://khanacademy.tumblr.com/rss"

    Public Const CONST_FORUMS_VANILLA_SSO_JSCONNECT_CLIENTID As String = "275549375"
    Public Const CONST_FORUMS_VANILLA_SSO_JSCONNECT_SECRETKEY As String = "236a615e8bb013e8f2576cd5cd3c9c19"

    Public Const SESSION_PAYMENTS_SELECTEDPAYABLES As String = "SelectedPayables"

    Public Shared Function GetOrdinal(ByVal position As Int16) As String
        Dim ret As String
        Select Case position
            Case 1, 21, 31, 41, 51, 61, 71, 81, 91
                ret = "st"
            Case 2, 22, 32, 42, 52, 62, 72, 82, 92
                ret = "nd"
            Case 3, 23, 33, 43, 53, 63, 73, 83, 93
                ret = "rd"
            Case Else
                ret = "th"
        End Select

        Return ret
    End Function
    Public Shared Function GetTotalRevenues() As Double
        Dim sqlQueryText As String = "select sum(amount) as TotalRevenue from dbo.TEMPOfficeEntries --WHERE YEAR(TransactionDate) = YEAR(GETDATE())"
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function
    Public Shared Function GetStudentCount() As Double
        Dim sqlQueryText As String = " select count(*) as StudentCount from dbo.TEMPCustomers "
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function
    Public Shared Function GetTeacherCount() As Double
        Dim sqlQueryText As String = " select count(DISTINCT a.UserId) as TeacherCount from dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE RoleName LIKE '%Teacher%' "
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString)
        Dim sqlCommand As New System.Data.SqlClient.SqlCommand(sqlQueryText, sqlConn)

        sqlConn.Open()
        Return sqlCommand.ExecuteScalar
        sqlConn.Close()
    End Function
    Public Shared Function GenerateRandomPassword(ByVal desiredLength As String) As String
        Dim ret As String = "", seedRandom As Int32, realRandom As Int32

        For i As Int32 = 1 To desiredLength
            Randomize()
            seedRandom = Rnd()
            Select Case Math.Round(seedRandom)
                Case 1
                    realRandom = Int(((90 - 65) * Rnd()) + 65)
                Case Else
                    realRandom = Int(((122 - 97) * Rnd()) + 97)
            End Select
            ret &= Chr(realRandom)
        Next
        Return ret
    End Function
    Public Shared Function GetRandomNumberBasedOnCurrentTime(ByVal maxValue As Int32) As Int32
        Dim ret As Int32

        ret = New Random(System.DateTime.Now.Millisecond).Next(1, maxValue)

        Return ret
    End Function
    Public Shared Function GetTableRows(ByVal sqlStatement As String) As System.Data.DataRowCollection
        Dim ret As System.Data.DataRowCollection
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString)
        Dim da As New System.Data.SqlClient.SqlDataAdapter(sqlStatement, sqlConn)
        da.SelectCommand.CommandTimeout = 0
        Dim dt As New System.Data.DataTable

        sqlConn.Open()
        da.Fill(dt)
        sqlConn.Close()
        ret = dt.Rows
        Return ret
    End Function
    Public Shared Function UpdateTableRow(ByVal sqlStatement As String) As Int32
        Dim ret As Int32
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString)
        sqlConn.Open()

        Dim sqlCmd As New SqlCommand(sqlStatement)
        sqlCmd.Connection = sqlConn
        sqlCmd.CommandTimeout = 0
        ret = sqlCmd.ExecuteNonQuery
        sqlConn.Close()

        Return ret
    End Function
    Public Shared Function InsertTableRow(ByVal sqlStatement As String) As Int32
        Dim ret As Int32
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString)
        sqlConn.Open()

        Dim sqlCmd As New SqlCommand(sqlStatement)
        sqlCmd.Connection = sqlConn
        sqlCmd.CommandTimeout = 0
        ret = sqlCmd.ExecuteNonQuery
        sqlConn.Close()

        Return ret
    End Function
    Public Shared Function DeleteTableRow(ByVal sqlStatement As String) As Int32
        Dim ret As Int32
        Dim sqlConn As New System.Data.SqlClient.SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings("iTecon").ToString)
        sqlConn.Open()

        Dim sqlCmd As New SqlCommand(sqlStatement)
        sqlCmd.Connection = sqlConn
        sqlCmd.CommandTimeout = 0
        ret = sqlCmd.ExecuteNonQuery
        sqlConn.Close()

        Return ret
    End Function
    Public Shared Function GetMaleOrFemale(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "F"
                ret = "Female"
            Case "M"
                ret = "Male"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetGenderPossessivePronoun(ByVal genderAbbreviation As String) As String
        Dim ret As String

        Select Case genderAbbreviation.ToUpper
            Case "F"
                ret = "her"
            Case "M"
                ret = "his"
            Case Else
                ret = ""
        End Select

        Return ret
    End Function
    Public Shared Function GetYesOrNo(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "N"
                ret = "No"
            Case "Y"
                ret = "Yes"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetApprovalStatus(ByVal status As String) As String
        Dim ret As String

        Select Case status.ToUpper
            Case "APPROVED"
                ret = "Yes"
            Case Else
                ret = "No"
        End Select

        Return ret
    End Function
    Public Shared Function GetSettings(ByVal moduleName As String) As DataRowCollection
        Dim ret As DataRowCollection

        ret = GetTableRows("SELECT SettingTitle, SettingValue FROM dbo.Core_Setting WHERE ModuleName = '" & moduleName & "' ")

        Return ret
    End Function
    Public Shared Function ShowPosition() As Boolean
        Dim ret As Boolean, temp As String = ""

        temp = GetTableRows("SELECT SettingTitle, SettingValue FROM dbo.Core_Setting WHERE SettingTitle = 'Show Positions' ")(0).Item(1)

        Select Case temp.Trim.ToUpper
            Case "YES"
                ret = True
            Case "NO"
                ret = False
        End Select

        Return ret
    End Function
    ''get the range of values between '12345678' and 'FFFFFFFF'
    'Dim maxHex As Int64 = Convert.ToInt64("FFFFFFFF", 16)
    'Dim minHex As Int64 = Convert.ToInt64("12345678", 16)
    'Dim rangeCode As Int64 = maxHex - minHex
    ''retrieve current hex value from DB
    'Dim hexOldValue As String = "1234ABCF"
    ''increment hex value by 1
    'Dim intCode As Int64 = Convert.ToInt64("FFFFFFFF", 16)
    'Dim intNewValue As Int64 = intCode + 1
    'Dim hexNewValue As String = Hex(intNewValue)
    ''store new hex value
    Public Shared Function GetMaxStudentId() As Int32
        Dim ret As String

        Dim rows As DataRowCollection
        rows = GetTableRows("SELECT IsNull(Max(CustomerId), 0) FROM dbo.TEMPCustomers")

        ret = CType(rows(0).Item(0), Int32)

        Return ret
    End Function
    Public Shared Function GetMaxApplicantId() As Int32
        Dim ret As String

        Dim rows As DataRowCollection

        'rows = GetTableRows("SELECT IsNull(Max(CustomerId), 0) FROM dbo.TEMPCustomers_0_Applied")
        rows = GetTableRows("SELECT IsNull(Max(CustomerCode), 0) FROM dbo.TEMPCustomers_0_Applied")

        If CType(rows(0).Item(0), Int32) = 0 Then
            rows = GetTableRows("SELECT IsNull(Max(CustomerCode), 0) FROM dbo.TEMPCustomers_2012")
        End If

        If CType(rows(0).Item(0), Int32) = 0 Then
            rows = GetTableRows("SELECT IsNull(Max(CustomerCode), 0) FROM dbo.TEMPCustomers")
        End If

        ret = CType(rows(0).Item(0), Int32)

        Return ret
    End Function
    Public Shared Function PadNumber(ByVal numToPad As String, ByVal desiredChars As Int32) As String
        Dim ret As String

        If numToPad.Length < desiredChars Then
            numToPad = "0" & numToPad
            numToPad = PadNumber(numToPad, desiredChars)
            ret = numToPad
        Else
            ret = numToPad
        End If

        Return ret
    End Function
    Public Shared Function GetCalendarMonthEvents(ByVal calendarEvents As Hashtable, ByVal incomingEventArgs As WebControls.DayRenderEventArgs) As WebControls.DayRenderEventArgs
        Dim ret As WebControls.DayRenderEventArgs
        If Not calendarEvents Is Nothing Then
            Dim rowsTodayEvents As System.Data.DataRowCollection = Common.GetTableRows("SELECT EventId, ISNULL(Remark1, ''), StartDate FROM dbo.Core_CalendarEvent WHERE StartDate <= '" & incomingEventArgs.Day.Date.ToString & "' AND EndDate >= '" & incomingEventArgs.Day.Date.ToString & "'")
            Select Case rowsTodayEvents.Count
                Case 0
                Case Else
                    For i As Int32 = 0 To rowsTodayEvents.Count - 1
                        If Not calendarEvents(CType(rowsTodayEvents(i).Item(0), Int32)) Is Nothing Then
                            If incomingEventArgs.Day.Date.Month = CType(rowsTodayEvents(i).Item(2), Date).Month Then
                                incomingEventArgs.Cell.BorderColor = System.Drawing.ColorTranslator.FromHtml("#808080")
                                Select Case CType(rowsTodayEvents(i).Item(1), String).Trim.ToUpper
                                    Case "EVENT"
                                        incomingEventArgs.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#ff0000")
                                    Case "HOLIDAY"
                                        incomingEventArgs.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml("#00ff00")
                                End Select
                                'e.Cell.BackColor = System.Drawing.ColorTranslator.FromHtml(rowsSchoolTheme(0).Item(3).ToString)
                                incomingEventArgs.Cell.BorderStyle = BorderStyle.Solid
                                incomingEventArgs.Cell.BorderWidth = 1
                                incomingEventArgs.Cell.Font.Bold = True
                                incomingEventArgs.Cell.ToolTip = calendarEvents(CType(rowsTodayEvents(i).Item(0), Int32)).ToString
                            End If
                        End If
                    Next
            End Select
        End If

        ret = incomingEventArgs
        Return ret
    End Function
    Public Shared Sub UploadPhoto(ByRef fileUploadControl As FileUpload, ByVal destinationFolder As String, ByVal destinationFilePrefix As String, ByVal uniqueId As String)
        ' Specify the path on the server to save the uploaded file to.
        Dim savePath As String = destinationFolder                      'e.g. "c:\inetpub\wwwroot\abc\uploads\"
        Dim destinationFileName As String = ""
        Dim fileDetails As System.IO.FileInfo = Nothing
        fileDetails = New System.IO.FileInfo(fileUploadControl.PostedFile.FileName)
        ' Get the name of the file to upload.
        destinationFileName = destinationFilePrefix & uniqueId & ".jpg"
        ' Append the name of the file to upload to the path.
        savePath &= destinationFileName
        fileUploadControl.SaveAs(savePath)
    End Sub
    Public Shared Sub ResizePhoto(ByRef fileUploadControl As FileUpload, ByVal savePath As String)
        Dim maxUploadFileSize As Int32 = CType(System.Configuration.ConfigurationManager.AppSettings("Max_PhotoUploadSize"), Int32)
        Dim scaleFactor As Int32
        If fileUploadControl.PostedFile.ContentLength <= maxUploadFileSize Then
            'do nothing
        Else
            scaleFactor = maxUploadFileSize / fileUploadControl.PostedFile.ContentLength

            Dim image As System.Drawing.Image = System.Drawing.Image.FromStream(fileUploadControl.PostedFile.InputStream)
            Dim newWidth As Int32 = image.Width * scaleFactor
            Dim newHeight As Int32 = image.Height * scaleFactor

            'Create the delegate
            Dim dummyCallBack As System.Drawing.Image.GetThumbnailImageAbort = New System.Drawing.Image.GetThumbnailImageAbort(AddressOf DummyCallBackMethod)
            Dim thumbnailBitmap As System.Drawing.Image = image.GetThumbnailImage(newWidth, newHeight, dummyCallBack, IntPtr.Zero)

            'Dim thumbnailBitmap As System.Drawing.Bitmap = New System.Drawing.Bitmap(newWidth, newHeight)
            Dim thumbnailGraphic As System.Drawing.Graphics = System.Drawing.Graphics.FromImage(thumbnailBitmap)
            With thumbnailGraphic
                .CompositingQuality = Drawing.Drawing2D.CompositingQuality.HighQuality
                .SmoothingMode = Drawing.Drawing2D.SmoothingMode.HighQuality
                .InterpolationMode = Drawing.Drawing2D.InterpolationMode.HighQualityBicubic
            End With
            Dim imageRectangle As System.Drawing.Rectangle = New System.Drawing.Rectangle(0, 0, newWidth, newHeight)
            thumbnailGraphic.DrawImage(image, imageRectangle)
            thumbnailBitmap.Save(savePath, image.RawFormat)

            thumbnailGraphic.Dispose()
        End If
    End Sub
    Public Shared Sub UploadNonPhotoFile(ByRef fileUploadControl As FileUpload, ByVal destinationFolder As String, ByVal destinationFilePrefix As String, ByVal uniqueId As String)
        'Specify the path on the server to save the uploaded file to.
        Dim savePath As String = destinationFolder                      'e.g. "c:\inetpub\wwwroot\abc\uploads\"
        Dim destinationFileName As String = ""
        ' Get the name of the file to upload.
        destinationFileName = destinationFilePrefix & uniqueId
        ' Append the name of the file to upload to the path.
        savePath &= destinationFileName
        'save
        fileUploadControl.SaveAs(savePath)
    End Sub
    Public Shared Function DummyCallBackMethod() As Boolean
        Return False
    End Function
    Public Shared Function FileExistsOnServer(ByVal filePath As String) As Boolean
        Dim ret As Boolean
        Dim fileDetails As System.IO.FileInfo = Nothing

        fileDetails = New System.IO.FileInfo(filePath)
        ret = fileDetails.Exists

        Return ret
    End Function
    Public Shared Function ShowPhotograph(ByVal fileName As String, ByVal filePath As String) As String
        Dim ret As String

        If FileExistsOnServer(filePath) Then
            ret = fileName
        Else
            ret = "~/images/pp/anonynous.png"
        End If

        Return ret
    End Function
    Public Shared Function ShowPracticeQuestionDiagram(ByVal fileName As String, ByVal filePath As String) As String
        Dim ret As String

        If FileExistsOnServer(filePath) Then
            ret = fileName
        Else
            ret = "~/images/zoom.gif"
        End If

        Return ret
    End Function
    Public Shared Sub DeleteFile(ByVal filePath As String)
        Dim fileDetails As System.IO.FileInfo = Nothing

        fileDetails = New System.IO.FileInfo(filePath)
        fileDetails.Delete()
    End Sub
    Public Shared Function ConvertStringToBoolean(ByVal stringRepresentation As String) As Boolean
        Dim ret As Boolean

        Select Case ret
            Case "0", "F", "N"
                ret = False
            Case "1", "T", "Y"
                ret = True
            Case Else
                ret = False
        End Select

        Return ret
    End Function
    Public Shared Function ConvertDBNulltoNothing(ByVal valuetoConvert As Object) As Object
        Dim ret As String = ""

        If valuetoConvert.GetType Is System.Type.GetType("System.DBNull") Then
            ret = Nothing
        Else
            ret = valuetoConvert
        End If

        Return ret
    End Function
    Public Shared Function DecodeHTML(ByVal htmlString As String) As String

        htmlString = Replace(htmlString, "%2F", "/")
        htmlString = Replace(htmlString, "%7C", "|")
        htmlString = Replace(htmlString, "%3F", "?")
        htmlString = Replace(htmlString, "%21", "!")
        htmlString = Replace(htmlString, "%40", "@")
        htmlString = Replace(htmlString, "%5C", "\")
        htmlString = Replace(htmlString, "%23", "#")
        htmlString = Replace(htmlString, "%24", "$")
        htmlString = Replace(htmlString, "%5E", "^")
        htmlString = Replace(htmlString, "%26", "&")
        htmlString = Replace(htmlString, "%25", "%")
        htmlString = Replace(htmlString, "%2A", "*")
        htmlString = Replace(htmlString, "%28", "(")
        htmlString = Replace(htmlString, "%29", ")")
        htmlString = Replace(htmlString, "%7D", "}")
        htmlString = Replace(htmlString, "%3A", ":")
        htmlString = Replace(htmlString, "%2C", ",")
        htmlString = Replace(htmlString, "%7B", "{")
        htmlString = Replace(htmlString, "%2B", "+")
        htmlString = Replace(htmlString, "%2E", ".")
        htmlString = Replace(htmlString, "%2D", "-")
        htmlString = Replace(htmlString, "%7E", "~")
        htmlString = Replace(htmlString, "%2D", "-")
        htmlString = Replace(htmlString, "%5B", "[")
        htmlString = Replace(htmlString, "%5F", "_")
        htmlString = Replace(htmlString, "%5D", "]")
        htmlString = Replace(htmlString, "%60", "`")
        htmlString = Replace(htmlString, "%3D", "=")
        htmlString = Replace(htmlString, "%27", "'")
        htmlString = Replace(htmlString, "+", " ")
        htmlString = Replace(htmlString, "%22", Chr(34))

        Return htmlString
    End Function
    Public Shared Function EncodeHTML(ByVal htmlString As String) As String

        htmlString = Replace(htmlString, "/", "%2F")
        htmlString = Replace(htmlString, "|", "%7C")
        htmlString = Replace(htmlString, "?", "%3F")
        htmlString = Replace(htmlString, "!", "%21")
        htmlString = Replace(htmlString, "@", "%40")
        htmlString = Replace(htmlString, "\", "%5C")
        htmlString = Replace(htmlString, "#", "%23")
        htmlString = Replace(htmlString, "$", "%24")
        htmlString = Replace(htmlString, "^", "%5E")
        htmlString = Replace(htmlString, "&", "%26")
        htmlString = Replace(htmlString, "%", "%25")
        htmlString = Replace(htmlString, "*", "%2A")
        htmlString = Replace(htmlString, "(", "%28")
        htmlString = Replace(htmlString, ")", "%29")
        htmlString = Replace(htmlString, "}", "%7D")
        htmlString = Replace(htmlString, ":", "%3A")
        htmlString = Replace(htmlString, ",", "%2C")
        htmlString = Replace(htmlString, "{", "%7B")
        htmlString = Replace(htmlString, "+", "%2B")
        htmlString = Replace(htmlString, ".", "%2E")
        htmlString = Replace(htmlString, "-", "%2D")
        htmlString = Replace(htmlString, "~", "%7E")
        htmlString = Replace(htmlString, "-", "%2D")
        htmlString = Replace(htmlString, "[", "%5B")
        htmlString = Replace(htmlString, "_", "%5F")
        htmlString = Replace(htmlString, "]", "%5D")
        htmlString = Replace(htmlString, "`", "%60")
        htmlString = Replace(htmlString, "=", "%3D")
        htmlString = Replace(htmlString, "'", "%27")
        htmlString = Replace(htmlString, " ", "+")
        htmlString = Replace(htmlString, Chr(34), "%22")
        htmlString = Replace(htmlString, vbCrLf, Chr(13))

        Return htmlString
    End Function
    Public Shared Function SavePrincipalComment(ByVal matricNumber As String, ByVal sessionName As String, ByVal termName As String, ByVal assessment As String, ByVal comment As String) As Int32
        Dim ret As Int32

        If GetTableRows(" SELECT * FROM dbo.TEMPStudentSubjectScorePrincipalComment WHERE PortalNumber = '" & matricNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessment & "' ").Count = 0 Then
            'no comment yet, so do a fresh insert
            ret = InsertTableRow(" INSERT INTO dbo.TEMPStudentSubjectScorePrincipalComment(PortalNumber, SessionName, TermName, AssessmentType, Comment)  VALUES ('" & matricNumber & "','" & sessionName & "','" & termName & "','" & assessment & "','" & comment & "') ")
        Else
            'previously-entered comment exists, so update previous comment
            ret = UpdateTableRow(" UPDATE dbo.TEMPStudentSubjectScorePrincipalComment SET Comment = '" & comment & "' WHERE PortalNumber = '" & matricNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessment & "' ")
        End If

        Return ret
    End Function
    Public Shared Function GetParentEmails(ByVal mode As String, ByVal filter As String) As Collection
        Dim ret As Collection = New Collection, rowsParentEmails As DataRowCollection, sqlSelect As String = ""

        Select Case mode.ToUpper
            Case "SINGLE"
                sqlSelect = " SELECT CustomerCode as PortalNumber, CurrentBal as MotherEmail, EmailAddress as FatherEmail, DistrictCode as ClassName FROM dbo.TEMPCustomers WHERE CustomerCode = '" & filter & "' "
            Case "CLASS"
                sqlSelect = " SELECT CustomerCode as PortalNumber, CurrentBal as MotherEmail, EmailAddress as FatherEmail, DistrictCode as ClassName FROM dbo.TEMPCustomers WHERE DistrictCode = '" & filter & "' "
            Case "PROGRAMME"
                sqlSelect = " SELECT CustomerCode as PortalNumber, CurrentBal as MotherEmail, EmailAddress as FatherEmail, DistrictCode as ClassName FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPClass b ON a.DistrictCode = b.ClassName INNER JOIN dbo.TEMPProgramme c ON b.Remarks = c.ProgrammeName WHERE c.ProgrammeName = '" & filter & "' "
            Case "SUBJECT"
                sqlSelect = " SELECT DISTINCT CustomerCode as PortalNumber, CurrentBal as MotherEmail, EmailAddress as FatherEmail, DistrictCode as ClassName FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber WHERE b.SubjectShortName IN (SELECT SubjectShortName FROM dbo.TEMPStudentSubject WHERE PortalNumber = a.CustomerCode) AND SubjectShortName = '" & filter & "' "
            Case "ALL"
                sqlSelect = " SELECT CustomerCode as PortalNumber, CurrentBal as MotherEmail, EmailAddress as FatherEmail, DistrictCode as ClassName FROM dbo.TEMPCustomers "
        End Select

        rowsParentEmails = GetTableRows(sqlSelect)

        If rowsParentEmails.Count = 0 Then
            ret = Nothing
        Else
            For i As Int32 = 0 To rowsParentEmails.Count - 1
                ret.Add(rowsParentEmails(i).Item(0).ToString & "|" & rowsParentEmails(i).Item(1).ToString & "|" & rowsParentEmails(i).Item(2).ToString & "|" & rowsParentEmails(i).Item(3).ToString)
            Next
        End If

        Return ret
    End Function
    Public Shared Sub SendMail(ByVal fromAddresses As String, ByVal toAddresses As String, ByVal ccAddresses As String, ByVal bccAddresses As String, ByVal subject As String, ByVal bodyFormat As String, ByVal body As String)
        On Error Resume Next
        '(1) Create the MailMessage instance
        Dim emailMessage As New MailMessage(fromAddresses, toAddresses)

        '(2) Assign the MailMessage's properties
        'emailMessage.Bcc.Add("idowuakinde@yahoo.com")
        emailMessage.Subject = subject
        emailMessage.Body = body
        emailMessage.IsBodyHtml = False

        '(3) Create the SmtpClient object
        Dim smtp As New SmtpClient("localhost")

        '(4) Send the MailMessage (will use the Web.config settings)
        smtp.Send(emailMessage)
    End Sub
    Public Shared Sub SendMail(ByVal fromAddresses As String, ByVal toAddresses As String, ByVal ccAddresses As String, ByVal bccAddresses As String, ByVal subject As String, ByVal bodyFormat As String, ByVal body As String, ByVal attachment As String)
        On Error Resume Next
        '(1) Create the MailMessage instance
        Dim emailMessage As New MailMessage(fromAddresses, toAddresses)

        '(2) Assign the MailMessage's properties
        'emailMessage.Bcc.Add("idowuakinde@yahoo.com")
        emailMessage.Subject = subject
        emailMessage.Body = body
        emailMessage.IsBodyHtml = False

        'mm.Attachments.Add(New Attachment(AttachmentFile.PostedFile.InputStream, AttachmentFile.FileName))
        emailMessage.Attachments.Add(New Attachment(attachment))

        '(3) Create the SmtpClient object
        Dim smtp As New SmtpClient("localhost")

        '(4) Send the MailMessage (will use the Web.config settings)
        smtp.Send(emailMessage)
    End Sub
    Public Shared Function GetPeriodTimes(ByVal periodNumber As Int32) As String
        Dim ret As String = ""

        Select Case periodNumber
            Case "1"
                ret = "(8:40am - 9:30am)"
            Case "2"
                ret = "(9:30am - 10:20am)"
            Case "3"
                ret = "(10:20am - 11:10am)"
            Case "4"
                ret = "(11:10am - 12:00pm)"
            Case "5"
                ret = "(12:40pm - 1:30pm)"
            Case "6"
                ret = "(1:30pm - 2:20pm)"
            Case "7"
                ret = "(2:20pm - 3:10pm)"
            Case "8"
                ret = "(3:10pm - 4:00pm)"
        End Select

        Return ret
    End Function
    Public Shared Sub RegisterClientScript(ByRef myPage As Page, ByVal myScriptKey As String, ByVal myScriptContents As String)
        If Not myPage.ClientScript.IsClientScriptBlockRegistered(myScriptKey) Then
            myPage.ClientScript.RegisterStartupScript(GetType(Page), myScriptKey, myScriptContents)
        End If
    End Sub
    Public Shared Function IsBatchApproved(ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String) As String
        Dim ret As String
        Dim temp As Int32

        'temp = CType(GetTableRows(" SELECT COUNT(*) FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName WHERE a.DistrictCode = '" & className & "' AND b.SubjectShortName = '" & subjectShortName & "' ")(0).Item(0), Int32)

        temp = CType(GetTableRows(" SELECT COUNT(*) FROM dbo.TEMPStudentSubjectScore a INNER JOIN dbo.TEMPCustomers b ON a.PortalNumber = b.CustomerCode WHERE subjectShortName = '" & subjectShortName & "' AND sessionName = '" & sessionName & "' AND termName = '" & termName & "' AND b.DistrictCode = '" & className & "' AND Remark1 IS NULL ")(0).Item(0), Int32)

        Select Case temp
            Case 0
                ret = "Approved"
            Case Else
                ret = "Pending"
        End Select

        Return ret
    End Function
    Public Shared Function IsBatch2Approved(ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String) As String
        Dim ret As String
        Dim temp As Int32

        'temp = CType(GetTableRows(" SELECT COUNT(*) FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName WHERE a.DistrictCode = '" & className & "' AND b.SubjectShortName = '" & subjectShortName & "' ")(0).Item(0), Int32)

        temp = CType(GetTableRows(" SELECT COUNT(*) FROM dbo.TEMPStudentSubjectScore a INNER JOIN dbo.TEMPCustomers b ON a.PortalNumber = b.CustomerCode WHERE subjectShortName = '" & subjectShortName & "' AND sessionName = '" & sessionName & "' AND termName = '" & termName & "' AND b.DistrictCode = '" & className & "' AND Remark1 IS NULL ")(0).Item(0), Int32)

        Select Case temp
            Case 0
                ret = "Approved"
            Case Else
                ret = "Pending"
        End Select

        Return ret
    End Function
    Public Shared Function GetIntegerSeries(ByVal minimum As Int32, ByVal maximum As Int32, ByVal interval As Int32) As Collection
        Dim ret As Collection, temp As New Collection

        For i As Int32 = minimum To maximum Step interval
            temp.Add(i)
        Next

        ret = temp

        Return ret
    End Function
    Public Shared Function GetYearSeries() As Collection
        Dim ret As Collection, temp As New Collection

        For i As Int32 = 1900 To DateTime.Now.Year Step 1
            temp.Add(i)
        Next

        ret = temp

        Return ret
    End Function
    Public Shared Function GetDoubleSeries(ByVal minimum As Double, ByVal maximum As Double, ByVal interval As Double) As Collection
        Dim ret As Collection, temp As New Collection

        For i As Double = minimum To maximum Step interval
            temp.Add(i)
        Next

        ret = temp

        Return ret
    End Function
    Public Shared Function GetCurrentWeekStartDate() As Date
        Dim ret As Date
        Dim currentWeekStartDate As Date

        Select Case Today.DayOfWeek
            Case DayOfWeek.Monday
                'equate to today
                currentWeekStartDate = Today
            Case DayOfWeek.Tuesday
                'step back 1 day
                currentWeekStartDate = DateAdd(DateInterval.Weekday, -1, Today)
            Case DayOfWeek.Wednesday
                'step back 2 days
                currentWeekStartDate = DateAdd(DateInterval.Weekday, -2, Today)
            Case DayOfWeek.Thursday
                'step back 3 days
                currentWeekStartDate = DateAdd(DateInterval.Weekday, -3, Today)
            Case DayOfWeek.Friday
                'step back 4 days
                currentWeekStartDate = DateAdd(DateInterval.Weekday, -4, Today)
            Case DayOfWeek.Saturday
                'step back 5 days
                currentWeekStartDate = DateAdd(DateInterval.Weekday, -5, Today)
            Case DayOfWeek.Sunday
                'step back 6 days
                currentWeekStartDate = DateAdd(DateInterval.Weekday, -6, Today)
        End Select

        ret = currentWeekStartDate

        Return ret
    End Function
    Public Shared Function GetFullMonthName(ByVal shortName As String) As String
        Dim ret As String

        ret = shortName.Trim.ToUpper

        Select Case ret
            Case "JAN"
                ret = "JANUARY"
            Case "FEB"
                ret = "FEBRUARY"
            Case "MAR"
                ret = "MARCH"
            Case "APR"
                ret = "APRIL"
            Case "MAY"
                ret = "MAY"
            Case "JUN"
                ret = "JUNE"
            Case "JUL"
                ret = "JULY"
            Case "AUG"
                ret = "AUGUST"
            Case "SEP"
                ret = "SEPTEMBER"
            Case "OCT"
                ret = "OCTOBER"
            Case "NOV"
                ret = "NOVEMBER"
            Case "DEC"
                ret = "DEEMBER"
            Case Else
                ret = ret
        End Select

        Return ret
    End Function
    Public Shared Function GetSpecialDateFormat(ByVal _date As DateTime) As String
        Dim ret As String
        If _date = "01/01/1900 00:00:00" Then
            ret = "N/A (Not available)"
        Else
            Dim _dateMonth As Int32 = _date.Month
            Dim _dateMonthName As String = MonthName(_dateMonth, True)
            Dim _dateDay As Int32 = _date.Day
            Dim _dateWeekDay As String = _date.DayOfWeek.ToString
            'ret = "Aug 1 (Wednesday)"
            ret = _dateMonthName & " " & PadNumber(_dateDay, 2) & " (" & _dateWeekDay & ")"
        End If

        Return ret
    End Function
    Public Shared Function GetSpecialDateFormatShort(ByVal _date As DateTime) As String
        Dim ret As String
        If _date = "01/01/1900 00:00:00" Then
            ret = "N/A (Not available)"
        Else
            Dim _dateMonth As Int32 = _date.Month
            Dim _dateMonthName As String = MonthName(_dateMonth, True)
            Dim _dateDay As Int32 = _date.Day
            Dim _dateWeekDay As String = _date.DayOfWeek.ToString
            'ret = "Aug 1"
            ret = _dateMonthName & " " & PadNumber(_dateDay, 2)
        End If

        Return ret
    End Function
    Public Shared Function GetFriendlyDate(ByVal _date As Date) As String
        Dim ret As String
        If _date = "01/01/1900 00:00:00" Then
            ret = "N/A (Not available)"
        Else
            Dim _dateMonth As Int32 = _date.Month
            Dim _dateMonthName As String = MonthName(_dateMonth, True)
            Dim _dateDay As Int32 = _date.Day
            Dim _dateYear As String = _date.Year
            Dim _dateWeekday As String = _date.DayOfWeek.ToString
            'ret = "Aug 01, 2011 (Wednesday)"
            ret = _dateMonthName & " " & PadNumber(_dateDay, 2) & ", " & _dateYear & " (" & _dateWeekday & ")"
        End If

        Return ret
    End Function
    Public Shared Function GetFriendlyDateShort(ByVal _date As Date) As String
        Dim ret As String
        If _date = "01/01/1900 00:00:00" Then
            ret = "N/A (Not available)"
        Else
            Dim _dateMonth As Int32 = _date.Month
            Dim _dateMonthName As String = MonthName(_dateMonth, True)
            Dim _dateDay As Int32 = _date.Day
            Dim _dateYear As String = _date.Year
            Dim _dateWeekday As String = _date.DayOfWeek.ToString
            'ret = "Aug 01, 2011"
            ret = _dateMonthName & " " & PadNumber(_dateDay, 2) & ", " & _dateYear
        End If

        Return ret
    End Function
    Public Shared Function GetTimespanInYears(ByVal startDate As Date, ByVal endDate As Date) As Int32
        Dim ret As Int32

        ret = Int((endDate - startDate).TotalDays / 365)

        Return ret
    End Function
    Public Shared Function GetTimespanInMonths(ByVal startDate As Date, ByVal endDate As Date) As Int32
        Dim ret As Int32

        ret = Int((endDate - startDate).TotalDays / (365 / 12))

        Return ret
    End Function
    Public Shared Function GetAttendanceRecord(ByVal portalNumber As String, ByVal lessonDateString As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String, ByRef counterObject As Int32()) As String
        Dim ret As String = ""

        If IsDate(lessonDateString) Then
            Dim lessonDate As Date = CType(lessonDateString, Date)
            Dim rowsAttendance As DataRowCollection = GetTableRows(" SELECT Attendance FROM dbo.TEMPStudentSubjectAttendance WHERE PortalNumber = '" & portalNumber & "' AND LessonDate = '" & lessonDate & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' ")
            If rowsAttendance.Count > 0 Then
                ret = CType(rowsAttendance(0).Item(0), String)
                Select Case ret
                    Case "P"
                        counterObject(0) += 1
                    Case "L"
                        counterObject(1) += 1
                    Case "A"
                        counterObject(2) += 1
                    Case "U"
                        counterObject(3) += 1
                End Select
            Else
                ret = "U"   'Unknown / Unrecorded
                counterObject(3) += 1
            End If
        End If

        Return ret
    End Function
    Public Shared Function GetDataEntryPage(ByVal className As String, ByVal termName As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                If termName = "1st Term" Then
                    ret = "manage_student_scores_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_CA3.aspx"
                Else
                    ret = "manage_student_scores_CA5.aspx"
                End If
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                If termName = "1st Term" Then
                    ret = "manage_student_scores_primary_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_primary_CA3.aspx"
                Else
                    ret = "manage_student_scores_primary_CA5.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                If termName = "1st Term" Then
                    ret = "manage_student_scores_nursery_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_nursery_CA3.aspx"
                Else
                    ret = "manage_student_scores_nursery_CA5.aspx"
                End If
            Case Else
                If termName = "1st Term" Then
                    ret = "manage_student_scores_prenursery_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_prenursery_CA3.aspx"
                Else
                    ret = "manage_student_scores_prenursery_CA5.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetDataEntryPage2(ByVal className As String, ByVal termName As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                If termName = "1st Term" Then
                    ret = "manage_student_scores_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_CA4.aspx"
                Else
                    ret = "manage_student_scores_CA6.aspx"
                End If
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                If termName = "1st Term" Then
                    ret = "manage_student_scores_primary_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_primary_CA4.aspx"
                Else
                    ret = "manage_student_scores_primary_CA6.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                If termName = "1st Term" Then
                    ret = "manage_student_scores_nursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_nursery_CA4.aspx"
                Else
                    ret = "manage_student_scores_nursery_CA6.aspx"
                End If
            Case Else
                If termName = "1st Term" Then
                    ret = "manage_student_scores_prenursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "manage_student_scores_prenursery_CA4.aspx"
                Else
                    ret = "manage_student_scores_prenursery_CA6.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetMidTermScore(ByVal portalNumber As String, ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String, ByVal scoreType As String) As Double
        Dim ret As Double
        Dim assessmentType As String = "Test"
        Dim rowsScore As System.Data.DataRowCollection
        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                If scoreType.ToUpper = "CA" Then                     'This is Cycle Test, fetch the column called "Score"
                    rowsScore = GetTableRows("Select IsNull(Score, -2) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                ElseIf scoreType.ToUpper = "CLASSTEST" Then          'This is Class Test, fetch the column called "ScoreClassTest"
                    rowsScore = GetTableRows("Select IsNull(ScoreClassTest, -2) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                ElseIf scoreType.ToUpper = "ASSIGNMENT" Then         'This is Assignment, fetch the column called "ScoreAssignments"
                    rowsScore = GetTableRows("Select IsNull(ScoreAssignments, -2) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                Else                                                 'This is Class Work, fetch the column called "ScoreClassWork"
                    rowsScore = GetTableRows("Select IsNull(ScoreClassWork, -2) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                End If
                Select Case rowsScore.Count
                    Case 0
                        ret = -2
                    Case Else
                        ret = rowsScore(0).Item(0).ToString
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                If scoreType.ToUpper = "CA" Then        'This is CA, fetch the column called "Score"
                    rowsScore = GetTableRows("Select IsNull(Score, -2) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                Else        'This is Cycle Test, fetch the column called "ScoreClassTest"
                    rowsScore = GetTableRows("Select IsNull(ScoreClassTest, -2) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                End If
                Select Case rowsScore.Count
                    Case 0
                        ret = -2
                    Case Else
                        ret = rowsScore(0).Item(0).ToString
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                If scoreType.ToUpper = "CA" Then        'This is CA, fetch the column called "Score"
                    rowsScore = GetTableRows("Select IsNull(Score, 0) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                Else        'This is Cycle Test, fetch the column called "ScoreClassTest"
                    rowsScore = GetTableRows("Select IsNull(ScoreClassTest, 0) AS Score FROM dbo.TEMPStudentSubjectScore WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                End If
                Select Case rowsScore.Count
                    Case 0
                        ret = 0
                    Case Else
                        ret = rowsScore(0).Item(0).ToString
                End Select
            Case Else 'pre-nursery (creche)
                rowsScore = GetTableRows("Select IsNull(Score, 0) AS Score FROM dbo.TEMPStudentSubjectScore_Nursery WHERE PortalNumber = '" & portalNumber & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = '" & assessmentType & "' ")
                Select Case rowsScore.Count
                    Case 0
                        ret = 0
                    Case Else
                        ret = rowsScore(0).Item(0).ToString
                End Select
        End Select

        Return ret
    End Function
    Public Shared Function GetScoreMask(ByVal score As Double, ByVal className As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                Select Case score
                    Case -2
                        ret = "NOT ENROLLED"
                    Case -1
                        ret = "ABSENT"
                    Case Else
                        ret = Math.Round(score).ToString
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                Select Case score
                    Case -2
                        ret = "NOT ENROLLED"
                    Case -1
                        ret = "ABSENT"
                    Case Else
                        ret = Math.Round(score).ToString
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                Select Case score
                    Case 0
                        ret = "NOT ASSESSED"
                    Case Else
                        ret = Math.Round(score).ToString
                End Select
            Case Else
                Select Case score
                    Case 0
                        ret = "NOT ASSESSED"
                    Case Else
                        ret = Math.Round(score).ToString
                End Select
        End Select

        Return ret
    End Function
    Public Shared Function GetScoresApprovalPage(ByVal className As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"                                    'secondary
                ret = "approve_CA1.aspx"
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                ret = "approve_primary_CA1.aspx"
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"       'nursery
                ret = "approve_nursery_CA1.aspx"
            Case Else
                ret = "approve_prenursery_CA1.aspx"
        End Select

        Return ret
    End Function
    Public Shared Function GetScoresApprovalPage2(ByVal className As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"                                    'secondary
                ret = "approve_CA2.aspx"
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                ret = "approve_primary_CA2.aspx"
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"       'nursery
                ret = "approve_nursery_CA2.aspx"
            Case Else
                ret = "approve_prenursery_CA2.aspx"
        End Select

        Return ret
    End Function
    Public Shared Function GetProgramme(ByVal className As String) As String
        Dim ret As String
        Dim rowsProgramme As DataRowCollection

        rowsProgramme = GetTableRows(" SELECT Remarks FROM dbo.TEMPClass WHERE ClassName = '" & className & "' ")

        Select Case rowsProgramme.Count
            Case 0
                ret = ""
            Case Else
                ret = rowsProgramme(0).Item(0).ToString
        End Select

        Return ret
    End Function
    Public Shared Function GetClassAverage(ByVal className As String, ByVal sessionName As String, ByVal termName As String, ByVal assessmentType As String) As Double
        Dim ret As Double
        Dim rowsClassAverage As DataRowCollection = Nothing

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                    Case "TEST2"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                    Case "TEST2"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                    Case "TEST2"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                End Select
            Case Else           'creche
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                    Case "TEST2"
                        rowsClassAverage = GetTableRows(" SELECT ClassName, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS ClassAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY ClassName, SessionName, TermName ")
                End Select
        End Select

        Select Case rowsClassAverage.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsClassAverage(0).Item(3), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetClassTermTotalAverage(ByVal className As String, ByVal sessionName As String, ByVal termName As String) As Double
        Dim ret As Double
        Dim rowsSubjectScore As DataRowCollection = Nothing

        'rowsSubjectScore = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) as AverageScore FROM dbo.VW_ACADEMICS_Student_Term_Totals WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Term Total' ")
        rowsSubjectScore = GetTableRows(" SELECT AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Term_Totals WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Term Total' GROUP BY ClassName, SessionName, TermName ")

        Select Case rowsSubjectScore.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsSubjectScore(0).Item(0), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentsPersonalAverage(ByVal portalNumber As String, ByVal className As String, ByVal sessionName As String, ByVal termName As String, ByVal assessmentType As String) As Double
        Dim ret As Double
        Dim rowsPersonalAverage As DataRowCollection = Nothing

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                    Case "TEST2"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                    Case "TEST2"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                    Case "TEST2"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                End Select
            Case Else           'creche
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                    Case "TEST2"
                        rowsPersonalAverage = GetTableRows(" SELECT PortalNumber, StudentName, ClassName, Gender, SessionName, TermName, AVG(PersonalAggregateSubjectScore) AS PersonalAverage FROM [dbo].[VW_ACADEMICS_Student_Subject_Scores] WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber, StudentName, ClassName, Gender, SessionName, TermName ")
                End Select
        End Select

        Select Case rowsPersonalAverage.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsPersonalAverage(0).Item(6), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentSubjectScore(ByVal portalnumber As String, ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String, ByVal assessmentType As String) As Double
        Dim ret As Double
        Dim rowsSubjectScore As DataRowCollection = Nothing

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPStudentSubject b ON a.PortalNumber = b.PortalNumber AND a.SessionName = b.SessionName and a.TermName = b.TermName INNER JOIN dbo.TEMPSubject c ON a.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND b.PortalNumber = '" & portalnumber & "' AND b.SubjectShortName = '" & subjectShortName & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND a.AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPStudentSubject b ON a.PortalNumber = b.PortalNumber AND a.SessionName = b.SessionName and a.TermName = b.TermName INNER JOIN dbo.TEMPSubject c ON a.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND b.PortalNumber = '" & portalnumber & "' AND b.SubjectShortName = '" & subjectShortName & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND a.AssessmentType = 'After Mid-Term' ")
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPStudentSubject b ON a.PortalNumber = b.PortalNumber AND a.SessionName = b.SessionName and a.TermName = b.TermName INNER JOIN dbo.TEMPSubject c ON a.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND b.PortalNumber = '" & portalnumber & "' AND b.SubjectShortName = '" & subjectShortName & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND a.AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPStudentSubject b ON a.PortalNumber = b.PortalNumber AND a.SessionName = b.SessionName and a.TermName = b.TermName INNER JOIN dbo.TEMPSubject c ON a.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND b.PortalNumber = '" & portalnumber & "' AND b.SubjectShortName = '" & subjectShortName & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND a.AssessmentType = 'After Mid-Term' ")
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPStudentSubject b ON a.PortalNumber = b.PortalNumber AND a.SessionName = b.SessionName and a.TermName = b.TermName INNER JOIN dbo.TEMPSubject c ON a.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND b.PortalNumber = '" & portalnumber & "' AND b.SubjectShortName = '" & subjectShortName & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND a.AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPStudentSubject b ON a.PortalNumber = b.PortalNumber AND a.SessionName = b.SessionName and a.TermName = b.TermName INNER JOIN dbo.TEMPSubject c ON a.SubjectShortName = c.ShortName INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND b.PortalNumber = '" & portalnumber & "' AND b.SubjectShortName = '" & subjectShortName & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND a.AssessmentType = 'After Mid-Term' ")
                End Select
            Case Else           'creche
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND a.PortalNumber = '" & portalnumber & "' AND a.SessionName = '" & sessionName & "' AND a.TermName = '" & termName & "' AND a.AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectScore = GetTableRows(" SELECT PersonalAggregateSubjectScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPCustomers d ON a.PortalNumber = d.CustomerCode WHERE d.DistrictCode = '" & className & "' AND a.SubjectShortName = '" & subjectShortName & "' AND a.PortalNumber = '" & portalnumber & "' AND a.SessionName = '" & sessionName & "' AND a.TermName = '" & termName & "' AND a.AssessmentType = 'After Mid-Term' ")
                End Select
        End Select

        Select Case rowsSubjectScore.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsSubjectScore(0).Item(0), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentTermTotalScore(ByVal portalnumber As String, ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String) As Double
        Dim ret As Double
        Dim rowsSubjectScore As DataRowCollection = Nothing

        rowsSubjectScore = GetTableRows(" SELECT IsNull(PersonalAggregateSubjectScore, 0) FROM dbo.VW_ACADEMICS_Student_Term_Totals WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND PortalNumber = '" & portalnumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Term Total' ")

        Select Case rowsSubjectScore.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsSubjectScore(0).Item(0), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentsPersonalTermTotalAverage(ByVal portalnumber As String, ByVal className As String, ByVal sessionName As String, ByVal termName As String) As Double
        Dim ret As Double
        Dim rowsSubjectScore As DataRowCollection = Nothing

        rowsSubjectScore = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) as AverageScore FROM dbo.VW_ACADEMICS_Student_Term_Totals WHERE ClassName = '" & className & "' AND PortalNumber = '" & portalnumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Term Total' ")

        Select Case rowsSubjectScore.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsSubjectScore(0).Item(0), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetClassSubjectAverage(ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String, ByVal assessmentType As String) As Double
        Dim ret As Double
        Dim rowsSubjectClassAverage As DataRowCollection = Nothing

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' ")
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' ")
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' ")
                End Select
            Case Else           'creche
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' ")
                    Case "TEST2"
                        rowsSubjectClassAverage = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) AS ClassSubjectAverage FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' ")
                End Select
        End Select

        Select Case rowsSubjectClassAverage.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsSubjectClassAverage(0).Item(0), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetClassTermTotalSubjectAverage(ByVal className As String, ByVal subjectShortName As String, ByVal sessionName As String, ByVal termName As String) As Double
        Dim ret As Double
        Dim rowsSubjectScore As DataRowCollection = Nothing

        rowsSubjectScore = GetTableRows(" SELECT IsNull(AVG(PersonalAggregateSubjectScore), 0) as AverageScore FROM dbo.VW_ACADEMICS_Student_Term_Totals WHERE ClassName = '" & className & "' AND SubjectShortName = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Term Total' ")

        Select Case rowsSubjectScore.Count
            Case 0
                ret = 0.0
            Case Else
                ret = CType(rowsSubjectScore(0).Item(0), Double)
        End Select

        Return ret
    End Function
    Public Shared Function GetGradeSchool2(ByVal score As Double, ByVal className As String) As String
        Dim ret As String = ""

        Select Case GetProgramme(className).ToUpper
            Case "CRE"
                ret = GetGrade_CRE(score)
            Case "NUR"
                ret = GetGrade_NUR(score)
            Case "PRI"
                ret = GetGrade_PRI(score)
            Case "SEC"
                ret = GetGrade_SEC(score)
        End Select

        Return ret
    End Function
    Private Shared Function GetGrade_SEC(ByVal score As Double) As String
        Dim ret As String = ""

        Select Case Math.Ceiling(score)
            Case 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100
                ret = "A*,Excellent"
            Case 85, 86, 87, 88, 89
                ret = "A,Very Good"
            Case 80, 81, 82, 83, 84
                ret = "B+,Good"
            Case 75, 76, 77, 78, 79
                ret = "B,Good"
            Case 70, 71, 72, 73, 74
                ret = "C+,Satisfactory"
            Case 65, 66, 67, 68, 69
                ret = "C,Satisfactory"
            Case 60, 61, 62, 63, 64
                ret = "D,Unsatisfactory"
            Case 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
                ret = "E,Unsatisfactory"
            Case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
                ret = "F,Poor"
        End Select

        Return ret
    End Function
    Private Shared Function GetGrade_PRI(ByVal score As Double) As String
        Dim ret As String = ""

        Select Case Math.Ceiling(score)
            Case 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100
                ret = "A+"
            Case 80, 81, 82, 83, 84, 85, 86, 87, 88, 89
                ret = "A"
            Case 70, 71, 72, 73, 74, 75, 76, 77, 78, 79
                ret = "B"
            Case 60, 61, 62, 63, 64, 65, 66, 67, 68, 69
                ret = "C"
            Case 50, 51, 52, 53, 54, 55, 56, 57, 58, 59
                ret = "D"
            Case 40, 41, 42, 43, 44, 45, 46, 47, 48, 49
                ret = "E"
            Case 30, 31, 32, 33, 34, 35, 36, 37, 38, 39
                ret = "F"
            Case 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29
                ret = "G"
        End Select

        Return ret
    End Function
    Private Shared Function GetGrade_CRE(ByVal score As Double) As String
        Dim ret As String = ""

        Select Case Math.Ceiling(score)
            Case 3
                ret = "Proficient"
            Case 2
                ret = "Developing"
            Case 1
                ret = "Beginning"
            Case Else
                ret = "Not assessed at this time"
        End Select

        Return ret
    End Function
    Private Shared Function GetGrade_NUR(ByVal score As Double) As String
        Dim ret As String = ""

        Select Case Math.Ceiling(score)
            Case 1
                ret = "Excellent"
            Case 2
                ret = "Very Good"
            Case 3
                ret = "Good"
            Case 4
                ret = "Average"
            Case 5
                ret = "Below Average"
        End Select

        Return ret
    End Function
    Public Shared Function GetReportCardSignature(ByVal className As String) As String
        Dim ret As String
        Dim teacherInCharge As String

        Dim rowsTeacherInCharge As DataRowCollection = GetTableRows(" SELECT Teacher FROM dbo.TEMPClass WHERE ClassName = '" & className & "' ")

        Select Case rowsTeacherInCharge.Count
            Case 0
                teacherInCharge = ""
            Case Else
                teacherInCharge = rowsTeacherInCharge(0).Item(0).ToString
        End Select

        Select Case teacherInCharge
            Case ""
                ret = ""
            Case Else
                ret = "<img border='1' src='/images/_sign/" & teacherInCharge & ".jpg' height='50' width='100' ></img>"
        End Select

        Return ret
    End Function
    Public Shared Function GetRespectiveSchoolHeadSignature(ByVal className As String) As String
        Dim ret As String
        Dim respectiveSchool As String, respectiveHeadOfSchool As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"
                respectiveSchool = "SEC"
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"
                respectiveSchool = "PRI"
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"
                respectiveSchool = "NUR"
            Case Else
                respectiveSchool = "CRE"
        End Select


        Dim rowsRespectiveHeadOfSchool As DataRowCollection = GetTableRows(" SELECT Teacher FROM dbo.TEMPProgramme WHERE ProgrammeName = '" & respectiveSchool & "' ")

        Select Case rowsRespectiveHeadOfSchool.Count
            Case 0
                respectiveHeadOfSchool = ""
            Case Else
                respectiveHeadOfSchool = rowsRespectiveHeadOfSchool(0).Item(0).ToString
        End Select

        Select Case respectiveHeadOfSchool
            Case ""
                ret = ""
            Case Else
                ret = "<img border='1' src='/images/_sign/" & respectiveHeadOfSchool & ".jpg' height='50' width='100' ></img>"
        End Select

        Return ret
    End Function
    Public Shared Function GetSchoolsHeadSignature() As String
        Dim ret As String
        Dim HeadOfSchools As String

        Dim rowsRespectiveHeadOfSchool As DataRowCollection = GetTableRows(" SELECT SettingValue FROM dbo.Core_Setting WHERE SettingTitle = 'Who is the Principal?' ")

        Select Case rowsRespectiveHeadOfSchool.Count
            Case 0
                HeadOfSchools = ""
            Case Else
                HeadOfSchools = rowsRespectiveHeadOfSchool(0).Item(0).ToString
        End Select

        Select Case HeadOfSchools
            Case ""
                ret = ""
            Case Else
                ret = "<img border='1' src='/images/_sign/" & HeadOfSchools & ".jpg' height='50' width='100' ></img>"
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentResultsPage(ByVal className As String, ByVal termName As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_sec_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_sec_CA3.aspx"
                Else
                    ret = "~/modules/data/print_student_result_sec_CA5.aspx"
                End If
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_primary_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_primary_CA3.aspx"
                Else
                    ret = "~/modules/data/print_student_result_primary_CA5.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_nursery_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_nursery_CA3.aspx"
                Else
                    ret = "~/modules/data/print_student_result_nursery_CA5.aspx"
                End If
            Case Else
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_prenursery_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_prenursery_CA3.aspx"
                Else
                    ret = "~/modules/data/print_student_result_prenursery_CA5.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentResultsPage2(ByVal className As String, ByVal termName As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_sec_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_sec_CA4.aspx"
                Else
                    ret = "~/modules/data/print_student_result_sec_CA6.aspx"
                End If
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_primary_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_primary_CA4.aspx"
                Else
                    ret = "~/modules/data/print_student_result_primary_CA6.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_nursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_nursery_CA4.aspx"
                Else
                    ret = "~/modules/data/print_student_result_nursery_CA6.aspx"
                End If
            Case Else
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_result_prenursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_result_prenursery_CA4.aspx"
                Else
                    ret = "~/modules/data/print_student_result_prenursery_CA6.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentResultsPage3(ByVal className As String, ByVal termName As String) As String
        Dim ret As String = ""

        Select Case className.ToUpper
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_beh_report_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_beh_report_CA4.aspx"
                Else
                    ret = "~/modules/data/print_student_beh_report_CA6.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED", "PRE-NURSERY", "PLAYGROUP"     'nursery
                If termName = "1st Term" Then
                    ret = "~/modules/data/print_student_skillsreport_nursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/print_student_skillsreport_nursery_CA4.aspx"
                Else
                    ret = "~/modules/data/print_student_skillsreport_nursery_CA6.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentResultsApprovalPage(ByVal className As String, ByVal termName As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_sec_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_sec_CA3.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_sec_CA5.aspx"
                End If
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_primary_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_primary_CA3.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_primary_CA5.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_nursery_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_nursery_CA3.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_nursery_CA5.aspx"
                End If
            Case Else
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_prenursery_CA1.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_prenursery_CA3.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_prenursery_CA5.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentResultsApprovalPage2(ByVal className As String, ByVal termName As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_sec_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_sec_CA4.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_sec_CA6.aspx"
                End If
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_primary_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_primary_CA4.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_primary_CA6.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_nursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_nursery_CA4.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_nursery_CA6.aspx"
                End If
            Case Else
                If termName = "1st Term" Then
                    ret = "~/modules/data/approve_student_result_prenursery_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/approve_student_result_prenursery_CA4.aspx"
                Else
                    ret = "~/modules/data/approve_student_result_prenursery_CA6.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetStudentResultsApprovalPage3(ByVal className As String, ByVal termName As String) As String
        Dim ret As String = ""

        Select Case className.ToUpper
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                If termName = "1st Term" Then
                    ret = "~/modules/data/manage_student_scores_primaryskills_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/manage_student_scores_primaryskills_CA4.aspx"
                Else
                    ret = "~/modules/data/manage_student_scores_primaryskills_CA6.aspx"
                End If
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED", "PRE-NURSERY", "PLAYGROUP"     'nursery
                If termName = "1st Term" Then
                    ret = "~/modules/data/manage_student_scores_nurseryskills_CA2.aspx"
                ElseIf termName = "2nd Term" Then
                    ret = "~/modules/data/manage_student_scores_nurseryskills_CA4.aspx"
                Else
                    ret = "~/modules/data/manage_student_scores_nurseryskills_CA6.aspx"
                End If
        End Select

        Return ret
    End Function
    Public Shared Function GetSchoolChamp(ByVal sessionName As String, ByVal termName As String) As String
        Dim ret As String

        Dim rowsSchoolChamp As DataRowCollection = GetTableRows(" Select TOP 1 PortalNumber, AVG(PersonalAggregateSubjectScore) from dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN TEMPSubject b ON a.SubjectShortName = b.ShortName INNER JOIN dbo.TEMPCustomers c ON a.PortalNumber = c.CustomerCode where SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND ClassName IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = 'SEC') group by PortalNumber order by AVG(PersonalAggregateSubjectScore) DESC ")

        If rowsSchoolChamp.Count > 0 Then
            ret = rowsSchoolChamp(0).Item(0).ToString
        Else
            ret = CONST_ACADEMICS_DUMMY_SCHOOL_CHAMP
        End If

        Return ret
    End Function
    Public Shared Function GetClassChamp(ByVal sessionName As String, ByVal termName As String, ByVal className As String) As String
        Dim ret As String, classNameStripped As String

        'correct the ClassName variable
        classNameStripped = className.Replace(" Red", "").Replace(" Blue", "")
        If className.Contains(" Red") Or className.Contains(" Blue") Then
            className = "'" & classNameStripped & " Red', '" & classNameStripped & " Blue'"
        Else
            className = "'" & className & "'"
        End If

        Dim rowsSchoolChamp As DataRowCollection = GetTableRows(" Select TOP 1 PortalNumber, AVG(PersonalAggregateSubjectScore) from dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN dbo.TEMPCustomers c ON a.PortalNumber = c.CustomerCode where SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND ClassName IN (" & className & ") group by PortalNumber order by AVG(PersonalAggregateSubjectScore) DESC ")

        If rowsSchoolChamp.Count > 0 Then
            ret = rowsSchoolChamp(0).Item(0).ToString
        Else
            ret = CONST_ACADEMICS_DUMMY_SCHOOL_CHAMP
        End If

        Return ret
    End Function
    Public Shared Function GetCurrentCumulativeAverage(ByVal portalNumber As String, ByVal sessionName As String, ByVal termName As String) As Double
        Dim ret As String

        Dim rowsCurrentAverage As DataRowCollection = GetTableRows(" Select AVG(PersonalAggregateSubjectScore) from dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN TEMPSubject b ON a.SubjectShortName = b.ShortName INNER JOIN dbo.TEMPCustomers c ON a.PortalNumber = c.CustomerCode where PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' group by PortalNumber order by AVG(PersonalAggregateSubjectScore) DESC ")

        If rowsCurrentAverage.Count > 0 Then
            ret = CType(rowsCurrentAverage(0).Item(0), Double)
        Else
            ret = 0
        End If

        Return ret
    End Function
    Public Shared Function GetLocalOrForeign(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "L"
                ret = "Local"
            Case "F"
                ret = "Foreign"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetConfirmationStatus(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "C"
                ret = "Confirmed"
            Case "P"
                ret = "Probation"
            Case "U"
                ret = "Unconfirmed"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetFullMaritalStatus(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "D"
                ret = "Divorced"
            Case "M"
                ret = "Married"
            Case "S"
                ret = "Single"
            Case "W"
                ret = "Widowed"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetFullCareerMovementType(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "N"
                ret = "Neutral (Horizontal Movement)"
            Case "D"
                ret = "Demotion"
            Case "P"
                ret = "Promotion"
            Case "S"
                ret = "Suspension"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetLocationAbbreviation(ByVal locationId As Int32) As String
        Dim ret As String

        Dim rows As DataRowCollection
        rows = GetTableRows("SELECT Remark FROM dbo.HR_Location WHERE LocationId = " & locationId & "")

        ret = rows(0).Item(0).ToString

        Return ret
    End Function
    Public Shared Function GetDepartmentAbbreviation(ByVal departmentCode As String) As String
        Dim ret As String

        Dim rows As DataRowCollection
        rows = GetTableRows("SELECT Code FROM dbo.Core_Department_Ext a INNER JOIN dbo.Core_Department b ON a.DepartmentId = b.DepartmentId WHERE left(DepartmentName, charindex('.', DepartmentName) - 1) = '" & departmentCode & "'")

        ret = rows(0).Item(0).ToString

        Return ret
    End Function
    Public Shared Function GetMaxStaffId() As Int32
        Dim ret As String

        Dim rows As DataRowCollection
        rows = GetTableRows("SELECT Max(StaffId) FROM dbo.HR_Staff_Base")

        ret = CType(rows(0).Item(0), Int32)

        Return ret
    End Function
    Public Shared Function GetLastPayrollMonth() As Int32
        Dim ret As String

        Dim rows As DataRowCollection
        rows = GetTableRows("SELECT TOP 1 EffectiveMonth FROM dbo.HR_PAYROLL_PayrollProcessingStatus WHERE CurrentStatus = 'C' ORDER BY EntryDate DESC")

        ret = CType(rows(0).Item(0), Int32)

        Return ret
    End Function
    Public Shared Function GetLastPayrollYear() As Int32
        Dim ret As String

        Dim rows As DataRowCollection
        rows = GetTableRows("SELECT TOP 1 EffectiveYear FROM dbo.HR_PAYROLL_PayrollProcessingStatus WHERE CurrentStatus = 'C' ORDER BY EntryDate DESC")

        ret = CType(rows(0).Item(0), Int32)

        Return ret
    End Function
    Public Shared Function GetRecentActivity(ByVal portalNumber As String) As Collection
        Dim ret As New Collection
        Dim rowsBirthdays As DataRowCollection
        Dim rowsStaffBirthdays As DataRowCollection = GetTableRows(" SELECT * FROM dbo.Core_User a INNER JOIN dbo.Core_Department b ON a.DepartmentId = b.DepartmentId WHERE MONTH(DateOfBirth) = MONTH(GETDATE()) ORDER BY DAY(DateOfBirth) DESC ")

        Select Case IsNumeric(portalNumber)
            Case True
                rowsBirthdays = GetTableRows("SELECT * FROM dbo.TEMPCustomers WHERE MONTH(MeterDate) = MONTH(GETDATE()) AND DistrictCode = (SELECT DistrictCode FROM dbo.TEMPCustomers WHERE CustomerCode = '" & portalNumber & "') ORDER BY DAY(MeterDate) DESC")
            Case Else
                rowsBirthdays = GetTableRows("SELECT * FROM dbo.TEMPCustomers WHERE MONTH(MeterDate) = MONTH(GETDATE()) ORDER BY DAY(MeterDate) DESC")
        End Select

        'add Student Birthdays
        If rowsBirthdays.Count = 0 Then
            ret.Add("Birthday|Student|No classmate birthdays this month.")
        Else
            For i As Int32 = 0 To rowsBirthdays.Count - 1
                'ret.Add("Birthdays|Student|" & rowsBirthdays(i).Item("CustomerName").ToString & " (" & rowsBirthdays(i).Item("DistrictCode").ToString & ") - " & GetSpecialDateFormatShort(CType(rowsBirthdays(i).Item("MeterDate"), Date)))
                ret.Add("Birthday|Student|<a href=" & Chr(34) & "javascript:window.open('modules/data/photo_zoom.aspx?a=" & rowsBirthdays(i).Item("CustomerCode").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" & Chr(34) & " title='Click to view a Passport-sized Photograph...'><b>" & rowsBirthdays(i).Item("CustomerName").ToString & "</b></a> - " & GetSpecialDateFormatShort(CType(rowsBirthdays(i).Item("MeterDate"), Date)))
            Next
        End If
        'add Staff Birthdays
        If rowsStaffBirthdays.Count = 0 Then
            ret.Add("Birthday|Staff|No staff birthdays this month.")
        Else
            For i As Int32 = 0 To rowsStaffBirthdays.Count - 1
                ret.Add("Birthday|Staff|<a href=" & Chr(34) & "javascript:window.open('modules/hrm/hr/photo_zoom.aspx?a=" & rowsStaffBirthdays(i).Item("Username").ToString & "','Enlarge Passport Photograph', 'status,menubar,height=300,width=300');" & Chr(34) & " title='Click to view a Passport-sized Photograph...'><b>" & rowsStaffBirthdays(i).Item("FirstName").ToString & " " & rowsStaffBirthdays(i).Item("MiddleName").ToString & " " & rowsStaffBirthdays(i).Item("Surname").ToString & "</b></a> (Staff) - " & GetSpecialDateFormatShort(CType(rowsStaffBirthdays(i).Item("DateOfBirth"), Date)))
            Next
        End If
        Return ret
    End Function
    Public Shared Function GetRecentPostsFromLiteratureEncore() As Collection
        Dim ret As New Collection
        Dim rowsLiteratureEncorePosts As DataRowCollection = ReadRssFeedFromLiteratureEncore()

        'add posts
        If rowsLiteratureEncorePosts Is Nothing Then
            ret.Add("Blog|LiteratureEncore|No blog articles found at Literature Encore.")
        Else
            For i As Int32 = 0 To (rowsLiteratureEncorePosts.Count - (rowsLiteratureEncorePosts.Count - 5)) - 1
                ret.Add("Blog|LiteratureEncore|<a href='" & rowsLiteratureEncorePosts(i).Item(10).ToString & "' title='Click to read this full article on the Literature Encore Blog...'><b>" & rowsLiteratureEncorePosts(i).Item(0).ToString & "</b></a>")
            Next
        End If
        Return ret
    End Function
    Public Shared Function GetRecentPostsFromKhanAcademy() As Collection
        Dim ret As New Collection
        Dim rowsKhanAcademyPosts As DataRowCollection = ReadRssFeedFromKhanAcademy()

        'add posts
        If rowsKhanAcademyPosts Is Nothing Then
            ret.Add("Blog|KhanAcademy|No blog articles found at Khan Academy.")
        Else
            For i As Int32 = 0 To (rowsKhanAcademyPosts.Count - (rowsKhanAcademyPosts.Count - 5)) - 1
                ret.Add("Blog|KhanAcademy|<a href='" & rowsKhanAcademyPosts(i).Item(5).ToString & "' title='Click to read this full article on the Khan Academy Blog...'><b>" & rowsKhanAcademyPosts(i).Item(0).ToString & "</b></a>")
            Next
        End If
        Return ret
    End Function
    Public Shared Function ReadRssFeedFromLiteratureEncore() As DataRowCollection
        Dim ret As DataRowCollection
        Dim ds As New DataSet

        Dim oXml As System.Xml.XmlTextReader = New System.Xml.XmlTextReader(CONST_LITERATUREENCORE_FEED_URL)
        oXml.WhitespaceHandling = System.Xml.WhitespaceHandling.None
        Dim oBuilder As System.Text.StringBuilder = New StringBuilder

        Try
            Dim fContinue As Boolean = oXml.Read
            While fContinue
                Dim sName As String = oXml.Name.Replace(":", "_")
                If oXml.NodeType = System.Xml.XmlNodeType.Element Then
                    'add the element...
                    oBuilder.Append("<" & sName)
                    If oXml.HasAttributes Then
                        While oXml.MoveToNextAttribute
                            Dim attributeName As String = oXml.Name.Replace(":", "_")
                            oBuilder.AppendFormat(" " & attributeName & "=" & Chr(34) & oXml.Value & Chr(34))
                        End While
                    End If
                    If sName = "xhtml_meta" Or sName = "atom10_link" Or sName = "feedburner_info" Then
                        oBuilder.Append("></" & sName & ">")
                    Else
                        oBuilder.Append(">")
                    End If
                ElseIf oXml.NodeType = System.Xml.XmlNodeType.Text Then
                    oBuilder.Append(System.Web.HttpUtility.HtmlEncode(oXml.Value))
                ElseIf oXml.NodeType = System.Xml.XmlNodeType.EndElement Then
                    oBuilder.Append("</" & sName & ">")
                End If
                fContinue = oXml.Read
            End While
            oXml.Close()

            Dim sXmlResult As String = oBuilder.ToString

            ds = New DataSet
            Dim oStringReader As System.IO.StringReader = New System.IO.StringReader(sXmlResult)
            ds.ReadXml(oStringReader, XmlReadMode.Auto)

            If Not oStringReader Is Nothing Then
                oStringReader.Close()
            End If
            If Not oXml Is Nothing Then
                oXml.Close()
            End If

            ret = ds.Tables(5).Rows

            Return ret
        Catch ex As Exception
            Return Nothing
        End Try
    End Function
    Public Shared Function ReadRssFeedFromKhanAcademy() As DataRowCollection
        Dim ret As DataRowCollection
        Dim ds As New DataSet

        Dim oXml As System.Xml.XmlTextReader = New System.Xml.XmlTextReader(CONST_KHANACADEMY_FEED_URL)
        oXml.WhitespaceHandling = System.Xml.WhitespaceHandling.None
        Dim oBuilder As System.Text.StringBuilder = New StringBuilder

        Try
            Dim fContinue As Boolean = oXml.Read
            Dim descriptionCount As Int32 = 0
            While fContinue
                Dim sName As String = oXml.Name.Replace(":", "_")
                If oXml.NodeType = System.Xml.XmlNodeType.Element Then
                    'add the element...
                    oBuilder.Append("<" & sName)
                    If oXml.HasAttributes Then
                        While oXml.MoveToNextAttribute
                            Dim attributeName As String = oXml.Name.Replace(":", "_")
                            oBuilder.AppendFormat(" " & attributeName & "=" & Chr(34) & oXml.Value & Chr(34))
                        End While
                    End If
                    If (sName = "description" And descriptionCount = 0) Then
                        oBuilder.Append("></" & sName & ">")
                        descriptionCount += 1
                    ElseIf sName = "atom10_link" Or sName = "feedburner_info" Then
                        oBuilder.Append("></" & sName & ">")
                    Else
                        oBuilder.Append(">")
                    End If
                ElseIf oXml.NodeType = System.Xml.XmlNodeType.Text Then
                    oBuilder.Append(System.Web.HttpUtility.HtmlEncode(oXml.Value))
                ElseIf oXml.NodeType = System.Xml.XmlNodeType.EndElement Then
                    oBuilder.Append("</" & sName & ">")
                End If
                fContinue = oXml.Read
            End While
            oXml.Close()

            Dim sXmlResult As String = oBuilder.ToString

            ds = New DataSet
            Dim oStringReader As System.IO.StringReader = New System.IO.StringReader(sXmlResult)
            ds.ReadXml(oStringReader, XmlReadMode.Auto)

            If Not oStringReader Is Nothing Then
                oStringReader.Close()
            End If
            If Not oXml Is Nothing Then
                oXml.Close()
            End If

            ret = ds.Tables(5).Rows

            Return ret
        Catch ex As Exception
            Return Nothing
        End Try
    End Function
    Public Shared Function GetRecentActivityBackgroundColor(ByVal activityIdentifier As String) As String
        Dim ret As String

        Select Case activityIdentifier.ToUpper
            Case "BIRTHDAYSTUDENT"
                ret = "#FFB3B3"
            Case "BLOGLITERATUREENCORE", "BLOGKHANACADEMY"
                ret = "#FF9672"
            Case "BIRTHDAYSTAFF"
                ret = "#CCCC00"
            Case Else
                ret = "#FFFFFF"
        End Select

        Return ret
    End Function
    Public Shared Function GetClassPosition(ByVal personalAverage As Double, ByVal className As String, ByVal sessionName As String, ByVal termName As String, ByVal assessmentType As String) As Int32
        Dim ret As Double
        Dim rowsClassPosition As DataRowCollection = Nothing

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                    Case "TEST2"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                End Select
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                    Case "TEST2"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                End Select
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                    Case "TEST2"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                End Select
            Case Else           'creche
                '
                Select Case assessmentType.ToUpper
                    Case "TEST"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Before Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                    Case "TEST2"
                        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'After Mid-Term' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")
                End Select
        End Select

        ret = rowsClassPosition.Count

        Return ret
    End Function
    Public Shared Function GetClassTermTotalPosition(ByVal personalAverage As Double, ByVal className As String, ByVal sessionName As String, ByVal termName As String) As Int32
        Dim ret As Double
        Dim rowsClassPosition As DataRowCollection = Nothing

        rowsClassPosition = GetTableRows(" SELECT PortalNumber, AVG(PersonalAggregateSubjectScore) as AverageScore FROM dbo.VW_ACADEMICS_Student_Term_Totals WHERE ClassName = '" & className & "' AND SessionName = '" & sessionName & "' AND TermName = '" & termName & "' AND AssessmentType = 'Term Total' GROUP BY PortalNumber HAVING AVG(PersonalAggregateSubjectScore) >= " & personalAverage & " ORDER BY AverageScore DESC ")

        ret = rowsClassPosition.Count

        Return ret
    End Function
    Public Shared Function ConvertDateTimeToLongString(ByVal _date As DateTime) As String
        Dim ret As String = ""

        ret = PadNumber(_date.Year.ToString, 4)
        ret &= PadNumber(_date.Month.ToString, 2)
        ret &= PadNumber(_date.Day.ToString, 2)
        ret &= PadNumber(_date.Hour.ToString, 2)
        ret &= PadNumber(_date.Minute.ToString, 2)
        ret &= PadNumber(_date.Second.ToString, 2)
        ret &= PadNumber(_date.Millisecond.ToString, 5)

        Return _date.ToString
    End Function
    Public Shared Function FormatScore(ByVal score As Int32, ByVal className As String) As String
        Dim ret As String

        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                ret = score.ToString
            Case "YEAR 1", "YEAR 2", "YEAR 3", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
                ret = score.ToString
            Case "NURSERY 1", "NURSERY 2", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                ret = score.ToString
            Case Else           'creche
                Select Case score.ToString
                    Case "0"
                        ret = "NA"
                    Case Else
                        ret = score.ToString
                End Select
        End Select

        Return ret
    End Function
    Public Shared Function GetRecentMessagesFromManagement(ByVal remoteSMSHistory As String) As DataRowCollection
        Dim ret As New DataTable
        
        If remoteSMSHistory = "Request Timeout" Then
            Return ret.Rows
        Else

            Dim dtLocal As New DataTable, dtRemote As New DataTable, dtMerged As New DataTable, dtfinal As New DataTable

            Dim rowsSMSFromLocalDB As DataRowCollection = GetTableRows(" SELECT CONVERT(VARCHAR, CONVERT(int, [TimeStamp])) as id, IsNull(BatchMessageText, '') as [Message], IsNull(BatchSenderAlias, '') as Sender, " & CONST_BULKSMS_INFOBIP_PRICE_PER_UNIT.ToString & " as Price, COUNT(*) AS [Count], IsNull((LEN(BatchMessageText)/" & CONST_BULKSMS_CHARACTERS_PER_PAGE.ToString & ") + 1, 0) AS Pages, [TimeStamp] as Creation_Date FROM dbo.BulkSMS_MessageHistory WHERE Gateway = 'INFOBIP.CHILDVILLE' AND BatchMessageText LIKE '%parent%' GROUP BY [TimeStamp], BatchMessageText, BatchSenderAlias ORDER BY [TimeStamp] DESC ")
            Dim rowsSMSFromRemoteGateway As DataRowCollection = DeserializeJsonToDataTable(remoteSMSHistory).Rows

            If rowsSMSFromLocalDB.Count > 0 Then
                dtLocal = rowsSMSFromLocalDB(0).Table
            End If

            If rowsSMSFromRemoteGateway.Count > 0 Then
                dtRemote = rowsSMSFromRemoteGateway(0).Table
            End If

            'loop through Source Table 1 (Local) and copy out rows into Target Table
            dtMerged = dtRemote.Clone
            For Each row As System.Data.DataRow In dtLocal.Rows
                dtMerged.ImportRow(row)
            Next
            'loop through Source Table 2 (Remote) and copy out rows into Target Table
            For Each row As System.Data.DataRow In dtRemote.Rows
                dtMerged.ImportRow(row)
            Next
            'discard the two Source Tables
            dtLocal = Nothing
            dtRemote = Nothing
            'sort and filter for Parent-related information...
            Dim view As System.Data.DataView = dtMerged.DefaultView
            view.Sort = "Creation_Date DESC"
            view.RowFilter = "Message LIKE '%parent%'"
            dtMerged = view.ToTable
            'pick out only the top 3 rows
            dtfinal = dtMerged.Clone
            For Each row As System.Data.DataRow In dtMerged.Rows
                dtfinal.ImportRow(row)
                If dtfinal.Rows.Count = 3 Then
                    Exit For
                End If
            Next
            view = dtfinal.DefaultView
            view.Sort = "Creation_Date DESC"
            view.RowFilter = "Message LIKE '%parent%'"

            ret = view.ToTable
            Return ret.Rows
        End If
    End Function
    Public Shared Function CleanupPhoneNumber(ByVal rawPhoneNumber As String) As String
        Dim ret As String = ""

        If rawPhoneNumber.Length = 0 Then
            'do nothing
        ElseIf Left(rawPhoneNumber, 3) = "234" Then
            'do nothing
        ElseIf Left(rawPhoneNumber, 1) = "0" Then
            ret = "234" & Right(rawPhoneNumber, rawPhoneNumber.Length - 1)
        ElseIf rawPhoneNumber.Length <> 0 And Left(rawPhoneNumber, 1) <> "2" And Left(rawPhoneNumber, 1) <> "0" Then
            ret = "234" & rawPhoneNumber
        End If

        Return ret
    End Function
    Public Shared Function GetInventoryItemCondition(ByVal abbrev As String) As String
        Dim ret As String

        Select Case abbrev.ToUpper
            Case "N"
                ret = "New"
            Case "F"
                ret = "Fairly Used"
            Case "H"
                ret = "Heavily Used"
            Case "S"
                ret = "Scrap"
            Case Else
                ret = "Unknown"
        End Select

        Return ret
    End Function
    Public Shared Function GetStaffDesignations(ByVal username As String) As String
        Dim ret As String
        Dim rowsStaffDetails As System.Data.DataRowCollection = Common.GetTableRows(" SELECT * FROM dbo.HR_Staff_Base WHERE StaffCode = '" & username & "' ")

        Select Case rowsStaffDetails.Count
            Case 0
                ret = ""
            Case 1
                ret = rowsStaffDetails(0).Item("RoleName").ToString
            Case Else
                ret = ""
                For i As Int32 = 0 To rowsStaffDetails.Count - 1
                    ret &= rowsStaffDetails(i).Item("RoleName").ToString & ", "
                Next
                ret = Left(ret, Len(ret) - 2)
        End Select

        Return ret
    End Function
    'Public Shared Function ShowLineBreaksInTextOnWeb(ByVal _text As String) As String
    '    'Dim ret As String = CType(ConvertDBNulltoNothing(_text), String)
    '    Dim ret As String = _text

    '    'ret = ret.Replace(Chr(10) + Chr(13), "<br /><br />")
    '    ret = ret.Replace(Chr(13), "<br />")

    '    Return ret
    'End Function
    Public Shared Function ShowLineBreaksInTextOnWeb(ByVal _obj As Object) As String
        'Dim ret As String = CType(ConvertDBNulltoNothing(_text), String)
        Dim ret As String = ""

        If TypeOf (_obj) Is DBNull Then
            ret = ""
        Else
            'ret = ret.Replace(Chr(10) + Chr(13), "<br /><br />")
            ret = _obj.Replace(Chr(13), "<br />")
        End If

        Return ret
    End Function
    Public Shared Function PromoteAllStudents() As Int32
        Dim ret As Int32, previousBal As Double, lastPmt As Double, newClass As String
        Dim currentSession As String = GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        Dim previousSession As String = (CType(currentSession.Split("/")(0), Int32) - 1).ToString & "/" & (CType(currentSession.Split("/")(1), Int32) - 1).ToString

        'For each student enrolled for the previous session minus the exclusion list minus the ultimate class, copy a row into dbo.TEMPCustomers_0_Applied, change the belongtocode to the currentsession, and set the ActiveInactive to 'Accepted'
        Dim rowsStudentsToPromote As System.Data.DataRowCollection = GetTableRows(" SELECT EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, State, PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, Password, Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, Notes, SyncStatus FROM dbo.TEMPCustomers_0_Applied WHERE belongtocode = '" & previousSession & "' AND ActiveInactive = 'Accepted' AND CustomerCode NOT IN (SELECT PortalNumber FROM dbo.TEMPPromotionExclusion WHERE SessionName = '" & previousSession & "') AND DistrictCode NOT IN (SELECT ClassName FROM dbo.TEMPClass WHERE ListingOrder = (SELECT MAX(ListingOrder) FROM dbo.TEMPClass)) ")
        For Each studentRow As DataRow In rowsStudentsToPromote
            If IsDBNull(studentRow.Item("PreviousBal")) Then previousBal = 0 Else previousBal = studentRow.Item("PreviousBal")
            If IsDBNull(studentRow.Item("LastPmt")) Then lastPmt = 0 Else lastPmt = studentRow.Item("LastPmt")
            newClass = GetTableRows(" SELECT Remark2 FROM dbo.TEMPClass WHERE ClassName = '" & studentRow.Item("DistrictCode") & "' ")(0).Item(0).ToString

            Dim sqlInsert As String = ""
            sqlInsert = " INSERT INTO dbo.TEMPCustomers_0_Applied (EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, State, PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, Password, Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, SyncStatus) "
            'sqlInsert &= "                                  VALUES('" & studentRow.Item("EntryDate") & "', '" & studentRow.Item("RefCode") & "', '" & currentSession & "', '" & newClass & "', '" & studentRow.Item("CustomerCode") & "', '" & studentRow.Item("CustomerCodeOld") & "', '" & studentRow.Item("Occupancy") & "', '" & studentRow.Item("Cycle") & "', '" & studentRow.Item("CustomerName") & "', '" & studentRow.Item("FirstName") & "', '" & studentRow.Item("LastName") & "', '" & studentRow.Item("BillingAddress") & "', '" & studentRow.Item("City") & "', '" & studentRow.Item("State") & "', '" & studentRow.Item("PostalCode") & "', '" & studentRow.Item("Country") & "', '" & studentRow.Item("MeterIdCode") & "', '" & studentRow.Item("ContactTitle") & "', '" & studentRow.Item("PhoneNumber") & "', '" & studentRow.Item("Extension") & "', '" & studentRow.Item("FaxNumber") & "', '" & studentRow.Item("EmailAddress") & "', '" & studentRow.Item("Password") & "', '" & studentRow.Item("Activated") & "', '" & studentRow.Item("CurrentBal") & "', " & previousBal & ", " & lastPmt & ", '" & studentRow.Item("LastDate") & "', '" & studentRow.Item("RA") & "', '" & studentRow.Item("MeterDate") & "', '" & "Accepted" & "', '" & studentRow.Item("SyncStatus") & "') "
            sqlInsert &= "                                  VALUES('" & studentRow.Item("EntryDate") & "', '" & studentRow.Item("RefCode").ToString.Replace("'", "-") & "', '" & currentSession & "', '" & newClass & "', '" & studentRow.Item("CustomerCode").ToString.Replace("'", "-") & "', '" & studentRow.Item("CustomerCodeOld").ToString.Replace("'", "-") & "', '" & studentRow.Item("Occupancy").ToString.Replace("'", "-") & "', '" & studentRow.Item("Cycle").ToString.Replace("'", "-") & "', '" & studentRow.Item("CustomerName").ToString.Replace("'", "-") & "', '" & studentRow.Item("FirstName").ToString.Replace("'", "-") & "', '" & studentRow.Item("LastName").ToString.Replace("'", "-") & "', '" & studentRow.Item("BillingAddress").ToString.Replace("'", "-") & "', '" & studentRow.Item("City").ToString.Replace("'", "-") & "', '" & studentRow.Item("State").ToString.Replace("'", "-") & "', '" & studentRow.Item("PostalCode").ToString.Replace("'", "-") & "', '" & studentRow.Item("Country").ToString.Replace("'", "-") & "', '" & studentRow.Item("MeterIdCode").ToString.Replace("'", "-") & "', '" & studentRow.Item("ContactTitle").ToString.Replace("'", "-") & "', '" & studentRow.Item("PhoneNumber").ToString.Replace("'", "-") & "', '" & studentRow.Item("Extension").ToString.Replace("'", "-") & "', '" & studentRow.Item("FaxNumber").ToString.Replace("'", "-") & "', '" & studentRow.Item("EmailAddress").ToString.Replace("'", "-") & "', '" & studentRow.Item("Password").ToString.Replace("'", "-") & "', '" & studentRow.Item("Activated").ToString.Replace("'", "-") & "', '" & studentRow.Item("CurrentBal").ToString.Replace("'", "-") & "', " & previousBal & ", " & lastPmt & ", '" & studentRow.Item("LastDate") & "', '" & studentRow.Item("RA").ToString.Replace("'", "-") & "', '" & studentRow.Item("MeterDate") & "', '" & "Accepted" & "', '" & studentRow.Item("SyncStatus").ToString.Replace("'", "-") & "') "

            ret += InsertTableRow(sqlInsert)
        Next

        Return ret
    End Function
    'JSON
    Public Shared Function DeserializeJsonToDataTable(ByVal jsonText As String) As DataTable
        Dim ret As DataTable

        ret = Newtonsoft.Json.JsonConvert.DeserializeObject(Of System.Data.DataTable)(jsonText)

        Return ret
    End Function
    Public Shared Function DeserializeJson(ByVal jsonText As String) As Object
        Dim ret As Object

        ret = Newtonsoft.Json.JsonConvert.DeserializeObject(jsonText)

        Return ret
    End Function
    Public Shared Function SerializeJson(ByVal json As Object) As String
        Dim ret As String

        ret = Newtonsoft.Json.JsonConvert.SerializeObject(json)

        Return ret
    End Function
    'PAYMENTS
    Public Shared Function LogPayment_CollegePay(ByVal logDetails As String) As String
        Dim ret As String = "", insertResponse As Int32

        'Dim sReader As New System.IO.StringReader(logDetails)
        'Dim doc As New System.Xml.XmlDocument
        Try
            'doc.Load(sReader)

            'Dim nRoot As System.Xml.XmlNode = doc.DocumentElement
            'Dim xNodeList As System.Xml.XmlNodeList = nRoot.SelectNodes("Payments/Payment")

            Dim productGroupCode As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/ProductGroupCode")  ' xNodeList.Item(i).ChildNodes(0).InnerXml
            Dim paymentLogId As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentLogId") ' xNodeList.Item(i).ChildNodes(1).InnerXml
            Dim customerReference As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustReference") ' xNodeList.Item(i).ChildNodes(2).InnerXml
            Dim alternateCustomerReference As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/AlternateCustReference") ' xNodeList.Item(i).ChildNodes(3).InnerXml
            Dim amount As Decimal = GetXMLSingleNodeValue(logDetails, "Payments/Payment/Amount") ' xNodeList.Item(i).ChildNodes(4).InnerXml
            Dim paymentStatus As Int32 = CType(GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentStatus"), Int32) ' xNodeList.Item(i).ChildNodes(5).InnerXml
            Dim paymentMethod As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentMethod") ' xNodeList.Item(i).ChildNodes(6).InnerXml
            Dim paymentReference As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentReference") ' xNodeList.Item(i).ChildNodes(7).InnerXml
            Dim terminalId As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/TerminalId") ' xNodeList.Item(i).ChildNodes(8).InnerXml
            Dim channelName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/ChannelName") ' xNodeList.Item(i).ChildNodes(9).InnerXml
            Dim location As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/Location") ' xNodeList.Item(i).ChildNodes(10).InnerXml
            Dim isReversal As Boolean = ConvertStringToBoolean(GetXMLSingleNodeValue(logDetails, "Payments/Payment/IsReversal")) ' ConvertStringToBoolean(xNodeList.Item(i).ChildNodes(11).InnerXml)
            Dim paymentDate As DateTime = CType(GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentDate"), Date) ' CDate(xNodeList.Item(i).ChildNodes(12).InnerXml)
            Dim settlementDate As DateTime = CType(GetXMLSingleNodeValue(logDetails, "Payments/Payment/SettlementDate"), Date) ' CDate(xNodeList.Item(i).ChildNodes(13).InnerXml)
            Dim institutionId As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/InstitutionId") ' xNodeList.Item(i).ChildNodes(14).InnerXml
            Dim institutionName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/InstitutionName") ' xNodeList.Item(i).ChildNodes(15).InnerXml
            Dim branchName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/BranchName") ' xNodeList.Item(i).ChildNodes(16).InnerXml
            Dim bankName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/BankName") ' xNodeList.Item(i).ChildNodes(17).InnerXml
            Dim feeName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/FeeName") ' xNodeList.Item(i).ChildNodes(18).InnerXml
            Dim customerName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustomerName") ' xNodeList.Item(i).ChildNodes(19).InnerXml
            Dim otherCustomerInfo As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/OtherCustomerInfo") ' xNodeList.Item(i).ChildNodes(20).InnerXml
            Dim receiptNumber As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/ReceiptNo") ' xNodeList.Item(i).ChildNodes(21).InnerXml
            Dim collectionsAccount As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/CollectionsAccount") ' xNodeList.Item(i).ChildNodes(22).InnerXml
            Dim thirdPartyCode As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/ThirdPartyCode") ' xNodeList.Item(i).ChildNodes(23).InnerXml
            Dim paymentItemName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentItems/PaymentItem/ItemName") ' xNodeList.Item(i).ChildNodes(24).ChildNodes(0).ChildNodes(0).InnerXml
            Dim paymentItemCode As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentItems/PaymentItem/ItemCode") ' xNodeList.Item(i).ChildNodes(24).ChildNodes(0).ChildNodes(1).InnerXml
            Dim paymentItemAmount As Decimal = CType(GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentItems/PaymentItem/ItemAmount"), Decimal) ' xNodeList.Item(i).ChildNodes(24).ChildNodes(0).ChildNodes(2).InnerXml
            Dim leadBankCode As String = "" 'GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustReference") ' xNodeList.Item(i).ChildNodes(24).ChildNodes(0).ChildNodes(3).InnerXml
            Dim leadBankCbnCode As String = ""  'GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustReference") ' xNodeList.Item(i).ChildNodes(24).ChildNodes(0).ChildNodes(4).InnerXml
            Dim leadbankName As String = "" ' GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustReference") ' xNodeList.Item(i).ChildNodes(24).ChildNodes(0).ChildNodes(5).InnerXml
            Dim bankCode As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/BankCode") ' xNodeList.Item(i).ChildNodes(25).InnerXml
            Dim customerAddress As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustomerAddress") ' xNodeList.Item(i).ChildNodes(26).InnerXml
            Dim customerTelephone As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/CustomerPhoneNumber") ' xNodeList.Item(i).ChildNodes(27).InnerXml
            Dim depositorName As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/DepositorName") ' xNodeList.Item(i).ChildNodes(28).InnerXml
            Dim depositorSlipNumber As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/DepositSlipNumber") ' xNodeList.Item(i).ChildNodes(29).InnerXml
            Dim paymentCurrency As String = GetXMLSingleNodeValue(logDetails, "Payments/Payment/PaymentCurrency") ' xNodeList.Item(i).ChildNodes(30).InnerXml

            Dim rowsOldRecord As System.Data.DataRowCollection = GetTableRows(" SELECT IsNull(CAST(PaymentLogId AS VARCHAR), '') + '@@|@@' + IsNull(CAST(PaymentLogReference AS VARCHAR), '') + '@@|@@' + IsNull(CAST(PaymentLogStatus AS VARCHAR), '') + '@@|@@' + IsNull(CAST(PaymentLogDate AS VARCHAR), '') + '@@|@@' + IsNull(CAST(PaymentReversalFlag AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWProductGroupCode AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentLogId AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWCustomerReference AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWAlternateCustomerReference AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWAmount AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentStatus AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentMethod AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentReference AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWTerminalId AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWChannelName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWLocation AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWIsReversal AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentDate AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWSettlementDate AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWInstitutionId AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWInstitutionName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWBranchName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWBankName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWFeeName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWCustomerName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWOtherCustomerInfo AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWReceiptNumber AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWCollectionsAccount AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWThirdPartyCode AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentItemName AS VARCHAR), '')  + '@@|@@' + IsNull(CAST(ISWPaymentItemCode AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentItemAmount AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWLeadBankCode AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWLeadBankCbnCode AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWLeadBankName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWBankCode AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWCustomerAddress AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWCustomerTelephone AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWDepositorName AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWDepositorSlipNumber AS VARCHAR), '') + '@@|@@' + IsNull(CAST(ISWPaymentCurrency AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark1 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark2 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark3 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark4 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark5 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark6 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark7 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark8 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark9 AS VARCHAR), '') + '@@|@@' + IsNull(CAST(Remark10 AS VARCHAR), '') AS OldRecord FROM dbo.PAYMENT_ISWCollegePayPaymentLog WHERE ISWPaymentLogId = '" & paymentLogId & "' ")
            Dim sqlSaveRecord As String

            'check for duplicates and reversals
            If rowsOldRecord.Count > 0 Then
                'check if this is a Reversal...
                If isReversal = True Then
                    Dim sqlInsertDisputeReversal As String
                    sqlInsertDisputeReversal = "       INSERT INTO dbo.PAYMENT_ISWCollegePayPaymentDispute(PaymentDisputeType, ISWPaymentLogId, OldPaymentLog) "
                    sqlInsertDisputeReversal &= "      VALUES('" & "Reversal" & "','" & paymentLogId & "','" & CType(rowsOldRecord(0).Item(0), String) & "')"
                    Call InsertTableRow(sqlInsertDisputeReversal)

                    Dim sqlUpdatePaymentLogWithReversalAmount As String
                    sqlUpdatePaymentLogWithReversalAmount = "       UPDATE dbo.PAYMENT_ISWCollegePayPaymentLog "
                    sqlUpdatePaymentLogWithReversalAmount &= "      SET ISWAmount = ISWAmount + " & amount & ", "
                    sqlUpdatePaymentLogWithReversalAmount &= "          ISWPaymentItemAmount = ISWPaymentItemAmount + " & amount & ", "
                    sqlUpdatePaymentLogWithReversalAmount &= "          ISWIsReversal = 'True', "
                    sqlUpdatePaymentLogWithReversalAmount &= "          PaymentReversalFlag = 1 "
                    sqlUpdatePaymentLogWithReversalAmount &= "      WHERE ISWPaymentLogId = '" & paymentLogId & "' "
                    Call Common.UpdateTableRow(sqlUpdatePaymentLogWithReversalAmount)

                    ret = 0 'reversal has been handled successfully
                Else
                    'this is a Duplicate...
                    Dim sqlInsertDisputeDuplicate As String
                    sqlInsertDisputeDuplicate = "       INSERT INTO dbo.PAYMENT_ISWCollegePayPaymentDispute(PaymentDisputeType, ISWPaymentLogId, OldPaymentLog) "
                    sqlInsertDisputeDuplicate &= "      VALUES('" & "Duplicate" & "','" & paymentLogId & "','" & CType(rowsOldRecord(0).Item(0), String) & "')"
                    Call Common.InsertTableRow(sqlInsertDisputeDuplicate)

                    ret = 0 'duplicate has been handled successfully
                End If
            Else
                'go ahead and save record normally...
                sqlSaveRecord = "       INSERT INTO dbo.PAYMENT_ISWCollegePayPaymentLog(ISWProductGroupCode, ISWPaymentLogId, ISWCustomerReference, ISWAlternateCustomerReference, ISWAmount, ISWPaymentStatus, ISWPaymentMethod, ISWPaymentReference, ISWTerminalId, ISWChannelName, ISWLocation, ISWIsReversal, ISWPaymentDate, ISWSettlementDate, ISWInstitutionId, ISWInstitutionName, ISWBranchName, ISWBankName, ISWFeeName, ISWCustomerName, ISWOtherCustomerInfo, ISWReceiptNumber, ISWCollectionsAccount, ISWThirdPartyCode, ISWPaymentItemName, ISWPaymentItemCode, ISWPaymentItemAmount, ISWLeadBankCode, ISWLeadBankCbnCode, ISWLeadBankName, ISWBankCode, ISWCustomerAddress, ISWCustomerTelephone, ISWDepositorName, ISWDepositorSlipNumber, ISWPaymentCurrency) "
                sqlSaveRecord &= "      VALUES('" & productGroupCode & "','" & paymentLogId & "','" & customerReference & "','" & alternateCustomerReference & "'," & amount & "," & paymentStatus & ",'" & paymentMethod & "','" & paymentReference & "','" & terminalId & "','" & channelName & "','" & location & "','" & isReversal & "','" & paymentDate & "','" & settlementDate & "','" & institutionId & "','" & institutionName & "','" & branchName & "','" & bankName & "','" & feeName & "','" & customerName & "','" & otherCustomerInfo & "','" & receiptNumber & "','" & collectionsAccount & "','" & thirdPartyCode & "','" & paymentItemName & "','" & paymentItemCode & "'," & paymentItemAmount & ",'" & leadBankCode & "','" & leadBankCbnCode & "','" & leadbankName & "','" & bankCode & "','" & customerAddress & "','" & customerTelephone & "','" & depositorName & "','" & depositorSlipNumber & "','" & paymentCurrency & "')"

                'ret = sqlSaveRecord
                insertResponse += Common.InsertTableRow(sqlSaveRecord)

                If insertResponse > 0 Then  'success
                    ret = 0
                Else                        'failure
                    ret = 1
                End If
            End If

            Return ret
        Catch ex As Exception
            Return 1
        End Try
    End Function
    Public Shared Function GetXMLSingleNodeValue(ByVal xmlData As String, ByVal nodeName As String) As String
        Dim ret As String = ""

        Dim sReader As New System.IO.StringReader(xmlData)
        Dim doc As New System.Xml.XmlDocument

        If xmlData = "" Then
            ret = ""
        Else
            doc.Load(sReader)       ' = LoadXMLDoc(sReader, httpStream)               ' doc.Load(sReader)

            Dim nRoot As System.Xml.XmlNode = doc.DocumentElement
            Dim desiredNode As System.Xml.XmlNode = nRoot.SelectSingleNode(nodeName)
            ret = desiredNode.InnerXml
            'ret = Regex.Replace(desiredNode.InnerXml, "[^a-zA-Z0-9_.]+", "")
        End If

        Return ret
    End Function
    'ERROR LOGGING
    Public Shared Function LogException(ex As Exception) As String
        Dim ret As String = "", insertResponse As Int32, sqlInsert As String

        Try
            Dim exceptionLogRef As String = Guid.NewGuid.ToString.Replace("'", "*")
            Dim exceptionlogTimeStamp As DateTime = Now().ToString.Replace("'", "*")
            Dim exceptionType As String = ex.GetType.ToString.Replace("'", "*")
            Dim exceptionSource As String = ex.Source.Replace("'", "*")
            Dim exceptionMessage As String = ex.Message.Replace("'", "*")
            Dim exceptionHashcode As String = ex.GetHashCode.ToString.Replace("'", "*")
            Dim exceptionStackTrace As String = ex.StackTrace.Replace("'", "*")
            Dim exceptionTargetSite As String = (ex.TargetSite.Name & "(in Module: " & ex.TargetSite.Module.FullyQualifiedName & ")").Replace("'", "*")
            Dim exceptionString As String = ex.ToString.Replace("'", "*")
            Dim exceptionHelpLink As String = "" : If IsNothing(ex.HelpLink) Then exceptionHelpLink = "" Else exceptionHelpLink = ex.HelpLink.Replace("'", "*")

            Dim innerExceptionType As String = ""
            Dim innerExceptionSource As String = ""
            Dim innerExceptionMessage As String = ""
            Dim innerExceptionHashcode As String = ""
            Dim innerExceptionStackTrace As String = ""
            Dim innerExceptionTargetSite As String = ""
            Dim innerExceptionString As String = ""
            Dim innerExceptionHelplink As String = ""
            Dim remark1 As String = ""
            Dim remark2 As String = ""
            Dim remark3 As String = ""

            If Not IsNothing(ex.InnerException) Then
                innerExceptionType = ex.InnerException.GetType.ToString.Replace("'", "*")
                innerExceptionSource = ex.InnerException.Source.Replace("'", "*")
                innerExceptionMessage = ex.InnerException.Message.Replace("'", "*")
                innerExceptionHashcode = ex.InnerException.GetHashCode.ToString.Replace("'", "*")
                innerExceptionStackTrace = ex.InnerException.StackTrace.Replace("'", "*")
                innerexceptionTargetSite = (ex.InnerException.TargetSite.Name & "(in Module: " & ex.InnerException.TargetSite.Module.FullyQualifiedName & ")").Replace("'", "*")
                innerExceptionString = ex.InnerException.ToString.Replace("'", "*")
                If IsNothing(ex.InnerException.HelpLink) Then innerExceptionHelplink = "" Else innerExceptionHelplink = ex.InnerException.HelpLink.Replace("'", "*")
            End If

            'save record ...
            sqlInsert = "       INSERT INTO dbo.LOG_ExceptionLog(ExceptionLogRef, ExceptionLogTimeStamp, ExceptionType, ExceptionSource, ExceptionMessage, ExceptionHashcode, ExceptionStackTrace, ExceptionTargetSite, ExceptionString, ExceptionHelplink, InnerExceptionType, InnerExceptionSource, InnerExceptionMessage, InnerExceptionHashcode, InnerExceptionStackTrace, InnerExceptionTargetSite, InnerExceptionString, InnerExceptionHelplink, Remark1, Remark2, Remark3) "
            sqlInsert &= "      VALUES('" & exceptionLogRef & "','" & exceptionlogTimeStamp & "','" & exceptionType & "','" & exceptionSource & "','" & exceptionMessage & "','" & exceptionHashcode & "','" & exceptionStackTrace & "','" & exceptionTargetSite & "','" & exceptionString & "','" & exceptionHelpLink & "','" & innerExceptionType & "','" & innerExceptionSource & "','" & innerExceptionMessage & "','" & innerExceptionHashcode & "','" & innerExceptionStackTrace & "','" & innerExceptionTargetSite & "','" & innerExceptionString & "','" & innerExceptionHelplink & "','" & remark1 & "','" & remark2 & "','" & remark3 & "')"

            'ret = sqlSaveRecord
            insertResponse += Common.InsertTableRow(sqlInsert)

            If insertResponse > 0 Then  'success
                ret = 0
            Else                        'failure
                ret = 1
            End If

            Return ret
        Catch exc As Exception
            Return 1
        End Try
    End Function
End Class
