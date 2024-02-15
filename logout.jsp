<%@ page import = "java.sql.* , java.util.*" %>

<%
    session.removeAttribute("username");
    session.removeAttribute("mail");
    session.removeAttribute("password");
    response.sendRedirect("index.jsp");
%>