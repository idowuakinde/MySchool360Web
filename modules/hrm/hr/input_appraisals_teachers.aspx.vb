
Partial Class modules_hrm_hr_input_appraisals_teachers
    Inherits System.Web.UI.Page

    Public selectedStaffCode As String, appraisalDepartment As String = "Teaching", serial As Int32 = 0, serialInner As Int32 = 0, headerId As Int32 = 0
    Public staffName As String = "", staffDesignation As String = "", lblStatus As Label
    Public rowsStaffAppraisalHeader As System.Data.DataRowCollection = Common.GetTableRows(" SELECT 0 AS ResponseHeaderId ")
    Public rowsStaffAppraisalDetails As System.Data.DataRowCollection
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.lblHeader.Text = ":: Year " & Now.Year.ToString & " Employee Appraisal Form for TEACHING Staff"
        lblStatus = CType(Me.DetailsView1.FindControl("lblStatus"), Label)
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        selectedStaffCode = CType(DetailsView1.FindControl("DropDownList5"), DropDownList).SelectedValue
        'bind the Meetings grid
        CType(DetailsView1.FindControl("dsSqlMeetings"), SqlDataSource).SelectParameters(0).DefaultValue = sessionName
        CType(DetailsView1.FindControl("dsSqlMeetings"), SqlDataSource).SelectParameters(1).DefaultValue = selectedStaffCode
        CType(DetailsView1.FindControl("gvMeetingObservations"), GridView).DataBind()
        'initiate the appraisal recording process by creating an "Appraisal Header" record
        If selectedStaffCode = "0" Then
            'do nothing
            'load the appropriate picture(s)
            CType(DetailsView1.FindControl("imgPhoto"), Image).ImageUrl = ""
            CType(DetailsView1.FindControl("imgPhotoHeader"), Image).ImageUrl = ""
            CType(DetailsView1.FindControl("imgPhotoFooter"), Image).ImageUrl = ""
            'load the appropriate signature
            CType(DetailsView1.FindControl("imgSignature"), Image).ImageUrl = ""
            'load the necessary data to bind the Header Section
            CType(DetailsView1.FindControl("lblAppraisalPeriod"), Label).Text = ""
            CType(DetailsView1.FindControl("lblStaffName"), Label).Text = ""
            CType(DetailsView1.FindControl("lblStaffDesignation"), Label).Text = ""
            CType(DetailsView1.FindControl("lblStaffUsername"), Label).Text = ""
            CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Text = ""
            CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text = ""

            CType(Me.DetailsView1.FindControl("dvMeetingObservation"), DetailsView).Visible = False
            CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Visible = False
            CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Visible = False
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_A"), GridView).Visible = False
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_B"), GridView).Visible = False
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_C"), GridView).Visible = False
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_D"), GridView).Visible = False
            CType(Me.DetailsView1.FindControl("btnSave"), Button).Enabled = False
        Else
            'load the appropriate picture(s)
            CType(DetailsView1.FindControl("imgPhoto"), Image).ImageUrl = Common.ShowPhotograph("~\images\pp_staff\" & selectedStaffCode & ".jpg", Server.MapPath("~\images\pp_staff\" & selectedStaffCode & ".jpg"))
            CType(DetailsView1.FindControl("imgPhotoHeader"), Image).ImageUrl = Common.ShowPhotograph("~\images\pp_staff\" & selectedStaffCode & ".jpg", Server.MapPath("~\images\pp_staff\" & selectedStaffCode & ".jpg"))
            CType(DetailsView1.FindControl("imgPhotoFooter"), Image).ImageUrl = Common.ShowPhotograph("~\images\pp_staff\" & selectedStaffCode & ".jpg", Server.MapPath("~\images\pp_staff\" & selectedStaffCode & ".jpg"))
            'load the appropriate signature
            CType(DetailsView1.FindControl("imgSignature"), Image).ImageUrl = "~\images\_sign\" & selectedStaffCode & ".jpg"
            'load the necessary data to bind the Header Section
            Dim rowsStaffDetails As System.Data.DataRowCollection = Common.GetTableRows(" SELECT * FROM dbo.HR_Staff_Base WHERE StaffCode = '" & selectedStaffCode & "' ")
            If rowsStaffDetails.Count > 0 Then
                staffName = rowsStaffDetails(0).Item("Title").ToString & " " & rowsStaffDetails(0).Item("Surname").ToString & " " & rowsStaffDetails(0).Item("OtherNames").ToString
                staffDesignation = Common.GetStaffDesignations(selectedStaffCode)
                rowsStaffAppraisalHeader = Common.GetTableRows(" SELECT * FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionName & "' AND Username = '" & selectedStaffCode & "' ")

                'load pre-existing header data
                CType(DetailsView1.FindControl("lblAppraisalPeriod"), Label).Text = sessionName
                CType(DetailsView1.FindControl("lblStaffName"), Label).Text = staffName
                CType(DetailsView1.FindControl("lblStaffDesignation"), Label).Text = staffDesignation
                CType(DetailsView1.FindControl("lblStaffUsername"), Label).Text = selectedStaffCode
                If rowsStaffAppraisalHeader.Count > 0 Then
                    CType(DetailsView1.FindControl("txtObservationFocus"), TextBox).Text = rowsStaffAppraisalHeader(0).Item("ObservationFocus").ToString
                    CType(DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text = rowsStaffAppraisalHeader(0).Item("Remark").ToString
                Else
                    CType(DetailsView1.FindControl("txtObservationFocus"), TextBox).Text = ""
                    CType(DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text = ""
                End If
                'make certain controls visible - to facilitate saving
                CType(Me.DetailsView1.FindControl("dvMeetingObservation"), DetailsView).Visible = True
                CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Visible = True
                CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Visible = True
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_A"), GridView).Visible = True
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_B"), GridView).Visible = True
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_C"), GridView).Visible = True
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_D"), GridView).Visible = True
                CType(Me.DetailsView1.FindControl("btnSave"), Button).Enabled = True
                'load pre-existing detail data
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_A"), GridView).DataBind()
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_B"), GridView).DataBind()
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_C"), GridView).DataBind()
                CType(Me.DetailsView1.FindControl("gvAppraisalDomains_D"), GridView).DataBind()
            Else
                'do nothing
            End If
            'Create the "Appraisal Header" record
            Dim insertResponse As Int32
            Dim observationFocus As String = CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Text
            Dim comments As String = CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text

            'save the header information
            Call SaveHeader(sessionName, selectedStaffCode, observationFocus, comments, insertResponse, False)

            'Response.Write(insertResponse) 'Response.End()
            If insertResponse >= 0 Then
                'lblStatus.Font.Bold = True
                'lblStatus.ForeColor = Drawing.Color.Green
                'lblStatus.Text = "Appraisal Record initiated for " & staffName & " (" & staffDesignation & ")"
                'retrieve the HeaderId of the most-recently-inserted/updated Appraisal Header record
                headerId = CType(Common.GetTableRows(" SELECT ResponseHeaderId FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionName & "' AND Username = '" & selectedStaffCode & "' ")(0).Item(0), Int32)
            Else
                'lblStatus.Font.Bold = True
                'lblStatus.ForeColor = Drawing.Color.Red
                'lblStatus.Text = "An error occurred and the system could not initate an Appraisal Record for " & staffName & " (" & staffDesignation & "). Please try again or contact an Administrator."
                'no Appraisal Header record was inserted/updated, so set headerId = 0
                headerId = 0
            End If
        End If
    End Sub

    Public Sub SaveHeader(ByVal sessionname As String, ByVal selectedStaffCode As String, ByVal observationFocus As String, ByVal comments As String, ByRef insertResponse As Int32, Optional ByVal updateFocusAndRemark As Boolean = True)
        Dim sqlInsert As String
        'ResponseHeaderId, SessionName, TermName, Username, ObservationFocus, Remark, Remark2, Remark3
        sqlInsert = " IF EXISTS (SELECT ResponseHeaderId FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionname & "' AND Username = '" & selectedStaffCode & "') "
        sqlInsert &= "      UPDATE dbo.HR_AppraisalDomainResponseHeader "
        sqlInsert &= "      SET SessionName = '" & sessionname & "', "
        If updateFocusAndRemark Then
            sqlInsert &= "          Username = '" & selectedStaffCode & "', "
            sqlInsert &= "          ObservationFocus = '" & observationFocus & "', "
            sqlInsert &= "          Remark = '" & comments & "' "
        Else
            sqlInsert &= "          Username = '" & selectedStaffCode & "' "
        End If
        sqlInsert &= "      WHERE SessionName = '" & sessionname & "' AND Username = '" & selectedStaffCode & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.HR_AppraisalDomainResponseHeader(SessionName, Username, ObservationFocus, Remark) "
        sqlInsert &= "      VALUES('" & sessionname & "', '" & selectedStaffCode & "', '" & observationFocus & "', '" & comments & "') "
        'Response.Write(sqlInsert) : Response.End()
        insertResponse += Common.InsertTableRow(sqlInsert)
    End Sub

    Public Function GetDomainResponse(ByVal headerId As Int32, ByVal domainId As Int32) As Int32
        Dim ret As Int32

        rowsStaffAppraisalDetails = Common.GetTableRows(" SELECT * FROM dbo.HR_AppraisalDomainResponseDetail WHERE HeaderId = " & headerId & " AND DomainId = " & domainId & " ")

        If rowsStaffAppraisalDetails.Count > 0 Then
            ret = CType(rowsStaffAppraisalDetails(0).Item("DomainResponse"), Int32)
        Else
            ret = 1
        End If

        Return ret
    End Function

    Protected Sub dsSqlMeetings_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs)
        selectedStaffCode = CType(DetailsView1.FindControl("DropDownList5"), DropDownList).SelectedValue
        headerId = CType(Common.GetTableRows(" SELECT ResponseHeaderId FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionName & "' AND Username = '" & selectedStaffCode & "' ")(0).Item(0), Int32)
        e.Command.Parameters(1).Value = headerId
    End Sub

    Protected Sub dsSqlMeetings_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceStatusEventArgs)
        CType(DetailsView1.FindControl("gvMeetingObservations"), GridView).DataBind()
    End Sub

    Protected Sub dsSqlMeetings_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs)
        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters
        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next
    End Sub

    Protected Sub gvAppraisalDomains_A_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Dim h As Int32
            If rowsStaffAppraisalHeader.Count > 0 Then
                h = CType(rowsStaffAppraisalHeader(0).Item("ResponseHeaderId"), Int32)
            Else
                h = headerId
            End If
            Dim d As Int32 = CType(rowView("DomainId"), Int32)
            CType(e.Row.FindControl("ddlRating"), DropDownList).SelectedValue = GetDomainResponse(h, d)
        End If
    End Sub

    Protected Sub gvAppraisalDomains_B_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Dim h As Int32
            If rowsStaffAppraisalHeader.Count > 0 Then
                h = CType(rowsStaffAppraisalHeader(0).Item("ResponseHeaderId"), Int32)
            Else
                h = headerId
            End If
            Dim d As Int32 = CType(rowView("DomainId"), Int32)
            CType(e.Row.FindControl("ddlRating"), DropDownList).SelectedValue = GetDomainResponse(h, d)
        End If
    End Sub

    Protected Sub gvAppraisalDomains_C_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Dim h As Int32
            If rowsStaffAppraisalHeader.Count > 0 Then
                h = CType(rowsStaffAppraisalHeader(0).Item("ResponseHeaderId"), Int32)
            Else
                h = headerId
            End If
            Dim d As Int32 = CType(rowView("DomainId"), Int32)
            CType(e.Row.FindControl("ddlRating"), DropDownList).SelectedValue = GetDomainResponse(h, d)
        End If
    End Sub

    Protected Sub gvAppraisalDomains_D_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Dim h As Int32
            If rowsStaffAppraisalHeader.Count > 0 Then
                h = CType(rowsStaffAppraisalHeader(0).Item("ResponseHeaderId"), Int32)
            Else
                h = headerId
            End If
            Dim d As Int32 = CType(rowView("DomainId"), Int32)
            CType(e.Row.FindControl("ddlRating"), DropDownList).SelectedValue = GetDomainResponse(h, d)
        End If
    End Sub

    Protected Sub DetailsView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles DetailsView1.ItemInserting
        Call btnSave_Click(sender, e)
        e.Cancel = True
    End Sub

    Protected Sub btnSave_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        selectedStaffCode = CType(DetailsView1.FindControl("DropDownList5"), DropDownList).SelectedValue
        headerId = CType(Common.GetTableRows(" SELECT ResponseHeaderId FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionName & "' AND Username = '" & selectedStaffCode & "' ")(0).Item(0), Int32)

        Dim grid_A As GridView = CType(DetailsView1.FindControl("gvAppraisalDomains_A"), GridView)
        Dim grid_B As GridView = CType(DetailsView1.FindControl("gvAppraisalDomains_B"), GridView)
        Dim grid_C As GridView = CType(DetailsView1.FindControl("gvAppraisalDomains_C"), GridView)
        Dim grid_D As GridView = CType(DetailsView1.FindControl("gvAppraisalDomains_D"), GridView)
        Dim insertResponse As Int32
        Dim observationFocus As String = CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Text
        Dim comments As String = CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Text

        'save the header information again
        Call SaveHeader(sessionName, selectedStaffCode, observationFocus, comments, insertResponse)

        Call SaveGridScores(selectedStaffCode, headerId, grid_A, insertResponse)
        Call SaveGridScores(selectedStaffCode, headerId, grid_B, insertResponse)
        Call SaveGridScores(selectedStaffCode, headerId, grid_C, insertResponse)
        Call SaveGridScores(selectedStaffCode, headerId, grid_D, insertResponse)

        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Appraisal Ratings were successfully saved."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub

    Public Sub SaveGridScores(ByVal selectedStaffCode As String, ByVal headerId As Int32, ByVal gridContainingScores As GridView, ByRef insertResponse As Int32)
        For i As Int32 = 0 To gridContainingScores.Rows.Count - 1
            'headerId, domainId, domainResponse
            Dim domainId As Int32 = gridContainingScores.DataKeys(i).Value
            Dim domainResponse As Int32 = CType(CType(gridContainingScores.Rows(i).FindControl("ddlRating"), DropDownList).SelectedValue, Int32)

            'save the scores
            Dim sqlInsert As String
            sqlInsert = " IF EXISTS (SELECT ResponseDetailId FROM dbo.HR_AppraisalDomainResponseDetail WHERE HeaderId = " & headerId & " AND DomainId = " & domainId & ") "
            sqlInsert &= "      UPDATE dbo.HR_AppraisalDomainResponseDetail "
            sqlInsert &= "      SET DomainResponse = '" & domainResponse & "' "
            sqlInsert &= "      WHERE HeaderId = " & headerId & " AND DomainId = " & domainId & " "
            sqlInsert &= "ELSE "
            sqlInsert &= "      INSERT INTO dbo.HR_AppraisalDomainResponseDetail(HeaderId, DomainId, DomainResponse) "
            sqlInsert &= "      VALUES(" & headerId & ", " & domainId & ", '" & domainResponse & "') "
            'Response.Write(sqlInsert)
            insertResponse += Common.InsertTableRow(sqlInsert)
        Next
    End Sub

    Protected Sub gvMeetingObservations_A_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialInner += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub DetailsView1_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewModeEventArgs) Handles DetailsView1.ModeChanging

    End Sub
End Class
