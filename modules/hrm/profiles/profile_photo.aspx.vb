
Partial Class modules_profiles_profile_photo
    Inherits System.Web.UI.Page

    Dim blnSuccess As Boolean
    Protected Sub DropDownList4_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList4.SelectedIndexChanged
        'Response.Write("'" & Me.DropDownList4.SelectedValue & "'") : Response.End()
        If Me.DropDownList4.SelectedValue <> "0" Then
            'lblHeader.Visible = True
            lblStatus_Passport.Visible = True : lblStatus_Passport.Text = ""
            Me.imgPassport.Visible = True
            Me.imgPassport.ImageUrl = "~/_uploads/photos/photo_" & Me.DropDownList4.SelectedValue & ".jpg"
            Me.filePassport.Visible = True
            Me.btnPassport.Visible = True

            'Me.lblHeader2.Visible = True
            lblStatus_Signature.Visible = True : lblStatus_Signature.Text = ""
            Me.imgSignature.Visible = True
            Me.imgSignature.ImageUrl = "~/_uploads/signatures/sign_" & Me.DropDownList4.SelectedValue & ".jpg"
            Me.fileSignature.Visible = True
            Me.btnSignature.Visible = True
        Else
            lblHeader.Visible = False : Me.lblHeader2.Visible = False
            lblStatus_Passport.Visible = False : lblStatus_Signature.Visible = False
            Me.imgPassport.Visible = False : Me.imgSignature.Visible = False
            Me.filePassport.Visible = False : Me.fileSignature.Visible = False
            Me.btnPassport.Visible = False : Me.btnSignature.Visible = False
        End If
    End Sub

    Protected Sub btnPassport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPassport.Click
        Try
            ' Before attempting to perform operations on the file, verify that the FileUpload control contains a file.
            If (filePassport.HasFile) Then
                Call UploadPhoto(filePassport, Server.MapPath("~/_uploads/photos/"), "photo_")
                ' Notify the user of the name the file was saved under.
                blnSuccess = True
                lblStatus_Passport.Font.Bold = True
                lblStatus_Passport.ForeColor = Drawing.Color.Green
                lblStatus_Passport.Text = "Congratulations! Your new Passport Photograph was SUCCESSFULLY uploaded."
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

    Protected Sub btnSignature_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSignature.Click
        Try
            ' Before attempting to perform operations on the file, verify that the FileUpload control contains a file.
            If (fileSignature.HasFile) Then
                Call UploadPhoto(fileSignature, Server.MapPath("~/_uploads/signatures/"), "sign_")
                ' Notify the user of the name the file was saved under.
                blnSuccess = True
                lblStatus_Signature.Font.Bold = True
                lblStatus_Signature.ForeColor = Drawing.Color.Green
                lblStatus_Signature.Text = "Congratulations! Your new Signature was SUCCESSFULLY uploaded."
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
        destinationFileName = destinationFilePrefix & Me.DropDownList4.SelectedValue & ".jpg"
        ' Append the name of the file to upload to the path.
        savePath &= destinationFileName
        ' Call the SaveAs method to save the uploaded file to the specified path. This example does not perform all the necessary error checking.               
        ' If a file with the same name already exists in the specified path, the uploaded file overwrites it.
        fileUploadControl.SaveAs(savePath)
    End Sub
End Class
