<%@ Page Language="VB" AutoEventWireup="false" CodeFile="hrm_all.aspx.vb" Inherits="modules_hrm_hrm_all" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>Untitled Page</title>
    <link href="../../StyleSheet.css" rel="stylesheet" type="text/css" />
	<script language="JavaScript" type="text/javascript" src="../../inc_functions_js.js"></script>
</head>
<body topmargin="0" leftmargin="0">
    <form id="form1" runat="server">
    <div>
        <table width="100%"  border="0" cellpadding="2" cellspacing="2">
          <tr>
            <td>
                <asp:Label ID="lblHeader" runat="server" Font-Bold="True" Font-Size="Small" 
                    Text=":: Human Resources"></asp:Label></td>
          </tr>
          <tr>
            <td>
            <table width="100%"  border="0" cellpadding="3" cellspacing="3" 
                    class="borderedTableGrey">
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/modules/hrm/frameset_main_admin.aspx?b=1" Target="singleHRFrame">Welcome</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><hr width="100%" color="black" shading="noshading" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/modules/hrm/dashboards/Default.aspx" Target="singleHRFrame">HR Dashboard</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/modules/hrm/dashboards/dash_appraisal.aspx" Target="singleHRFrame">Appraisal Dashboard</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/modules/hrm/reports/rev.aspx" Target="singleHRFrame">HR Reports</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><hr width="100%" color="black" shading="noshading" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/modules/hrm/hr/edit_staff.aspx" 
                        Target="singleHRFrame">Edit Staff Records</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink6" runat="server" NavigateUrl="~/modules/hrm/profiles/profile_photo_2.aspx" 
                        Target="singleHRFrame">Edit Staff Photos & Signatures</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink7" runat="server" NavigateUrl="~/modules/hrm/hr/input_quals_2.aspx" 
                        Target="singleHRFrame">Edit Staff Qualifications</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink8" runat="server" NavigateUrl="~/modules/hrm/hr/input_empl_2.aspx" 
                        Target="singleHRFrame">Edit Staff Employment History</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink9" runat="server" NavigateUrl="~/modules/hrm/hr/input_career_2.aspx" 
                        Target="singleHRFrame">Edit Staff Promotions & Demotions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink10" runat="server" NavigateUrl="~/modules/hrm/hr/input_languages_2.aspx" 
                        Target="singleHRFrame">Edit Staff Spoken Languages</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink11" runat="server" NavigateUrl="~/modules/hrm/hr/input_training_2.aspx" 
                        Target="singleHRFrame">Edit Staff Trainings</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/modules/hrm/hr/input_leave_2.aspx" 
                        Target="singleHRFrame">Edit Staff Leave Histories</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/modules/hrm/hr/input_misconduct_2.aspx" 
                        Target="singleHRFrame">Edit Staff Misconducts</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/modules/hrm/hr/input_exit_2.aspx" 
                        Target="singleHRFrame">Edit Staff Exit</asp:HyperLink></td>
              </tr>
                <tr>
                <td><hr width="100%" color="black" shading="noshading" /></td>
                </tr>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink16" runat="server" 
                        Target="singleHRFrame" 
                        NavigateUrl="~/modules/hrm/hr/input_appraisals_teachers_readonly.aspx">Teaching Staff - View Appraisals</asp:HyperLink></td>
                </tr>
              <% If Common.DecodeHTML(userRole) = "Head of School" Then%>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink15" runat="server" 
                        Target="singleHRFrame" 
                        NavigateUrl="~/modules/hrm/hr/input_appraisals_teachers.aspx">Teaching Staff - Edit Appraisals</asp:HyperLink></td>
              </tr>
              <% End If %>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink39" runat="server" 
                        Target="singleHRFrame" 
                        NavigateUrl="~/modules/hrm/hr/input_appraisals_admin_readonly.aspx">Admin Staff - View Appraisals</asp:HyperLink></td>
                </tr>
              <% If Common.DecodeHTML(userRole) = "Head of School" Then%>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink37" runat="server" 
                        Target="singleHRFrame" 
                        NavigateUrl="~/modules/hrm/hr/input_appraisals_admin.aspx">Admin Staff - Edit Appraisals</asp:HyperLink></td>
                </tr>
              <% End If %>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink40" runat="server" 
                        Target="singleHRFrame" 
                        NavigateUrl="~/modules/hrm/hr/input_appraisals_maint_readonly.aspx">Maintenance Staff - View Appraisals</asp:HyperLink></td>
                </tr>
              <% If Common.DecodeHTML(userRole) = "Head of School" or Common.DecodeHTML(userRole) = "Estate Manager" Then%>
                <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink38" runat="server" 
                        Target="singleHRFrame" 
                        NavigateUrl="~/modules/hrm/hr/input_appraisals_maint.aspx">Maintenance Staff - Edit Appraisals</asp:HyperLink></td>
                </tr>
              <% End If %>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><hr width="100%" color="black" shading="noshading" /></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink18" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managecertcodes.aspx" 
                        Target="singleHRFrame">Setup Certificates</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink19" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managecerttypes.aspx" 
                        Target="singleHRFrame">Setup Institution Types</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/manageinstitutions.aspx" 
                        Target="singleHRFrame">Setup Institutions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managedisciplines.aspx" 
                        Target="singleHRFrame">Setup Disciplines</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/manageleavetypes.aspx" 
                        Target="singleHRFrame">Setup Leave Types</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managedischarge.aspx" 
                        Target="singleHRFrame">Setup Exit Reasons</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managedesignations.aspx" 
                        Target="singleHRFrame">Setup Designations</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink25" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managejoblevels.aspx" 
                        Target="singleHRFrame">Setup Grade Levels</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink26" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managelocations.aspx" 
                        Target="singleHRFrame">Setup Locations</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink27" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managedepartments.aspx" 
                        Target="singleHRFrame">Setup Departments</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink28" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managehospitals.aspx" 
                        Target="singleHRFrame">Setup Hospitals</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink29" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managetrainings.aspx" 
                        Target="singleHRFrame">Setup Trainings</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink30" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managetrainingprovs.aspx" 
                        Target="singleHRFrame">Setup Training Providers</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink31" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managereligions.aspx" 
                        Target="singleHRFrame">Setup Religions</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink32" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managelanguages.aspx" 
                        Target="singleHRFrame">Setup Languages</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink33" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managebanks.aspx" 
                        Target="singleHRFrame">Setup Banks</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink34" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/managetaxvariables.aspx" 
                        Target="singleHRFrame">Setup Tax Variables</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink35" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/manageappraisaldomains.aspx" 
                        Target="singleHRFrame">Setup Appraisal Domains</asp:HyperLink></td>
              </tr>
              <tr onmouseover="javascript:ChangeRowBackgroundColor(this);" onmouseout="javascript:RevertRowBackgroundColor(this);">
                <td><asp:HyperLink ID="HyperLink36" runat="server" NavigateUrl="~/modules/hrm/system/setups/metadata/manageappraisaldomaingroups.aspx" 
                        Target="singleHRFrame">Setup Appraisal Domain Groups</asp:HyperLink></td>
              </tr>
              </table>
            </td>
          </tr>
          </table>
    </div>
    </form>
</body>
</html>
