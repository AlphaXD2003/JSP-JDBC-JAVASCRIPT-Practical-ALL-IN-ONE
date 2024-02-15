<%@ page import = "java.sql.* , java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <title>My Practical Exam</title>
</head>
<body background-color="#333">
    <div class="container">
        <h1>View The Details</h1>
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
        <div class="view">
            <%
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
            String mail = (String) session.getAttribute("mail");
            String query = "select * from practical where mail = ?";
            try(PreparedStatement ps = conn.prepareStatement(query)){
                ps.setString(1, mail);
                ResultSet rs = ps.executeQuery();
                if(rs.next()){
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("mail", rs.getString("mail"));
                    session.setAttribute("password", rs.getString("password"));
                }else{
                    session.setAttribute("regError", "User not found.");
                }
            }catch(Exception e){
                out.println(e);
            }
            %>
            <div class="viewusername">
                <h5>Username:</h5>
                <p><%= (String) session.getAttribute("username") %></p>
            </div>
           
            <div class="viewmail">
                <h5>Email: &nbsp &nbsp &nbsp</h5><p><%= (String) session.getAttribute("mail") %></p>
            </div>
          
            <div class="viewpassword">
                <h5>Password:</h5> <p id="fp" >****</p> <p id="passwordValue"  hidden> <%= (String) session.getAttribute("password") %></p>
                <span class="toggle-password" onclick="togglePasswordVisibility()"">
                    <i class="fa fa-eye" style="font-size:24px" ></i>
                </span>
            </div>

            <button id="updatepagebtn" onclick="update()">Update Details</button>
            <button id="updateprev" onclick="prev()">Previus page</button>
            
            <% String regError = (String) session.getAttribute("regError");
        if(regError != null){%>
            <p style="color: red;"><%= regError %></p>
        <%
        session.removeAttribute("regError");
          }
        }
        %>
        </div>
    </div>
    <script>
       
        function togglePasswordVisibility() {
            let passwordElement = document.getElementById("passwordValue");
            let fp = document.getElementById("fp");
            passwordElement.toggleAttribute("hidden");
            fp.toggleAttribute("hidden");
        
         
        }
        function prev(){
            window.location.href = "main.jsp";
        }
        function update(){
            window.location.href = "update.jsp";
        }

        
    </script>
</body>
</html>