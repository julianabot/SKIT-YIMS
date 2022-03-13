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

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/png" href="img/SK_Logo.png"/>
        <link href="../Account/AccountCSS/Edit.css" rel="stylesheet" type="text/css">
        <title>Edit Resident Profile</title>
        
    </head>
    <%
        String host = "jdbc:mysql://localhost:3306/skit-yims?useSSL=false";
        Connection conn = null;
        Statement stat = null;
        ResultSet res = null;
        PreparedStatement stmt = null;
        Class.forName("com.mysql.jdbc.Driver").newInstance();
        conn = DriverManager.getConnection(host, "root", "1Europa4!");
    %>

    <body>
        <div id="header-container">
            <img src="../img/SK_Logo.png" alt="SK Logo" id="Logo">
            <div>
                <h1 id="header-text">SK Ibayo-Tipas:<br>Edit Resident Profile</h1>
            </div>
        </div>
        <div class="tab">
            <button class="tablinks" onclick="showTab(event, 'Info')" id="defaultOpen">Resident Information</button>
            <button class="tablinks" onclick="showTab(event, 'Details')">Resident Details</button>
            <button class="tablinks" onclick="showTab(event, 'Contact')">Contact Details</button>
            <button class="tablinks" onclick="showTab(event, 'Family')">Family Details</button>
            <button class="tablinks" onclick="showTab(event, 'Survey')">Survey</button>
            <button class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination</button>
        </div>
        <div overflow:auto class="container">
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

                <div id="Info" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div class ="form-group">
                                <label>Name</label>
                                <input type="text" class="form-control" name ="name" value = "<%= res.getString("name")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Age Group</label>
                                <select name="age" class="age-select">
                                    <%
                                        if (res.getString("agegroup").equals("14 years old and below")) {
                                    %>        
                                    <option value="14 years old and below" selected = "selected">14 years old and below</option>
                                    <option value="15-20 years old">15-20 years old</option>
                                    <option value="21-30 years old">21-30 years old</option>
                                    <option value="31 years old and above">31 years old and above</option>  
                                    <%
                                    } else if (res.getString("agegroup").equals("15-20 years old")) {
                                    %>        
                                    <option value="14 years old and below">14 years old and below</option>
                                    <option value="15-20 years old"  selected = "selected">15-20 years old</option>
                                    <option value="21-30 years old">21-30 years old</option>
                                    <option value="31 years old and above">31 years old and above</option>
                                    <%
                                    } else if (res.getString("agegroup").equals("21-30 years old")) {
                                    %>
                                    <option value="14 years old and below">14 years old and below</option>
                                    <option value="15-20 years old">15-20 years old</option>
                                    <option value="21-30 years old" selected = "selected">21-30 years old</option>
                                    <option value="31 years old and above">31 years old and above</option>
                                    <%
                                    } else {
                                    %>
                                    <option value="14 years old and below">14 years old and below</option>
                                    <option value="15-20 years old">15-20 years old</option>
                                    <option value="21-30 years old">21-30 years old</option>
                                    <option value="31 years old and above" selected = "selected">31 years old and above</option
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Birthday</label>
                                <input type="text" class="form-control" name ="birthday" value = "<%= res.getString("birthday")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Address</label>
                                <input type="text" class="form-control" name ="address" value = "<%= res.getString("address")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Gender</label>
                                <select name="gender" class="age-select">
                                    <%
                                        if (res.getString("gender").equals("Male(Lalaki)")) {
                                    %>         
                                    <option value="Male(Lalaki)" selected = "selected">Male(Lalaki)</option>
                                    <option value="Female (Babae)">Female (Babae)</option>  
                                    <%
                                    } else if (res.getString("gender").equals("Female (Babae)")) {
                                    %>        
                                    <option value="Male(Lalaki)">Male(Lalaki)</option>
                                    <option value="Female (Babae)"  selected = "selected">Female (Babae)</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>valid ID</label>
                                <input type="text" class="form-control" name ="validID" value = "<%= res.getString("validID")%>">
                            </div>
                            <%
                                }
                            %>   
                        </div>
                    </div>
                </div>
                <!--  <br>
                  <br> -->

                <%
                    String contact_info = "SELECT * FROM `skit-yims`.`contact-info` WHERE contactID = '" + num + "';";
                    res = stat.executeQuery(contact_info);
                    while (res.next()) {
                %>
                <input type ="hidden" name ="contactID" value = "<%= res.getString("contactID")%>"/>

                <div id="Contact" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div class ="form-group">
                                <label>Contact Number</label>
                                <input type="text" class="form-control" name ="contactNo" value = "<%= res.getString("contactNo")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Email Address</label>
                                <input type="text" class="form-control" name ="emailAddress" value = "<%= res.getString("emailAddress")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Facebook Name or URL</label>
                                <input type="text" class="form-control" name ="fbNameURL" value = "<%= res.getString("fbNameURL")%>"/>
                            </div>
                            <%
                                }
                            %>    
                        </div>
                    </div>
                </div>

                <!--  <br>
                  <br> -->


                <%
                    String fam_status = "SELECT * FROM `skit-yims`.`fam-status` WHERE familyID = '" + num + "';";
                    res = stat.executeQuery(fam_status);
                    while (res.next()) {
                %>
                <input type ="hidden" name ="familyID" value = "<%= res.getString("familyID")%>"/>

                <div id="Family" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div class ="form-group">
                                <label>Mother Name</label>
                                <input type="text" class="form-control" name ="motherName" value = "<%= res.getString("motherName")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Mother Occupation</label>
                                <input type="text" class="form-control" name ="motherOccupation" value = "<%= res.getString("motherOccupation")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Father Name</label>
                                <input type="text" class="form-control" name ="fatherName" value = "<%= res.getString("fatherName")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Father Occupation</label>
                                <input type="text" class="form-control" name ="fatherOccupation" value = "<%= res.getString("fatherOccupation")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Vital Status of Mother</label>
                                <select name="vitalStatusMother" class="age-select">
                                    <%
                                        if (res.getString("vitalStatusMother").equals("Living")) {
                                    %>         
                                    <option value="Living" selected = "selected">Living</option>
                                    <option value="Deceased">Deceased</option>  
                                    <%
                                    } else {
                                    %>        
                                    <option value="Living">Living</option>
                                    <option value="Deceased"  selected = "selected">Deceased</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Vital Status of Father</label>
                                <select name="vitalStatusFather" class="age-select">
                                    <%
                                        if (res.getString("vitalStatusFather").equals("Living")) {
                                    %>         
                                    <option value="Living" selected = "selected">Living</option>
                                    <option value="Deceased">Deceased</option>  
                                    <%
                                    } else {
                                    %>        
                                    <option value="Living">Living</option>
                                    <option value="Deceased"  selected = "selected">Deceased</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Number of Siblings</label>
                                <input type="text" class="form-control" name ="noOfSiblings" value = "<%= res.getString("noOfSiblings")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Sibling Education</label>
                                <input type="text" class="form-control" name ="siblingEducation" value = "<%= res.getString("siblingEducation")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Breadwinner</label>
                                <input type="text" class="form-control" name ="breadWinner" value = "<%= res.getString("breadWinner")%>"/>
                            </div>
                            <%
                                }
                            %>
                        </div>
                    </div>
                </div>
                <!-- <br>
                 <br> -->

                <%
                    String resident_org = "SELECT * FROM `skit-yims`.`resident-org` WHERE organizationID = '" + num + "';";
                    res = stat.executeQuery(resident_org);
                    while (res.next()) {
                %>
                <input type ="hidden" name ="organizationID" value = "<%= res.getString("organizationID")%>"/>

                <div id="Survey" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div class ="form-group">
                                <label>Resident Voter</label>
                                <select name="residentVoter" class="age-select">
                                    <%
                                        if (res.getString("residentVoter").equals("Yes")) {
                                    %>         
                                    <option value="Yes" selected = "selected">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else {
                                    %>        
                                    <option value="Yes">Yes</option>
                                    <option value="No"  selected = "selected">No</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Member of an Organization</label>
                                <select name="memberOfOrg" class="age-select">
                                    <%
                                        if (res.getString("memberOfOrg").equals("Yes")) {
                                    %>         
                                    <option value="Yes" selected = "selected">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else {
                                    %>        
                                    <option value="Yes">Yes</option>
                                    <option value="No"  selected = "selected">No</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Name of Organization</label>
                                <input type="text" class="form-control" name ="nameOfOrg" value = "<%= res.getString("nameOfOrg")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Support SK</label>
                                <select name="supportSK" class="age-select">
                                    <%
                                        if (res.getString("supportSK").equals("Yes")) {
                                    %>         
                                    <option value="Yes" selected = "selected">Yes</option>
                                    <option value="No">No</option>
                                    <option value="Maybe">Maybe</option>  
                                    <%
                                    } else if (res.getString("supportSK").equals("No")) {
                                    %>        
                                    <option value="Yes">Yes</option>
                                    <option value="No"  selected = "selected">No</option>
                                    <option value="Maybe">Maybe</option>  
                                    <%
                                    } else {
                                    %>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>
                                    <option value="Maybe"  selected = "selected">Maybe</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Show of support to SK</label>
                                <input type="text" class="form-control" name ="showSupport" value = "<%= res.getString("showSupport")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Job Chance</label>
                                <input type="text" class="form-control" name ="jobChance" value = "<%= res.getString("jobChance")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Say to SK</label>
                                <input type="text" class="form-control" name ="sayToSK" value = "<%= res.getString("sayToSK")%>"/>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
                <!-- <br>
                 <br> -->

                <%
                    String resident_status = "SELECT * FROM `skit-yims`.`resident-status` WHERE statusID = '" + num + "';";
                    res = stat.executeQuery(resident_status);
                    while (res.next()) {
                %>
                <input type ="hidden" name ="statusID" value = "<%= res.getString("statusID")%>"/>

                <div id="Details" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div class ="form-group">
                                <label>Civil Status</label>
                                <select name="civilStatus" class="age-select">
                                    <%
                                        if (res.getString("civilStatus").equals("Single")) {
                                    %>         
                                    <option value="Single"  selected = "selected">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option>
                                    <%
                                    } else if (res.getString("civilStatus").equals("Married")) {
                                    %>        
                                    <option value="Single">Single</option>
                                    <option value="Married"  selected = "selected">Married</option>
                                    <option value="Widowed">Widowed</option> 
                                    <%
                                    } else {
                                    %>
                                    <option value="Single">Single</option>
                                    <option value="Married">Married</option>
                                    <option value="Widowed">Widowed</option> 
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Working Status</label>
                                <select name="workingStatus" class="age-select">
                                    <%
                                        if (res.getString("workingStatus").equals("Full-Time Student")) {
                                    %>         
                                    <option value="Full-Time Student" selected = "selected">Full-Time Student</option>
                                    <option value="Working Student">Working Student</option>
                                    <option value="Out of School Youth">Out of School Youth</option>
                                    <option value="Working/Employed">Working/Employed</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Currently Looking For a Job">Currently Looking For a Job</option>
                                    <%
                                    } else if (res.getString("workingStatus").equals("Working Student")) {
                                    %>        
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Working Student"  selected = "selected">Working Student</option>
                                    <option value="Out of School Youth">Out of School Youth</option>
                                    <option value="Working/Employed">Working/Employed</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Currently Looking For a Job">Currently Looking For a Job</option>
                                    <%
                                    } else if (res.getString("workingStatus").equals("Out of School Youth")) {
                                    %>        
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Working Student">Working Student</option>
                                    <option value="Out of School Youth"   selected = "selected">Out of School Youth</option>
                                    <option value="Working/Employed">Working/Employed</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Currently Looking For a Job">Currently Looking For a Job</option>
                                    <%
                                    } else if (res.getString("workingStatus").equals("Working/Employed")) {
                                    %>        
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Working Student">Working Student</option>
                                    <option value="Out of School Youth">Out of School Youth</option>
                                    <option value="Working/Employed" selected = "selected">Working/Employed</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Currently Looking For a Job">Currently Looking For a Job</option>
                                    <%
                                    } else if (res.getString("workingStatus").equals("Unemployed")) {
                                    %>        
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Working Student">Working Student</option>
                                    <option value="Out of School Youth">Out of School Youth</option>
                                    <option value="Working/Employed">Working/Employed</option>
                                    <option value="Unemployed" selected = "selected">Unemployed</option>
                                    <option value="Currently Looking For a Job">Currently Looking For a Job</option>
                                    <%
                                    } else {
                                    %>
                                    <option value="Full-Time Student">Full-Time Student</option>
                                    <option value="Working Student">Working Student</option>
                                    <option value="Out of School Youth">Out of School Youth</option>
                                    <option value="Working/Employed">Working/Employed</option>
                                    <option value="Unemployed">Unemployed</option>
                                    <option value="Currently Looking For a Job" selected = "selected">Currently Looking For a Job</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Education Attainment</label>
                                <select name="educationAttainment" class="age-select">
                                    <%
                                        if (res.getString("educationAttainment").equals("Elementary Level")) {
                                    %>         
                                    <option value="Elementary Level" selected = "selected">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else if (res.getString("educationAttainment").equals("Elementary Graduate")) {
                                    %>        
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate" selected = "selected">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else if (res.getString("educationAttainment").equals("Junior High School Level")) {
                                    %>        
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level" selected = "selected">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else if (res.getString("educationAttainment").equals("Junior High School Graduate")) {
                                    %>        
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate" selected = "selected">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else if (res.getString("educationAttainment").equals("Senior High School Level")) {
                                    %>        
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level" selected = "selected">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else if (res.getString("educationAttainment").equals("Senior High School Graduate")) {
                                    %>        
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate" selected = "selected">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else if (res.getString("educationAttainment").equals("College Level")) {
                                    %>        
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level" selected = "selected">College Level</option>
                                    <option value="College Graduate">College Graduate</option>
                                    <%
                                    } else {
                                    %>
                                    <option value="Elementary Level">Elementary Level</option>
                                    <option value="Elementary Graduate">Elementary Graduate</option>
                                    <option value="Junior High School Level">Junior High School Level</option>
                                    <option value="Junior High School Graduate">Junior High School Graduate</option>
                                    <option value="Senior High School Level">Senior High School Level</option>
                                    <option value="Senior High School Graduate">Senior High School Graduate</option>
                                    <option value="College Level">College Level</option>
                                    <option value="College Graduate" selected = "selected">College Graduate</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Job Employed</label>
                                <input type="text" class="form-control" name ="jobEmployed" value = "<%= res.getString("jobEmployed")%>"/>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>PWD</label>
                                <select name="PWD" class="age-select">
                                    <%
                                        if (res.getString("PWD").equals("Yes")) {
                                    %>         
                                    <option value="Yes" selected = "selected">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else {
                                    %>        
                                    <option value="Yes">Yes</option>
                                    <option value="No"  selected = "selected">No</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Type of Disability</label>
                                <input type="text" class="form-control" name ="typeOfDisability" value = "<%= res.getString("typeOfDisability")%>"/>
                            </div>
                            <%
                                }
                            %>

                        </div>
                    </div>
                </div>
                <!-- <br>
                 <br> -->

                <%
                    String vaccine_info = "SELECT * FROM `skit-yims`.`vaccine-info` WHERE vaccineID = '" + num + "';";
                    res = stat.executeQuery(vaccine_info);
                    while (res.next()) {
                %>
                <input type ="hidden" name ="vaccineID" value = "<%= res.getString("vaccineID")%>"/>

                <div id="Vaccination" class="tabcontent">
                    <div class="container-main">
                        <div class="content-container">
                            <div class ="form-group">
                                <label>Vaccinated</label>
                                <select name="vaccinated" class="age-select">
                                    <%
                                        if (res.getString("vaccinated").equals("N/A")) {
                                    %>         
                                    <option value="N/A" selected = "selected">N/A</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else if (res.getString("vaccinated").equals("Yes")) {
                                    %>        
                                    <option value="N/A">N/A</option>
                                    <option value="Yes" selected = "selected">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No" selected = "selected">No</option> 
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Willing for Vaccine</label>
                                <select name="willingForVaccine" class="age-select">
                                    <%
                                        if (res.getString("willingForVaccine").equals("N/A")) {
                                    %>         
                                    <option value="N/A" selected = "selected">N/A</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else if (res.getString("willingForVaccine").equals("Yes")) {
                                    %>        
                                    <option value="N/A">N/A</option>
                                    <option value="Yes" selected = "selected">Yes</option>
                                    <option value="No">No</option>  
                                    <%
                                    } else {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Yes">Yes</option>
                                    <option value="No" selected = "selected">No</option> 
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Brand of Vaccine</label>
                                <select name="brandOfVaccine" class="age-select">
                                    <%
                                        if (res.getString("brandOfVaccine").equals("N/A")) {
                                    %>         
                                    <option value="N/A" selected = "selected">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("Pfizer-BioNTech")) {
                                    %>        
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech" selected = "selected">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("Oxford-AstraZeneca")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca" selected = "selected">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("CoronaVac (Sinovac)")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)" selected = "selected">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("Gamaleya Sputnik V")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V" selected = "selected">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("Johnson and Johnson's Janssen")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen" selected = "selected">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("Bharat BioTech")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech" selected = "selected">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else if (res.getString("brandOfVaccine").equals("Moderna")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna" selected = "selected">Moderna</option>
                                    <option value="Sinopharm">Sinopharm</option> 
                                    <%
                                    } else {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Pfizer-BioNTech">Pfizer-BioNTech</option>
                                    <option value="Oxford-AstraZeneca">Oxford-AstraZeneca</option>
                                    <option value="CoronaVac (Sinovac)">CoronaVac (Sinovac)</option>
                                    <option value="Gamaleya Sputnik V">Gamaleya Sputnik V</option>
                                    <option value="Johnson and Johnson's Janssen">Johnson and Johnson's Janssen</option>
                                    <option value="Bharat BioTech">Bharat BioTech</option>
                                    <option value="Moderna">Moderna</option>
                                    <option value="Sinopharm" selected = "selected">Sinopharm</option> 
                                    <%
                                        }
                                    %>
                                </select>
                            </div>

                            <div class="content-divider"></div>

                            <div class ="form-group">
                                <label>Vaccine Status</label>
                                <select name="vaccineStatus" class="age-select">
                                    <%
                                        if (res.getString("vaccineStatus").equals("N/A")) {
                                    %>         
                                    <option value="N/A" selected = "selected">N/A</option>
                                    <option value="Not Vaccinated">Not Vaccinated</option>
                                    <option value="First Dose">First Dose</option>
                                    <option value="Second Dose">Second Dose</option>
                                    <option value="Booster">Booster</option>
                                    <%
                                    } else if (res.getString("vaccineStatus").equals("Not Vaccinated")) {
                                    %>        
                                    <option value="N/A">N/A</option>
                                    <option value="Not Vaccinated" selected = "selected">Not Vaccinated</option>
                                    <option value="First Dose">First Dose</option>
                                    <option value="Second Dose">Second Dose</option>
                                    <option value="Booster">Booster</option>
                                    <%
                                    } else if (res.getString("vaccineStatus").equals("First Dose")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Not Vaccinated">Not Vaccinated</option>
                                    <option value="First Dose" selected = "selected">First Dose</option>
                                    <option value="Second Dose">Second Dose</option>
                                    <option value="Booster">Booster</option>
                                    <%
                                    } else if (res.getString("vaccineStatus").equals("Second Dose")) {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Not Vaccinated">Not Vaccinated</option>
                                    <option value="First Dose">First Dose</option>
                                    <option value="Second Dose"  selected = "selected">Second Dose</option>
                                    <option value="Booster">Booster</option>
                                    <%
                                    } else {
                                    %>
                                    <option value="N/A">N/A</option>
                                    <option value="Not Vaccinated">Not Vaccinated</option>
                                    <option value="First Dose">First Dose</option>
                                    <option value="Second Dose">Second Dose</option>
                                    <option value="Booster"   selected = "selected">Booster</option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>
                            <%
                                }
                            %>    
                        </div>
                    </div>
                </div>

                <div class="buttons">
                    <button type ="submit" class="btn btn-warning">Update</button>
                    <a href="../Account/ViewDatabase.jsp" class ="btn btn-default">Back</a>
                </div>

        </div>

    </form>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript">
                function siblingSelection(times) {
                    $("#clonecontainer").html('');
                    for (var i = 1; i < times; i++) {
                        var clons = $(".original").first().clone();
                        $("#clonecontainer").append(clons);
                    }
                }

    </script>
    <script>
        var counter = 0;
        var tabs = ["Info", "Details", "Contact", "Family", "Survey", "Vaccination"];
        function showTab(evt, tabName) {
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                tabcontent[i].style.display = "none";
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");

            }
            document.getElementById(tabName).style.display = "block";
            evt.currentTarget.className += " active";
            counter = tabs.indexOf(tabName);

            if (counter == 5) {
                document.getElementById('nextButton').style.visibility = 'hidden';
                document.getElementById("submitButton").style.visibility = 'visible';
                document.getElementById('backButton').style.visibility = 'visible';
            } else if (counter != 5) {
                if (counter == 0) {
                    document.getElementById('backButton').style.visibility = 'hidden';
                } else {
                    document.getElementById('backButton').style.visibility = 'visible';
                }
                document.getElementById("nextButton").style.visibility = 'visible';
                document.getElementById("submitButton").style.visibility = 'hidden';
            }
            console.log(tabName);
            console.log(counter);
        }

        function next() {
            counter = (counter + 1) % 6;
            if (counter == 5) {
                document.getElementById("submitButton").style.visibility = 'visible';
                document.getElementById("nextButton").style.visibility = 'hidden';
                document.getElementById('backButton').style.visibility = 'visible';
            }
            document.getElementById('backButton').style.visibility = 'visible';
            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                if (i != counter) {
                    tabcontent[i].style.display = "none";
                } else {
                    tabcontent[i].style.display = "block";
                }
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            tablinks[counter].className += " active";

            console.log(tabName);
            console.log(counter);
            document.getElementByClassName("tabcontent").style.display = "block";

        }

        function prev() {
            counter = (counter - 1) % 6;
            if (counter == 0) {
                document.getElementById('backButton').style.visibility = 'hidden';
                document.getElementById("submitButton").style.visibility = 'hidden';
            } else {
                document.getElementById('backButton').style.visibility = 'visible';
            }
            document.getElementById("submitButton").style.visibility = 'hidden';

            var i, tabcontent, tablinks;
            tabcontent = document.getElementsByClassName("tabcontent");
            for (i = 0; i < tabcontent.length; i++) {
                if (i != counter) {
                    tabcontent[i].style.display = "none";
                } else {
                    tabcontent[i].style.display = "block";
                }
            }
            tablinks = document.getElementsByClassName("tablinks");
            for (i = 0; i < tablinks.length; i++) {
                tablinks[i].className = tablinks[i].className.replace(" active", "");
            }
            tablinks[counter].className += " active";
            console.log(tabName);
            console.log(counter);
            document.getElementByClassName("tabcontent").style.display = "block";
        }

        // Get the element with id="defaultOpen" and click on it
        document.getElementById("defaultOpen").click();
        evt.currentTarget.className += " active";
    </script>
</body>


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


