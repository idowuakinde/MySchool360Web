
Partial Class modules_vle_vle_teacher_menu
    Inherits System.Web.UI.Page

    Public username As String = "", schoolColour As String = "", serial As Int32 = 0

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        username = Request.QueryString("a")
        schoolColour = "#" & Request.QueryString("b")

        Me.HyperLink1.NavigateUrl = "~/modules/system/setups/metadata/managevirtualclassroom.aspx?a=" & username
        Me.HyperLink2.NavigateUrl = "~/modules/system/setups/metadata/managepracticequestions.aspx?a=" & username
    End Sub
End Class
