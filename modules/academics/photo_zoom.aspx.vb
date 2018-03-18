
Partial Class modules_hr_photo_zoom
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim matricNumber As String = Request.QueryString("a")

        Dim imageUrl As String = "~/images/pp/" & matricNumber & ".jpg"
        Me.imgPassport.ImageUrl = Common.ShowPhotograph(imageUrl, Server.MapPath(imageUrl))
    End Sub
End Class
