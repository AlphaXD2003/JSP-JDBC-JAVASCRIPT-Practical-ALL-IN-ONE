<%@ page import = "java.sql.* , java.util.*" %>

<%
    String username = (String) session.getAttribute("username");
    String mail = (String) session.getAttribute("mail");
    String password = (String) session.getAttribute("password");

    try{
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/exam", "root", "root");
        String query = "delete from practical where mail = ? and password = ?";
        try(PreparedStatement ps = conn.prepareStatement(query)){
            ps.setString(1, mail);
            ps.setString(2, password);
            ps.executeUpdate();
            session.removeAttribute("username");
            session.removeAttribute("mail");
            session.removeAttribute("password");
            response.sendRedirect("index.jsp");
        }catch(Exception e){
            out.println(e);
        }
    }catch(Exception e){
        out.println(e);
    }
%>