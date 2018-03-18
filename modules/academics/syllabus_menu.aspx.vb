
Partial Class modules_academics_syllabus_menu
    Inherits System.Web.UI.Page

    Public username As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")

        Me.HyperLink1.NavigateUrl = "~/modules/academics/managesyllabus_1.aspx?a=" & username
        Me.HyperLink2.NavigateUrl = "~/modules/academics/managesyllabus_2.aspx?a=" & username
        Me.HyperLink3.NavigateUrl = "~/modules/academics/managesyllabus.aspx?a=" & username
    End Sub
End Class
