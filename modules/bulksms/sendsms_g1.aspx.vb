Imports System.IO
Imports System.Net
Imports System.Data

Partial Class modules_bulksms_sendsms_g1
    Inherits System.Web.UI.Page

    Public senderAlias As String = "", recipients As String = "", messageType As String = "", messageText As String = ""
    Public balanceNaira As Double = 0, balanceUnits As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Call ShowBalance()

        Dim defaultSenderAlias As String = CType(Common.GetTableRows(" SELECT ModuleName, SettingTitle, SettingValue FROM dbo.Core_Setting ")(5).Item(2), String)
        CType(Me.dvNewStudent.FindControl("txtAlias"), TextBox).Text = defaultSenderAlias
    End Sub

    Protected Sub dvNewStudent_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertedEventArgs) Handles dvNewStudent.ItemInserted
        Call ShowBalance()
    End Sub

    Protected Sub dvNewStudent_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.DetailsViewInsertEventArgs) Handles dvNewStudent.ItemInserting
        senderAlias = CType(dvNewStudent.FindControl("txtAlias"), TextBox).Text
        recipients = CType(dvNewStudent.FindControl("txtRecipients"), TextBox).Text
        messageType = CType(dvNewStudent.FindControl("ddlMessageType"), DropDownList).SelectedValue
        messageText = CType(dvNewStudent.FindControl("txtMessageText"), TextBox).Text

        Dim ret As String = SendSMS(senderAlias, recipients, messageText)
        Select Case ret
            Case "0"
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Green
                lblStatus.Text = "Congratulations! BULK SMS Message(s) sent successfully."
            Case Else
                lblStatus.Font.Bold = True
                lblStatus.ForeColor = Drawing.Color.Red
                lblStatus.Text = "An error occurred during the BULK SMS Operation. Please try again or contact an Administrator."
        End Select
    End Sub

    Protected Function SendSMS(ByVal senderAlias As String, ByVal recipients As String, ByVal messageText As String) As String
        'Url Encode message
        Dim WebResponseString As String = ""
        Dim batchCumulativeStatusCode As Int32 = 0
        Dim URL As String = ""

        If messageText.Length <= Common.CONST_BULKSMS_CHARACTERS_PER_PAGE Then  '160 xters
            messageText = HttpUtility.UrlEncode(messageText)
            'simple SMS
            URL = "http://api.infobip.com/api/v3/sendsms/plain?user=" & Common.CONST_BULKSMS_INFOBIP_USERNAME & "&password=" & Common.CONST_BULKSMS_INFOBIP_PASSWORD & "&sender=" & senderAlias & "&SMSText=" & messageText & "&GSM=" & recipients
        Else
            messageText = HttpUtility.UrlEncode(messageText)
            'long SMS
            URL = "http://api.infobip.com/api/v3/sendsms/plain?user=" & Common.CONST_BULKSMS_INFOBIP_USERNAME & "&password=" & Common.CONST_BULKSMS_INFOBIP_PASSWORD & "&sender=" & senderAlias & "&SMSText=" & messageText & "&GSM=" & recipients & "&type=longSMS"
        End If

        Try
            Dim xmlDoc As New System.Xml.XmlDocument
            Dim xmlTextReader As New System.Xml.XmlTextReader(URL)

            xmlDoc.Load(xmlTextReader)

            Dim messageResponseStatus As String = "", messageResponseId As String = "", messageResponseDestination As String = ""
            With xmlDoc.DocumentElement
                For i As Int32 = 0 To .ChildNodes.Count - 1
                    messageResponseStatus = .ChildNodes(i).ChildNodes(0).InnerXml
                    batchCumulativeStatusCode += CType(messageResponseStatus, Int32)
                    messageResponseId = .ChildNodes(i).ChildNodes(1).InnerXml
                    messageResponseDestination = .ChildNodes(i).ChildNodes(2).InnerXml

                    'save a log in the Message History
                    Dim insertSQLStatement As String
                    insertSQLStatement = " INSERT INTO dbo.BulkSMS_MessageHistory(Gateway, MessageId, MessageStatus, MessageDestination, TimeStamp, BatchSenderAlias, BatchRecipients, BatchMessageType, BatchMessageText) "
                    insertSQLStatement &= " VALUES('INFOBIP.CHILDVILLE', '" & messageResponseId & "', '" & messageResponseStatus & "', '" & messageResponseDestination & "','" & Now & "','" & senderAlias & "','" & recipients & "','0','" & HttpUtility.UrlDecode(messageText) & "') "
                    Call Common.InsertTableRow(insertSQLStatement)
                Next
            End With

            WebResponseString = batchCumulativeStatusCode.ToString

            'Response.Write(WebResponseString) 'Display Response.
        Catch ex As Exception
            WebResponseString = "Request Timeout" 'If any exception occurs.
            'Response.Write(WebResponseString)
        End Try

        Return WebResponseString
    End Function

    Protected Function CheckBalance() As String
        Dim WebRequest As Net.WebRequest 'object for WebRequest
        Dim WebResponse As Net.WebResponse 'object for WebResponse
        Dim WebResponseString As String = ""
        Dim URL As String = "http://api.infobip.com/api/command?username=" & Common.CONST_BULKSMS_INFOBIP_USERNAME & "&password=" & Common.CONST_BULKSMS_INFOBIP_PASSWORD & "&cmd=CREDITS"
        WebRequest = Net.HttpWebRequest.Create(URL) 'Hit URL Link
        WebRequest.Timeout = 25000
        Try
            WebResponse = WebRequest.GetResponse 'Get Response
            Dim reader As IO.StreamReader = New IO.StreamReader(WebResponse.GetResponseStream)
            'Read Response and store in variable
            WebResponseString = reader.ReadToEnd()
            WebResponse.Close()
            'Response.Write(WebResponseString) 'Display Response.
        Catch ex As Exception
            WebResponseString = "Request Timeout" 'If any exception occurs.
            'Response.Write(WebResponseString)
        End Try

        Return WebResponseString
    End Function

    Private Sub ShowBalance()
        Dim balance As String = CheckBalance()
        If balance.ToUpper = "REQUEST TIMEOUT" Then
            Me.lblBalance.Text = balance
        Else
            balanceNaira = CType(balance / 100, Double)
            balanceUnits = balanceNaira / Common.CONST_BULKSMS_INFOBIP_PRICE_PER_UNIT

            Me.lblBalance.Text = FormatNumber(balanceUnits, 0).ToString & " SMS units remaining. 160 characters = 1 SMS unit."
            If balanceUnits > Common.CONST_BULKSMS_REFILL_LEVEL Then
                Me.lblBalance.ForeColor = Drawing.Color.Green
            Else
                Me.lblBalance.ForeColor = Drawing.Color.Red
            End If
        End If
    End Sub

    Protected Sub btnSendMessage_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.dvNewStudent.InsertItem(True)
    End Sub
End Class
