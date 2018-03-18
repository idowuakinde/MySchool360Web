
Partial Class modules_feedback_managefeedback
    Inherits System.Web.UI.Page

    Public username As String = "", serial As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
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
