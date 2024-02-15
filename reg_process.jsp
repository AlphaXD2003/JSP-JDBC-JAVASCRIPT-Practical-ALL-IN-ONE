<%@ page import = "java.sql.* , java.util.* , java.io.* , java.security.* , java.util.regex.Pattern" %>

<%

String username = request.getParameter("username");
String email = request.getParameter("email");
String password = request.getParameter("password");

String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";
Pattern pattern = Pattern.compile(passwordRegex);

boolean isMatch = pattern.matcher(password).matches();
if(!isMatch){
    session.setAttribute("regError", "Password must contain at least one lowercase letter, one uppercase letter, one special character and must be at least 8 characters long.");
    response.sendRedirect("reg.jsp");
}
else{
    String mail = (String) session.getAttribute("mail");
    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
        String query1 = "select * from practical where mail = ?";
        try(PreparedStatement ps1 = conn.prepareStatement(query1)){
            ps1.setString(1 , email);
            ResultSet rs1 = ps1.executeQuery();
            if(rs1.next()){
                session.setAttribute("regError", "User already exists.");
                response.sendRedirect("reg.jsp");
            }
            else{
                try{
                    Class.forName("com.mysql.jdbc.Driver");
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
                    
                    String query = "insert into practical (username, mail, password) values (?, ?, ?)";
                    try(PreparedStatement ps = con.prepareStatement(query)){
                        ps.setString(1, username);
                        ps.setString(2, email);
                        ps.setString(3, password);
                        ps.executeUpdate();
                
                        session.setAttribute("username", username);
                        session.setAttribute("mail", email);
                        session.setAttribute("password", password);
                
                
                        response.sendRedirect("main.jsp");
                    }catch(Exception e){
                        out.println(e);
                    }
                
                }catch(Exception e){
                    out.println(e);
                }
            }
        }
    }catch(Exception e){
        out.println(e);
    }
   
}


%>