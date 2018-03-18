Imports WebSupergoo.ABCpdf6

Partial Class modules_data_principal_reviewteachercomments_subjects
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", subjectShortName As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        subjectShortName = Request.QueryString("b")
        className = Request.QueryString("c")
        Me.lblHeader.Text = ":: Review Teacher Comments for September Test. (SUBJECT: " & subjectShortName & ", CLASS: " & className & ")"

        If Not IsPostBack Then
            Dim scriptKey As String = "WidthHeightforPDF"
            Dim sb As StringBuilder = New StringBuilder()
            sb.AppendLine("<script>")
            sb.AppendLine("document.getElementById('" + hfHeight.ClientID + "').value = document.body.clientHeight;")
            sb.AppendLine("document.getElementById('" + hfWidth.ClientID + "').value = document.body.clientWidth;")
            sb.AppendLine("</script")

            Call Common.RegisterClientScript(Page, scriptKey, sb.ToString)
        End If
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub btnPrintAll_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintAll.Click
        Dim theDoc As New Doc, theData As Byte(), theID As Int32, intHTMLWidth As Int32

        'first of all, clear the cache...
        theDoc.HtmlOptions.PageCacheClear()

        If Convert.ToInt32(hfWidth.Value) >= Convert.ToInt32(hfHeight.Value) Then 'switch to landscape
            'apply a rotation transform
            Dim w As Double = theDoc.MediaBox.Width
            Dim h As Double = theDoc.MediaBox.Height
            Dim l As Double = theDoc.MediaBox.Left
            Dim b As Double = theDoc.MediaBox.Bottom

            theDoc.Transform.Rotate(90, l, b)
            theDoc.Transform.Translate(w, 0)
            'rotate our rectangle
            theDoc.Rect.Width = h
            theDoc.Rect.Height = w

            intHTMLWidth = hfHeight.Value * Convert.ToInt32(theDoc.Rect.Width / theDoc.Rect.Height)
            theDoc.HtmlOptions.BrowserWidth = intHTMLWidth

            theID = theDoc.GetInfoInt(theDoc.Root, "Pages")
            theDoc.SetInfo(theID, "/Rotate", "90")
        Else    'switch to portrait
            intHTMLWidth = hfHeight.Value * Convert.ToInt32(theDoc.Rect.Width / theDoc.Rect.Height)
            theDoc.HtmlOptions.BrowserWidth = intHTMLWidth
        End If

        theDoc.Page = theDoc.AddPage()
        theDoc.AddImageUrl("http://localhost/myschool360.oxbridge/modules/data/principal_reviewteachercomments_subjects.aspx?a=" & username & "&b=" & subjectShortName & "&c=" & className, True, intHTMLWidth, True)

        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Oxbridge_ReportCard_2012SeptemberTest_PrincipalReview_" & className & "_" & subjectShortName & ".PDF")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub btnPrintAll0_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPrintAll0.Click
        Call btnPrintAll_Click(sender, e)
    End Sub
End Class
