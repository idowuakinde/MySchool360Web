Imports WebSupergoo.ABCpdf6

Partial Class modules_data_print_batch_result_classes_step2
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        className = Request.QueryString("a")
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub btnPrintBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintBatch.Click
        Dim theDoc As New Doc(), theData As Byte()

        For i As Int32 = 0 To Me.gvMaster.Rows.Count - 1
            Dim portalnumber As String = Me.gvMaster.Rows(i).Cells(3).Text
            'Dim portalnumber As String = CType(Me.gvMaster.Rows(i).FindControl("Label1"), Label).Text
            'Response.Write(portalnumber & "*<br />")

            theDoc.Page = theDoc.AddPage()
            'theDoc.AddImageUrl("http://localhost/myschool360.oxbridge/modules/data/print_student_result.asp?a=" & portalNumber)
            theDoc.AddImageUrl("http://oxbridge.myschool360.info/modules/data/print_student_result.asp?a=" & portalnumber)
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Oxbridge_ReportCard_2012SeptemberTest_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub btnPrintBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintBatch0.Click
        Call btnPrintBatch_Click(sender, e)
    End Sub

    Protected Sub btnEmailBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailBatch.Click
        Response.Redirect("email_to_parents.aspx?a=class&b=" & className)
    End Sub

    Protected Sub btnEmailBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailBatch0.Click
        Call btnEmailBatch_Click(sender, e)
    End Sub
End Class
