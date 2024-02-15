<%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>My Practical Exam</title>
</head>
<body background-color="#333">
    <div class="container">
        <h1>My Practical Exam</h1>
        <div class="con_img">
            <img src="https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png" alt="">
        </div>
        <div class="information">
            <form id="loginForm" class="info" method="post"  action="login_process.jsp">
                <input type="email" name="email" id="email" placeholder="Enter Email ...">
                <input type="password" name="password" id="password" placeholder="Enter Password ...">
            </form>
        </div>
        <button class="login_btn" onclick="login()">Login</button>
        <button class="reg_btn" onclick="reg()">Register</button>
    </div>
    <script>
        function reg(){
            window.location.href = "reg.jsp";
        }
        function login(){
            let form = document.getElementById('loginForm');
            form.submit();
        }

        
    </script>
</body>
</html>