
Partial Class modules_feedback_sendfeedback
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", serial As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
    End Sub

    Protected Sub dsSqlFeedback_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlFeedback.Inserting
        'Dim cmdParams As System.Data.Common.DbParameterCollection = e.Command.Parameters

        'For i As Int32 = 0 To cmdParams.Count - 1
        '    Trace.Warn(cmdParams(i).ParameterName, cmdParams(i).Value)
        'Next
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            CType(e.Row.FindControl("Label11"), Label).Text = Common.GetFriendlyDate(CType(rowView("TimeStamp"), Date).ToString) & ": " & CType(rowView("TimeStamp"), Date).ToLongTimeString
            'Response.Write("'" & rowView("TimeStamp").ToString & "', ") ': Response.End()
        End If
    End Sub
End Class
