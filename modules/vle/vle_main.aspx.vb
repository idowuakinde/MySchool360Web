
Partial Class modules_vle_vle_main
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", schoolColour As String = "", serial As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        schoolColour = "#" & Request.QueryString("d")
    End Sub
End Class
