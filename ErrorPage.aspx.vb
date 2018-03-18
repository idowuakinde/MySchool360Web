
Partial Class ErrorPage
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim ex As Exception = HttpContext.Current.Cache("currentException")

        lblErrorMessage.Text = ex.InnerException.Message
        Dim separator() As String = {" at "}, intRet As String
        'lblErrorSource.Text = Join(ex.InnerException.StackTrace.Split(separator, StringSplitOptions.None), " | ")
        lblErrorSource.Text = ex.InnerException.StackTrace.Split(separator, StringSplitOptions.None)(1)

        intRet = Common.LogException(ex)
    End Sub
End Class
