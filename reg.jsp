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
            <form class="info"  onsubmit="login()">
                <input type="text" name="username" id="username" placeholder="Enter Username ...">
                <input type="email" name="email" id="email" placeholder="Enter Email ...">
                <input type="password" name="password" id="password" placeholder="Enter Password ...">
            </form>
        </div>
        <button class="reg_btn" onclick="reg()">Register</button>
        <button class="login_btn" onclick="login()"> Back to Login</button>
        <% String regError = (String) session.getAttribute("regError");
        if(regError != null){%>
            <p style="color: red;"><%= regError %></p>
        <%
        session.removeAttribute("regError");
        }
        %>
    </div>
    <script>
        function login(){
            window.location.href = "index.jsp";
        }
        function reg(){
            let form = document.querySelector('.info');
            form.action = "reg_process.jsp";
            form.submit();
        }
        
    </script>
</body>
</html>