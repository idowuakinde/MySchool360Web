
Partial Class modules_enrolment_enrolment_new
    Inherits System.Web.UI.Page

    Public portalNumber As String, imageURL As String = "", sessionName As String, maxId As Int32
    Public birthDate_year As DropDownList, birthDate_month As DropDownList, birthDate_day As DropDownList, birthDate_label As Label
    Public blnSuccess As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        maxId = Common.GetMaxApplicantId
        If maxId = 0 Then
            portalNumber = System.Configuration.ConfigurationManager.AppSettings("Current_School_Id") & Common.PadNumber((maxId + 1).ToString, 4)
        Else
            portalNumber = Common.PadNumber((maxId + 1).ToString, 4)
        End If
        imageURL = "~/images/pp/" & portalNumber & ".jpg"
        imgPhoto.ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))
        sessionName = Request.QueryString("a")

        'Year
        birthDate_year = CType(dvNewStudent.FindControl("ddlDateBirth_Year"), DropDownList)

        'Month
        birthDate_month = CType(dvNewStudent.FindControl("ddlDateBirth_Month"), DropDownList)

        'Day
        birthDate_day = CType(dvNewStudent.FindControl("ddlDateBirth_Day"), DropDownList)
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        birthDate_label = CType(dvNewStudent.FindControl("lblBirthDate"), Label)
        'month / day / year
        birthDate_label.Text = MonthName(birthDate_month.SelectedValue, True).ToUpper & "/" & birthDate_day.SelectedValue & "/" & birthDate_year.SelectedValue
    End Sub

    Protected Sub dvNewStudent_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvNewStudent.ItemInserting
        dsSqlAddStudent.InsertParameters(1).DefaultValue = portalNumber
        'portalNumber += 1
        dsSqlAddStudent.InsertParameters(8).DefaultValue = Request.Params("hidBirthDate")
        dsSqlAddStudent.InsertParameters(13).DefaultValue = sessionName
    End Sub

    Protected Sub dvNewStudent_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvNewStudent.ItemInserted
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
                    lblStatus.Text = "Congratulations! New Application for Enrolment has been successfully saved."

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
