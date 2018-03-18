
Partial Class modules_data_principal_comments_selector
    Inherits System.Web.UI.Page

    Public pageSize As Int32, pageIndex As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub GridView5_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView5.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            'e.Row.Attributes("onClick") = ClientScript.GetPostBackClientHyperlink(Me.GridView5, "Select$" & e.Row.RowIndex) & ";self.parent.frames[" & Chr(34) & "singleStudentFrame" & Chr(34) & "].location.href='profile_student_single.aspx?a=" & CType(rowView("MatricNumber"), String) & "&b=" & CType(rowView("Class"), String) & "';"
            'e.Row.Attributes("onClick") = ClientScript.GetPostBackClientHyperlink(Me.GridView5, "Select$" & e.Row.RowIndex) & ";self.parent.frames[" & Chr(34) & "singleStudentFrame" & Chr(34) & "].location.href='profile_student_edit.aspx?a=" & CType(rowView("MatricNumber"), String) & "';"
            'e.Row.Attributes("onmouseout") = "this.style.textDecoration='none';"
            'e.Row.Style("cursor") = "pointer"
        End If
    End Sub

End Class
