
Partial Class modules_data_principal_comments_subjects_step2
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0, teacherName As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        teacherName = Request.QueryString("b")
        Me.lblHeader.Text = ":: Thank you. <br />&nbsp;&nbsp;&nbsp;&nbsp;The teacher you selected (" & teacherName & ") teaches the following subjects. <br />&nbsp;&nbsp;&nbsp;&nbsp;Please click a subject to comment on the scores entered for that subject:"
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub
End Class
