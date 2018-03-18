Imports dotnetCHARTING
Imports System.Drawing
Imports System.Drawing.Drawing2D

Partial Class frameset_welcome_g
    Inherits System.Web.UI.Page

    Public username As String, staffFirstName As String, staffFullName As String, schoolId As Int32, SN As Int32, departmentName As String, classPosition As Int32, classSize As Int32, serialSubjects As Int32 = 0, serialTests As Int32 = 0
    Public sessionName As String, currentTerm As String, termNameForComputations As String, programmeName As String
    Public rowsSchoolTheme As System.Data.DataRowCollection, rowsAnnouncements As System.Data.DataRowCollection, rowsRecentActivity As Collection, rowsStaffProfile As System.Data.DataRowCollection, rowsChampProfile As System.Data.DataRowCollection
    Public rowsLiteratureEncore As Collection, rowsKhanAcademy As Collection
    Public rowsEvents As System.Data.DataRowCollection
    Public calendarEvents As Hashtable = Nothing, eventId As Int32 = 0, eventTitle As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a").ToString
        schoolId = Request.QueryString("b").ToString
        departmentName = Request.QueryString("c").ToString
        sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        currentTerm = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
        termNameForComputations = currentTerm
        Dim imageURL As String = "~/images/pp_staff/" & username & ".jpg"
        imgPhoto.ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
        rowsSchoolTheme = Common.GetTableRows("SELECT SchoolId, SchoolAbbr, SchoolName, ShortName, ExtensionField1 FROM dbo.Core_School WHERE SchoolId = " & schoolId & "")
        rowsAnnouncements = Common.GetTableRows("SELECT AnnouncementId, DatePublished, Message FROM dbo.TEMPAnnouncements WHERE Expired = 'N' ORDER BY DatePublished DESC")
        rowsRecentActivity = Common.GetRecentActivity(username)
        rowsLiteratureEncore = Common.GetRecentPostsFromLiteratureEncore()
        rowsKhanAcademy = Common.GetRecentPostsFromKhanAcademy()
        rowsStaffProfile = Common.GetTableRows("SELECT * FROM dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE Username = '" & username & "'")
        rowsEvents = Common.GetTableRows("SELECT EventId, EventName, StartDate, EndDate, CAST(DateDiff(day, StartDate, EndDate) + 1 AS Varchar) + ' day(s)' as Duration, Remark1 as EventType FROM dbo.Core_CalendarEvent WHERE MONTH(StartDate) = MONTH(GetDate())")
        rowsChampProfile = Common.GetTableRows("SELECT * FROM dbo.TempCustomers WHERE CustomerCode = '" & Common.GetSchoolChamp(sessionName, termNameForComputations) & "'")
        Dim schoolChampImageURL As String = "~/images/pp/" & Common.GetSchoolChamp(sessionName, termNameForComputations) & ".jpg"

        calendarEvents = New Hashtable

        For i As Int32 = 0 To rowsEvents.Count - 1
            eventId = CType(rowsEvents(i).Item(0), Int32)
            eventTitle = "Event: " & rowsEvents(i).Item(1).ToString & vbCrLf & "From: " & CType(rowsEvents(i).Item(2), Date).ToLongDateString & vbCrLf & "To " & CType(rowsEvents(i).Item(3), Date).ToLongDateString & vbCrLf & "Duration: " & rowsEvents(i).Item(4).ToString & vbCrLf & "Type: " & rowsEvents(i).Item(5).ToString
            calendarEvents.Add(eventId, eventTitle)
        Next

        staffFirstName = rowsStaffProfile(0).Item("FirstName").ToString & " " & rowsStaffProfile(0).Item("Surname").ToString
        staffFullName = rowsStaffProfile(0).Item("FirstName").ToString & " " & rowsStaffProfile(0).Item("MiddleName").ToString & " " & rowsStaffProfile(0).Item("Surname").ToString
        imgPhoto.ToolTip = staffFullName & "'s Passport Photograph"
    End Sub

    Protected Sub calEvents_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calEvents.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub Page_Unload(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Unload
        rowsSchoolTheme = Nothing
        rowsAnnouncements = Nothing
        rowsStaffProfile = Nothing
    End Sub
End Class
