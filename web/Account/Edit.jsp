<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.Statement" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.Connection" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/Account/AccountCSS/Edit.css?v={random number/string}" rel="stylesheet" type="text/css">
        <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/SK_Logo.png" /> 
        <title>Edit Resident Profile</title>

    </head>
    <%
        Connection conn = null;
        Statement stat = null;
        ResultSet res = null;
        PreparedStatement stmt = null;
        conn = (Connection) getServletContext().getAttribute("dbConnection");

        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        if (session.getAttribute("loggedIn") == null) {
            response.sendRedirect(request.getContextPath() + "/Extra/InvalidSession.jsp");
        }
    %>

    <body>
        <div id="header-container">
            <img src="${pageContext.request.contextPath}/img/SK_Logo.png" alt="SK Logo" id="Logo">
            <div>
                <h1 id="header-text">SK Ibayo-Tipas:<br>Edit Resident Profile</h1>
            </div>
        </div>
        <!--        <div class="tab">
                    <button class="tablinks" onclick="showTab(event, 'Info')" id="defaultOpen">Resident Information</button>
                    <button class="tablinks" onclick="showTab(event, 'Details')">Resident Details</button>
                    <button class="tablinks" onclick="showTab(event, 'Contact')">Contact Details</button>
                    <button class="tablinks" onclick="showTab(event, 'Family')">Family Details</button>
                    <button class="tablinks" onclick="showTab(event, 'Survey')">Survey</button>
                    <button class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination</button>
                </div>-->
        <div overflow:auto class="container">
            <form action="../EditServlet" method = "POST">
                <%
                    stat = conn.createStatement();
                    String u = request.getParameter("u");
                    int num = Integer.parseInt(u);
                    String basic_info = "SELECT * FROM `skit-yims`.`basic-info` WHERE basicID = '" + num + "';";
                    res = stat.executeQuery(basic_info);
                    while (res.next()) {
                %>   
                <input type ="hidden" name ="basicID" value = "<%= res.getString("basicID")%>"/>

                <div class="container-main">
                    <!--<div id="Info" class="tabcontent">-->

                    <!--<div class="content-container">-->
                    <div class="content-divider"></div>
                    <p>Resident Information</p>
                    <div class ="form-group">
                        <label>Name<em class="required"></em></label>
                        <input type="text" class="form-control" name ="name" value = "<%= res.getString("name")%>" required maxlength="50"/>
                    </div>

                    <div class="content-divider"></div>
                    <div class="form-group">
                        <label>Birthday<em class="required"></em></label>
                        <input type="date" class="form-control" name ="birthday" value = "<%= res.getString("birthday")%>" required readonly/>
                    </div>


                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Address<em class="required"></em></label>
                        <input type="text" class="form-control" name ="address" value = "<%= res.getString("address")%>" required maxlength="100"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Gender<em class="required"></em></label>
                        <select name="gender" class="age-select" required>
                            <%
                                if (res.getString("gender").equals("Male")) {
                            %>
                            <option value="Male(Lalaki)" selected = "selected" disabled>Male</option>
                            <option value="Female (Babae)" disabled>Female</option>
                            <%
                            } else if (res.getString("gender").equals("Female")) {
                            %>
                            <option value="Male(Lalaki)" disabled>Male</option>
                            <option value="Female (Babae)"  selected = "selected" disabled>Female</option>
                            <%
                                }
                            %>
                        </select>
                    </div>

                    <div class="content-divider"></div>
                    <%
                        }
                    %>   
                    <!--</div>-->
                    <!--</div>-->
                    <!--</div>-->
                    <!--  <br>
                      <br> -->

                    <%
                        String contact_info = "SELECT * FROM `skit-yims`.`contact-info` WHERE contactID = '" + num + "';";
                        res = stat.executeQuery(contact_info);
                        while (res.next()) {
                    %>
                    <input type ="hidden" name ="contactID" value = "<%= res.getString("contactID")%>"/>

                    <!--<div id="Contact" class="tabcontent">-->
                    <p>Contact Details</p>
                    <!--<div class="container-main">-->
                    <!--<div class="content-container">-->
                    <div class ="form-group">
                        <label>Contact Number<em class="required"></em></label>
                        <input type="tel" class="form-control" name ="contactNo" pattern="^[0-9]{3,45}$" value = "<%= res.getString("contactNo")%>" required maxlength="15"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Email Address<em class="required"></em></label>
                        <input type="email" class="form-control" name ="emailAddress" value = "<%= res.getString("emailAddress")%>" required maxlength="45"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Facebook Name or URL<em class="required"></em></label>
                        <input type="text" class="form-control" name ="fbNameURL" value = "<%= res.getString("fbNameURL")%>" required maxlength="35"/>
                    </div>
                    <%
                        }
                    %>    
                    <div class="content-divider"></div>
                    <!--</div>-->
                    <!--</div>-->
                    <!--</div>-->

                    <!--  <br>
                      <br> -->


                    <%
                        String fam_status = "SELECT * FROM `skit-yims`.`fam-status` WHERE familyID = '" + num + "';";
                        res = stat.executeQuery(fam_status);
                        while (res.next()) {
                    %>
                    <input type ="hidden" name ="familyID" value = "<%= res.getString("familyID")%>"/>

                    <!--<div id="Family" class="tabcontent">-->
                    <p>Family Details</p>
                    <!--<div class="container-main">-->
                    <!--<div class="content-container">-->
                    <div class ="form-group">
                        <label>Mother Name<em class="required"></em></label>
                        <input type="text" class="form-control" name ="motherName" value = "<%= res.getString("motherName")%>" required maxlength="50" readonly/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Mother Occupation<em class="required"></em></label>
                        <input type="text" class="form-control" name ="motherOccupation" value = "<%= res.getString("motherOccupation")%>" required maxlength="30"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Father Name<em class="required"></em></label>
                        <input type="text" class="form-control" name ="fatherName" value = "<%= res.getString("fatherName")%>" required maxlength="50" readonly/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Father Occupation<em class="required"></em></label>
                        <input type="text" class="form-control" name ="fatherOccupation" value = "<%= res.getString("fatherOccupation")%>" required maxlength="30"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Vital Status of Mother<em class="required"></em></label>
                        <select name="vitalStatusMother" class="age-select" required>
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
                        <label>Vital Status of Father<em class="required"></em></label>
                        <select name="vitalStatusFather" class="age-select" required>
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
                        <label>Number of Siblings<em class="required"></em></label>
                        <!--INPUT CHANGE TO INT?-->
                        <input type="text" class="form-control" name ="noOfSiblings" value = "<%= res.getString("noOfSiblings")%>" required/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Sibling Education<em class="required"></em></label>
                        <input type="text" class="form-control" name ="siblingEducation" value = "<%= res.getString("siblingEducation")%>" required/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Breadwinner<em class="required"></em></label>
                        <input type="text" class="form-control" name ="breadWinner" value = "<%= res.getString("breadWinner")%>" required maxlength="30"/>
                    </div>
                    <%
                        }
                    %>
                    <div class="content-divider"></div>
                    <!--</div>-->
                    <!--</div>-->
                    <!--</div>-->
                    <!-- <br>
                     <br> -->

                    <%
                        String resident_org = "SELECT * FROM `skit-yims`.`resident-org` WHERE organizationID = '" + num + "';";
                        res = stat.executeQuery(resident_org);
                        while (res.next()) {
                    %>
                    <input type ="hidden" name ="organizationID" value = "<%= res.getString("organizationID")%>"/>

                    <!--<div id="Survey" class="tabcontent">-->
                    <p>Survey</p>
                    <!--<div class="container-main">-->
                    <!--<div class="content-container">-->
                    <div class ="form-group">
                        <label>Resident Voter<em class="required"></em></label>
                        <select name="residentVoter" class="age-select" required>
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
                        <label>Member of an Organization<em class="required"></em></label>
                        <select name="memberOfOrg" class="age-select" required>
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
                        <label>Name of Organization<em class="required"></em></label>
                        <input type="text" class="form-control" name ="nameOfOrg" value = "<%= res.getString("nameOfOrg")%>" required maxlength="50"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Support SK<em class="required"></em></label>
                        <input name="supportSK" class="age-select" value="<%= res.getString("supportSK")%>" readonly/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Show of support to SK<em class="required"></em></label>
                        <input type="text" class="form-control" name ="showSupport" value = "<%= res.getString("showSupport")%>" required maxlength="120" readonly/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Job Chance<em class="required"></em></label>
                        <input type="text" class="form-control" name ="jobChance" value = "<%= res.getString("jobChance")%>" required maxlength="120" readonly/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>Say to SK<em class="required"></em></label>
                        <input type="text" class="form-control" name ="sayToSK" value = "<%= res.getString("sayToSK")%>" required maxlength="120" readonly/>
                    </div>
                    <%
                        }
                    %>
                    <div class="content-divider"></div>

                    <!--</div>-->
                    <!--</div>-->
                    <!--</div>-->
                    <!-- <br>
                     <br> -->

                    <%
                        String resident_status = "SELECT * FROM `skit-yims`.`resident-status` WHERE statusID = '" + num + "';";
                        res = stat.executeQuery(resident_status);
                        while (res.next()) {
                    %>
                    <input type ="hidden" name ="statusID" value = "<%= res.getString("statusID")%>"/>

                    <!--<div id="Details" class="tabcontent">-->
                    <p>Resident Details</p>
                    <!--<div class="container-main">-->
                    <!--<div class="content-container">-->
                    <div class ="form-group">
                        <label>Civil Status<em class="required"></em></label>
                        <select name="civilStatus" class="age-select" required>
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
                        <label>Working Status<em class="required"></em></label>
                        <select name="workingStatus" class="age-select" required>
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
                        <label>Education Attainment<em class="required"></em></label>
                        <select name="educationAttainment" class="age-select" required>
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
                        <label>Job Employed<em class="required"></em></label>
                        <input type="text" class="form-control" name ="jobEmployed" value = "<%= res.getString("jobEmployed")%>" required maxlength="30"/>
                    </div>

                    <div class="content-divider"></div>

                    <div class ="form-group">
                        <label>PWD<em class="required"></em></label>
                        <select name="PWD" class="age-select" required>
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
                        <label>Type of Disability<em class="required"></em></label>
                        <input type="text" class="form-control" name ="typeOfDisability" value = "<%= res.getString("typeOfDisability")%>" required maxlength="40"/>
                    </div>
                    <%
                        }
                    %>
                    <div class="content-divider"></div>

                    <!--</div>-->
                    <!--</div>-->
                    <!--</div>-->

                    <%
                        String vaccine_info = "SELECT * FROM `skit-yims`.`vaccine-info` WHERE vaccineID = '" + num + "';";
                        res = stat.executeQuery(vaccine_info);
                        while (res.next()) {
                    %>

                    <input type ="hidden" name ="vaccineID" value = "<%= res.getString("vaccineID")%>"/>

                    <!--<div id="Vaccination" class="tabcontent">-->
                    <p>Vaccine</p>
                    <!--<div class="container-main">-->
                    <!--<div class="content-container">-->
                    <div class ="form-group">
                        <label>Vaccinated<em class="required"></em></label>
                        <select name="vaccinated" class="age-select" required>
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
                        <label>Willing for Vaccine<em class="required"></em></label>
                        <select name="willingForVaccine" class="age-select" required>
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
                        <label>Brand of Vaccine<em class="required"></em></label>
                        <select name="brandOfVaccine" class="age-select" required>
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
                        <label>Vaccine Status<em class="required"></em></label>
                        <select name="vaccineStatus" class="age-select" required>
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
                </div>
                <%
                    }
                %>  
                <div class="content-divider"></div>
                <!--</div>-->
                <!--</div>-->
                <!--</div>-->
                <div class="buttons">
                    <input type="submit" value="Confirm" name="conf"/></button>
                    <a href="${pageContext.request.contextPath}/Account/ViewDatabase.jsp" class ="btn btn-default">Cancel</a>
                </div>
            </form>
        </div>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
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
            }

            // Get the element with id="defaultOpen" and click on it
            document.getElementById("defaultOpen").click();
            evt.currentTarget.className += " active";
        </script>
    </body>
</html>

<%--
UPDATE `skit-yims`.`basic-info` SET `name` = 'Kyle' WHERE (`basicID` = '1');
--%>


