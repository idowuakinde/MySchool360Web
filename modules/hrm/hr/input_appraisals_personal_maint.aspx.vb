
Partial Class modules_hrm_hr_input_appraisals_personal_maint
    Inherits System.Web.UI.Page

    Public selectedStaffCode As String, appraisalDepartment As String, serial As Int32 = 0, serialInner As Int32 = 0, headerId As Int32 = 0
    Public staffName As String = "", staffDesignation As String = "", lblStatus As Label
    Public rowsStaffAppraisalHeader As System.Data.DataRowCollection = Common.GetTableRows(" SELECT 0 AS ResponseHeaderId ")
    Public rowsStaffAppraisalDetails As System.Data.DataRowCollection
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        selectedStaffCode = Request.QueryString("a")
        Dim rowsStaffDetails As System.Data.DataRowCollection = Common.GetTableRows(" SELECT b.Remark1 FROM dbo.HR_Staff_Base a INNER JOIN dbo.Core_Department b ON a.DepartmentId = b.DepartmentId WHERE a.StaffCode = '" & selectedStaffCode & "' ")
        If rowsStaffDetails.Count > 0 Then
            If rowsStaffDetails(0).Item(0).ToString.ToUpper = "TEACHING" Then
                appraisalDepartment = "Teaching"
                Response.Redirect("input_appraisals_personal.aspx?a=" & Request.QueryString("a") & "&b=" & Request.QueryString("b"), True)
            ElseIf rowsStaffDetails(0).Item(0).ToString.ToUpper = "ADMINISTRATIVE" Then
                appraisalDepartment = "Administrative"
                Response.Redirect("input_appraisals_personal_admin.aspx?a=" & Request.QueryString("a") & "&b=" & Request.QueryString("b"), True)
            Else
                appraisalDepartment = "Maintenance & Grounds"
            End If
        End If

        rowsStaffAppraisalHeader = Common.GetTableRows(" SELECT * FROM dbo.HR_AppraisalDomainResponseHeader WHERE SessionName = '" & sessionName & "' AND Username = '" & selectedStaffCode & "' ")
        If rowsStaffAppraisalHeader.Count > 0 Then
            headerId = CType(rowsStaffAppraisalHeader(0).Item("ResponseHeaderId"), Int32)
        End If

        Me.lblHeader.Text = "My Appraisal Form :: Year " & Now.Year.ToString
        lblStatus = CType(Me.DetailsView1.FindControl("lblStatus"), Label)

        Call LoadAppraisal()
    End Sub

    Protected Sub LoadAppraisal()
        'bind the Meetings grid
        CType(DetailsView1.FindControl("dsSqlMeetings"), SqlDataSource).SelectParameters(0).DefaultValue = sessionName
        CType(DetailsView1.FindControl("dsSqlMeetings"), SqlDataSource).SelectParameters(1).DefaultValue = selectedStaffCode
        CType(DetailsView1.FindControl("gvMeetingObservations"), GridView).DataBind()
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
                headerId = 0
            End If
            'make certain controls visible - to facilitate saving
            CType(Me.DetailsView1.FindControl("txtObservationFocus"), TextBox).Visible = True
            CType(Me.DetailsView1.FindControl("txtAppraisalComments"), TextBox).Visible = True
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_A"), GridView).Visible = True
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_B"), GridView).Visible = True
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_C"), GridView).Visible = True
            CType(Me.DetailsView1.FindControl("gvAppraisalDomains_D"), GridView).Visible = True
            CType(Me.DetailsView1.FindControl("btnSave"), Button).Enabled = True
        Else
            'do nothing
        End If
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
            CType(e.Row.FindControl("lblRating"), Label).Text = GetDomainResponse(h, d)
        End If
    End Sub

    Public Function GetDomainResponse(ByVal headerId As Int32, ByVal domainId As Int32) As Int32
        Dim ret As Int32

        rowsStaffAppraisalDetails = Common.GetTableRows(" SELECT * FROM dbo.HR_AppraisalDomainResponseDetail WHERE HeaderId = " & headerId & " AND DomainId = " & domainId & " ")

        If rowsStaffAppraisalDetails.Count > 0 Then
            ret = CType(rowsStaffAppraisalDetails(0).Item("DomainResponse"), Int32)
        Else
            ret = 0
        End If

        Return ret
    End Function

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
            CType(e.Row.FindControl("lblRating"), Label).Text = GetDomainResponse(h, d)
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
            CType(e.Row.FindControl("lblRating"), Label).Text = GetDomainResponse(h, d)
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
            CType(e.Row.FindControl("lblRating"), Label).Text = GetDomainResponse(h, d)
        End If
    End Sub

    Protected Sub gvMeetingObservations_A_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialInner += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub dsSqlMeetings_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceSelectingEventArgs)
        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters
        'For Each p As System.Data.Common.DbParameter In cmdParams
        '    Trace.Warn(p.ParameterName, p.Value)
        'Next
    End Sub
End Class
