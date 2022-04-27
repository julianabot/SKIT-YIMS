<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%
    System.out.println(request.getParameter("d"));
    String id = request.getParameter("d");
    int no = Integer.parseInt(id);
//    Class.forName("com.mysql.jdbc.Driver").newInstance();
//    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "admin1234");
    Connection conn = (Connection) getServletContext().getAttribute("dbConnection");
    Statement stat = conn.createStatement();

    String iUsername = (String) request.getSession(false).getAttribute("username");
    String iName = (String) request.getSession(false).getAttribute("name");
    String name = "";
    String query = "SELECT name FROM `basic-info` WHERE basicID = ?";
    PreparedStatement stmt = conn.prepareStatement(query);
    stmt.setInt(1, no);

    ResultSet rs = stmt.executeQuery();
    while (rs.next()) {
        name = rs.getString(1);
    }
    query = "INSERT INTO `audit-log` (username, name, changes) VALUES (?, ?, ?)";
    stmt = conn.prepareStatement(query);

    stmt.setString(1, iUsername);
    stmt.setString(2, iName);

    String changes = iUsername + ": " + iName + " deleted Resident " + no + ": " + name;
    stmt.setString(3, changes);

    stmt.execute();

    query = "UPDATE `audit-log` SET timestamp = now() WHERE auditID = LAST_INSERT_ID()";
    stmt = conn.prepareStatement(query);

    stmt.execute();

    stat.executeUpdate("DELETE FROM `skit-yims`.`resident-info` WHERE residentID = '" + no + "'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`basic-info` WHERE basicID = '" + no + "'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`contact-info` WHERE contactID = '" + no + "'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`fam-status` WHERE familyID = '" + no + "'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`resident-org` WHERE organizationID = '" + no + "'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`resident-status` WHERE statusID = '" + no + "'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`vaccine-info` WHERE vaccineID = '" + no + "'");

    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
%>

