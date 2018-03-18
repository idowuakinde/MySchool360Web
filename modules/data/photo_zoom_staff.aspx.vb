
Partial Class modules_data_photo_zoom_staff
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim username As String = Request.QueryString("a")

        Dim imageUrl As String = "~/images/pp_staff/" & username & ".jpg"
        Me.imgPassport.ImageUrl = Common.ShowPhotograph(imageUrl, Server.MapPath(imageUrl))
    End Sub
End Class
