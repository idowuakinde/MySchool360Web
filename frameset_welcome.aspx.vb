Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class frameset_welcome
    Inherits System.Web.UI.Page

    Public portalNumber As String, studentFirstName As String, studentFullName As String, schoolId As Int32, SN As Int32, className As String, classPosition As Int32, classSize As Int32
    Public sessionName As String, currentTerm As String, termNameForComputations As String, programmeName As String
    Public rowsSchoolTheme As System.Data.DataRowCollection, rowsAnnouncements As System.Data.DataRowCollection, rowsRecentActivity As Collection, rowsStudentProfile As System.Data.DataRowCollection, rowsChampProfile As System.Data.DataRowCollection, rowsAverageScore As System.Data.DataRowCollection
    Public rowsLiteratureEncore As Collection, rowsKhanAcademy As Collection
    Public rowsEvents As System.Data.DataRowCollection
    Public averageScore As Double
    Public calendarEvents As Hashtable = Nothing, eventId As Int32 = 0, eventTitle As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a").ToString
        schoolId = Request.QueryString("b").ToString
        className = Request.QueryString("c").ToString
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        currentTerm = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
        termNameForComputations = currentTerm
        Dim imageURL As String = "~/images/pp/" & portalNumber & ".jpg"
        imgPhoto.ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
        rowsSchoolTheme = Common.GetTableRows("SELECT SchoolId, SchoolAbbr, SchoolName, ExtensionField1 FROM dbo.Core_School WHERE SchoolId = " & schoolId & "")
        'rowsAnnouncements = Common.GetRecentMessagesFromManagement(GetSMSHistory)
        rowsAnnouncements = Common.GetTableRows("SELECT AnnouncementId, DatePublished as Creation_Date, Message, Expired FROM dbo.TEMPAnnouncements WHERE Expired = 'N'")
        rowsRecentActivity = Common.GetRecentActivity(portalNumber)
        rowsLiteratureEncore = Common.GetRecentPostsFromLiteratureEncore()
        rowsKhanAcademy = Common.GetRecentPostsFromKhanAcademy()
        rowsStudentProfile = Common.GetTableRows("SELECT * FROM dbo.TempCustomers WHERE CustomerCode = '" & portalNumber & "'")
        rowsAverageScore = Common.GetTableRows("SELECT MatricNumber, AVG(ScoreCA + ScoreExam) AS AverageScore FROM dbo.TEMPScoreSheet WHERE MatricNumber = '" & portalNumber & "' GROUP BY MatricNumber ORDER BY AverageScore DESC")
        rowsEvents = Common.GetTableRows("SELECT EventId, EventName, StartDate, EndDate, CAST(DateDiff(day, StartDate, EndDate) + 1 AS Varchar) + ' day(s)' as Duration, Remark1 as EventType FROM dbo.Core_CalendarEvent WHERE MONTH(StartDate) = MONTH(GetDate())")
        rowsChampProfile = Common.GetTableRows("SELECT * FROM dbo.TempCustomers WHERE CustomerCode = '" & Common.GetClassChamp(sessionName, termNameForComputations, className) & "'")
        Dim schoolChampImageURL As String = "~/images/pp/" & Common.GetClassChamp(sessionName, termNameForComputations, className) & ".jpg"

        calendarEvents = New Hashtable

        For i As Int32 = 0 To rowsEvents.Count - 1
            eventId = CType(rowsEvents(i).Item(0), Int32)
            eventTitle = "Event: " & rowsEvents(i).Item(1).ToString & vbCrLf & "From: " & CType(rowsEvents(i).Item(2), Date).ToLongDateString & vbCrLf & "To: " & CType(rowsEvents(i).Item(3), Date).ToLongDateString & vbCrLf & "Duration: " & rowsEvents(i).Item(4).ToString & vbCrLf & "Type: " & rowsEvents(i).Item(5).ToString
            calendarEvents.Add(eventId, eventTitle)
        Next

        If rowsAverageScore.Count = 0 Then
            averageScore = 0
        Else
            averageScore = CType(rowsAverageScore(0).Item("AverageScore"), Double)
        End If

        studentFirstName = rowsStudentProfile(0).Item("FirstName").ToString
        studentFullName = rowsStudentProfile(0).Item("CustomerName").ToString

        Chart0.Type = ChartType.Combo
        Chart0.Width = 650
        Chart0.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart0.DefaultSeries.DefaultElement.ToolTip = studentFirstName & " achieved an Overall Average Score of %yvalue% (across all subjects) in %xvalue"
        Chart0.Debug = True
        Chart0.Mentor = False
        Chart0.LegendBox.Visible = False
        Chart0.ShadingEffectMode = ShadingEffectMode.Three
        Chart0.DefaultElement.ShowValue = True
        Chart0.YAxis.FormatString = "{n:0}"
        Chart0.YAxis.ScaleRange.ValueLow = 0
        Chart0.YAxis.ScaleRange.ValueHigh = 100
        'Add a series
        Dim de0 As DataEngine
        de0 = New DataEngine()
        de0.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de0.CommandTimeout = 300
        de0.SqlStatement = " SELECT TermName, AVG(PersonalAggregateSubjectScore) FROM dbo.VW_ACADEMICS_Student_Subject_Scores WHERE SessionName = '" & sessionName & "' AND PortalNumber = '" & portalNumber & "' AND PersonalAggregateSubjectScore <> 0 GROUP BY TermName "
        Dim sc0 As SeriesCollection
        sc0 = de0.GetSeries()
        If sc0.Count > 0 Then
            sc0(0).ImageBarTemplate = "images/ImageBars/black_pencil"
        End If
        Chart0.SeriesCollection.Add(sc0)
        Chart0.URL = "modules/dashboards/dashboard_student.aspx?c=0&a=" & portalNumber & "&b=" & className

        Chart0b.Type = ChartType.Combo
        Chart0b.Width = 650
        Chart0b.TempDirectory = System.Configuration.ConfigurationManager.AppSettings("Chart_DotnetCharting2005_TempDirectory")
        Chart0b.DefaultSeries.DefaultElement.ToolTip = studentFirstName & " achieved an Overall Average Score of %yvalue% (cumulative so far) in %xvalue"
        Chart0b.Debug = True
        Chart0b.Mentor = False
        Chart0b.LegendBox.Visible = False
        Chart0b.ShadingEffectMode = ShadingEffectMode.Three
        Chart0b.DefaultElement.ShowValue = False
        Chart0b.YAxis.FormatString = "{n:0}"
        Chart0b.YAxis.ScaleRange.ValueLow = 0
        Chart0b.YAxis.ScaleRange.ValueHigh = 100
        'Add a series
        Dim de0b As DataEngine
        de0b = New DataEngine()
        de0b.ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings("iTecon_School").ToString
        de0b.CommandTimeout = 300
        'de0b.SqlStatement = "Select ShortName, AVG(PersonalAggregateSubjectScore) from dbo.VW_ACADEMICS_Student_Subject_Scores a INNER JOIN TEMPSubject b ON a.SubjectShortName = b.ShortName WHERE SessionName = '" & sessionName & "' AND PortalNumber = '" & portalNumber & "' group by ShortName order by AVG(PersonalAggregateSubjectScore) DESC "
        de0b.SqlStatement = " Select SubjectShortName, AVG(PersonalAggregateSubjectScore) from dbo.VW_ACADEMICS_Student_Subject_Scores a WHERE SessionName = '" & sessionName & "' AND PortalNumber = '" & portalNumber & "' AND PersonalAggregateSubjectScore <> 0 group by SubjectShortName order by AVG(PersonalAggregateSubjectScore) DESC "
        Dim sc0b As SeriesCollection
        sc0b = de0b.GetSeries()
        If sc0b.Count > 0 Then
            sc0b(0).ImageBarTemplate = "images/ImageBars/black_pencil"
        End If
        Chart0b.SeriesCollection.Add(sc0b)
        Chart0b.URL = "modules/dashboards/dashboard_student.aspx?c=0&a=" & portalNumber & "&b=" & className
    End Sub

    Protected Function GetSMSHistory() As String
        Dim WebRequest As Net.WebRequest 'object for WebRequest
        Dim WebResponse As Net.WebResponse 'object for WebResponse
        Dim WebResponseString As String = ""
        Dim URL As String = "http://sms.hive.com.ng/api/?username=" & Common.CONST_BULKSMS_USERNAME & "&password=" & Common.CONST_BULKSMS_PASSWORD & "&request=message_history"
        WebRequest = Net.HttpWebRequest.Create(URL) 'Hit URL Link
        WebRequest.Timeout = 25000
        Try
            WebResponse = WebRequest.GetResponse 'Get Response
            Dim reader As IO.StreamReader = New IO.StreamReader(WebResponse.GetResponseStream)
            'Read Response and store in variable
            WebResponseString = reader.ReadToEnd()
            WebResponse.Close()
            'Response.Write(WebResponseString) 'Display Response.
        Catch ex As Exception
            WebResponseString = "Request Timeout" 'If any exception occur.
            'Response.Write(WebResponseString) : Response.End()
        End Try

        Return WebResponseString
    End Function

    Protected Sub calEvents_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calEvents.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        rowsSchoolTheme = Nothing
        rowsAnnouncements = Nothing
        rowsStudentProfile = Nothing
        rowsAverageScore = Nothing
    End Sub
End Class
