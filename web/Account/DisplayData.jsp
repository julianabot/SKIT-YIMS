<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="ISO-8859-1">
        <title>DISPLAY DATA PAGE</title>
    </head>
    <body>
        <%
            try {

        //        Class.forName("com.mysql.jdbc.Driver").newInstance();
        //        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false","root","admin1234");
                Connection con = (Connection) getServletContext().getAttribute("dbConnection");
                String sql = "SELECT * FROM `skit-yims`.`basic-info`;";
                PreparedStatement stmt = con.prepareStatement(sql);
                ResultSet rs = stmt.executeQuery();
                if (rs.next() == false) {
                    out.println("No Records in the table");
                } else {%>

        <table border="1">
            <tr><th>Basic ID</th><th>Name</th><th>Agegroup</th><th>Birthday</th><th>Address</th><th>Gender</th><th>Valid ID</th></tr>
                    <%
            do {%>

            <tr><td><%= rs.getString(1)%></td><td><%= rs.getString(2)%></td><td><%= rs.getString(3)%></td><td><%= rs.getString(4)%></td>
                <td><%= rs.getString(5)%></td><td><%= rs.getString(6)%></td><td><%= rs.getString(7)%></td></tr>

            <%} while (rs.next());
                    }

                } catch (Exception e) {
                    System.out.println(e.getMessage());
                    e.getStackTrace();
                }
            %>
        </table>
    </body>
</html>