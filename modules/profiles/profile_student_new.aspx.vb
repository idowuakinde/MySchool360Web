
Partial Class modules_profiles_profile_student_new
    Inherits System.Web.UI.Page

    Public portalNumber As String, imageURL As String = ""
    Public birthDate_year As DropDownList, birthDate_month As DropDownList, birthDate_day As DropDownList, birthDate_label As Label
    Public blnSuccess As Boolean

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = System.Configuration.ConfigurationManager.AppSettings("Current_School_Id") & Common.PadNumber((Common.GetMaxStudentId + 1).ToString, 4)
        imageURL = "~/images/pp/" & portalNumber & ".jpg"
        imgPhoto.ImageUrl = Common.ShowPhotograph(imageURL, Server.MapPath(imageURL))

        'Year
        birthDate_year = CType(dvNewStudent.FindControl("ddlDateBirth_Year"), DropDownList)
        If Not IsPostBack Then
            For m As Int32 = Year(Now) To Year(Now) - 100 Step -1
                birthDate_year.Items.Add(m)
            Next
        End If

        'Month
        birthDate_month = CType(dvNewStudent.FindControl("ddlDateBirth_Month"), DropDownList)

        'Day
        birthDate_day = CType(dvNewStudent.FindControl("ddlDateBirth_Day"), DropDownList)
        If Not IsPostBack Then
            For n As Int32 = 1 To 31
                birthDate_day.Items.Add(n)
            Next
        End If
    End Sub

    Protected Sub Page_PreRender(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.PreRender
        birthDate_label = CType(dvNewStudent.FindControl("lblBirthDate"), Label)
        'month / day / year
        birthDate_label.Text = MonthName(birthDate_month.SelectedValue, True).ToUpper & "/" & birthDate_day.SelectedValue & "/" & birthDate_year.SelectedValue
    End Sub

    Protected Sub dvNewStudent_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvNewStudent.ItemInserting
        dsSqlAddStudent.InsertParameters(1).DefaultValue = portalNumber
        portalNumber += 1
        dsSqlAddStudent.InsertParameters(8).DefaultValue = Request.Params("hidBirthDate")
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
                    lblStatus.Text = "Congratulations! New student has been successfully enrolled."
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
