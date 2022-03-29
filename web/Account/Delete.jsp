<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%
    System.out.println(request.getParameter("d"));
    String id = request.getParameter("d");
    int no = Integer.parseInt(id);
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/skit-yims?useSSL=false", "root", "kgarcia24");
    Statement stat = conn.createStatement();
    stat.executeUpdate("DELETE FROM `skit-yims`.`resident-info` WHERE residentID = '"+no+"'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`basic-info` WHERE basicID = '"+no+"'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`contact-info` WHERE contactID = '"+no+"'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`fam-status` WHERE familyID = '"+no+"'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`resident-org` WHERE organizationID = '"+no+"'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`resident-status` WHERE statusID = '"+no+"'");
    stat.executeUpdate("DELETE FROM `skit-yims`.`vaccine-info` WHERE vaccineID = '"+no+"'");
    
    response.sendRedirect("/SKIT-YIMS/Account/ViewDatabase.jsp");
%>

