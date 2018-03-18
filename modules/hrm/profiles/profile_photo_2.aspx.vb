
Partial Class modules_profiles_profile_photo_2
    Inherits System.Web.UI.Page

    Dim blnSuccess As Boolean

    Protected Sub gvMaster_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles gvMaster.SelectedIndexChanged
        For Each gvRow As GridViewRow In gvMaster.Rows
            gvRow.FindControl("lblHeader").Visible = False
            gvRow.FindControl("lblStatus_Passport").Visible = False
            gvRow.FindControl("imgPassport").Visible = False
            gvRow.FindControl("filePassPort").Visible = False
            gvRow.FindControl("btnPassport").Visible = False
            gvRow.FindControl("lblHeader2").Visible = False
            gvRow.FindControl("lblStatus_Signature").Visible = False
            gvRow.FindControl("imgSignature").Visible = False
            gvRow.FindControl("fileSignature").Visible = False
            gvRow.FindControl("btnSignature").Visible = False
        Next
        gvMaster.SelectedRow.FindControl("lblHeader").Visible = True
        gvMaster.SelectedRow.FindControl("lblStatus_Passport").Visible = True : CType(gvMaster.SelectedRow.FindControl("lblStatus_Passport"), Label).Text = ""
        gvMaster.SelectedRow.FindControl("imgPassport").Visible = True : CType(gvMaster.SelectedRow.FindControl("imgPassport"), Image).ImageUrl = "~\images\pp_staff\" & gvMaster.SelectedDataKey(2).ToString & ".jpg"
        gvMaster.SelectedRow.FindControl("filePassPort").Visible = True
        gvMaster.SelectedRow.FindControl("btnPassport").Visible = True
        gvMaster.SelectedRow.FindControl("lblHeader2").Visible = True
        gvMaster.SelectedRow.FindControl("lblStatus_Signature").Visible = True : CType(gvMaster.SelectedRow.FindControl("lblStatus_Signature"), Label).Text = ""
        gvMaster.SelectedRow.FindControl("imgSignature").Visible = True : CType(gvMaster.SelectedRow.FindControl("imgSignature"), Image).ImageUrl = "~\images\_sign\" & gvMaster.SelectedDataKey(2).ToString & ".jpg"
        gvMaster.SelectedRow.FindControl("fileSignature").Visible = True
        gvMaster.SelectedRow.FindControl("btnSignature").Visible = True
    End Sub

    Protected Sub btnPassport_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim filePassport As FileUpload = CType(gvMaster.SelectedRow.FindControl("filePassPort"), FileUpload)
            Dim lblStatus_Passport As Label = CType(gvMaster.SelectedRow.FindControl("lblStatus_Passport"), Label)
            ' Before attempting to perform operations on the file, verify that the FileUpload control contains a file.
            If (filePassport.HasFile) Then
                Call UploadPhoto(filePassport, Server.MapPath("~/images/pp_staff/"), "")
                ' Notify the user of the name the file was saved under.
                blnSuccess = True
                lblStatus_Passport.Font.Bold = True
                lblStatus_Passport.ForeColor = Drawing.Color.Green
                lblStatus_Passport.Text = "Congratulations! New Passport Photograph was SUCCESSFULLY uploaded."
            Else
                ' Notify the user that no file was uploaded.
                blnSuccess = False
                lblStatus_Passport.Font.Bold = True
                lblStatus_Passport.ForeColor = Drawing.Color.Red
                lblStatus_Passport.Text = "You did not specify a file to upload."
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Protected Sub btnSignature_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Try
            Dim fileSignature As FileUpload = CType(gvMaster.SelectedRow.FindControl("fileSignature"), FileUpload)
            Dim lblStatus_Signature As Label = CType(gvMaster.SelectedRow.FindControl("lblStatus_Signature"), Label)
            ' Before attempting to perform operations on the file, verify that the FileUpload control contains a file.
            If (fileSignature.HasFile) Then
                Call UploadPhoto(fileSignature, Server.MapPath("~/images/_sign/"), "")
                ' Notify the user of the name the file was saved under.
                blnSuccess = True
                lblStatus_Signature.Font.Bold = True
                lblStatus_Signature.ForeColor = Drawing.Color.Green
                lblStatus_Signature.Text = "Congratulations! New Signature was SUCCESSFULLY uploaded."
            Else
                ' Notify the user that no file was uploaded.
                blnSuccess = False
                lblStatus_Signature.Font.Bold = True
                lblStatus_Signature.ForeColor = Drawing.Color.Red
                lblStatus_Signature.Text = "You did not specify a file to upload."
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Private Sub UploadPhoto(ByVal fileUploadControl As FileUpload, ByVal destinationFolder As String, ByVal destinationFilePrefix As String)
        ' Specify the path on the server to save the uploaded file to.
        Dim savePath As String = destinationFolder                      'e.g. "c:\inetpub\wwwroot\abc\uploads\"
        Dim destinationFileName As String = ""
        Dim fileDetails As System.IO.FileInfo = Nothing
        fileDetails = New System.IO.FileInfo(fileUploadControl.PostedFile.FileName)
        ' Get the name of the file to upload.
        destinationFileName = destinationFilePrefix & gvMaster.SelectedDataKey(2).ToString & ".jpg"
        ' Append the name of the file to upload to the path.
        savePath &= destinationFileName
        ' Call the SaveAs method to save the uploaded file to the specified path. This example does not perform all the necessary error checking.               
        ' If a file with the same name already exists in the specified path, the uploaded file overwrites it.
        fileUploadControl.SaveAs(savePath)
    End Sub
End Class
