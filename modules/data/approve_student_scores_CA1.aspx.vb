
Partial Class modules_data_approve_student_scores_CA1
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", subjectShortName As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        subjectShortName = Request.QueryString("b")
        className = Request.QueryString("c")
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange") = "javascript:CopyStandardComment(this, " & Chr(34) & rowView("FirstName") & Chr(34) & ");"
            'Response.Write(CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange").ToString)
        End If
    End Sub

    Protected Sub btnSaveScores_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApprove.Click

    End Sub
End Class
