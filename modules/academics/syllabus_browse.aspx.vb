
Partial Class modules_academics_syllabus_browse
    Inherits System.Web.UI.Page

    Public username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
    End Sub
End Class
