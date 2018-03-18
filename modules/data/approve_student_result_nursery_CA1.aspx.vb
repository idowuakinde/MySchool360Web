
Partial Class modules_data_approve_student_result_nursery_CA1
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, innerSerial As Int32 = 0, innerTotal As Int32 = 0, innerAverage As Int32 = 0, portalNumber As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "1st Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString
    Public callbackURL As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not IsPostBack Then
            callbackURL = Request.UrlReferrer.OriginalString
            hidCallbackURL.Value = callbackURL
            'Response.Write("'" & callbackURL & "'") : Response.End()
        End If
        portalNumber = Request.QueryString("a")
        Dim rowsClassName As System.Data.DataRowCollection = Common.GetTableRows(" SELECT DistrictCode FROM dbo.TEMPCustomers WHERE CustomerCode = '" & portalNumber & "' ")
        If rowsClassName.Count = 0 Then
            className = ""
        Else
            className = rowsClassName(0).Item(0).ToString
        End If

        Me.dsSqlStudents.SelectCommand = " SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder FROM dbo.TEMPCustomers a WHERE CustomerCode = '" & portalNumber & "' ORDER BY PortalNumber "
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = className
        Me.dsSqlStudents.DataBind()

        Me.dsSqlSubjects.SelectCommand = " SELECT CustomerId, CustomerCode as PortalNumber, UPPER(d.SubjectName) AS SubjectName, IsNull(ScoreId, 0) AS ScoreId, ISNULL(c.Score, 0) AS Score, REPLACE(ISNULL(c.Comment, ''), '''''', '''') AS Comment FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber LEFT JOIN dbo.TEMPStudentSubjectScore c ON b.PortalNumber = c.PortalNumber AND b.SubjectShortName = c.SubjectShortName AND b.SessionName = c.SessionName AND b.TermName = c.TermName AND AssessmentType = @AssessmentType INNER JOIN dbo.TEMPSubject d ON b.SubjectShortName = d.ShortName WHERE a.CustomerCode = @PortalNumber AND ISNULL(c.Score, 0) >= 0 AND b.SessionName = @SessionName AND b.TermName = @TermName ORDER BY StudentSubjectId "
        Me.dsSqlSubjects.SelectParameters(0).DefaultValue = assessmentType
        Me.dsSqlSubjects.SelectParameters(1).DefaultValue = Me.gvMaster.SelectedValue
        Me.dsSqlSubjects.SelectParameters(2).DefaultValue = sessionName
        Me.dsSqlSubjects.SelectParameters(3).DefaultValue = TermName
        Me.dsSqlSubjects.DataBind()
    End Sub

    Protected Sub gvMaster_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMaster.RowCommand
        If e.CommandName = "Select" Then
            Dim index As Int32 = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = gvMaster.Rows(index)
            'add code
            Call SaveComments(row)
        End If
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Me.gvMaster.SelectedIndex = e.Row.RowIndex
        End If
    End Sub

    Protected Sub gvDetail_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        If e.Row.RowType = DataControlRowType.DataRow Then
            innerSerial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            innerTotal += (rowView("Score"))
        End If
    End Sub

    Public Sub SaveComments(ByVal currentRow As GridViewRow)
        Dim insertResponse As Int32

        ''save the individual subject comments
        Dim sqlUpdate As String
        Dim innerGrid As GridView = CType(currentRow.FindControl("gvDetail"), GridView)
        Dim innerGridDataSource As SqlDataSource = CType(innerGrid.DataSourceObject, SqlDataSource)
        Dim subjectScoreId As Int32, subjectComment As String
        Dim dvSource As New System.Data.DataView : dvSource = innerGridDataSource.Select(New DataSourceSelectArguments())

        For i As Int32 = 0 To dvSource.Table.Rows.Count - 1
            subjectScoreId = CType(dvSource.Table.Rows(i).Item("ScoreId"), Int32) ' innerGrid.data ' CType(innerGrid.Rows(i).Cells(6).Text, Int32) 'CType(innerGrid.DataKeys(0).Value, Int32)
            subjectComment = CType(innerGrid.Rows(i).FindControl("txtSubjectComment"), TextBox).Text.Replace("'", "''")

            sqlUpdate = "       UPDATE dbo.TEMPStudentSubjectScore "
            sqlUpdate &= "      SET Comment = '" & subjectComment & "' "
            sqlUpdate &= "      WHERE ScoreId = " & subjectScoreId & " "
            'Response.Write(sqlUpdateSubjectComment & "<br />")
            insertResponse += Common.UpdateTableRow(sqlUpdate)
        Next

        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Scores and all Comments were successfully saved."
            'navigate away from this page (ONLY ON SUCCESS!)
            Response.Redirect(hidCallbackURL.Value, True)
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub

    Protected Sub dsSqlSubjects_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.SqlDataSourceCommandEventArgs) Handles dsSqlSubjects.Updating
        'Dim cmdParams As System.Data.SqlClient.SqlParameterCollection = e.Command.Parameters

        'For Each cp As System.Data.SqlClient.SqlParameter In cmdParams
        '    Trace.Warn(cp.ParameterName, cp.Value)
        'Next
    End Sub
End Class
