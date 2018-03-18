
Partial Class modules_system_setups_metadata_managepracticequestions
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0

    Protected Sub DetailsView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles DetailsView1.ItemInserted
        Me.gvUsers.DataBind()
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        Dim uploadControl As FileUpload = CType(DetailsView1.FindControl("fileDiagram"), FileUpload)
        If uploadControl.HasFile Then
            'upload specified file
            Dim uniqueFileName As String = e.Values("SubjectShortName").ToString.Replace(" ", "") & "_" & Guid.NewGuid.ToString.ToUpper & New System.IO.FileInfo(uploadControl.PostedFile.FileName).Extension
            'Response.Write(uniqueFileName) : Response.End()
            Call Common.UploadNonPhotoFile(uploadControl, Server.MapPath("~/_pq/"), "", uniqueFileName)
            e.Values("DiagramLocation") = uniqueFileName
        Else
            'ignore
        End If
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            Dim downloadLocation As String = Common.ConvertDBNulltoNothing(rowView("DiagramLocation"))
            If downloadLocation = "" Then
                CType(e.Row.FindControl("hlnkDownload"), HyperLink).Visible = False
            Else
                CType(e.Row.FindControl("hlnkDownload"), HyperLink).NavigateUrl = "~/_pq/" & downloadLocation
            End If
        End If
    End Sub
End Class
