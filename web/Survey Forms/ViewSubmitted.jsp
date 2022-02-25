<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Page</title>
    </head>
    <body>
        <h1>View Submitted Form</h1>
        <p>Error: ${errorLogin}</p>

        <h1>Resident Information</h1>

        <p>Resident Name: ${residentName}</p>
        <p>Age Range: ${ageRange}</p>
        <p>Birthday: ${birthday}</p>
        <p>Address: ${address}</p>
        <p>valid ID: N/A</p>

        <h1>Resident Status</h1>

        <p>Civil Status: ${civilStatus}</p>
        <p>Working Status: ${working}</p>
        <p>Job Employed: ${jobEmployed}</p>
        <p>Education: ${education}</p>
        <p>PWD: ${pwd}</p>
        <p>Type PWD: ${typePWD}</p>

        <h1>Contact Details</h1>

        <p>Phone: ${phone}</p>
        <p>Email: ${email}</p>
        <p>FB: ${fb}</p>

        <h1>Family Status</h1>

        <p>Mother: ${mother}</p>
        <p>Mother Status: ${motherStatus}</p>
        <p>Mother Work: ${motherWork}</p>
        <p>Father: ${father}</p>
        <p>Father Status: ${fatherStatus}</p>
        <p>Father Work: ${fatherWork}</p>
        <p>Number of Siblings: ${noSiblings}</p>
        <p>Working Sibs: ${workingSibs}</p>
        <p>Breadwinner: ${breadwinner}</p>

        <h1>Survey</h1>
        <p>Resident Voter: ${residentVoter}</p>
        <p>Member of Org: ${memberOfOrg}</p>
        <p>Support SK: ${supportSK}</p>
        <p>Show support: ${showSupport}</p>
        <p>Job Chance: ${jobChance}</p>
        <p>Say to SK: ${sayToSK}</p>

        <h1>Vaccination</h1>
        <p>Vaccinated: ${vaccinated}</p>
        <p>Willing for Vaccine ${willingForVaccine}</p>
        <p>Brand of Vaccine ${brandOfVaccine}</p>
        <p>Vaccine Status: ${vaccineStatus}</p>

    </body>
</html>
