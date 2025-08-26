<%
If Request.ServerVariables("HTTPS") = "off" Then
    Response.Redirect "https://" & Request.ServerVariables("HTTP_HOST") & "/certsrv"
ElseIf Request.ServerVariables("HTTPS") = "on" Then
    Response.Redirect "https://" & Request.ServerVariables("HTTP_HOST") & "/certsrv" 
End If
%>