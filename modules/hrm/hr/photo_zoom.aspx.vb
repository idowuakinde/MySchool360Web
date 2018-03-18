
Partial Class modules_hr_photo_zoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim username As String = Request.QueryString("a")

        Me.imgPassport.ImageUrl = "~/images/pp_staff/" & username & ".jpg"
    End Sub
End Class
