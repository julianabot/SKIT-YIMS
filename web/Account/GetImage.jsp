<%@page import="java.sql.Blob"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
    String id = request.getParameter("id");
    Connection con = (Connection) getServletContext().getAttribute("dbConnection");
    try {

        PreparedStatement ps = con.prepareStatement("select * FROM `skit-yims`.`basic-info` WHERE basicID = ?");
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            Blob blob = rs.getBlob("validID");
            byte byteArray[] = blob.getBytes(1, (int) blob.length());
            response.setContentType("image/png");
            OutputStream os = response.getOutputStream();
            os.write(byteArray);
            os.flush();
            os.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>