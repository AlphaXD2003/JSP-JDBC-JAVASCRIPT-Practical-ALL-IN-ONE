<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <body background-color="#333">
        <div class="container">
            <h1>My Practical Exam</h1>
            <div class="con_img">
                <img src="https://www.copahost.com/blog/wp-content/uploads/2019/07/imgsize2.png" alt="">
            </div>
            <%
                String mail1 = (String) session.getAttribute("mail");
                if(mail1 == null){
                    response.sendRedirect("index.jsp");
                }
                else{
            %>
            <div class="information">
                <form id="update" class="info" >
                    <input type="text" name="username" id="username" placeholder="Enter New Username ...">
                    <input type="password" name="password" id="password" placeholder="Enter New Password ...">
                </form>
            </div>
            <button class="login_btn" onclick="update()">Update</button>
            <button class="reg_btn" onclick="prev()">Cancel</button>
        </div>
        <% } %>
        <script>
              function prev(){
                window.location.href = "view.jsp";
              }
              function update(){
                let form = document.getElementById('update');
                form.method = "post";
                form.action = "update_process.jsp";
                form.submit();
              }
            
        </script>
    </body>
</body>
</html>