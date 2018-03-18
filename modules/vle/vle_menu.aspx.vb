
Partial Class modules_vle_vle_menu
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", className As String = "", schoolColour As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("b")
        schoolColour = "#" & Request.QueryString("d")

        Me.HyperLink1.NavigateUrl = "~/modules/virtualclass/virtualclass_resources.aspx?a=" & portalNumber & "&c=" & className & "&d=" & schoolColour.Replace("#", "")
        Me.HyperLink2.NavigateUrl = "~/modules/vle/pq_default.aspx?a=" & portalNumber & "&c=" & className & "&d=" & schoolColour.Replace("#", "")
    End Sub

End Class
