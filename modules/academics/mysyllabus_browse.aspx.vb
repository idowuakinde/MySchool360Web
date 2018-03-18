
Partial Class modules_academics_mysyllabus_browse
    Inherits System.Web.UI.Page

    Public portalNumber As String, className As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("b")
    End Sub
End Class
