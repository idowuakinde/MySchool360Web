Imports System
Imports System.IO
Imports System.Text
Imports System.Drawing
Imports GemBox.Spreadsheet

Partial Class modules_reports_export_admin_broadsheet_CA1
    Inherits System.Web.UI.Page

    Dim portalNumber As String = "", assessmentType As String = "Test"
    Dim className As String, personalTotal As Double, personalAverage As Double, personalAverageTotal As Double, subjectAverage As Double, averageOfAverage As Double, subjectScore As Double, classPosition As Int32
    Dim logoFileName As String = Server.MapPath("~/images/logos/logo.15.jpg")
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString
    Public termName As String = "1st Term"      'Common.GetTableRows(" SELECT TermName FROM dbo.TEMPTerm WHERE CurrentTerm = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        className = Request.QueryString("a")

        Dim excelFile As ExcelFile = New ExcelFile
        Call GenerateWorkSheet(excelFile)
        Call DownloadFile("~/App_Data/ExportBroadSheet.xlsx")
        excelFile = Nothing
    End Sub

    Private Sub GenerateWorkSheet(ByVal workBook As GemBox.Spreadsheet.ExcelFile)
        Dim rowsSubjects As System.Data.DataRowCollection
        Select Case className.ToUpper
            Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
                rowsSubjects = Common.GetTableRows(" SELECT DISTINCT a.SubjectId, a.SubjectName, a.ShortName FROM dbo.TEMPSubject a INNER JOIN dbo.TEMPStudentSubject b ON a.ShortName = b.SubjectShortName INNER JOIN dbo.TEMPCustomers c ON b.PortalNumber = c.CustomerCode INNER JOIN dbo.TEMPStudentSubjectScore d ON b.PortalNumber = d.PortalNumber AND b.SessionName = d.SessionName AND b.TermName = d.TermName WHERE b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND b.PortalNumber IN (SELECT CustomerCode FROM dbo.TEMPCustomers WHERE DistrictCode = '" & className & "') ")
            Case "YEAR 1", "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary (and new primary class nomenclatures)
                rowsSubjects = Common.GetTableRows(" SELECT DISTINCT a.SubjectId, a.SubjectName, a.ShortName FROM dbo.TEMPSubject a INNER JOIN dbo.TEMPStudentSubject b ON a.ShortName = b.SubjectShortName INNER JOIN dbo.TEMPCustomers c ON b.PortalNumber = c.CustomerCode INNER JOIN dbo.TEMPStudentSubjectScore d ON b.PortalNumber = d.PortalNumber AND b.SessionName = d.SessionName AND b.TermName = d.TermName WHERE b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND b.PortalNumber IN (SELECT CustomerCode FROM dbo.TEMPCustomers WHERE DistrictCode = '" & className & "') ")
            Case "NURSERY 1", "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
                rowsSubjects = Common.GetTableRows(" SELECT DISTINCT a.SubjectId, a.SubjectName, a.ShortName FROM dbo.TEMPSubject a INNER JOIN dbo.TEMPStudentSubject b ON a.ShortName = b.SubjectShortName INNER JOIN dbo.TEMPCustomers c ON b.PortalNumber = c.CustomerCode INNER JOIN dbo.TEMPStudentSubjectScore d ON b.PortalNumber = d.PortalNumber AND b.SessionName = d.SessionName AND b.TermName = d.TermName WHERE b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND b.PortalNumber IN (SELECT CustomerCode FROM dbo.TEMPCustomers WHERE DistrictCode = '" & className & "') ")
            Case Else           'creche
                rowsSubjects = Common.GetTableRows(" SELECT 0 as SubjectId, 'All Subjects' as SubjectName, 'All Subjects' as ShortName ")
        End Select

        'commence "Export to XLS"
        Dim worksheets As ExcelWorksheetCollection = workBook.Worksheets
        Dim ws As ExcelWorksheet
        Dim wsName As String = "BROADSHEET_CHILDVILLE"
        Dim reportFileLoc As String = Server.MapPath("~/App_Data/ExportBroadSheet.xlsx")
        worksheets.Add(wsName)

        worksheets.ActiveWorksheet = worksheets(wsName)
        ws = worksheets.ActiveWorksheet

        ws.DefaultColumnWidth = 1200
        ws.Columns(1).Width = 12000
        For i As Int32 = 0 To 50
            ws.Rows(i).Height = 400
        Next
        ws.Rows(3).Height = 2500
        ws.Pictures.Add(logoFileName, PositioningMode.MoveAndSize, New AnchorCell(ws.Columns(2), ws.Rows(0), True), New AnchorCell(ws.Columns(5), ws.Rows(2), False))
        Dim mergedRange As CellRange = ws.Cells.GetSubrangeAbsolute(0, 2, 2, 21)
        mergedRange.Merged = True
        mergedRange.Style.HorizontalAlignment = HorizontalAlignmentStyle.Center
        mergedRange.Style.VerticalAlignment = VerticalAlignmentStyle.Center
        mergedRange.Style.Font.Weight = 700
        mergedRange.Value = "CHILDVILLE SCHOOLS, LAGOS" & vbCrLf & "BROADSHEET" & vbCrLf & sessionName.ToUpper & " SESSION, " & termName.ToUpper & ", BEFORE MID-TERM"

        Dim rotatedStyle As CellStyle = New CellStyle
        rotatedStyle.Rotation = 90
        rotatedStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center
        rotatedStyle.VerticalAlignment = VerticalAlignmentStyle.Center
        rotatedStyle.WrapText = True
        rotatedStyle.Font.Weight = 700
        Dim centeredTextStyle As CellStyle = New CellStyle
        centeredTextStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center
        centeredTextStyle.VerticalAlignment = VerticalAlignmentStyle.Center
        centeredTextStyle.WrapText = True
        centeredTextStyle.Font.Weight = 700

        'Generate the Header row in Excel
        ws.Cells(3, 0).Value = "S/N" : ws.Cells(3, 0).Style = centeredTextStyle
        ws.Cells(3, 1).Value = className : ws.Cells(3, 1).Style = centeredTextStyle
        Dim currentColumn As Int32 = 2
        For i As Int32 = 0 To rowsSubjects.Count - 1
            ws.Cells(3, currentColumn).Value = rowsSubjects(i).Item("SubjectName").ToString.ToUpper
            ws.Cells(3, currentColumn).Style = rotatedStyle
            currentColumn = currentColumn + 1
        Next
        ws.Cells(3, 21).Value = "POSITION IN CLASS" : ws.Cells(3, 21).Style = rotatedStyle
        ws.Cells(3, 20).Value = "AVERAGE" : ws.Cells(3, 20).Style = rotatedStyle
        ws.Cells(3, 19).Value = "TOTAL" : ws.Cells(3, 19).Style = rotatedStyle

        'Generate the Student Detail row(s) for as many students as are in the current Class
        Dim rowsStudents As System.Data.DataRowCollection = Common.GetTableRows(" SELECT DISTINCT CustomerID, EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCode as PortalNumber, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, [State], PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, [Password], Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, SyncStatus FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber WHERE a.DistrictCode = '" & className & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' ")
        currentColumn = 1
        For i As Int32 = 0 To rowsStudents.Count - 1
            portalNumber = rowsStudents(i).Item("PortalNumber").ToString
            ws.Cells(4 + i, 0).Value = i + 1 : ws.Cells(4 + i, 0).Style = centeredTextStyle
            ws.Cells(4 + i, currentColumn).Value = rowsStudents(i).Item("CustomerName").ToString & " (" & portalNumber.ToString & ")" : ws.Cells(4 + i, currentColumn).Style = centeredTextStyle : ws.Cells(4 + i, currentColumn).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
            For j As Int32 = 0 To rowsSubjects.Count - 1
                ws.Cells(4 + i, currentColumn + j + 1).Value = Common.GetStudentSubjectScore(portalNumber, className, CType(rowsSubjects(j).Item("ShortName"), String), sessionName, termName, assessmentType)
                ws.Cells(4 + i, currentColumn + j + 1).Style = centeredTextStyle
                personalTotal += Common.GetStudentSubjectScore(portalNumber, className, CType(rowsSubjects(j).Item("ShortName"), String), sessionName, termName, assessmentType)
            Next
            personalAverage = Common.GetStudentsPersonalAverage(portalNumber, className, sessionName, termName, assessmentType)
            personalAverageTotal += personalAverage
            classPosition = Common.GetClassPosition(personalAverage, className, sessionName, termName, assessmentType)
            ws.Cells(4 + i, 21).Value = classPosition & Common.GetOrdinal(classPosition) : ws.Cells(4 + i, 21).Style = centeredTextStyle
            ws.Cells(4 + i, 20).Value = personalAverage : ws.Cells(4 + i, 20).Style = centeredTextStyle
            ws.Cells(4 + i, 19).Value = personalTotal : ws.Cells(4 + i, 19).Style = centeredTextStyle
            personalTotal = 0
        Next

        'Generate the Subject Average row
        ws.Cells(4 + rowsStudents.Count + 1, 1).Value = "SUBJECT AVERAGE" : ws.Cells(4 + rowsStudents.Count + 1, 1).Style = centeredTextStyle : ws.Cells(4 + rowsStudents.Count + 1, 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
        For i As Int32 = 0 To rowsSubjects.Count - 1
            ws.Cells(4 + rowsStudents.Count + 1, 1 + (i + 1)).Value = Common.GetClassSubjectAverage(className, CType(rowsSubjects(i).Item("ShortName"), String), sessionName, termName, assessmentType)
            ws.Cells(4 + rowsStudents.Count + 1, 1 + (i + 1)).Style = centeredTextStyle
        Next

        'Generate the Class Average row
        averageOfAverage = personalAverageTotal / rowsStudents.Count
        'ws.Cells(4 + rowsStudents.Count + 1, 20).Value = averageOfAverage : ws.Cells(4 + rowsStudents.Count + 1, 20).Style = centeredTextStyle          ''''commenting this line out because it results in an accumulation of approximations, thereby causing confusion when compared with the "absolute" Class Average as calculated directly a few lines below...
        ws.Cells(4 + rowsStudents.Count + 3, 1).Value = "CLASS AVERAGE" : ws.Cells(4 + rowsStudents.Count + 3, 1).Style = centeredTextStyle : ws.Cells(4 + rowsStudents.Count + 3, 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
        ws.Cells(4 + rowsStudents.Count + 3, 2).Value = Common.GetClassAverage(className, sessionName, termName, assessmentType) : ws.Cells(4 + rowsStudents.Count + 3, 2).Style = centeredTextStyle

        workBook.SaveXlsx(reportFileLoc)
        'End "Export to XLS"
    End Sub
    'Private Sub GenerateWorkSheet(ByVal workBook As GemBox.Spreadsheet.ExcelFile)
    '    Dim rowsSubjects As System.Data.DataRowCollection
    '    Select Case className.ToUpper
    '        Case "YEAR 7", "YEAR 8", "YEAR 9", "YEAR 10", "YEAR 11"     'secondary
    '            rowsSubjects = Common.GetTableRows(" SELECT DISTINCT a.SubjectId, a.SubjectName, a.ShortName FROM dbo.TEMPSubject a INNER JOIN dbo.TEMPStudentSubject b ON a.ShortName = b.SubjectShortName INNER JOIN dbo.TEMPCustomers c ON b.PortalNumber = c.CustomerCode INNER JOIN dbo.TEMPStudentSubjectScore d ON b.PortalNumber = d.PortalNumber AND b.SessionName = d.SessionName AND b.TermName = d.TermName WHERE b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND b.PortalNumber IN (SELECT CustomerCode FROM dbo.TEMPCustomers WHERE DistrictCode = '" & className & "') ")
    '        Case "YEAR 1 BLUE", "YEAR 1 RED", "YEAR 2 BLUE", "YEAR 2 RED", "YEAR 3 BLUE", "YEAR 3 RED", "YEAR 4 BLUE", "YEAR 4 RED", "YEAR 5 BLUE", "YEAR 5 RED", "YEAR 6"     'primary
    '            rowsSubjects = Common.GetTableRows(" SELECT DISTINCT a.SubjectId, a.SubjectName, a.ShortName FROM dbo.TEMPSubject a INNER JOIN dbo.TEMPStudentSubject b ON a.ShortName = b.SubjectShortName INNER JOIN dbo.TEMPCustomers c ON b.PortalNumber = c.CustomerCode INNER JOIN dbo.TEMPStudentSubjectScore d ON b.PortalNumber = d.PortalNumber AND b.SessionName = d.SessionName AND b.TermName = d.TermName WHERE b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND b.PortalNumber IN (SELECT CustomerCode FROM dbo.TEMPCustomers WHERE DistrictCode = '" & className & "') ")
    '        Case "NURSERY 1 BLUE", "NURSERY 1 RED", "NURSERY 2 BLUE", "NURSERY 2 RED"     'nursery
    '            rowsSubjects = Common.GetTableRows(" SELECT DISTINCT a.SubjectId, a.SubjectName, a.ShortName FROM dbo.TEMPSubject a INNER JOIN dbo.TEMPStudentSubject b ON a.ShortName = b.SubjectShortName INNER JOIN dbo.TEMPCustomers c ON b.PortalNumber = c.CustomerCode INNER JOIN dbo.TEMPStudentSubjectScore d ON b.PortalNumber = d.PortalNumber AND b.SessionName = d.SessionName AND b.TermName = d.TermName WHERE b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' AND b.PortalNumber IN (SELECT CustomerCode FROM dbo.TEMPCustomers WHERE DistrictCode = '" & className & "') ")
    '        Case Else           'creche
    '            rowsSubjects = Common.GetTableRows(" SELECT 0 as SubjectId, 'All Subjects' as SubjectName, 'All Subjects' as ShortName ")
    '    End Select

    '    'commence "Export to XLS"
    '    Dim worksheets As ExcelWorksheetCollection = workBook.Worksheets
    '    Dim ws As ExcelWorksheet
    '    Dim wsName As String = "BROADSHEET_CHILDVILLE"
    '    Dim reportFileLoc As String = Server.MapPath("~/App_Data/ExportBroadSheet.xlsx")
    '    worksheets.Add(wsName)

    '    worksheets.ActiveWorksheet = worksheets(wsName)
    '    ws = worksheets.ActiveWorksheet

    '    ws.DefaultColumnWidth = 1200
    '    ws.Columns(1).Width = 12000
    '    For i As Int32 = 0 To 50
    '        ws.Rows(i).Height = 400
    '    Next
    '    ws.Rows(3).Height = 2500
    '    ws.Pictures.Add(logoFileName, PositioningMode.MoveAndSize, New AnchorCell(ws.Columns(2), ws.Rows(0), True), New AnchorCell(ws.Columns(5), ws.Rows(2), False))
    '    Dim mergedRange As CellRange = ws.Cells.GetSubrangeAbsolute(0, 2, 2, 21)
    '    mergedRange.Merged = True
    '    mergedRange.Style.HorizontalAlignment = HorizontalAlignmentStyle.Center
    '    mergedRange.Style.VerticalAlignment = VerticalAlignmentStyle.Center
    '    mergedRange.Style.Font.Weight = 700
    '    mergedRange.Value = "CHILDVILLE SCHOOLS, LAGOS" & vbCrLf & "BROADSHEET" & vbCrLf & sessionName.ToUpper & " SESSION, " & termName.ToUpper & ", BEFORE MID-TERM"

    '    Dim rotatedStyle As CellStyle = New CellStyle
    '    rotatedStyle.Rotation = 90
    '    rotatedStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center
    '    rotatedStyle.VerticalAlignment = VerticalAlignmentStyle.Center
    '    rotatedStyle.WrapText = True
    '    rotatedStyle.Font.Weight = 700
    '    Dim centeredTextStyle As CellStyle = New CellStyle
    '    centeredTextStyle.HorizontalAlignment = HorizontalAlignmentStyle.Center
    '    centeredTextStyle.VerticalAlignment = VerticalAlignmentStyle.Center
    '    centeredTextStyle.WrapText = True
    '    centeredTextStyle.Font.Weight = 700

    '    'Generate the Header row in Excel
    '    ws.Cells(3, 0).Value = "S/N" : ws.Cells(3, 0).Style = centeredTextStyle
    '    ws.Cells(3, 1).Value = className : ws.Cells(3, 1).Style = centeredTextStyle
    '    Dim currentColumn As Int32 = 2
    '    For i As Int32 = 0 To rowsSubjects.Count - 1
    '        ws.Cells(3, currentColumn).Value = rowsSubjects(i).Item("SubjectName").ToString.ToUpper
    '        ws.Cells(3, currentColumn).Style = rotatedStyle
    '        currentColumn = currentColumn + 1
    '    Next
    '    ws.Cells(3, 21).Value = "POSITION IN CLASS" : ws.Cells(3, 21).Style = rotatedStyle
    '    ws.Cells(3, 20).Value = "AVERAGE" : ws.Cells(3, 20).Style = rotatedStyle
    '    ws.Cells(3, 19).Value = "TOTAL" : ws.Cells(3, 19).Style = rotatedStyle

    '    'Generate the Student Detail row(s) for as many students as are in the current Class
    '    Dim rowsStudents As System.Data.DataRowCollection = Common.GetTableRows(" SELECT DISTINCT CustomerID, EntryDate, RefCode, belongtocode, DistrictCode, CustomerCode, CustomerCode as PortalNumber, CustomerCodeOld, Occupancy, Cycle, CustomerName, FirstName, LastName, BillingAddress, City, [State], PostalCode, Country, Meteridcode, ContactTitle, PhoneNumber, Extension, FaxNumber, EmailAddress, [Password], Activated, CurrentBal, PreviousBal, LastPmt, LastDate, RA, Meterdate, ActiveInactive, SyncStatus FROM dbo.TEMPCustomers a INNER JOIN dbo.TEMPStudentSubject b ON a.CustomerCode = b.PortalNumber WHERE a.DistrictCode = '" & className & "' AND b.SessionName = '" & sessionName & "' AND b.TermName = '" & termName & "' ")
    '    currentColumn = 1
    '    For i As Int32 = 0 To rowsStudents.Count - 1
    '        portalNumber = rowsStudents(i).Item("PortalNumber").ToString
    '        ws.Cells(4 + i, 0).Value = i + 1 : ws.Cells(4 + i, 0).Style = centeredTextStyle
    '        ws.Cells(4 + i, currentColumn).Value = rowsStudents(i).Item("CustomerName").ToString : ws.Cells(4 + i, currentColumn).Style = centeredTextStyle : ws.Cells(4 + i, currentColumn).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
    '        For j As Int32 = 0 To rowsSubjects.Count - 1
    '            ws.Cells(4 + i, currentColumn + j + 1).Value = Common.GetStudentSubjectScore(portalNumber, className, CType(rowsSubjects(j).Item("ShortName"), String), sessionName, termName, assessmentType)
    '            ws.Cells(4 + i, currentColumn + j + 1).Style = centeredTextStyle
    '            personalTotal += Common.GetStudentSubjectScore(portalNumber, className, CType(rowsSubjects(j).Item("ShortName"), String), sessionName, termName, assessmentType)
    '        Next
    '        personalAverage = Common.GetStudentsPersonalAverage(portalNumber, className, sessionName, termName, assessmentType)
    '        personalAverageTotal += personalAverage
    '        classPosition = Common.GetClassPosition(personalAverage, className, sessionName, termName, assessmentType)
    '        ws.Cells(4 + i, 21).Value = classPosition & Common.GetOrdinal(classPosition) : ws.Cells(4 + i, 21).Style = centeredTextStyle
    '        ws.Cells(4 + i, 20).Value = personalAverage : ws.Cells(4 + i, 20).Style = centeredTextStyle
    '        ws.Cells(4 + i, 19).Value = personalTotal : ws.Cells(4 + i, 19).Style = centeredTextStyle
    '        personalTotal = 0
    '    Next

    '    'Generate the Subject Average row
    '    ws.Cells(4 + rowsStudents.Count + 1, 1).Value = "SUBJECT AVERAGE" : ws.Cells(4 + rowsStudents.Count + 1, 1).Style = centeredTextStyle : ws.Cells(4 + rowsStudents.Count + 1, 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
    '    For i As Int32 = 0 To rowsSubjects.Count - 1
    '        ws.Cells(4 + rowsStudents.Count + 1, 1 + (i + 1)).Value = Common.GetClassSubjectAverage(className, CType(rowsSubjects(i).Item("ShortName"), String), sessionName, termName, assessmentType)
    '        ws.Cells(4 + rowsStudents.Count + 1, 1 + (i + 1)).Style = centeredTextStyle
    '    Next

    '    'Generate the Class Average row
    '    averageOfAverage = personalAverageTotal / rowsStudents.Count
    '    ws.Cells(4 + rowsStudents.Count + 1, 20).Value = averageOfAverage : ws.Cells(4 + rowsStudents.Count + 1, 20).Style = centeredTextStyle
    '    ws.Cells(4 + rowsStudents.Count + 3, 1).Value = "CLASS AVERAGE" : ws.Cells(4 + rowsStudents.Count + 3, 1).Style = centeredTextStyle : ws.Cells(4 + rowsStudents.Count + 3, 1).Style.HorizontalAlignment = HorizontalAlignmentStyle.Left
    '    ws.Cells(4 + rowsStudents.Count + 3, 2).Value = averageOfAverage : ws.Cells(4 + rowsStudents.Count + 3, 2).Style = centeredTextStyle

    '    workBook.SaveXlsx(reportFileLoc)
    '    'End "Export to XLS"
    'End Sub

    Public Overrides Sub VerifyRenderingInServerForm(ByVal control As Control)
        'do nothing
        'DO NOT REMOVE! The mere presence of this procedure, though empty, enables the "Export to Excel" functionality...
    End Sub

    Private Sub DownloadFile(ByVal virtualPath As String)
        Dim filePath As String = Server.MapPath(virtualPath)
        Dim targetFile As New System.IO.FileInfo(filePath)

        Response.Clear()

        Response.ContentType = "application/octet-stream"
        Response.AddHeader("content-length", targetFile.Length.ToString)
        Response.AddHeader("content-disposition", "attachment; filename=ExportBroadSheet_" & sessionName.Replace("/", "") & "Session_" & termName.Replace(" ", "") & "_BeforeMidTerm_" & className.Replace(" ", "").Replace("-", "") & ".xlsx")

        Response.WriteFile(targetFile.FullName)
        Response.End()
    End Sub
End Class
