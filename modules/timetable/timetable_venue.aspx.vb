
Partial Class modules_timetable_timetable_venue
    Inherits System.Web.UI.Page

    Public venueName As String, periodsPerDay As Int32, periodsBeforeShortBreak As Int32, periodsBeforeLongBreak As Int32

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        venueName = Request.QueryString("a")
        Me.Label9.Text = ":: VENUE TIMETABLE FOR " & venueName.ToUpper

        Dim rcSettings As System.Data.DataRowCollection = Common.GetSettings("Timetable")
        periodsPerDay = CType(rcSettings(0).Item(1), Int32)
        periodsBeforeShortBreak = CType(rcSettings(1).Item(1), Int32)
        periodsBeforeLongBreak = CType(rcSettings(2).Item(1), Int32)
    End Sub

    Public Function GetTimetablePeriod(ByVal dayOfWeek As Int32, ByVal periodNumber As Int32) As String
        Dim ret As String
        Dim rcPeriod As System.Data.DataRowCollection = Common.GetTableRows("SELECT [PeriodId], [DayOfWeek], [PeriodNumber], b.ClassName, c.SubjectName, d.VenueName, e.FirstName + ' ' + e.Surname as TeacherName FROM [dbo].[Core_TimetablePeriod] a INNER JOIN dbo.TEMPClass b ON a.ClassId  = b.ClassId INNER JOIN dbo.TEMPSubject c ON a.SubjectId = c.SubjectId INNER JOIN dbo.Core_TuitionVenue d ON a.RoomId = d.VenueId INNER JOIN dbo.Core_User e ON a.Remark1 = e.Username WHERE DayofWeek = " & dayOfWeek & " AND PeriodNumber = " & periodNumber & " AND d.VenueName = '" & venueName & "' ")

        Select Case rcPeriod.Count
            Case 0
                ret = "--"
            Case 1
                ret = "<b>" & rcPeriod(0).Item(4).ToString & "</b><br /> for <br /><b>" & rcPeriod(0).Item(3).ToString & "</b><br /> with <br /><b>" & rcPeriod(0).Item(6).ToString & "</b>"
            Case Else
                ret = "<a href='timetable_venue_clash.aspx?a=" & venueName & "'><font color='red'><b>" & "CLASH !</b></font></a>"
        End Select

        Return ret
    End Function
End Class
