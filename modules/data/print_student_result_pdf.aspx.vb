Imports WebSupergoo.ABCpdf6

Partial Class modules_data_print_student_result_pdf
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", saveFile As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        saveFile = Request.QueryString("b")

        If saveFile = "yes" Then
            'Common.SaveStudentResultAsPDFOnServer(portalNumber, Server.MapPath("~/_pdf/results/Oxbridge_ReportCard_2012SeptemberTest_" & portalNumber & ".PDF"))
        Else
            Dim theDoc As New Doc(), theData As Byte()
            'Response.Write(theDoc.License) : Response.End()
            'theDoc.AddImageUrl("http://localhost/myschool360.oxbridge/modules/data/print_student_result.asp?a=" & portalNumber)
            theDoc.AddImageUrl("http://oxbridge.myschool360.info/modules/data/print_student_result.asp?a=" & portalNumber)
            theData = theDoc.GetData()
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
            Response.AddHeader("content-disposition", "attachment; filename=Oxbridge_ReportCard_2012SeptemberTest_" & portalNumber & ".PDF")
            Response.BinaryWrite(theData)
            theDoc = Nothing
        End If

    End Sub
End Class
