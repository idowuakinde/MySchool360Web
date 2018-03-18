Imports WebSupergoo.ABCpdf6

Partial Class modules_data_print_batch_result_allstudents
    Inherits System.Web.UI.Page

    Public serial As Int32, pageSize As Int32, pageIndex As Int32

    Protected Sub GridView5_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView5.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub btnPrintBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintBatch.Click
        Dim theDoc As New Doc(), theData As Byte()

        For i As Int32 = 0 To Me.GridView5.Rows.Count - 1
            'Dim portalnumber As String = Me.GridView5.Rows(i).Cells(1).Text
            Dim portalnumber As String = CType(Me.GridView5.Rows(i).FindControl("Label1"), Label).Text
            'Response.Write(portalnumber & "*<br />")

            theDoc.Page = theDoc.AddPage()
            'theDoc.AddImageUrl("http://localhost/myschool360.oxbridge/modules/data/print_student_result.asp?a=" & portalNumber)
            theDoc.AddImageUrl("http://oxbridge.myschool360.info/modules/data/print_student_result.asp?a=" & portalnumber)
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Oxbridge_ReportCard_2012SeptemberTest_AllStudents.pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub btnPrintBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintBatch0.Click
        Call btnPrintBatch_Click(sender, e)
    End Sub

    Protected Sub btnEmailBatch_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailBatch.Click
        Response.Redirect("email_to_parents.aspx?a=ALL")
    End Sub

    Protected Sub btnEmailBatch0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnEmailBatch0.Click
        Call btnEmailBatch_Click(sender, e)
    End Sub
End Class
