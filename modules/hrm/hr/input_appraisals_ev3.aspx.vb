
Partial Class modules_hr_input_appraisals_ev3
    Inherits System.Web.UI.Page

    Public selectedStaffGUID As String

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Me.lblHeader.Text = ":: Year " & Now.Year.ToString & " Employee Appraisal Form (Evaluator 3 - FINAL Evaluator)"
        Dim rows As System.Data.DataRowCollection = Common.GetTableRows("SELECT TOP 1 Variable_Query, Variable_Warning, Variable_Others FROM dbo.HR_AppraisalVariables")
        CType(DetailsView1.FindControl("lblAppraisalQuery"), Label).Text = rows(0).Item(0).ToString
        CType(DetailsView1.FindControl("lblAppraisalWarning"), Label).Text = rows(0).Item(1).ToString
        CType(DetailsView1.FindControl("lblAppraisalOthers"), Label).Text = rows(0).Item(2).ToString
    End Sub

    Protected Sub DropDownList5_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        selectedStaffGUID = CType(DetailsView1.FindControl("DropDownList5"), DropDownList).SelectedValue
        CType(DetailsView1.FindControl("imgPhoto"), Image).ImageUrl = "~\images\pp_staff\" & selectedStaffGUID & ".jpg"
    End Sub
End Class
