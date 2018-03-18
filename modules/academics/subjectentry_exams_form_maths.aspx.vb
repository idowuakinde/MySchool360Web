
Partial Class modules_academics_subjectentry_exams_form_maths
    Inherits System.Web.UI.Page

    Public serialNumber As Int32

    Protected Sub GridView2_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView2.RowDataBound
        serialNumber += 1
    End Sub
End Class
