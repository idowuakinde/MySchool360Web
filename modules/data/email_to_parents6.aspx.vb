Imports WebSupergoo.ABCpdf6

Partial Class modules_data_email_to_parents6
    Inherits System.Web.UI.Page

    Public mode As String = "", filter As String = "", recipientCollection As Collection = New Collection, recipientDetails As String()
    Public portalNumber As String = "", className As String = "", defaultEmailSender As String = "", resultsPageLocation As String = ""
    Public motherEMail As String = "", fatherEmail As String = "", fromAddresses As String, toAddresses As String, ccAddresses As String, bccAddresses As String, subject As String, bodyFormat As Int32, body As String, attachment As String
    Dim sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        mode = Request.QueryString("a")
        filter = Request.QueryString("b")
        recipientCollection = Common.GetParentEmails(mode, filter)
        defaultEmailSender = Common.GetTableRows(" SELECT SettingValue FROM dbo.Core_Setting WHERE SettingTitle = 'Default E-mail Sending Address' ")(0).Item(0).ToString

        'loop through the recipientCollection collection and send emails to all qualifying parents...
        For i As Int32 = 1 To recipientCollection.Count
            recipientDetails = recipientCollection(i).ToString.Split("|")

            portalNumber = recipientDetails(0)
            motherEMail = recipientDetails(1)
            fatherEmail = recipientDetails(2)
            className = recipientDetails(3)

            fromAddresses = defaultEmailSender
            'toAddresses = "idowuakinde@yahoo.com"
            toAddresses = motherEMail '"08066032312"
            ccAddresses = fatherEmail
            bccAddresses = ""
            subject = "Your child's result for the 3rd Term After Mid-Term Assessment at Childville (Portal Number: " & portalNumber & ", Class: " & className.ToUpper & ")"
            bodyFormat = 1          '1 for text, 0 for html
            body = Common.EncodeHTML("Please find attached." & vbCrLf & vbCrLf & "From Childville Schools.")
            attachment = Server.MapPath("~/_pdf/results/Childville_ReportCard_20123rdTermEnd_" & portalNumber & ".PDF")

            'prepare the attachment (PDF result)
            Dim theDoc As New Doc(), theID As Int32

            resultsPageLocation = Common.GetStudentResultsPage2(className, "3rd Term")

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalNumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalNumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While

            For j As Integer = 1 To theDoc.PageCount
                theDoc.PageNumber = j
                theDoc.Flatten()
            Next

            theDoc.Save(attachment)
            theDoc = Nothing

            'Response.Redirect("sendmail.asp?a=" & fromAddresses & "&b=" & toAddresses & "&c=" & ccAddresses & "&d=" & bccAddresses & "&e=" & subject & "&f=" & bodyFormat & "&g=" & body & "&h=" & attachment & "")
            Call Common.SendMail(fromAddresses, toAddresses, ccAddresses, bccAddresses, subject, bodyFormat, body, attachment)
        Next

        Response.Write("E-mails sent successfully. <br /><br />Please be mindful to monitor the default sender address (" & fromAddresses & ") for notifications of occasional delivery failures.")
    End Sub
End Class
