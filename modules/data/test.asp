<% 
    'Sub SendMail()
        Dim strBody 
        Dim CDONTSMail 
        Set CDONTSMail = CreateObject("CDONTS.NewMail") 
        CDONTSMail.From= "idowuakinde@yahoo.com" 
        CDONTSMail.To= "idowuakinde@yahoo.co.uk; idowuakinde@yahoo.com" 
        CDONTSMail.Subject="This is a Test email" 
        strBody = "This is a test message." & vbCrLf 
        CDONTSMail.Body= strBody 
        CDONTSMail.Send 
        set CDONTSMail=nothing 
    'End Sub
%>