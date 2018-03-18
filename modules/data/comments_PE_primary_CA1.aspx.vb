
Partial Class modules_data_comments_PE_primary_CA1
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", className As String = "", assessmentType As String = "Test"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        Dim rowsClassName As System.Data.DataRowCollection = Common.GetTableRows(" SELECT ClassName FROM dbo.TEMPClass WHERE Teacher = '" & username & "' ")
        If rowsClassName.Count = 0 Then
            className = ""
        Else
            className = rowsClassName(0).Item(0).ToString
        End If
        Me.lblHeader.Text = ":: Append Physical Education Comments (Primary School, BEFORE the Mid-Term)"

        Me.dsSqlSubjects.SelectCommand = " SELECT a.CustomerId, a.DistrictCode AS ClassName, a.CustomerCode as PortalNumber, UPPER(a.LastName) + ' ' + a.FirstName AS StudentNames, b.Score_PE FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubjectScoreTeacherComment b ON a.CustomerCode = b.PortalNumber AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & TermName & "' AND b.AssessmentType = '" & assessmentType & "' INNER JOIN dbo.TEMPClass c ON a.DistrictCode = c.ClassName WHERE a.DistrictCode IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks = 'PRI') ORDER BY c.ListingOrder, a.DistrictCode, StudentNames "
        Me.dsSqlSubjects.DataBind()
    End Sub

    Protected Sub gvPEComments_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvPEComments.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
        End If
    End Sub

    Protected Sub gvPEComments_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvPEComments.RowCommand
        If e.CommandName = "Select" Then
            Dim index As Int32 = Convert.ToInt32(e.CommandArgument)
            Dim currentRow As GridViewRow = gvPEComments.Rows(index)
            'add code
            Call SavePEComments(currentRow)
        End If
    End Sub

    Public Sub SavePEComments(ByVal currentRow As GridViewRow)
        Dim insertResponse As Int32

        Dim portalNumber As String = currentRow.Cells(2).Text
        Dim scorePE As String = CType(currentRow.FindControl("txtPEComment"), TextBox).Text.Replace("'", "''")

        ''save the PE comments
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreCommentId FROM dbo.TEMPStudentSubjectScoreTeacherComment WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScoreTeacherComment "
        sqlInsert &= "      SET Score_PE = '" & scorePE & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScoreTeacherComment(PortalNumber, SessionName, TermName, AssessmentType, Score_PE) "
        sqlInsert &= "      VALUES('" & portalNumber & "','" & sessionName & "','" & TermName & "','" & assessmentType & "','" & scorePE & "')"
        'Response.Write(sqlInsert)
        insertResponse += Common.InsertTableRow(sqlInsert)
        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' PE Comments were successfully saved."
            CType(Me.gvPEComments.Rows(currentRow.RowIndex).FindControl("imgSaveConfirmation"), Image).Visible = True
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub
End Class
