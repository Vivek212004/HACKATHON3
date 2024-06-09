<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%
String fname = request.getParameter("fname");
String pwd = request.getParameter("pwd");

try {
    // Load MySQL JDBC Driver
    Class.forName("com.mysql.jdbc.Driver");
    
    // Establish connection
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3", "root", "");
    
    // Create a parameterized query to prevent SQL injection
    String sql = "SELECT PASSWORD FROM users WHERE EMAIL = ?";
    PreparedStatement ps = con.prepareStatement(sql);
    ps.setString(1, fname);
    
    ResultSet rs = ps.executeQuery();
    
    if (rs.next()) {
        String dbPassword = rs.getString("PASSWORD");
        
        if (dbPassword.equals(pwd)) {
            response.sendRedirect("../index.html"); // Redirect to index.html page on success
        } else {
            out.println("Invalid password.");
        }
    } else {
        out.println("User not found.");
    }

} catch (Exception e) {
    e.printStackTrace();
}
%>
