
Partial Class modules_academics_result_student_all
    Inherits System.Web.UI.Page

    Public pageSize As Int32, pageIndex As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            'First load
            '            pageSize = Request.QueryString("a")
            '            pageIndex = Request.QueryString("b")
            '
            '            Me.GridView5.PageSize = pageSize
            '            Me.GridView5.PageIndex = pageIndex
        End If
    End Sub

    Protected Sub GridView5_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView5.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            For i As Int32 = 1 To e.Row.Cells.Count - 1 'I am deliberately skipping cell 0 to allow for a custom javascript 'OnClick' function on that cell...
                e.Row.Cells(i).Attributes("onClick") = ClientScript.GetPostBackClientHyperlink(Me.GridView5, "Select$" & e.Row.RowIndex) & ";self.parent.frames[" & Chr(34) & "singleStudentFrame" & Chr(34) & "].location.href='../reports/rpt_menu_student.aspx?a=" & CType(rowView("MatricNumber"), String) & "&b=" & CType(rowView("Class"), String) & "&c=" & CType(rowView("SessionName"), String) & "';"
                e.Row.Cells(i).Attributes("onmouseout") = "this.style.textDecoration='none';"
                e.Row.Cells(i).Style("cursor") = "pointer"
                'e.Row.Cells(i).Attributes("title") = e.Row.Cells(i).Attributes("onClick")
            Next
        End If
    End Sub
End Class
