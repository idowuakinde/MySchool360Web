
Partial Class modules_system_setups_metadata_manageassets
    Inherits System.Web.UI.Page

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        Dim filePhoto_Add As FileUpload = CType(Me.DetailsView1.FindControl("FileUpload1"), FileUpload)
        Dim assetCode As String, assetName As String, assetClass As String, assetManufacturer As String, destinationFileName As String

        If (filePhoto_Add.HasFile) Then
            If e.Values("AssetCode") Is Nothing Then assetCode = "" Else assetCode = e.Values("AssetCode")
            If e.Values("AssetName") Is Nothing Then assetName = "" Else assetName = e.Values("AssetName")
            If e.Values("AssetClassId") Is Nothing Then assetClass = "" Else assetClass = e.Values("AssetClassId")
            If e.Values("AssetManufacturerId") Is Nothing Then assetManufacturer = "" Else assetManufacturer = e.Values("AssetManufacturerId")
            destinationFileName = assetCode.Replace(" ", "_") & "_" & assetName.Replace(" ", "_") & "_" & assetClass.Replace(" ", "_") & "_" & assetManufacturer.Replace(" ", "_")

            Call Common.UploadPhoto(filePhoto_Add, Server.MapPath("~/images/_assets/"), "", destinationFileName)
            e.Values("AssetPictureLocation") = destinationFileName & ".jpg"
            e.Values("AssetRef") = Guid.NewGuid.ToString.ToUpper
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub
End Class
