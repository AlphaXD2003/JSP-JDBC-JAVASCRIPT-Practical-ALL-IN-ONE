<%@ page import="java.util.*" %>
<%@ page import="java.io.* , java.util.* , java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="style.css">
    <title>Main Page</title>
</head>
<body style="background-color: #333;">
    <div class="container">
        <h1>Logged In!</h1>
        
        <%-- Retrieve username from session attribute --%>
        <%
            String username = (String) session.getAttribute("username");
            String mail = (String) session.getAttribute("mail");
            String password = (String) session.getAttribute("password");

            if (username != null) {
        %>
                <p>Welcome, <%= username %>!</p>
        <%
            } else {
        %>
                <p>No username found in session.</p>
        <%
            }
        %>
        <button id="view" onclick="view()">View Details</button>
        <button id="delete" onclick="del()" >Delete Account</button>

        <a href="logout.jsp">Logout</a>
    </div>
    <script>
        function view(){
            window.location.href = "view.jsp";
        }
        function del(){
            window.location.href = "delete.jsp";
        }
    </script>
</body>
</html>