<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<p>
    <br/>
</p>

<%
    String host = "jdbc:mysql://localhost:3306/skit-yims?useSSL=false";
    Connection conn = null;
    Statement stat = null;
    ResultSet res = null;
    PreparedStatement stmt = null;
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    conn = DriverManager.getConnection(host, "root", "kgarcia24");
%>

<form action = "" method = "post">
    <%
        stat = conn.createStatement();
        String u = request.getParameter("u");
        int num = Integer.parseInt(u);
        String basic_info = "SELECT * FROM `skit-yims`.`basic-info` WHERE basicID = '" + num + "';";
        res = stat.executeQuery(basic_info);
        while (res.next()) {
    %>   
    <input type ="hidden" name ="basicID" value = "<%= res.getString("basicID")%>"/>
    <div class ="form-group">
        <label>Name</label>
        <input type="text" class="form-control" name ="name" value = "<%= res.getString("name")%>"/>
    </div>
    <div class ="form-group">
        <label>Age Group</label>
        <input type="text" class="form-control" name ="age" value = "<%= res.getString("agegroup")%>"/>
    </div>
    <div class ="form-group">
        <label>Birthday</label>
        <input type="text" class="form-control" name ="birthday" value = "<%= res.getString("birthday")%>"/>
    </div>
    <div class ="form-group">
        <label>Address</label>
        <input type="text" class="form-control" name ="address" value = "<%= res.getString("address")%>"/>
    </div>
    <div class ="form-group">
        <label>Gender</label>
        <input type="text" class="form-control" name ="gender" value = "<%= res.getString("gender")%>"/>
    </div>
    <div class ="form-group">
        <label>valid ID</label>
        <input type="text" class="form-control" name ="validID" value = "<%= res.getString("validID")%>">
    </div>
    <%
        }
    %>   

    <br>
    <br>

    <%
        String contact_info = "SELECT * FROM `skit-yims`.`contact-info` WHERE contactID = '" + num + "';";
        res = stat.executeQuery(contact_info);
        while (res.next()) {
    %>
    <input type ="hidden" name ="contactID" value = "<%= res.getString("contactID")%>"/>
    <div class ="form-group">
        <label>Contact Number</label>
        <input type="text" class="form-control" name ="contactNo" value = "<%= res.getString("contactNo")%>"/>
    </div>
    <div class ="form-group">
        <label>Email Address</label>
        <input type="text" class="form-control" name ="emailAddress" value = "<%= res.getString("emailAddress")%>"/>
    </div>
    <div class ="form-group">
        <label>Facebook Name or URL</label>
        <input type="text" class="form-control" name ="fbNameURL" value = "<%= res.getString("fbNameURL")%>"/>
    </div>
    <%
        }
    %>    

    <br>
    <br>

    <%
        String fam_status = "SELECT * FROM `skit-yims`.`fam-status` WHERE familyID = '" + num + "';";
        res = stat.executeQuery(fam_status);
        while (res.next()) {
    %>
    <input type ="hidden" name ="familyID" value = "<%= res.getString("familyID")%>"/>
    <div class ="form-group">
        <label>Mother Name</label>
        <input type="text" class="form-control" name ="motherName" value = "<%= res.getString("motherName")%>"/>
    </div>
    <div class ="form-group">
        <label>Mother Occupation</label>
        <input type="text" class="form-control" name ="motherOccupation" value = "<%= res.getString("motherOccupation")%>"/>
    </div>
    <div class ="form-group">
        <label>Father Name</label>
        <input type="text" class="form-control" name ="fatherName" value = "<%= res.getString("fatherName")%>"/>
    </div>
    <div class ="form-group">
        <label>Father Occupation</label>
        <input type="text" class="form-control" name ="fatherOccupation" value = "<%= res.getString("fatherOccupation")%>"/>
    </div>
    <div class ="form-group">
        <label>Vital Status of Mother</label>
        <input type="text" class="form-control" name ="vitalStatusMother" value = "<%= res.getString("vitalStatusMother")%>"/>
    </div>
    <div class ="form-group">
        <label>Vital Status of Father</label>
        <input type="text" class="form-control" name ="vitalStatusFather" value = "<%= res.getString("vitalStatusFather")%>"/>
    </div>
    <div class ="form-group">
        <label>Number of Siblings</label>
        <input type="text" class="form-control" name ="noOfSiblings" value = "<%= res.getString("noOfSiblings")%>"/>
    </div>
    <div class ="form-group">
        <label>Sibling Education</label>
        <input type="text" class="form-control" name ="siblingEducation" value = "<%= res.getString("siblingEducation")%>"/>
    </div>
    <div class ="form-group">
        <label>Breadwinner</label>
        <input type="text" class="form-control" name ="breadWinner" value = "<%= res.getString("breadWinner")%>"/>
    </div>
    <%
        }
    %>

    <br>
    <br>

    <%
        String resident_org = "SELECT * FROM `skit-yims`.`resident-org` WHERE organizationID = '" + num + "';";
        res = stat.executeQuery(resident_org);
        while (res.next()) {
    %>
    <input type ="hidden" name ="organizationID" value = "<%= res.getString("organizationID")%>"/>
    <div class ="form-group">
        <label>Resident Voter</label>
        <input type="text" class="form-control" name ="residentVoter" value = "<%= res.getString("residentVoter")%>"/>
    </div>
    <div class ="form-group">
        <label>Member of an Organization</label>
        <input type="text" class="form-control" name ="memberOfOrg" value = "<%= res.getString("memberOfOrg")%>"/>
    </div>
    <div class ="form-group">
        <label>Name of Organization</label>
        <input type="text" class="form-control" name ="nameOfOrg" value = "<%= res.getString("nameOfOrg")%>"/>
    </div>
    <div class ="form-group">
        <label>Support SK</label>
        <input type="text" class="form-control" name ="supportSK" value = "<%= res.getString("supportSK")%>"/>
    </div>
    <div class ="form-group">
        <label>Show of support to SK</label>
        <input type="text" class="form-control" name ="showSupport" value = "<%= res.getString("showSupport")%>"/>
    </div>
    <div class ="form-group">
        <label>Job Chance</label>
        <input type="text" class="form-control" name ="jobChance" value = "<%= res.getString("jobChance")%>"/>
    </div>
    <div class ="form-group">
        <label>Say to SK</label>
        <input type="text" class="form-control" name ="sayToSK" value = "<%= res.getString("sayToSK")%>"/>
    </div>
    <%
        }
    %>

    <br>
    <br>

    <%
        String resident_status = "SELECT * FROM `skit-yims`.`resident-status` WHERE statusID = '" + num + "';";
        res = stat.executeQuery(resident_status);
        while (res.next()) {
    %>
    <input type ="hidden" name ="statusID" value = "<%= res.getString("statusID")%>"/>
    <div class ="form-group">
        <label>Civil Status</label>
        <input type="text" class="form-control" name ="civilStatus" value = "<%= res.getString("civilStatus")%>"/>
    </div>
    <div class ="form-group">
        <label>Working Status</label>
        <input type="text" class="form-control" name ="workingStatus" value = "<%= res.getString("workingStatus")%>"/>
    </div>
    <div class ="form-group">
        <label>Education Attainment</label>
        <input type="text" class="form-control" name ="educationAttainment" value = "<%= res.getString("educationAttainment")%>"/>
    </div>
    <div class ="form-group">
        <label>Job Employed</label>
        <input type="text" class="form-control" name ="jobEmployed" value = "<%= res.getString("jobEmployed")%>"/>
    </div>
    <div class ="form-group">
        <label>PWD</label>
        <input type="text" class="form-control" name ="PWD" value = "<%= res.getString("PWD")%>"/>
    </div>
    <div class ="form-group">
        <label>Type of Disability</label>
        <input type="text" class="form-control" name ="typeOfDisability" value = "<%= res.getString("typeOfDisability")%>"/>
    </div>
    <%
        }
    %>
    
    <br>
    <br>

    <%
        String vaccine_info = "SELECT * FROM `skit-yims`.`vaccine-info` WHERE vaccineID = '" + num + "';";
        res = stat.executeQuery(vaccine_info);
        while (res.next()) {
    %>
    <input type ="hidden" name ="vaccineID" value = "<%= res.getString("vaccineID")%>"/>
    <div class ="form-group">
        <label>Vaccinated</label>
        <input type="text" class="form-control" name ="vaccinated" value = "<%= res.getString("vaccinated")%>"/>
    </div>
    <div class ="form-group">
        <label>Willing for Vaccine</label>
        <input type="text" class="form-control" name ="willingForVaccine" value = "<%= res.getString("willingForVaccine")%>"/>
    </div>
    <div class ="form-group">
        <label>Brand of Vaccine</label>
        <input type="text" class="form-control" name ="brandOfVaccine" value = "<%= res.getString("brandOfVaccine")%>"/>
    </div>
    <div class ="form-group">
        <label>Vaccine Status</label>
        <input type="text" class="form-control" name ="vaccineStatus" value = "<%= res.getString("vaccineStatus")%>"/>
    </div>
    <%
        }
    %>    


    <button type ="submit" class="btn btn-warning">Update</button>
    <a href="../Account/ViewDatabase.jsp" class ="btn btn-default">Back</a>
</form>
<html>
    <%
        String bID = request.getParameter("basicID");
        String name = request.getParameter("name");
        String age = request.getParameter("age");
        String birthday = request.getParameter("birthday");
        String address = request.getParameter("address");
        String gender = request.getParameter("gender");
        String validID = request.getParameter("validID");

        String cID = request.getParameter("contactID");
        String contactNo = request.getParameter("contactNo");
        String email = request.getParameter("emailAddress");
        String fbName = request.getParameter("fbNameURL");

        String fID = request.getParameter("familyID");
        String motherName = request.getParameter("motherName");
        String motherOccupation = request.getParameter("motherOccupation");
        String fatherName = request.getParameter("fatherName");
        String fatherOccupation = request.getParameter("fatherOccupation");
        String vitalStatusMother = request.getParameter("vitalStatusMother");
        String vitalStatusFather = request.getParameter("vitalStatusFather");
        String noOfSiblings = request.getParameter("noOfSiblings");
        String siblingEducation = request.getParameter("siblingEducation");
        String breadWinner = request.getParameter("breadWinner");

        String oID = request.getParameter("organizationID");
        String residentVoter = request.getParameter("residentVoter");
        String memberOfOrg = request.getParameter("memberOfOrg");
        String nameOfOrg = request.getParameter("nameOfOrg");
        String supportSK = request.getParameter("supportSK");
        String showSupport = request.getParameter("showSupport");
        String jobChance = request.getParameter("jobChance");
        String sayToSK = request.getParameter("sayToSK");
        
        String sID = request.getParameter("statusID");
        String civilStatus = request.getParameter("civilStatus");
        String workingStatus = request.getParameter("workingStatus");
        String educationAttainment = request.getParameter("educationAttainment");
        String jobEmployed = request.getParameter("jobEmployed");
        String PWD = request.getParameter("PWD");
        String typeOfDisability = request.getParameter("typeOfDisability");
        
        String vID = request.getParameter("vaccineID");
        String vaccinated = request.getParameter("vaccinated");
        String willingForVaccine = request.getParameter("willingForVaccine");
        String brandOfVaccine = request.getParameter("brandOfVaccine");
        String vaccineStatus = request.getParameter("vaccineStatus");
        
        if (bID != null && name != null && address != null && validID != null
                && cID != null && contactNo != null && email != null && fbName != null
                && fID != null && motherName != null && motherOccupation != null && fatherName != null && fatherOccupation != null && vitalStatusMother != null && vitalStatusFather != null && noOfSiblings != null && siblingEducation != null && breadWinner != null
                && oID != null && residentVoter != null && memberOfOrg != null && nameOfOrg != null && supportSK != null && showSupport != null && jobChance != null && sayToSK != null
                && sID != null && civilStatus != null && workingStatus != null && educationAttainment != null && jobEmployed != null && PWD != null && typeOfDisability != null
                && vID != null && vaccinated != null && willingForVaccine != null && brandOfVaccine != null && vaccineStatus != null) {
            String basic_query = "UPDATE `skit-yims`.`basic-info` SET `name` = ?, `agegroup` = ?, `birthday` = ?, `address` = ?, `gender` = ?, `validID` = ? WHERE (`basicID` = '" + bID + "')";
            stmt = conn.prepareStatement(basic_query);
            stmt.setString(1, name);
            stmt.setString(2, age);
            stmt.setString(3, birthday);
            stmt.setString(4, address);
            stmt.setString(5, gender);
            stmt.setString(6, validID);
            stmt.execute();

            String contact_query = "UPDATE `skit-yims`.`contact-info` SET `contactNo` = ?, `emailAddress` = ?, `fbNameURL` = ?  WHERE (`contactID` = '" + cID + "')";
            stmt = conn.prepareStatement(contact_query);
            stmt.setString(1, contactNo);
            stmt.setString(2, email);
            stmt.setString(3, fbName);
            stmt.execute();

            String family_query = "UPDATE `skit-yims`.`fam-status` SET `motherName` = ?, `motherOccupation` = ?, `fatherName` = ? , `fatherOccupation` = ?, `vitalStatusMother` = ?, `vitalStatusFather` = ?, `noOfSiblings` = ?, `siblingEducation` = ?, `breadWinner` = ? WHERE (`familyID` = '" + fID + "')";
            stmt = conn.prepareStatement(family_query);
            stmt.setString(1, motherName);
            stmt.setString(2, motherOccupation);
            stmt.setString(3, fatherName);
            stmt.setString(4, fatherOccupation);
            stmt.setString(5, vitalStatusMother);
            stmt.setString(6, vitalStatusFather);
            stmt.setString(7, noOfSiblings);
            stmt.setString(8, siblingEducation);
            stmt.setString(9, breadWinner);
            stmt.execute();

            String org_query = "UPDATE `skit-yims`.`resident-org` SET `residentVoter` = ?, `memberOfOrg` = ?, `nameOfOrg` = ? , `supportSK` = ?, `showSupport` = ?, `jobChance` = ?, `sayToSK` = ? WHERE (`organizationID` = '" + oID + "')";
            stmt = conn.prepareStatement(org_query);
            stmt.setString(1, residentVoter);
            stmt.setString(2, memberOfOrg);
            stmt.setString(3, nameOfOrg);
            stmt.setString(4, supportSK);
            stmt.setString(5, showSupport);
            stmt.setString(6, jobChance);
            stmt.setString(7, sayToSK);
            stmt.execute();
            
            String status_query = "UPDATE `skit-yims`.`resident-status` SET `civilStatus` = ?, `workingStatus` = ?, `educationAttainment` = ? , `jobEmployed` = ?, `PWD` = ?, `typeOfDisability` = ? WHERE (`statusID` = '" + sID + "')";
            stmt = conn.prepareStatement(status_query);
            stmt.setString(1, civilStatus);
            stmt.setString(2, workingStatus);
            stmt.setString(3, educationAttainment);
            stmt.setString(4, jobEmployed);
            stmt.setString(5, PWD);
            stmt.setString(6, typeOfDisability);
            stmt.execute();
            
            String vaccine_query = "UPDATE `skit-yims`.`vaccine-info` SET `vaccinated` = ?, `willingForVaccine` = ?, `brandOfVaccine` = ? , `vaccineStatus` = ? WHERE (`vaccineID` = '" + vID + "')";
            stmt = conn.prepareStatement(vaccine_query);
            stmt.setString(1, vaccinated);
            stmt.setString(2, willingForVaccine);
            stmt.setString(3, brandOfVaccine);
            stmt.setString(4, vaccineStatus);
            stmt.execute();

            response.sendRedirect("../Account/ViewDatabase.jsp");
        }
    %>
</html>

<%--
UPDATE `skit-yims`.`basic-info` SET `name` = 'Kyle' WHERE (`basicID` = '1');
--%>