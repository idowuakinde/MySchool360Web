Imports System.Data

Partial Class modules_system_setups_metadata_managesettings
    Inherits System.Web.UI.Page

    Dim dailyPeriods As Int32 = 0, periodsBeforeShortBreak As Int32 = 0, periodsBeforeLongBreak As Int32 = 0, profileOrientation As String = "", showPositions As String = "", defaultSenderAlias As String = "", defaultEmailSender As String = "", headOfSchoolJunior As String = "", headofSchoolSenior As String = "", principal As String = "", directorOfStudies As String = "", bursar As String = "", currentSession As String = "", currentTerm As String = ""

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            Dim rowsSettings As DataRowCollection = Common.GetTableRows(" SELECT ModuleName, SettingTitle, SettingValue FROM dbo.Core_Setting ")
            Dim rowsSessions As DataRowCollection = Common.GetTableRows(" SELECT [SessionName] FROM dbo.[TEMPSession] WHERE CurrentSession = 'Y' ")
            Dim rowsTerms As DataRowCollection = Common.GetTableRows(" SELECT [TermName] FROM dbo.[TEMPTerm] WHERE CurrentTerm = 'Y' ")

            dailyPeriods = CType(rowsSettings(0).Item(2), Int32) : Me.ddlDailyPeriods.SelectedValue = dailyPeriods
            periodsBeforeShortBreak = CType(rowsSettings(1).Item(2), Int32) : Me.ddlShortBreakPeriod.SelectedValue = periodsBeforeShortBreak
            periodsBeforeLongBreak = CType(rowsSettings(2).Item(2), Int32) : Me.ddlLongBreakPeriod.SelectedValue = periodsBeforeLongBreak
            profileOrientation = CType(rowsSettings(3).Item(2), String) : Me.ddlProfileOrientation.SelectedValue = profileOrientation
            showPositions = CType(rowsSettings(4).Item(2), String) : Me.ddlShowPositions.SelectedValue = showPositions
            defaultSenderAlias = CType(rowsSettings(5).Item(2), String) : Me.txtSenderAlias.Text = defaultSenderAlias
            principal = CType(rowsSettings(6).Item(2), String) : Me.ddlPrincipal.SelectedValue = principal
            directorOfStudies = CType(rowsSettings(7).Item(2), String) : Me.ddlDOS.SelectedValue = directorOfStudies
            bursar = CType(rowsSettings(8).Item(2), String) : Me.ddlBursar.SelectedValue = bursar
            defaultEmailSender = CType(rowsSettings(9).Item(2), String) : Me.txtEmailSender.Text = defaultEmailSender
            headOfSchoolJunior = CType(rowsSettings(10).Item(2), String) : Me.ddlHeadOfSchoolJunior.SelectedValue = headOfSchoolJunior
            headofSchoolSenior = CType(rowsSettings(11).Item(2), String) : Me.ddlHeadOfSchoolSenior.SelectedValue = headofSchoolSenior
            currentSession = CType(rowsSessions(0).Item(0), String) : Me.ddlCurrentSession.SelectedValue = currentSession
            currentTerm = CType(rowsTerms(0).Item(0), String) : Me.ddlCurrentTerm.SelectedValue = currentTerm

            'close this object
            rowsSettings = Nothing
            rowsSessions = Nothing
            rowsTerms = Nothing
        End If
    End Sub

    Protected Sub ddlDailyPeriods_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDailyPeriods.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlDailyPeriods.SelectedValue & "' WHERE SettingTitle = 'Number of Daily Periods' ")
    End Sub

    Protected Sub ddlShortBreakPeriod_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlShortBreakPeriod.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlShortBreakPeriod.SelectedValue & "' WHERE SettingTitle = 'Period Number Just Before Short Break' ")
    End Sub

    Protected Sub ddlLongBreakPeriod_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlLongBreakPeriod.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlLongBreakPeriod.SelectedValue & "' WHERE SettingTitle = 'Period Number Just Before Long Break' ")
    End Sub

    Protected Sub ddlProfileOrientation_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlProfileOrientation.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlProfileOrientation.SelectedValue & "' WHERE SettingTitle = 'Profile Orientation' ")
    End Sub

    Protected Sub ddlShowPositions_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlShowPositions.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlShowPositions.SelectedValue & "' WHERE SettingTitle = 'Show Positions' ")
    End Sub

    Protected Sub btnSaveSenderAlias_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveSenderAlias.Click
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & txtSenderAlias.Text & "' WHERE SettingTitle = 'Default Sender Alias' ")
    End Sub

    Protected Sub ddlPrincipal_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlPrincipal.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlPrincipal.SelectedValue & "' WHERE SettingTitle = 'Who is the Principal?' ")
    End Sub

    Protected Sub ddlDOS_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlDOS.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlDOS.SelectedValue & "' WHERE SettingTitle = 'Who is the Director of Studies?' ")
    End Sub

    Protected Sub ddlBursar_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlBursar.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlBursar.SelectedValue & "' WHERE SettingTitle = 'Who is the Bursar?' ")
    End Sub

    Protected Sub ddlCurrentSession_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCurrentSession.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.TEMPSession SET CurrentSession = 'N' UPDATE dbo.TEMPSession Set CurrentSession = 'Y' WHERE SessionName = '" & ddlCurrentSession.SelectedValue & "' ")
    End Sub

    Protected Sub ddlCurrentTerm_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlCurrentTerm.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.TempTerm SET CurrentTerm = 'N'; UPDATE dbo.TEMPTerm SET CurrentTerm = 'Y' WHERE TermName = '" & ddlCurrentTerm.SelectedValue & "' ")
    End Sub

    Protected Sub btnSaveEmailSender_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnSaveEmailSender.Click
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & txtEmailSender.Text & "' WHERE SettingTitle = 'Default E-mail Sending Address' ")
    End Sub

    Protected Sub ddlHeadOfSchoolJunior_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHeadOfSchoolJunior.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlHeadOfSchoolJunior.SelectedValue & "' WHERE SettingTitle = 'Who is the Head of Junior School?' ")
    End Sub

    Protected Sub ddlHeadOfSchoolSenior_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlHeadOfSchoolSenior.SelectedIndexChanged
        Call Common.UpdateTableRow(" UPDATE dbo.Core_Setting SET SettingValue = '" & ddlHeadOfSchoolSenior.SelectedValue & "' WHERE SettingTitle = 'Who is the Head of Senior School?' ")
    End Sub

    Protected Sub btnPromoteAllStudents_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnPromoteAllStudents.Click
        Call Common.PromoteAllStudents()
    End Sub
End Class
