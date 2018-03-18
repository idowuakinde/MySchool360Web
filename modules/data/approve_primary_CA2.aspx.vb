Imports WebSupergoo.ABCpdf6

Partial Class modules_data_approve_primary_CA2
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", subjectShortName As String = "", className As String = "", assessmentType As String = "Exam"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        subjectShortName = Request.QueryString("b")
        className = Request.QueryString("c")
        Me.lblHeader.Text = ":: Review Students' Scores for End of Term. (SUBJECT: " & subjectShortName & ", CLASS: " & className & ")"
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            'CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange") = "javascript:CopyStandardComment(this, " & Chr(34) & rowView("FirstName") & Chr(34) & ");"
            'Response.Write(CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange").ToString)
        End If
    End Sub

    Protected Sub btnReject_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnReject.Click
        Dim updateResponse As Int32
        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim scoreId As Int32 = Me.gvMaster.Rows(i).Cells(4).Text

            'approve the scores
            Dim sqlUpdate As String = " UPDATE dbo.TEMPStudentSubjectScore2 SET Remark1 = NULL WHERE ScoreId = " & scoreId & " "
            'Response.Write(sqlUpdate)
            updateResponse += Common.UpdateTableRow(sqlUpdate)
        Next

        If updateResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Scores were successfully rejected."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Scores Approval operation. Please try again or contact an Administrator."
        End If
        Me.gvMaster.DataBind()
        'Response.Redirect("~/modules/data/approve_step1.aspx")
    End Sub

    Protected Sub btnApprove_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnApprove.Click
        Dim updateResponse As Int32
        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim scoreId As Int32 = Me.gvMaster.Rows(i).Cells(4).Text

            'approve the scores
            Dim sqlUpdate As String = " UPDATE dbo.TEMPStudentSubjectScore2 SET Remark1 = 'Approved' WHERE ScoreId = " & scoreId & " "
            'Response.Write(sqlUpdate)
            updateResponse += Common.UpdateTableRow(sqlUpdate)
        Next

        If updateResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Scores were successfully approved."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Scores Approval operation. Please try again or contact an Administrator."
        End If
        Me.gvMaster.DataBind()
    End Sub

    Protected Sub btnSaveComments_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveComments.Click
        Dim saveResponse As Int32

        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim portalnumber As String = Me.gvMaster.Rows(i).Cells(5).Text

            'save the Principal's comment
            saveResponse += Common.SavePrincipalComment(portalnumber, sessionName, TermName, assessmentType, Me.txtPrincipalComments.Text)
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

    Protected Sub btnEmailBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailBatch.Click
        Response.Redirect("email_to_parents2.aspx?a=subject&b=" & subjectShortName)
    End Sub

    Protected Sub btnPrintBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintBatch.Click
        Dim theDoc As New Doc(), theData As Byte()

        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim portalnumber As String = Me.gvMaster.Rows(i).Cells(5).Text

            theDoc.Page = theDoc.AddPage()
            'theDoc.AddImageUrl("http://localhost/myschool360.childville/modules/data/print_student_result2.asp?a=" & portalNumber)
            theDoc.AddImageUrl("http://childville.myschool360.info/modules/data/print_student_result2.asp?a=" & portalnumber)
        Next
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_2012EndOfTermReport_" & className & "_" & subjectShortName & ".PDF")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub btnPrintBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintBatch0.Click
        Call btnPrintBatch_Click(sender, e)
    End Sub

    Protected Sub btnEmailBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailBatch0.Click
        Call btnEmailBatch_Click(sender, e)
    End Sub
End Class
