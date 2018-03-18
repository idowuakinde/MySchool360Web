
Partial Class modules_data_principal_comments_subjects_step3
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", subjectShortName As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        subjectShortName = Request.QueryString("b")
        className = Request.QueryString("c")
        Me.lblHeader.Text = ":: Please Enter Principal's Comments for September Test. (SUBJECT: " & subjectShortName & ", CLASS: " & className & ")"
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange") = "javascript:CopyStandardComment(this, " & Chr(34) & rowView("FirstName") & Chr(34) & ");"
            'Response.Write(CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange").ToString)
        End If
    End Sub

    Protected Sub btnSaveComments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveComments.Click
        Dim saveResponse As Int32

        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim portalnumber As String = Me.gvMaster.Rows(i).Cells(4).Text

            'save the Principal's comment
            saveResponse += Common.SavePrincipalComment(portalnumber, sessionName, TermName, "Test", Me.txtPrincipalComments.Text.Replace("'", "''"))
        Next

        If saveResponse > 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Principal's Comments were successfully saved."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "Sorry. An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
        Me.gvMaster.DataBind()
        Me.txtPrincipalComments.Text = ""
    End Sub
End Class
