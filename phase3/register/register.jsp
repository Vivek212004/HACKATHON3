<%@ page import ="java.sql.*" %>
<%@ page import ="javax.sql.*" %>
<%
String fname = request.getParameter("fname");
String email = request.getParameter("email");
String pwd = request.getParameter("pass");
String cpwd = request.getParameter("cpass");

Class.forName("com.mysql.jdbc.Driver");
java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3307/phase3", "root", "");
Statement st = con.createStatement();
int i = 0;

if (cpwd.equals(pwd)) {
    i = st.executeUpdate("insert into users values ('" + fname + "', '" + email + "', '" + pwd + "',' " +cpwd+ " ')");
    if (i > 0) {
        response.sendRedirect("../login/index.html"); // Redirect to success.jsp page
    }
} else {
    request.setAttribute("errorMessage", "Passwords do not match");
    RequestDispatcher rd = request.getRequestDispatcher("index.html");
    rd.forward(request, response);
}
%>
