
Partial Class modules_selfservice_staff_appraisal
    Inherits System.Web.UI.Page

    Public selectedStaffGUID As String, rows As System.Data.DataRowCollection, staffCode As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        staffCode = Request.QueryString("a")
        rows = Common.GetTableRows("SELECT Surname, OtherNames FROM dbo.HR_Staff_Base WHERE StaffCode = '" & staffCode & "'")
        Me.lblHeader.Text = ":: YEAR " & Now.Year.ToString & " Employee Appraisal Results [" & rows(0).Item(0).ToString.ToUpper & " " & rows(0).Item(1).ToString.ToUpper & "]"
        rows = Common.GetTableRows("SELECT TOP 1 Variable_Query, Variable_Warning, Variable_Others FROM dbo.HR_AppraisalVariables")
        CType(DetailsView1.FindControl("lblAppraisalQuery"), Label).Text = rows(0).Item(0).ToString
        CType(DetailsView1.FindControl("lblAppraisalWarning"), Label).Text = rows(0).Item(1).ToString
        CType(DetailsView1.FindControl("lblAppraisalOthers"), Label).Text = rows(0).Item(2).ToString
    End Sub
End Class
