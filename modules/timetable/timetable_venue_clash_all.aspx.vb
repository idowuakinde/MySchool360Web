
Partial Class modules_timetable_timetable_venue_clash_all
    Inherits System.Web.UI.Page

    Public venueName As String, snMaster As Int32 = 0, snDetail As Int32 = 0, periodsPerDay As Int32 = 0

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        venueName = Request.QueryString("a")
        Me.Label9.Text = ":: VENUE CLASHES FOR ALL VENUES"

        Dim rcSettings As System.Data.DataRowCollection = Common.GetSettings("Timetable")
        periodsPerDay = CType(rcSettings(0).Item(1), Int32)
    End Sub

    Protected Sub InnerGrid_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        snDetail = 0
    End Sub

    Protected Sub InnerGrid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            snDetail += 1
        End If
    End Sub

    Protected Sub gvTeachers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvVenues.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            snMaster += 1

            Dim gvDetails As GridView = e.Row.FindControl("gvVenueLoad")
            Dim dsDetails As SqlDataSource = e.Row.FindControl("dsSqlGetVenueLoad")
            dsDetails.SelectParameters(0).DefaultValue = e.Row.DataItem("VenueName").ToString
            dsDetails.SelectParameters(1).DefaultValue = e.Row.DataItem("DayOfWeekName").ToString
            dsDetails.SelectParameters(2).DefaultValue = e.Row.DataItem("PeriodNumber").ToString
            gvDetails.DataBind()
        End If
    End Sub
End Class
