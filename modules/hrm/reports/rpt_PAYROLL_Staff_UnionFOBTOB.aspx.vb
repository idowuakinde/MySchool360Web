
Partial Class modules_reports_rpt_PAYROLL_Staff_UnionFOBTOB
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Double, total2 As Double, total3 As Double
    Public activeMonth As Int32, activeYear As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        activeMonth = Common.GetLastPayrollMonth() : activeYear = Common.GetLastPayrollYear()
        dsSqlGetData.SelectCommand = "SELECT a.PayrollArchiveId, a.StaffCode AS StaffCode, a.StaffName, c.LocationName, d.JobLevelName, a.UnionDues, a.FOBTOB FROM dbo.HR_PAYROLL_Archive_Shadow a INNER JOIN dbo.HR_Staff_Base b ON a.StaffCode = b.StaffCode iNNER JOIN dbo.HR_Location c ON b.LocationId = c.LocationId INNER JOIN dbo.HR_JobLevel d ON b.JobLevelId = d.JobLevelId WHERE a.EffectiveMonth = " & activeMonth & " AND EffectiveYear = " & activeYear & " ORDER BY a.StaffName "
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("UnionDues").ToString
            total2 += rowView("FOBTOB").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            total3 = total + total2
        End If
    End Sub

    Protected Sub ddlChooser_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlChooser.SelectedIndexChanged
        Select Case Me.ddlChooser.SelectedValue.ToUpper
            Case "ALL"
                Me.gvUsers.Columns(5).Visible = True
                Me.gvUsers.Columns(6).Visible = True
            Case "UNION"
                Me.gvUsers.Columns(5).Visible = True
                Me.gvUsers.Columns(6).Visible = False
            Case "FOBTOB"
                Me.gvUsers.Columns(5).Visible = False
                Me.gvUsers.Columns(6).Visible = True
        End Select
    End Sub
End Class
