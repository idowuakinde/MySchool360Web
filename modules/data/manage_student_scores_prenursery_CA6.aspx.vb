
Partial Class modules_data_manage_student_scores_prenursery_CA6
    Inherits System.Web.UI.Page

    Public serialNumber As Int32 = 0, username As String = "", subjectShortName As String = "", className As String = "", assessmentType As String = "Test2"
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public TermName As String = "3rd Term"  'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        subjectShortName = Request.QueryString("b")
        className = Request.QueryString("c")
        Me.lblHeader.Text = ":: View/Edit Students' Scores AFTER the Mid-Term Break. (CLASS: " & className & ")"

        Me.dsSqlStudents.SelectCommand = "SELECT CustomerId, RefCode, DistrictCode as ClassName, CustomerCode as PortalNumber, FirstName, LastName, SyncStatus as Gender, Activated as Boarder, ISNULL(c.ScoreA1, 0) AS ScoreA1, ISNULL(c.ScoreA2, 0) AS ScoreA2, ISNULL(c.ScoreA3, 0) AS ScoreA3, ISNULL(c.ScoreA4, 0) AS ScoreA4, ISNULL(c.ScoreA5, 0) AS ScoreA5, ISNULL(c.ScoreA6, 0) AS ScoreA6, ISNULL(c.ScoreB1, 0) AS ScoreB1, ISNULL(c.ScoreB2, 0) AS ScoreB2, ISNULL(c.ScoreB3, 0) AS ScoreB3, ISNULL(c.ScoreB4, 0) AS ScoreB4, ISNULL(c.ScoreC1, 0) AS ScoreC1, ISNULL(c.ScoreC2, 0) AS ScoreC2, ISNULL(c.ScoreC3, 0) AS ScoreC3, ISNULL(c.ScoreD1, 0) AS ScoreD1, ISNULL(c.ScoreD2, 0) AS ScoreD2, ISNULL(c.ScoreD3, 0) AS ScoreD3, ISNULL(c.ScoreD4, 0) AS ScoreD4, ISNULL(c.ScoreD5, 0) AS ScoreD5, ISNULL(c.ScoreD6, 0) AS ScoreD6, ISNULL(c.ScoreD7, 0) AS ScoreD7, ISNULL(c.ScoreD8, 0) AS ScoreD8, ISNULL(c.ScoreD9, 0) AS ScoreD9, ISNULL(c.ScoreD10, 0) AS ScoreD10, ISNULL(c.ScoreE1, 0) AS ScoreE1, ISNULL(c.ScoreE2, 0) AS ScoreE2, ISNULL(c.ScoreE3, 0) AS ScoreE3, ISNULL(c.ScoreE4, 0) AS ScoreE4, ISNULL(c.ScoreE5, 0) AS ScoreE5, ISNULL(c.ScoreE6, 0) AS ScoreE6, ISNULL(c.ScoreE7, 0) AS ScoreE7, ISNULL(c.ScoreE8, 0) AS ScoreE8, ISNULL(c.ScoreE9, 0) AS ScoreE9, ISNULL(c.ScoreE10, 0) AS ScoreE10, ISNULL(c.ScoreF1, 0) AS ScoreF1, ISNULL(c.ScoreF2, 0) AS ScoreF2, ISNULL(c.ScoreF3, 0) AS ScoreF3, ISNULL(c.ScoreF4, 0) AS ScoreF4, ISNULL(c.ScoreG1, 0) AS ScoreG1, ISNULL(c.ScoreG2, 0) AS ScoreG2, ISNULL(c.Comment, '') as Comment FROM dbo.TEMPCustomers a LEFT JOIN dbo.TEMPStudentSubjectScore_Nursery2 c ON a.CustomerCode = c.PortalNumber AND c.SessionName = @SessionName AND c.TermName = @TermName AND c.AssessmentType = @AssessmentType WHERE (a.DistrictCode = 'Playgroup' OR a.DistrictCode = 'Pre-Nursery') AND a.DistrictCode = @ClassName ORDER BY CustomerCode"
        Me.dsSqlStudents.SelectParameters(0).DefaultValue = sessionName
        Me.dsSqlStudents.SelectParameters(1).DefaultValue = TermName
        Me.dsSqlStudents.SelectParameters(2).DefaultValue = assessmentType
        Me.dsSqlStudents.SelectParameters(3).DefaultValue = className
    End Sub

    Protected Sub gvMaster_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles gvMaster.RowCommand
        If e.CommandName = "Select" Then
            Dim index As Int32 = Convert.ToInt32(e.CommandArgument)
            Dim row As GridViewRow = gvMaster.Rows(index)

            'add code
            Call SaveScores(row)
        End If
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serialNumber += 1
            CType(e.Row.FindControl("lblPagePosition"), Label).Text = "Current Page: " & gvMaster.PageIndex + 1 & " of " & gvMaster.PageCount
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            CType(e.Row.FindControl("lstCommentSelector"), ListBox).Attributes.Item("OnChange") = "javascript:CopyStandardComment(this, " & Chr(34) & rowView("FirstName") & Chr(34) & ");"
        End If
    End Sub

    Public Sub SaveScores(ByVal currentRow As GridViewRow)
        Dim insertResponse As Int32

        Dim portalNumber As String = CType(currentRow.FindControl("lblPortalNumber"), Label).Text
        Dim scoreA1 As Int32 = CType(currentRow.FindControl("ddlA1"), DropDownList).SelectedValue
        Dim scoreA2 As Int32 = CType(currentRow.FindControl("ddlA2"), DropDownList).SelectedValue
        Dim scoreA3 As Int32 = CType(currentRow.FindControl("ddlA3"), DropDownList).SelectedValue
        Dim scoreA4 As Int32 = CType(currentRow.FindControl("ddlA4"), DropDownList).SelectedValue
        Dim scoreA5 As Int32 = CType(currentRow.FindControl("ddlA5"), DropDownList).SelectedValue
        Dim scoreA6 As Int32 = CType(currentRow.FindControl("ddlA6"), DropDownList).SelectedValue
        Dim scoreB1 As Int32 = CType(currentRow.FindControl("ddlB1"), DropDownList).SelectedValue
        Dim scoreB2 As Int32 = CType(currentRow.FindControl("ddlB2"), DropDownList).SelectedValue
        Dim scoreB3 As Int32 = CType(currentRow.FindControl("ddlB3"), DropDownList).SelectedValue
        Dim scoreB4 As Int32 = CType(currentRow.FindControl("ddlB4"), DropDownList).SelectedValue
        Dim scoreC1 As Int32 = CType(currentRow.FindControl("ddlC1"), DropDownList).SelectedValue
        Dim scoreC2 As Int32 = CType(currentRow.FindControl("ddlC2"), DropDownList).SelectedValue
        Dim scoreC3 As Int32 = CType(currentRow.FindControl("ddlC3"), DropDownList).SelectedValue
        Dim scoreD1 As Int32 = CType(currentRow.FindControl("ddlD1"), DropDownList).SelectedValue
        Dim scoreD2 As Int32 = CType(currentRow.FindControl("ddlD2"), DropDownList).SelectedValue
        Dim scoreD3 As Int32 = CType(currentRow.FindControl("ddlD3"), DropDownList).SelectedValue
        Dim scoreD4 As Int32 = CType(currentRow.FindControl("ddlD4"), DropDownList).SelectedValue
        Dim scoreD5 As Int32 = CType(currentRow.FindControl("ddlD5"), DropDownList).SelectedValue
        Dim scoreD6 As Int32 = CType(currentRow.FindControl("ddlD6"), DropDownList).SelectedValue
        Dim scoreD7 As Int32 = CType(currentRow.FindControl("ddlD7"), DropDownList).SelectedValue
        Dim scoreD8 As Int32 = CType(currentRow.FindControl("ddlD8"), DropDownList).SelectedValue
        Dim scoreD9 As Int32 = CType(currentRow.FindControl("ddlD9"), DropDownList).SelectedValue
        Dim scoreD10 As Int32 = CType(currentRow.FindControl("ddlD10"), DropDownList).SelectedValue
        Dim scoreE1 As Int32 = CType(currentRow.FindControl("ddlE1"), DropDownList).SelectedValue
        Dim scoreE2 As Int32 = CType(currentRow.FindControl("ddlE2"), DropDownList).SelectedValue
        Dim scoreE3 As Int32 = CType(currentRow.FindControl("ddlE3"), DropDownList).SelectedValue
        Dim scoreE4 As Int32 = CType(currentRow.FindControl("ddlE4"), DropDownList).SelectedValue
        Dim scoreE5 As Int32 = CType(currentRow.FindControl("ddlE5"), DropDownList).SelectedValue
        Dim scoreE6 As Int32 = CType(currentRow.FindControl("ddlE6"), DropDownList).SelectedValue
        Dim scoreE7 As Int32 = CType(currentRow.FindControl("ddlE7"), DropDownList).SelectedValue
        Dim scoreE8 As Int32 = CType(currentRow.FindControl("ddlE8"), DropDownList).SelectedValue
        Dim scoreE9 As Int32 = CType(currentRow.FindControl("ddlE9"), DropDownList).SelectedValue
        Dim scoreE10 As Int32 = CType(currentRow.FindControl("ddlE10"), DropDownList).SelectedValue
        Dim scoreF1 As Int32 = CType(currentRow.FindControl("ddlF1"), DropDownList).SelectedValue
        Dim scoreF2 As Int32 = CType(currentRow.FindControl("ddlF2"), DropDownList).SelectedValue
        Dim scoreF3 As Int32 = CType(currentRow.FindControl("ddlF3"), DropDownList).SelectedValue
        Dim scoreF4 As Int32 = CType(currentRow.FindControl("ddlF4"), DropDownList).SelectedValue
        Dim scoreG1 As Int32 = CType(currentRow.FindControl("ddlG1"), DropDownList).SelectedValue
        Dim scoreG2 As Int32 = CType(currentRow.FindControl("ddlG2"), DropDownList).SelectedValue
        Dim comment As String = CType(currentRow.FindControl("txtAddSubjectComment"), TextBox).Text.Replace("'", "''")

        'save the scores
        Dim sqlInsert As String
        sqlInsert = " IF EXISTS (SELECT ScoreId FROM dbo.TEMPStudentSubjectScore_Nursery2 WHERE PortalNumber = '" & portalNumber & "' AND Remark1 = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "') "
        sqlInsert &= "      UPDATE dbo.TEMPStudentSubjectScore_Nursery2 "
        sqlInsert &= "      SET Remark1 = '" & subjectShortName & "', "
        sqlInsert &= "          ScoreA1 = " & scoreA1 & ", "
        sqlInsert &= "          scoreA2 = " & scoreA2 & ", "
        sqlInsert &= "          scoreA3 = " & scoreA3 & ", "
        sqlInsert &= "          scoreA4 = " & scoreA4 & ", "
        sqlInsert &= "          scoreA5 = " & scoreA5 & ", "
        sqlInsert &= "          scoreA6 = " & scoreA6 & ", "
        sqlInsert &= "          scoreB1 = " & scoreB1 & ", "
        sqlInsert &= "          scoreB2 = " & scoreB2 & ", "
        sqlInsert &= "          scoreB3 = " & scoreB3 & ", "
        sqlInsert &= "          scoreB4 = " & scoreB4 & ", "
        sqlInsert &= "          scoreC1 = " & scoreC1 & ", "
        sqlInsert &= "          scoreC2 = " & scoreC2 & ", "
        sqlInsert &= "          scoreC3 = " & scoreC3 & ", "
        sqlInsert &= "          scoreD1 = " & scoreD1 & ", "
        sqlInsert &= "          scoreD2 = " & scoreD2 & ", "
        sqlInsert &= "          scoreD3 = " & scoreD3 & ", "
        sqlInsert &= "          scoreD4 = " & scoreD4 & ", "
        sqlInsert &= "          scoreD5 = " & scoreD5 & ", "
        sqlInsert &= "          scoreD6 = " & scoreD6 & ", "
        sqlInsert &= "          scoreD7 = " & scoreD7 & ", "
        sqlInsert &= "          scoreD8 = " & scoreD8 & ", "
        sqlInsert &= "          scoreD9 = " & scoreD9 & ", "
        sqlInsert &= "          scoreD10 = " & scoreD10 & ", "
        sqlInsert &= "          scoreE1 = " & scoreE1 & ", "
        sqlInsert &= "          scoreE2 = " & scoreE2 & ", "
        sqlInsert &= "          scoreE3 = " & scoreE3 & ", "
        sqlInsert &= "          scoreE4 = " & scoreE4 & ", "
        sqlInsert &= "          scoreE5 = " & scoreE5 & ", "
        sqlInsert &= "          scoreE6 = " & scoreE6 & ", "
        sqlInsert &= "          scoreE7 = " & scoreE7 & ", "
        sqlInsert &= "          scoreE8 = " & scoreE8 & ", "
        sqlInsert &= "          scoreE9 = " & scoreE9 & ", "
        sqlInsert &= "          scoreE10 = " & scoreE10 & ", "
        sqlInsert &= "          scoreF1 = " & scoreF1 & ", "
        sqlInsert &= "          scoreF2 = " & scoreF2 & ", "
        sqlInsert &= "          scoreF3 = " & scoreF3 & ", "
        sqlInsert &= "          scoreF4 = " & scoreF4 & ", "
        sqlInsert &= "          scoreG1 = " & scoreG1 & ", "
        sqlInsert &= "          scoreG2 = " & scoreG2 & ", "
        sqlInsert &= "          Comment = '" & comment & "' "
        sqlInsert &= "      WHERE PortalNumber = '" & portalNumber & "' AND Remark1 = '" & subjectShortName & "' AND SessionName = '" & sessionName & "' AND TermName = '" & TermName & "' AND AssessmentType = '" & assessmentType & "' "
        sqlInsert &= "ELSE "
        sqlInsert &= "      INSERT INTO dbo.TEMPStudentSubjectScore_Nursery2(PortalNumber, Remark1, SessionName, TermName, AssessmentType, ScoreA1, ScoreA2, ScoreA3, ScoreA4, ScoreA5, ScoreA6, ScoreB1, ScoreB2, ScoreB3, ScoreB4, ScoreC1, ScoreC2, ScoreC3, ScoreD1, ScoreD2, ScoreD3, ScoreD4, ScoreD5, ScoreD6, ScoreD7, ScoreD8, ScoreD9, ScoreD10, ScoreE1, ScoreE2, ScoreE3, ScoreE4, ScoreE5, ScoreE6, ScoreE7, ScoreE8, ScoreE9, ScoreE10, ScoreF1, ScoreF2, ScoreF3, ScoreF4, ScoreG1, ScoreG2, Comment) "
        sqlInsert &= "      VALUES('" & portalNumber & "','" & subjectShortName & "','" & sessionName & "','" & TermName & "','" & assessmentType & "'," & scoreA1 & "," & scoreA2 & "," & scoreA3 & "," & scoreA4 & "," & scoreA5 & "," & scoreA6 & "," & scoreB1 & "," & scoreB2 & "," & scoreB3 & "," & scoreB4 & "," & scoreC1 & "," & scoreC2 & "," & scoreC3 & "," & scoreD1 & "," & scoreD2 & "," & scoreD3 & "," & scoreD4 & "," & scoreD5 & "," & scoreD6 & "," & scoreD7 & "," & scoreD8 & "," & scoreD9 & "," & scoreD10 & "," & scoreE1 & "," & scoreE2 & "," & scoreE3 & "," & scoreE4 & "," & scoreE5 & "," & scoreE6 & "," & scoreE7 & "," & scoreE8 & "," & scoreE9 & "," & scoreE10 & "," & scoreF1 & "," & scoreF2 & "," & scoreF3 & "," & scoreF4 & "," & scoreG1 & "," & scoreG2 & ",'" & comment & "')"
        'Response.Write(sqlInsert)
        insertResponse += Common.InsertTableRow(sqlInsert)
        If insertResponse >= 0 Then
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Green
            lblStatus.Text = "Congratulations! Students' Scores were successfully saved. You may move on to the next student."
        Else
            lblStatus.Font.Bold = True
            lblStatus.ForeColor = Drawing.Color.Red
            lblStatus.Text = "An error occurred during the Save operation. Please try again or contact an Administrator."
        End If
    End Sub
End Class
