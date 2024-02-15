<%@ page import = "java.sql.* , java.util.* , java.io.* , java.security.*" %>

<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    System.out.println("Email: " + email);

    try{
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
        
        String query = "select * from practical where mail = ? and password = ?";
        try(PreparedStatement ps = con.prepareStatement(query)){
            ps.setString(1, email);
            ps.setString(2, password);
            

            System.out.println("SQL Query: " + ps.toString());

            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                String username = rs.getString("username");
                String mail = rs.getString("mail");
                String pass = rs.getString("password");

                session.setAttribute("username", username);
                session.setAttribute("mail", mail);
                session.setAttribute("password", pass);
                response.sendRedirect("main.jsp");
            }else{
                out.print(email + " " + password);
            }
        }
    }
    catch(Exception e){
        out.println(e);
    }
%>