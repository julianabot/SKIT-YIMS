<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Database</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <style>
            body {font-family: Arial;}

            /* Style the tab */
            .tab {
                overflow: hidden;
                border: 1px solid #ccc;
                background-color: #f1f1f1;
            }

            /* Style the buttons inside the tab */
            .tab button {
                background-color: inherit;
                float: left;
                border: none;
                outline: none;
                cursor: pointer;
                padding: 14px 16px;
                transition: 0.3s;
                font-size: 17px;
            }

            /* Change background color of buttons on hover */
            .tab button:hover {
                background-color: #ddd;
            }

            /* Create an active/current tablink class */
            .tab button.active {
                background-color: #ccc;
            }

            /* Style the tab content */
            .tabcontent {
                display: none;
                padding: 6px 12px;
                border: 1px solid #ccc;
                border-top: none;
            }
            
            /* for button */
            .wrapper {
                border:1px solid #000;
                display:inline-block;
            }
        </style>
    </head>
    <body>
        <div style="background-color: #FFF9E9">
            <div>
             <div class="wrapper">
                <input type="text" />
                <button>GO</button>
             </div>
             <button type="button">Export Archived Data</button> 
            </div>
            <div>
             <h1>SK Ibayo-Tipas Youth Residents Database</h1>
             <button type="button">Sort</button> 
             <button type="button">Filter</button> 
            </div>
            <div class="tab">
                <button class="tablinks" onclick="showTab(event, 'All')" id="defaultOpen">All</button>
                <button class="tablinks" onclick="showTab(event, 'Information')">Basic Information</button>
                <button class="tablinks" onclick="showTab(event, 'Details')">Details</button>
                <button class="tablinks" onclick="showTab(event, 'Contact')">Contact</button>
                <button class="tablinks" onclick="showTab(event, 'Family')">Family</button>
                <button class="tablinks" onclick="showTab(event, 'Survey')">Survey</button>
                <button class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination Details</button>
                <button style="display:none;" class="tablinks" onclick="showTab(event, 'Vaccination')">Vaccination</button>
            </div>
            <div>
                <button type="button">Generate Report</button> 
            </div>
        </div>
    </body>
</html>
