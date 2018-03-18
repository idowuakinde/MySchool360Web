
Partial Class modules_timetable_default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        '
    End Sub

    Protected Sub ddlClass_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlClass.SelectedIndexChanged
        Dim destination As String = "timetable_class.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlTeacher_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTeacher.SelectedIndexChanged
        Dim destination As String = "timetable_teacher.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlVenue_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlVenue.SelectedIndexChanged
        Dim destination As String = "timetable_venue.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlClassFree_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlClassFree.SelectedIndexChanged
        Dim destination As String = "timetable_class_free.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlTeacherFree_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTeacherFree.SelectedIndexChanged
        Dim destination As String = "timetable_teacher_free.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlVenueFree_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlVenueFree.SelectedIndexChanged
        Dim destination As String = "timetable_venue_free.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlTeacherLoad_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTeacherLoad.SelectedIndexChanged
        Dim destination As String = "timetable_teacher_load.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlClassLoad_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlClassLoad.SelectedIndexChanged
        Dim destination As String = "timetable_class_load.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlVenueLoad_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlVenueLoad.SelectedIndexChanged
        Dim destination As String = "timetable_venue_load.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlVenueClash_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlVenueClash.SelectedIndexChanged
        Dim destination As String = "timetable_venue_clash.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlTeacherClash_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlTeacherClash.SelectedIndexChanged
        Dim destination As String = "timetable_teacher_clash.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub

    Protected Sub ddlClassClash_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles ddlClassClash.SelectedIndexChanged
        Dim destination As String = "timetable_class_clash.aspx"
        Dim currentValue As String = CType(sender, DropDownList).SelectedItem.ToString

        Select Case currentValue
            Case " "
                'do nothing
            Case Else
                destination &= "?a=" & currentValue
        End Select

        Server.Transfer(destination)
    End Sub
End Class
