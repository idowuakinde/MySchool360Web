
Partial Class modules_profiles_profile_student_all
    Inherits System.Web.UI.Page

    Protected Sub GridView5_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView5.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            For i As Int32 = 1 To e.Row.Cells.Count - 1 'I am deliberately skipping cell 0 to allow for a custom javascript 'OnClick' function on that cell...
                e.Row.Cells(i).Attributes("onClick") = ClientScript.GetPostBackClientHyperlink(Me.GridView5, "Select$" & e.Row.RowIndex) & ";self.parent.frames[" & Chr(34) & "singleStudentFrame" & Chr(34) & "].location.href='profile_student_edit.aspx?a=" & CType(rowView("MatricNumber"), String) & "';"
                e.Row.Cells(i).Attributes("onmouseout") = "this.style.textDecoration='none';"
                e.Row.Cells(i).Style("cursor") = "pointer"
            Next
        End If
    End Sub
End Class
