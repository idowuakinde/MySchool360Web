Imports WebSupergoo.ABCpdf6

Partial Class modules_data_print_student_result_prenursery_CA2_pdf
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", saveFile As String = "", sessionName As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        saveFile = Request.QueryString("b")
        If Request.QueryString("c") = "" Then
            sessionName = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
        Else
            sessionName = Request.QueryString("c")
        End If

        If saveFile = "yes" Then
            'Common.SaveStudentResultAsPDFOnServer(portalNumber, Server.MapPath("~/_pdf/results/Oxbridge_ReportCard_2012SeptemberTest_" & portalNumber & ".PDF"))
        Else
            Dim theDoc As New Doc(), theData As Byte(), theID As Int32

            'Response.Write(theDoc.License) : Response.End()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/modules/data/print_student_result_prenursery_CA2.aspx?a=" & portalNumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/modules/data/print_student_result_prenursery_CA2.aspx?a=" & portalNumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While

            For i As Integer = 1 To theDoc.PageCount
                theDoc.PageNumber = i
                theDoc.Flatten()
            Next

            theData = theDoc.GetData()
            Response.ContentType = "application/pdf"
            Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
            Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20121stTermEnd_" & portalNumber & ".PDF")
            Response.BinaryWrite(theData)
            theDoc = Nothing
        End If

    End Sub
End Class
