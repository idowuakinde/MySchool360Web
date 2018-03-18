
Partial Class modules_reports_rpt_HR_StaffCareerMovements
    Inherits System.Web.UI.Page
    Public serial As Int32, total As Double, filterText As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Select Case ddlChooser.SelectedValue
            Case "0"
                filterText = "  "
            Case Else
                filterText = " AND a.StaffId = " & ddlChooser.SelectedValue & " "
        End Select
        dsSqlGetData.SelectCommand = "SELECT a.StaffMovementId, a.EffectiveDate, a.StaffId, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName, a.FormerDesignationId, c.DesignationName as FormerDesignation, a.NewDesignationId, d.DesignationName as NewDesignation, a.MovementType, a.Remark FROM dbo.HR_Staff_Movement a INNER JOIN dbo.HR_Staff_Base b ON a.StaffId = b.StaffId INNER JOIN dbo.HR_Designation c ON a.FormerDesignationId = c.DesignationId INNER JOIN dbo.HR_Designation d ON a.NewDesignationId = d.DesignationId WHERE 1 = 1 " & filterText & " ORDER BY StaffName, EffectiveDate "
        gvUsers.DataBind()
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'total += rowView("PAYE").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub
End Class
