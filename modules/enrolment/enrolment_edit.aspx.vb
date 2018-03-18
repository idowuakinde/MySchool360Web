
Partial Class modules_enrolment_enrolment_edit
    Inherits System.Web.UI.Page

    Public portalNumber As String, imageURL As String = ""
    Public birthDate_year As DropDownList, birthDate_month As DropDownList, birthDate_day As DropDownList, birthDate_label As Label
    Public blnSuccess As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")

        imageURL = "~/images/pp/" & portalNumber & ".jpg"
        imgPhoto.ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
    End Sub

    Protected Sub dsSqlEditStudent_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlEditStudent.Updating
        Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'cmdParams("@Password").Value = cmdParams("@LastName").Value
        'cmdParams("@RA").Value = cmdParams("@LastName").Value

        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next
    End Sub

    Protected Sub dvEditStudent_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewUpdatedEventArgs) Handles dvEditStudent.ItemUpdated
        If Not e.Exception Is Nothing Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        Else
            Dim ret As Int32 = e.AffectedRows

            Select Case ret
                Case -1
                    lblStatus.Font.Bold = True
                    lblStatus.ForeColor = Drawing.Color.Green
                    lblStatus.Text = "Congratulations! Changes to Application for Enrolment have been successfully saved."

                    portalNumber = portalNumber + 1
                Case Else
                    lblStatus.Font.Bold = True
                    lblStatus.ForeColor = Drawing.Color.Red
                    lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
            End Select
        End If
    End Sub

    Protected Sub btnPassport_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPassport.Click
        Try
            ' Before attempting to perform operations on the file, verify that the FileUpload control contains a file.
            If (filePassport.HasFile) Then
                Call Common.UploadPhoto(filePassport, Server.MapPath("~/images/pp/"), "", portalNumber)
                blnSuccess = True
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Green
                lblStatus.Text = "Congratulations! New Passport Photograph was SUCCESSFULLY uploaded."
            Else
                ' Notify the user that no file was uploaded.
                blnSuccess = False
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Red
                lblStatus.Text = "An error occurred during the Upload operation. You did not specify a file to upload."
            End If
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Protected Sub btnRemove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnRemove.Click
        Try
            Call Common.DeleteFile(Server.MapPath("~/images/pp/" & portalNumber & ".jpg"))
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Existing Passport Photograph was successfully removed."
        Catch ex As Exception
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred and the existing Passport Photograph could not be removed."
        End Try
    End Sub
End Class
