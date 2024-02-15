<%@ page import="java.sql.* , java.util.*, java.security.* , java.util.regex.Pattern" %>
<%

    String username = request.getParameter("username");
    String mail = session.getAttribute("mail").toString();
    String password = request.getParameter("password");

    String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";
    Pattern pattern = Pattern.compile(passwordRegex);   

    boolean isMatch = pattern.matcher(password).matches();
    if(!isMatch){
        
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
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
        
        out.println(session.getAttribute("username") + " " + session.getAttribute("mail") + " " + session.getAttribute("password"));
        session.setAttribute("regError", "Password must contain at least one lowercase letter, one uppercase letter, one special character and must be at least 8 characters long."); 
        response.sendRedirect("view.jsp");
        
        
    }
    else{
        try{
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
            String query = "update practical set username = ? , mail = ? , password = ? where mail = ?";
            try(PreparedStatement ps = conn.prepareStatement(query)){
                ps.setString(1, username);
                ps.setString(2, mail);
                ps.setString(3, password);
                ps.setString(4, mail);
                ps.executeUpdate();
                session.setAttribute("username", username);
                session.setAttribute("mail", mail);
                session.setAttribute("password", password);
    
                response.sendRedirect("view.jsp");
            }catch(Exception e){
                out.println(e);
            }
        }catch(Exception e){
            out.println(e);
        }
    }

   

%>