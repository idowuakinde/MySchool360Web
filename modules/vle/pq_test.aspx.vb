
Partial Class modules_vle_pq_test
    Inherits System.Web.UI.Page

    Public selectedPortalNumber As String, serial As Int32 = 0, serialInner As Int32 = 0, selectedSubject As String, NoOfQuestions As Int32 = 0
    Public studentName As String, studentDesignation As String, lblStatus As Label
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        selectedSubject = Request.Form("lstQuizSubject")
        NoOfQuestions = Request.Form("lstQuizQuantity")
        selectedPortalNumber = Request.Form("hidPortalNumber")

        Me.lblHeader.Text = (Common.GetFriendlyDate(Date.Today) & " :: MYSCHOOL360 :: e-LEARNING :: PRACTICE QUESTIONS").ToUpper
        lblStatus = CType(Me.DetailsView1.FindControl("lblStatus"), Label)
        Dim rowsStudentDetails As System.Data.DataRowCollection = Common.GetTableRows(" SELECT * FROM dbo.VW_StudentProfiles WHERE MatricNumber = '" & selectedPortalNumber & "' ")
        studentName = rowsStudentDetails(0).Item("FirstName").ToString & " " & rowsStudentDetails(0).Item("LastName").ToString
        studentDesignation = ("Student, " & rowsStudentDetails(0).Item("Class").ToString)
        CType(Me.DetailsView1.FindControl("lblStudentName"), Label).Text = studentName & " [" & studentDesignation & "]"
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        'initiate the appraisal recording process by creating an "Appraisal Header" record
        'load the appropriate picture(s)
        CType(DetailsView1.FindControl("imgPhotoHeader"), Image).ImageUrl = Common.ShowPhotograph("~\images\pp\" & selectedPortalNumber & ".jpg", Server.MapPath("~\images\pp\" & selectedPortalNumber & ".jpg"))
        CType(DetailsView1.FindControl("imgPhotoFooter"), Image).ImageUrl = Common.ShowPhotograph("~\images\pp\" & selectedPortalNumber & ".jpg", Server.MapPath("~\images\pp\" & selectedPortalNumber & ".jpg"))
        'load the necessary data to bind the Header Section
        Dim rowsStudentDetails As System.Data.DataRowCollection = Common.GetTableRows(" SELECT * FROM dbo.TEMPCustomers WHERE CustomerCode = '" & selectedPortalNumber & "' ")
        If rowsStudentDetails.Count > 0 Then
            'rowsStaffAppraisalHeader = Common.GetTableRows(" SELECT * FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionName & "' AND Username = '" & selectedPortalNumber & "' ")

            ''load pre-existing header data
            'CType(DetailsView1.FindControl("lblAppraisalPeriod"), Label).Text = sessionName
            'CType(DetailsView1.FindControl("lblstudentName"), Label).Text = studentName
            'CType(DetailsView1.FindControl("lblStaffDesignation"), Label).Text = studentDesignation
            'CType(DetailsView1.FindControl("lblStaffUsername"), Label).Text = selectedPortalNumber
            'If rowsStaffAppraisalHeader.Count > 0 Then
            '    CType(DetailsView1.FindControl("txtObservationFocus"), TextBox).Text = rowsStaffAppraisalHeader(0).Item("ObservationFocus").ToString
            '    CType(DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text = rowsStaffAppraisalHeader(0).Item("Remark").ToString
            'Else
            '    CType(DetailsView1.FindControl("txtObservationFocus"), TextBox).Text = ""
            '    CType(DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text = ""
            'End If
            'make certain controls visible - to facilitate saving
            CType(Me.DetailsView1.FindControl("gvQuizQuestions"), GridView).Visible = True
            CType(Me.DetailsView1.FindControl("btnSave"), Button).Enabled = True
            'load pre-existing detail data
            CType(Me.DetailsView1.FindControl("gvQuizQuestions"), GridView).DataBind()
        Else
            'do nothing
        End If
        'Create the "Appraisal Header" record
        Dim insertResponse As Int32
        Dim observationFocus As String = CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Text
        Dim comments As String = CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text

        'Response.Write(insertResponse) 'Response.End()
        If insertResponse >= 0 Then

        Else

        End If
    End Sub

    Protected Sub gvQuizQuestions_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            'Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        'Call btnSave_Click(sender, e)
        e.Cancel = True
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim grid_Questions As GridView = CType(DetailsView1.FindControl("gvQuizQuestions"), GridView)
        Dim insertResponse As Int32

        Call SaveGridScores(selectedPortalNumber, grid_Questions, insertResponse)

        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Quiz Answers were successfully saved."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub

    Public Sub SaveGridScores(ByVal selectedStaffCode As String, ByVal gridContainingScores As GridView, ByRef insertResponse As Int32)
        For i As Int32 = 0 To gridContainingScores.Rows.Count - 1
            'questionId, answerChoice
            Dim questionId As Int32 = gridContainingScores.DataKeys(i).Value
            Dim answerChoice As String = CType(gridContainingScores.Rows(i).FindControl("ddlAnswer"), DropDownList).SelectedValue

            'save the scores
            Dim sqlInsert As String
            sqlInsert = " INSERT INTO dbo.PQ_AnswerDetail(QuestionId, AnswerChoice) "
            sqlInsert &= "      VALUES(" & questionId & ", '" & answerChoice & "') "
            'Response.Write(sqlInsert)
            insertResponse += Common.InsertTableRow(sqlInsert)
        Next
    End Sub

    Protected Sub DetailsView1_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView1.ModeChanging

    End Sub
End Class
