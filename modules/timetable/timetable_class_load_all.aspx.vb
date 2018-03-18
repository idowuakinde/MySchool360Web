
Partial Class modules_timetable_timetable_class_load_all
    Inherits System.Web.UI.Page

    Public SN As Int32 = 0, periodsPerDay As Int32 = 0

    Protected Sub form1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles form1.Load
        Me.Label9.Text = ":: CLASS LOAD FOR ALL CLASSES"

        Dim rcSettings As System.Data.DataRowCollection = Common.GetSettings("Timetable")
        periodsPerDay = CType(rcSettings(0).Item(1), Int32)
    End Sub

    Protected Sub InnerGrid_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        SN = 0
    End Sub

    Protected Sub InnerGrid_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            SN = SN + 1
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
        End If
    End Sub

    Protected Sub gvTeachers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvTeachers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim gvDetails As GridView = e.Row.FindControl("gvTeacherLoad")
            Dim dsDetails As SqlDataSource = e.Row.FindControl("dsSqlGetClassLoad")
            dsDetails.SelectParameters(0).DefaultValue = e.Row.DataItem("ClassName").ToString
            gvDetails.DataBind()
        End If
    End Sub
End Class
