
Partial Class modules_vle_vle_teacher_main
    Inherits System.Web.UI.Page

    Public username As String = "", schoolColour As String = "", serial As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        schoolColour = "#" & Request.QueryString("b")
    End Sub
End Class
