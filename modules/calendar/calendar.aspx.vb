
Partial Class modules_calendar_calendar
    Inherits System.Web.UI.Page

    Public rowsEvents As System.Data.DataRowCollection
    Dim calendarEvents As Hashtable = Nothing, eventId As Int32 = 0, eventTitle As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        rowsEvents = Common.GetTableRows("SELECT EventId, EventName, StartDate, EndDate, CAST(DateDiff(day, StartDate, EndDate) + 1 AS Varchar) + ' day(s)' as Duration, Remark1 as EventType FROM dbo.Core_CalendarEvent")

        calendarEvents = New Hashtable

        For i As Int32 = 0 To rowsEvents.Count - 1
            eventId = CType(rowsEvents(i).Item(0), Int32)
            eventTitle = "Event: " & rowsEvents(i).Item(1).ToString & vbCrLf & "From: " & CType(rowsEvents(i).Item(2), Date).ToLongDateString & vbCrLf & "To " & CType(rowsEvents(i).Item(3), Date).ToLongDateString & vbCrLf & "Duration: " & rowsEvents(i).Item(4).ToString & vbCrLf & "Type: " & rowsEvents(i).Item(5).ToString
            calendarEvents.Add(eventId, eventTitle)
        Next
    End Sub

    Protected Sub calJuly_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calJuly.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calAugust_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calAugust.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calSeptember_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calSeptember.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calOctober_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calOctober.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calNovember_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calNovember.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calDecember_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calDecember.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calJanuary_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calJanuary.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calFebruary_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calFebruary.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calMarch_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calMarch.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calApril_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calApril.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calMay_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calMay.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub

    Protected Sub calJune_DayRender(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DayRenderEventArgs) Handles calJune.DayRender
        e = Common.GetCalendarMonthEvents(calendarEvents, e)
    End Sub
End Class
