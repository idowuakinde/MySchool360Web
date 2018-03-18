
Partial Class modules_reports_rpt_Prov_Overtime
    Inherits System.Web.UI.Page

    Public serial As Int32, total As Int32, total2 As Int32, total3 As Int32, total4 As Int32

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            total += rowView("HoursWeekday").ToString
            total2 += rowView("HoursWeekend").ToString
            total3 += rowView("DaysWorked").ToString
            total4 += rowView("NightsWorked").ToString
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Dim activeMonth As Int32 = CType(Request.QueryString("a"), Int32)
        dsSqlGetData.SelectCommand = "SELECT a.StaffOvertimeId AS PayrollArchiveId, b.StaffCode, RTRIM(LTRIM(UPPER(IsNull(b.Surname,'')) + ' ' + IsNull(b.OtherNames,''))) AS StaffName, IsNull(a.HoursWeekday, 0) as HoursWeekday, IsNull(a.HoursWeekend, 0) as HoursWeekend, IsNull(a.DaysWorked, 0) as DaysWorked, IsNull(a.NightsWorked, 0) as NightsWorked FROM dbo.HR_PAYROLL_Staff_Overtime a INNER JOIN dbo.HR_Staff_Base b ON a.Remark = b.StaffCode WHERE EffectiveMonth = " & activemonth & " AND EffectiveYear = year(getdate()) ORDER BY a.StaffName "
    End Sub
End Class
