<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDateTime" %>

<%
String serverTime = LocalDateTime.now().toString();
%>

<!DOCTYPE html>

<html lang="en">

<head>

```
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>DevOps CI/CD Pipeline</title>

<style>

    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
        font-family: Arial, Helvetica, sans-serif;
    }

    body {
        background: #f4f7fb;
        color: #1f2937;
    }

    /* =====================================================
       HEADER
    ====================================================== */

    header {
        background: #111827;
        color: white;
        padding: 20px 8%;
        display: flex;
        justify-content: space-between;
        align-items: center;
    }

    header h1 {
        font-size: 24px;
    }

    .status {
        background: #16a34a;
        padding: 8px 15px;
        border-radius: 20px;
        font-size: 14px;
        font-weight: bold;
    }

    /* =====================================================
       HERO
    ====================================================== */

    .hero {
        padding: 60px 8%;
        background: linear-gradient(135deg, #2563eb, #4f46e5);
        color: white;
    }

    .hero h2 {
        font-size: 42px;
        margin-bottom: 15px;
    }

    .hero p {
        font-size: 18px;
        max-width: 750px;
        line-height: 1.6;
    }

    .btn {
        margin-top: 25px;
        padding: 12px 22px;
        border: none;
        border-radius: 6px;
        background: white;
        color: #2563eb;
        font-weight: bold;
        cursor: pointer;
        font-size: 15px;
    }

    .btn:hover {
        background: #e5e7eb;
    }

    #healthMessage {
        margin-top: 15px;
        font-weight: bold;
    }

    /* =====================================================
       MAIN CONTAINER
    ====================================================== */

    .container {
        width: 84%;
        margin: 40px auto;
    }

    .section-title {
        margin-bottom: 20px;
        font-size: 25px;
    }

    .section-description {
        color: #6b7280;
        margin-bottom: 25px;
        line-height: 1.6;
    }

    /* =====================================================
       PIPELINE STAGES
    ====================================================== */

    .pipeline {
        display: grid;
        grid-template-columns: repeat(5, 1fr);
        gap: 15px;
    }

    .stage {
        background: white;
        padding: 25px 15px;
        text-align: center;
        border-radius: 10px;
        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
    }

    .stage-icon {
        width: 50px;
        height: 50px;
        margin: 0 auto 15px;

        background: #2563eb;
        color: white;

        border-radius: 50%;

        display: flex;
        justify-content: center;
        align-items: center;

        font-weight: bold;
        font-size: 18px;
    }

    .stage h3 {
        margin-bottom: 8px;
    }

    .stage p {
        color: #6b7280;
        margin-bottom: 10px;
    }

    .success {
        color: #16a34a;
        font-weight: bold;
        font-size: 14px;
    }

    /* =====================================================
       ARCHITECTURE SECTION
    ====================================================== */

    .architecture-section {
        margin-top: 60px;
    }

    .architecture {
        background: #111827;
        border-radius: 15px;
        padding: 40px 30px;
        color: white;
        overflow-x: auto;
    }

    .architecture-flow {
        min-width: 900px;
        display: flex;
        flex-direction: column;
        align-items: center;
    }

    .architecture-row {
        display: flex;
        align-items: center;
        justify-content: center;
        gap: 20px;
        width: 100%;
    }

    .architecture-node {
        width: 190px;
        min-height: 115px;

        background: white;
        color: #1f2937;

        border-radius: 12px;

        padding: 20px;

        text-align: center;

        cursor: pointer;

        border: 3px solid transparent;

        box-shadow: 0 5px 15px rgba(0,0,0,0.25);

        transition: all 0.25s ease;
    }

    .architecture-node:hover {
        transform: translateY(-5px);
        border-color: #60a5fa;
    }

    .architecture-node h3 {
        margin-bottom: 8px;
        color: #2563eb;
    }

    .architecture-node p {
        font-size: 13px;
        color: #6b7280;
        line-height: 1.5;
    }

    .architecture-node .node-status {
        margin-top: 8px;
        color: #16a34a;
        font-size: 12px;
        font-weight: bold;
    }

    .arrow {
        font-size: 28px;
        color: #60a5fa;
        font-weight: bold;
    }

    .vertical-arrow {
        font-size: 30px;
        color: #60a5fa;
        height: 45px;
        display: flex;
        align-items: center;
    }

    .server-group {
        display: flex;
        gap: 30px;
        justify-content: center;
    }

    /* =====================================================
       ARCHITECTURE INFORMATION PANEL
    ====================================================== */

    .architecture-info {
        margin-top: 30px;

        background: #1f2937;

        border: 1px solid #374151;

        border-radius: 10px;

        padding: 25px;

        display: none;
    }

    .architecture-info.active {
        display: block;
    }

    .architecture-info h3 {
        color: #60a5fa;
        margin-bottom: 15px;
    }

    .architecture-info ul {
        list-style: none;
    }

    .architecture-info li {
        padding: 7px 0;
        color: #d1d5db;
    }

    .architecture-info li::before {
        content: "✓";
        color: #22c55e;
        font-weight: bold;
        margin-right: 10px;
    }

    .architecture-hint {
        text-align: center;
        color: #9ca3af;
        margin-top: 20px;
        font-size: 13px;
    }

    /* =====================================================
       SERVER INFORMATION
    ====================================================== */

    .server-info {
        margin-top: 30px;

        display: grid;

        grid-template-columns: repeat(3, 1fr);

        gap: 20px;
    }

    .info-box {
        background: white;

        padding: 20px;

        border-radius: 10px;

        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);

        text-align: center;
    }

    .info-box h3 {
        color: #6b7280;
        font-size: 15px;
        margin-bottom: 10px;
    }

    .info-box p {
        font-size: 17px;
        font-weight: bold;
        color: #111827;
        word-break: break-word;
    }

    /* =====================================================
       CARDS
    ====================================================== */

    .cards {
        display: grid;

        grid-template-columns: repeat(3, 1fr);

        gap: 20px;

        margin-top: 30px;
    }

    .card {
        background: white;

        padding: 25px;

        border-radius: 10px;

        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
    }

    .card h3 {
        margin-bottom: 12px;
        color: #2563eb;
    }

    .card p {
        line-height: 1.6;
        color: #4b5563;
    }

    /* =====================================================
       DEPLOYMENT INFORMATION
    ====================================================== */

    .deployment {
        margin-top: 30px;

        background: white;

        padding: 25px;

        border-radius: 10px;

        box-shadow: 0 3px 12px rgba(0, 0, 0, 0.08);
    }

    .deployment table {
        width: 100%;
        border-collapse: collapse;
    }

    .deployment th,
    .deployment td {
        padding: 12px;

        border-bottom: 1px solid #e5e7eb;

        text-align: left;
    }

    .deployment th {
        background: #f9fafb;
        width: 35%;
    }

    /* =====================================================
       FOOTER
    ====================================================== */

    footer {
        margin-top: 50px;

        background: #111827;

        color: #d1d5db;

        text-align: center;

        padding: 25px;
    }

    /* =====================================================
       RESPONSIVE
    ====================================================== */

    @media (max-width: 1000px) {

        .pipeline {
            grid-template-columns: repeat(2, 1fr);
        }

        .cards {
            grid-template-columns: 1fr;
        }

        .server-info {
            grid-template-columns: 1fr;
        }
    }

    @media (max-width: 600px) {

        .pipeline {
            grid-template-columns: 1fr;
        }

        .hero h2 {
            font-size: 30px;
        }

        .container {
            width: 90%;
        }

        header {
            padding: 20px 5%;
        }
    }

</style>
```

</head>

<body>

<!-- =====================================================
     HEADER
====================================================== -->

<header>

```
<h1>DevOps Pipeline</h1>

<div class="status">
    &#9679; SYSTEM ONLINE
</div>
```

</header>

<!-- =====================================================
     HERO
====================================================== -->

<section class="hero">

```
<h2>DevOps CI/CD Pipeline</h2>

<p>
    Welcome to the DevOps deployment demonstration.
    This application is deployed automatically through a CI/CD pipeline
    using GitHub, Jenkins, Maven, Ansible, Docker and AWS.
</p>

<button class="btn" onclick="checkHealth()">
    Check Application Health
</button>

<p id="healthMessage"></p>
```

</section>

<div class="container">

<!-- =====================================================
     PIPELINE STAGES
====================================================== -->

<h2 class="section-title">
    Pipeline Stages
</h2>

<p class="section-description">
    The application moves through source control, continuous integration,
    testing, deployment and AWS infrastructure before becoming available
    to end users.
</p>

<div class="pipeline">

```
<div class="stage">

    <div class="stage-icon">
        1
    </div>

    <h3>GitHub</h3>

    <p>
        Source Code
    </p>

    <div class="success">
        &#10003; SUCCESS
    </div>

</div>


<div class="stage">

    <div class="stage-icon">
        2
    </div>

    <h3>Jenkins</h3>

    <p>
        CI Pipeline
    </p>

    <div class="success">
        &#10003; SUCCESS
    </div>

</div>


<div class="stage">

    <div class="stage-icon">
        3
    </div>

    <h3>Maven</h3>

    <p>
        Build &amp; Test
    </p>

    <div class="success">
        &#10003; SUCCESS
    </div>

</div>


<div class="stage">

    <div class="stage-icon">
        4
    </div>

    <h3>Ansible</h3>

    <p>
        Deployment
    </p>

    <div class="success">
        &#10003; SUCCESS
    </div>

</div>


<div class="stage">

    <div class="stage-icon">
        5
    </div>

    <h3>AWS</h3>

    <p>
        Production
    </p>

    <div class="success">
        &#10003; RUNNING
    </div>

</div>
```

</div>

<!-- =====================================================
     SYSTEM ARCHITECTURE
====================================================== -->

<div class="architecture-section">

```
<h2 class="section-title">
    System Architecture
</h2>

<p class="section-description">
    End-to-end architecture showing how source code moves through the
    CI/CD pipeline and reaches the application servers through the
    AWS Application Load Balancer.
</p>


<div class="architecture">


    <div class="architecture-flow">


        <!-- GITHUB -->

        <div class="architecture-row">

            <div class="architecture-node"
                 onclick="showArchitecture('github')">

                <h3>GitHub</h3>

                <p>
                    Source Repository
                </p>

                <div class="node-status">
                    &#10003; SOURCE
                </div>

            </div>

        </div>


        <div class="vertical-arrow">
            &#8595;
        </div>


        <!-- JENKINS -->

        <div class="architecture-row">

            <div class="architecture-node"
                 onclick="showArchitecture('jenkins')">

                <h3>Jenkins EC2</h3>

                <p>
                    CI Server
                </p>

                <div class="node-status">
                    &#10003; BUILD SERVER
                </div>

            </div>

        </div>


        <div class="vertical-arrow">
            &#8595;
        </div>


        <!-- MAVEN + TEST -->

        <div class="architecture-row">

            <div class="architecture-node"
                 onclick="showArchitecture('maven')">

                <h3>Maven</h3>

                <p>
                    Build &amp; Automated Tests
                </p>

                <div class="node-status">
                    &#10003; TEST PASSED
                </div>

            </div>


            <div class="arrow">
                &#8594;
            </div>


            <div class="architecture-node"
                 onclick="showArchitecture('war')">

                <h3>webapp.war</h3>

                <p>
                    Application Artifact
                </p>

                <div class="node-status">
                    &#10003; READY
                </div>

            </div>


        </div>


        <div class="vertical-arrow">
            &#8595;
        </div>


        <!-- ANSIBLE -->

        <div class="architecture-row">

            <div class="architecture-node"
                 onclick="showArchitecture('ansible')">

                <h3>Ansible</h3>

                <p>
                    Deployment Automation
                </p>

                <div class="node-status">
                    &#10003; DEPLOYMENT
                </div>

            </div>

        </div>


        <div class="vertical-arrow">
            &#8595;
        </div>


        <!-- ALB -->

        <div class="architecture-row">

            <div class="architecture-node"
                 onclick="showArchitecture('alb')">

                <h3>AWS ALB</h3>

                <p>
                    Application Load Balancer
                </p>

                <div class="node-status">
                    &#10003; TRAFFIC ROUTING
                </div>

            </div>

        </div>


        <div class="vertical-arrow">
            &#8595;
        </div>


        <!-- EC2 SERVERS -->

        <div class="server-group">


            <div class="architecture-node"
                 onclick="showArchitecture('ec2a')">

                <h3>EC2 Server #1</h3>

                <p>
                    Apache Tomcat<br>
                    webapp.war
                </p>

                <div class="node-status">
                    &#10003; HEALTHY
                </div>

            </div>


            <div class="architecture-node"
                 onclick="showArchitecture('ec2b')">

                <h3>EC2 Server #2</h3>

                <p>
                    Apache Tomcat<br>
                    webapp.war
                </p>

                <div class="node-status">
                    &#10003; HEALTHY
                </div>

            </div>


        </div>


        <!-- INFORMATION PANEL -->

        <div id="architectureInfo"
             class="architecture-info">

            <h3 id="architectureTitle">
                Architecture Component
            </h3>

            <ul id="architectureDetails">
            </ul>

        </div>


        <div class="architecture-hint">

            Click any architecture component to view details.

        </div>


    </div>

</div>
```

</div>

<!-- =====================================================
     SERVER INFORMATION
====================================================== -->

<div class="server-info">

```
<div class="info-box">

    <h3>Application</h3>

    <p>
        DevOps Demo
    </p>

</div>


<div class="info-box">

    <h3>Environment</h3>

    <p>
        Production
    </p>

</div>


<div class="info-box">

    <h3>Application Server</h3>

    <p>
        Apache Tomcat
    </p>

</div>
```

</div>

<!-- =====================================================
     TECHNOLOGY CARDS
====================================================== -->

<div class="cards">

```
<div class="card">

    <h3>
        Continuous Integration
    </h3>

    <p>
        Developer pushes code to GitHub.
        Jenkins detects the change and starts the pipeline.
        Maven compiles the application and executes automated tests.
    </p>

</div>


<div class="card">

    <h3>
        Continuous Deployment
    </h3>

    <p>
        After successful testing, Jenkins triggers deployment.
        Ansible connects to the target EC2 servers and deploys
        the latest application version.
    </p>

</div>


<div class="card">

    <h3>
        Load Balancing
    </h3>

    <p>
        Application traffic is distributed across multiple
        EC2 instances using an AWS Application Load Balancer.
    </p>

</div>
```

</div>

<!-- =====================================================
     DEPLOYMENT INFORMATION
====================================================== -->

<div class="deployment">

```
<h2 class="section-title">
    Deployment Information
</h2>


<table>


    <tr>

        <th>
            Application
        </th>

        <td>
            DevOps Pipeline Demo
        </td>

    </tr>


    <tr>

        <th>
            Environment
        </th>

        <td>
            Production
        </td>

    </tr>


    <tr>

        <th>
            Build Tool
        </th>

        <td>
            Maven
        </td>

    </tr>


    <tr>

        <th>
            CI/CD
        </th>

        <td>
            Jenkins
        </td>

    </tr>


    <tr>

        <th>
            Configuration Management
        </th>

        <td>
            Ansible
        </td>

    </tr>


    <tr>

        <th>
            Containerization
        </th>

        <td>
            Docker
        </td>

    </tr>


    <tr>

        <th>
            Cloud Platform
        </th>

        <td>
            AWS EC2 + ALB
        </td>

    </tr>


    <tr>

        <th>
            Deployment Status
        </th>

        <td class="success">
            &#10003; SUCCESSFUL
        </td>

    </tr>


</table>
```

</div>

<!-- =====================================================
     RUNTIME INFORMATION
====================================================== -->

<div class="deployment">

```
<h2 class="section-title">
    Runtime Information
</h2>


<table>


    <tr>

        <th>
            Server Time
        </th>

        <td>
            <%= serverTime %>
        </td>

    </tr>


    <tr>

        <th>
            Server
        </th>

        <td>
            Apache Tomcat
        </td>

    </tr>


    <tr>

        <th>
            Application Type
        </th>

        <td>
            Java / JSP
        </td>

    </tr>


    <tr>

        <th>
            Deployment
        </th>

        <td class="success">
            &#10003; ACTIVE
        </td>

    </tr>


</table>
```

</div>

</div>

<!-- =====================================================
     FOOTER
====================================================== -->

<footer>

```
DevOps Pipeline Demo

<br><br>

CI/CD | Jenkins | Maven | Ansible | Docker | AWS | Tomcat | ALB
```

</footer>

<!-- =====================================================
     JAVASCRIPT
====================================================== -->

<script>


    /* =====================================================
       HEALTH CHECK
    ====================================================== */

    function checkHealth() {

        const message =
            document.getElementById("healthMessage");

        message.innerHTML =
            "&#10003; Application is healthy and responding successfully.";

        message.style.color = "#bbf7d0";

    }


    /* =====================================================
       ARCHITECTURE DETAILS
    ====================================================== */

    const architectureData = {

        github: {

            title: "GitHub - Source Repository",

            details: [

                "Application source code is maintained in GitHub",

                "Developer pushes changes to the repository",

                "GitHub webhook triggers Jenkins",

                "Jenkins checks out the latest source code"

            ]

        },


        jenkins: {

            title: "Jenkins EC2 - CI Server",

            details: [

                "Jenkins is hosted on an EC2 instance",

                "Receives GitHub webhook notifications",

                "Checks out application source code",

                "Starts the CI/CD pipeline",

                "Runs Maven build and test stages",

                "Triggers deployment after successful build"

            ]

        },


        maven: {

            title: "Maven - Build & Test",

            details: [

                "Compiles the Java application",

                "Resolves project dependencies",

                "Executes automated tests",

                "Packages the application",

                "Produces the webapp.war artifact"

            ]

        },


        war: {

            title: "webapp.war - Deployment Artifact",

            details: [

                "WAR file contains the Java web application",

                "Contains JSP pages and application resources",

                "Generated after successful Maven build",

                "Transferred for deployment to application servers"

            ]

        },


        ansible: {

            title: "Ansible - Deployment Automation",

            details: [

                "Jenkins triggers deployment automation",

                "Ansible connects to target EC2 servers",

                "Deploys the latest webapp.war",

                "Updates the Tomcat application",

                "Provides repeatable deployment"

            ]

        },


        alb: {

            title: "AWS Application Load Balancer",

            details: [

                "Receives incoming application traffic",

                "Uses a target group containing EC2 instances",

                "Performs health checks",

                "Routes traffic only to healthy targets",

                "Distributes requests across application servers"

            ]

        },


        ec2a: {

            title: "EC2 Server #1 - Application Server",

            details: [

                "Runs Apache Tomcat",

                "Hosts the webapp.war application",

                "Serves index.jsp",

                "Registered as an ALB target",

                "Health status: Healthy"

            ]

        },


        ec2b: {

            title: "EC2 Server #2 - Application Server",

            details: [

                "Runs Apache Tomcat",

                "Hosts the webapp.war application",

                "Serves index.jsp",

                "Registered as an ALB target",

                "Health status: Healthy"

            ]

        }

    };


    function showArchitecture(component) {

        const info =
            architectureData[component];

        const panel =
            document.getElementById("architectureInfo");

        const title =
            document.getElementById("architectureTitle");

        const details =
            document.getElementById("architectureDetails");


        title.innerText =
            info.title;


        details.innerHTML = "";


        info.details.forEach(function(detail) {

            const li =
                document.createElement("li");

            li.innerText =
                detail;

            details.appendChild(li);

        });


        panel.classList.add("active");


        panel.scrollIntoView({

            behavior: "smooth",

            block: "nearest"

        });

    }


</script>

</body>

</html>
