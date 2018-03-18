Imports Newtonsoft.Json

Partial Class modules_bulksms_rpt_bulksms_message_history
    Inherits System.Web.UI.Page

    Public serial As Int32, grandTotalUnits As Int32

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        'Dim dt As System.Data.DataTable = Common.DeserializeJsonToDataTable(GetMessageHistory)
        Dim dt As System.Data.DataTable = GetMessageHistory()
        'Response.Write(dt.Rows.Count) : Response.End()
        Me.gvReportData.DataSource = dt
        Me.gvReportData.DataBind()
    End Sub

    Protected Function GetMessageHistory() As System.Data.DataTable
        Dim ret As New System.Data.DataTable

        Dim rowsMessageBatches As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CONVERT(int, [TimeStamp]) as id, IsNull(BatchMessageText, '') as [Message], IsNull(BatchSenderAlias, '') as Sender, " & Common.CONST_BULKSMS_INFOBIP_PRICE_PER_UNIT.ToString & " as Price, COUNT(*) AS [Count], IsNull((LEN(BatchMessageText)/" & Common.CONST_BULKSMS_CHARACTERS_PER_PAGE.ToString & ") + 1, 0) AS Pages, [TimeStamp] as Creation_Date FROM dbo.BulkSMS_MessageHistory WHERE Gateway = 'INFOBIP.CHILDVILLE' GROUP BY [TimeStamp], BatchMessageText, BatchSenderAlias ORDER BY [TimeStamp] DESC ")

        If rowsMessageBatches.Count > 0 Then
            ret = rowsMessageBatches(0).Table
        End If

        Return ret
    End Function

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvReportData.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            grandTotalUnits += (rowView("Count") * rowView("Pages"))
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            'total_label.Text = "TOTAL: N " & FormatNumber(total, 2)
        End If
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        'Server.Transfer("~\modules\reports\export_admin_enrolments.aspx")
    End Sub
End Class
