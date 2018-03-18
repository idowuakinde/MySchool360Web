
Partial Class modules_virtualClass_virtualclass_resources
    Inherits System.Web.UI.Page

    Public portalNumber As String = "", className As String = "", subjectShortName As String = "", serial As Int32 = 0
    Public sessionName As String = Common.GetTableRows(" SELECT SessionName FROM dbo.TEMPSession WHERE CurrentSession = 'Y' ")(0).Item(0).ToString

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        portalNumber = Request.QueryString("a")
        className = Request.QueryString("c")

        Me.dsSqlStudentSubjects.SelectCommand = " SELECT DISTINCT a.[SubjectShortName], b.[SubjectName] FROM dbo.[TEMPStudentSubject] a INNER JOIN dbo.TEMPSubject b ON a.SubjectShortName = b.ShortName WHERE ([PortalNumber] = @PortalNumber) AND SessionName = @SessionName ORDER BY [SubjectShortName] "
        Me.dsSqlStudentSubjects.SelectParameters(0).DefaultValue = portalNumber
        Me.dsSqlStudentSubjects.SelectParameters(1).DefaultValue = sessionName

        Me.dsSqlResources.SelectCommand = " SELECT [ResourceId], a.[ResourceTypeId], [ResourceTypeName], [ResourceTitle], [ResourceLocation], [SubjectShortName], [ClassName], [TopicArea], [Notes], a.[Remark1], a.[Remark2], a.[Remark3] FROM [dbo].[TEMPVirtualClassroomResource] a INNER JOIN dbo.TEMPVirtualClassroomResourceType b ON a.ResourceTypeId = b.ResourceTypeId WHERE ClassName = @ClassName AND SubjectShortName = @SubjectShortName "
        Me.dsSqlResources.SelectParameters(0).DefaultValue = className
        Me.dsSqlResources.SelectParameters(1).DefaultValue = subjectShortName
    End Sub

    Protected Sub gvUsers_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles gvUsers.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            serial += 1
            Dim rowView As System.Data.DataRowView = CType(e.Row.DataItem, System.Data.DataRowView)

            Dim downloadLocation As String = Common.ConvertDBNulltoNothing(rowView("Remark1"))
            If downloadLocation = "" Then
                CType(e.Row.FindControl("hlnkDownload"), HyperLink).Visible = False
            Else
                CType(e.Row.FindControl("hlnkDownload"), HyperLink).NavigateUrl = "~/_virtualclass/" & downloadLocation
            End If

            Dim resourceType As String = Common.ConvertDBNulltoNothing(rowView("ResourceTypeName"))
            If resourceType.Trim.ToUpper = "ASSIGNMENT" Or resourceType.Trim.ToUpper = "HOMEWORK" Then
                CType(e.Row.FindControl("hlnkReply"), HyperLink).Visible = True
            Else
                CType(e.Row.FindControl("hlnkReply"), HyperLink).Visible = False
            End If
        End If
    End Sub
End Class
