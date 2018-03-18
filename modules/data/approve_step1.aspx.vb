Imports WebSupergoo.ABCpdf6

Partial Class modules_data_approve_step1
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0, username As String = "", className As String = "", resultsPageLocation As String = ""
    Dim sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        Dim headOfSchool As String = Common.GetTableRows(" SELECT Username FROM dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE c.RoleName = 'Head of School' ")(0).Item(0).ToString
        Dim schoolAdministrator As String = Common.GetTableRows(" SELECT Username FROM dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE c.RoleName = 'School Administrator' ")(0).Item(0).ToString
        Dim proprietress As String = Common.GetTableRows(" SELECT Username FROM dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE c.RoleName = 'Proprietress' ")(0).Item(0).ToString

        Dim headsOfSchool As String = ""
        Dim rowsHeadsOfSchool As System.Data.DataRowCollection = Common.GetTableRows(" SELECT Username FROM dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE c.RoleName IN ('Head of Junior School', 'Head of Senior School') ")
        Select Case rowsHeadsOfSchool.Count
            Case 0
                headsOfSchool = ""
            Case Else
                For i As Int32 = 0 To rowsHeadsOfSchool.Count - 1
                    headsOfSchool &= "'" & rowsHeadsOfSchool(i).Item(0).ToString & "',"
                Next
                headsOfSchool = Left(headsOfSchool, headsOfSchool.Length - 1)       'remove the trailing comma
                headsOfSchool = Left(headsOfSchool, headsOfSchool.Length - 1)       'remove the trailing apostrophe
                headsOfSchool = Right(headsOfSchool, headsOfSchool.Length - 1)      'remove the leading apostrophe
        End Select

        'Dim sqlStatement As String = " SELECT Username, FirstName + ' ' + MiddleName + ' ' + Surname as TeacherName FROM dbo.Core_User a INNER JOIN dbo.Core_RoleUser b ON a.UserId = b.UserId INNER JOIN dbo.Core_Role c ON b.RoleId = c.RoleId WHERE c.RoleName IN ('Teacher', 'Teacher (Class Teacher)', 'Teacher (PE Teacher)', 'Teacher (Subject Teacher)', 'Head of Senior School', 'Head of Junior School') AND a.UserId IN (SELECT d.UserId FROM dbo.Core_User d INNER JOIN dbo.TEMPUserSubject e ON d.UserId = e.UserId WHERE ClassName IN (SELECT ClassName FROM dbo.TEMPClass WHERE Remarks IN (SELECT ProgrammeName FROM dbo.TEMPProgramme WHERE Teacher IN ('" & username.Replace(headOfSchool, headsOfSchool) & "')))) ORDER BY TeacherName "
        Dim sqlStatement As String = " SELECT ClassName FROM dbo.TEMPClass a WHERE a.Remarks IN (SELECT ProgrammeName FROM dbo.TEMPProgramme WHERE Teacher IN ('" & username.Replace(headOfSchool, headsOfSchool) & "','" & username.Replace(schoolAdministrator, headsOfSchool) & "','" & username.Replace(proprietress, headsOfSchool) & "')) ORDER BY ListingOrder, ClassName  "
        Me.dsSqlTeachers.SelectCommand = sqlStatement
    End Sub

    Protected Sub gvMaster_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvMaster.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)
            Select Case CType(rowView("ClassName"), String).ToUpper
                Case "PRE-NURSERY", "PLAYGROUP"
                    CType(e.Row.FindControl("HyperLink1a"), HyperLink).NavigateUrl = ""
                    CType(e.Row.FindControl("HyperLink1c"), HyperLink).NavigateUrl = ""
                    CType(e.Row.FindControl("HyperLink1e"), HyperLink).NavigateUrl = ""

                    CType(e.Row.FindControl("lbtnPrintBatch1"), LinkButton).Enabled = False
                    CType(e.Row.FindControl("lbtnEmailBatch1"), LinkButton).Enabled = False

                    CType(e.Row.FindControl("lbtnPrintBatch3"), LinkButton).Enabled = False
                    CType(e.Row.FindControl("lbtnEmailBatch3"), LinkButton).Enabled = False

                    CType(e.Row.FindControl("lbtnPrintBatch5"), LinkButton).Enabled = False
                    CType(e.Row.FindControl("lbtnEmailBatch5"), LinkButton).Enabled = False
                Case Else
                    'do nothing
            End Select

            Select Common.GetProgramme(CType(rowView("ClassName"), String)).ToUpper
                Case "NUR"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch1"), LinkButton).Text = "Print Skills Reports >>"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch2"), LinkButton).Text = "Print Skills Reports >>"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch3"), LinkButton).Text = "Print Skills Reports >>"
                Case "PRI"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch1"), LinkButton).Text = "Print Behaviour Reports >>"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch2"), LinkButton).Text = "Print Behaviour Reports >>"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch3"), LinkButton).Text = "Print Behaviour Reports >>"
                Case "CRE", "SEC"
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch1"), LinkButton).Visible = False
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch2"), LinkButton).Visible = False
                    CType(e.Row.FindControl("lbtnPrintSkillsBatch3"), LinkButton).Visible = False
            End Select
        End If
    End Sub

    Protected Sub lbtnPrintBatch1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage(className, "1st Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20121stTermMid_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintBatch2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage2(className, "1st Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20121stTermEnd_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintSkillsBatch1_Click(ByVal sender As Object, e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage3(className, "1st Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_SkillsReport_1stTerm_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintBatch3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage(className, "2nd Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20122ndTermMid_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintBatch4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage2(className, "2nd Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20122ndTermEnd_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintSkillsBatch2_Click(ByVal sender As Object, e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage3(className, "2nd Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_SkillsReport_2ndTerm_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintBatch5_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage(className, "3rd Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20123rdTermMid_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintBatch6_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage2(className, "3rd Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_ReportCard_20123rdTermEnd_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnPrintSkillsBatch3_Click(ByVal sender As Object, e As System.EventArgs)
        Dim theDoc As New Doc(), theData As Byte(), theID As Int32
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        resultsPageLocation = Common.GetStudentResultsPage3(className, "3rd Term")

        Dim rowsStudentsInClass As System.Data.DataRowCollection = Common.GetTableRows(" SELECT CustomerCode as PortalNumber FROM dbo.TEMPCustomers a WHERE a.DistrictCode = '" & className & "' ")

        For i As Int32 = 0 To rowsStudentsInClass.Count - 1
            Dim portalnumber As String = rowsStudentsInClass(i).Item(0).ToString

            theDoc.Page = theDoc.AddPage()
            'theID = theDoc.AddImageUrl("http://localhost/myschool360.childville/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))
            theID = theDoc.AddImageUrl("http://childville.myschool360.info/" & Right(resultsPageLocation, resultsPageLocation.Length - 1) & "?a=" & portalnumber & "&b=" & sessionName & "&c=" & Common.GetRandomNumberBasedOnCurrentTime(500000))

            While True
                theDoc.FrameRect()
                If Not theDoc.Chainable(theID) Then
                    Exit While
                End If
                theDoc.Page = theDoc.AddPage()
                theID = theDoc.AddImageToChain(theID)
            End While
        Next

        For j As Integer = 1 To theDoc.PageCount
            theDoc.PageNumber = j
            theDoc.Flatten()
        Next
        'Response.End()
        theData = theDoc.GetData()
        Response.ContentType = "application/pdf"
        Response.AddHeader("content-length", UBound(theData) - LBound(theData) + 1)
        Response.AddHeader("content-disposition", "attachment; filename=Childville_SkillsReport_3rdTerm_" & className & ".pdf")
        Response.BinaryWrite(theData)
        theDoc = Nothing
    End Sub

    Protected Sub lbtnEmailBatch1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        Response.Redirect("email_to_parents.aspx?a=class&b=" & className)
    End Sub

    Protected Sub lbtnEmailBatch2_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        Response.Redirect("email_to_parents2.aspx?a=class&b=" & className)
    End Sub

    Protected Sub lbtnEmailBatch3_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        Response.Redirect("email_to_parents3.aspx?a=class&b=" & className)
    End Sub

    Protected Sub lbtnEmailBatch4_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        Response.Redirect("email_to_parents4.aspx?a=class&b=" & className)
    End Sub

    Protected Sub lbtnEmailBatch5_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        Response.Redirect("email_to_parents5.aspx?a=class&b=" & className)
    End Sub

    Protected Sub lbtnEmailBatch6_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Dim currentRow As GridViewRow = CType(sender, LinkButton).Parent.Parent

        className = currentRow.Cells(1).Text
        Response.Redirect("email_to_parents6.aspx?a=class&b=" & className)
    End Sub
End Class
