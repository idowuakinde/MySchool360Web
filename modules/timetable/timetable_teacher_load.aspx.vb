
Partial Class modules_timetable_timetable_teacher_load
    Inherits System.Web.UI.Page

    Public username As String, SN As Int32 = 0, periodsPerDay As Int32 = 0

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        username = Request.QueryString("a")
        Me.Label9.Text = ":: TEACHING LOAD FOR " & username.ToUpper

        Dim rcSettings As System.Data.DataRowCollection = Common.GetSettings("Timetable")
        periodsPerDay = CType(rcSettings(0).Item(1), Int32)
    End Sub

    Protected Sub InnerGrid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            SN = SN + 1
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            Dim innerGrid As GridView = CType(sender, GridView)
        End If
    End Sub
End Class
