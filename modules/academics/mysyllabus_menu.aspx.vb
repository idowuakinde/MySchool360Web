
Partial Class modules_academics_mysyllabus_menu
    Inherits System.Web.UI.Page

    Public portalNumber As String, className As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("b")

        Me.HyperLink1.NavigateUrl = "~/modules/academics/mysyllabus_all_1.aspx?a=" & portalNumber & "&b=" & className
        Me.HyperLink2.NavigateUrl = "~/modules/academics/mysyllabus_all_2.aspx?a=" & portalNumber & "&b=" & className
        Me.HyperLink3.NavigateUrl = "~/modules/academics/mysyllabus_all.aspx?a=" & portalNumber & "&b=" & className
    End Sub
End Class
