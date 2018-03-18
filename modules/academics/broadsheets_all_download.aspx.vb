
Partial Class modules_academics_broadsheets_all_download
    Inherits System.Web.UI.Page

    Public serial As Int32 = 0, username As String = ""

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
                Case Else
                    'do nothing
            End Select
        End If
    End Sub
End Class
