
Partial Class modules_academics_pastoral_care_report
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", imageURL As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        imageURL = "~/images/pp/" & portalNumber & ".jpg"
        CType(Me.DetailsView1.FindControl("imgPhoto"), Image).ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
        CType(Me.DetailsView1.FindControl("imgThumbnail"), Image).ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
        CType(Me.DetailsView1.FindControl("imgPhotoFooter"), Image).ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
    End Sub
End Class
