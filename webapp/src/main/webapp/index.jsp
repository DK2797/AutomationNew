<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.time.LocalDateTime" %>

<%
    String serverTime = LocalDateTime.now().toString();
%>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>DevOps CI/CD Pipeline</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        html {
            scroll-behavior: smooth;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7fb;
            color: #172033;
            line-height: 1.5;
        }

        /* =========================
           HEADER
           ========================= */

        header {
            height: 64px;
            background: #071426;
            color: white;

            display: flex;
            align-items: center;
            justify-content: space-between;

            padding: 0 5%;

            position: sticky;
            top: 0;
            z-index: 1000;

            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.18);
        }

        .logo {
            font-size: 21px;
            font-weight: 700;
        }

        nav {
            display: flex;
            gap: 28px;
        }

        nav a {
            color: #dbe5f5;
            text-decoration: none;
            font-size: 14px;
        }

        nav a:hover {
            color: #38bdf8;
        }

        /* =========================
           HERO
           ========================= */

        .hero {
            min-height: 280px;

            padding: 45px 7%;

            color: white;

            background:
                radial-gradient(
                    circle at 85% 30%,
                    rgba(56, 189, 248, 0.2),
                    transparent 30%
                ),
                linear-gradient(
                    135deg,
                    #1456d9,
                    #4338ca
                );

            display: flex;
            align-items: center;
        }

        .hero-content {
            max-width: 900px;
        }

        .hero h1 {
            font-size: 42px;
            line-height: 1.15;
            margin-bottom: 14px;
        }

        .hero p {
            font-size: 17px;
            color: #e7efff;
            max-width: 820px;
        }

        .health-button {
            margin-top: 20px;

            border: 0;
            border-radius: 6px;

            padding: 12px 20px;

            background: #16c784;
            color: white;

            font-size: 14px;
            font-weight: 700;

            cursor: pointer;
        }

        .health-button:hover {
            background: #11a96e;
        }

        #healthMessage {
            min-height: 23px;
            margin-top: 12px;

            color: #b9ffda;

            font-size: 15px;
            font-weight: 700;
        }

        /* =========================
           MAIN
           ========================= */

        .container {
            width: 92%;
            max-width: 1450px;

            margin: auto;

            padding: 36px 0;
        }

        .section {
            margin-bottom: 36px;
        }

        .section-title {
            color: #172b4d;
            font-size: 28px;
            margin-bottom: 7px;
        }

        .section-description {
            color: #607086;
            font-size: 15px;
            margin-bottom: 20px;
        }

        /* =========================
           PIPELINE
           ========================= */

        .pipeline {
            width: 100%;

            display: flex;
            flex-wrap: nowrap;

            gap: 15px;
        }

        .stage {
            flex: 1 1 0;
            min-width: 0;

            background: white;

            border: 1px solid #e1e7ef;
            border-radius: 10px;

            padding: 22px 12px;

            text-align: center;

            box-shadow:
                0 4px 12px rgba(30, 50, 80, 0.07);
        }

        .stage-number {
            width: 48px;
            height: 48px;

            margin: 0 auto 12px;

            border-radius: 50%;

            background: #2864e8;
            color: white;

            display: flex;
            align-items: center;
            justify-content: center;

            font-size: 18px;
            font-weight: 700;
        }

        .stage h3 {
            font-size: 17px;
            margin-bottom: 4px;
        }

        .stage p {
            color: #69768a;
            font-size: 13px;
            margin-bottom: 8px;
        }

        .success {
            color: #119447;
            font-size: 13px;
            font-weight: 700;
        }

        /* =========================
           ARCHITECTURE CARD
           ========================= */

        .architecture-card {
            background: white;

            border: 1px solid #dfe5ed;
            border-radius: 12px;

            padding: 25px;

            box-shadow:
                0 4px 14px rgba(30, 50, 80, 0.06);

            overflow-x: auto;

            margin-bottom: 25px;
        }

        .architecture-title {
            color: #172b4d;
            font-size: 23px;
            margin-bottom: 4px;
        }

        .architecture-subtitle {
            color: #69768a;
            font-size: 14px;
            margin-bottom: 24px;
        }

        /* =========================
           ARCHITECTURE NODES
           ========================= */

        .arch-node {
            min-height: 125px;

            border: 2px solid;
            border-radius: 10px;

            padding: 15px;

            text-align: center;

            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .arch-node h3 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .arch-node p {
            color: #5f6d82;
            font-size: 12px;
        }

        .arch-icon {
            width: 42px;
            height: 42px;

            margin-bottom: 8px;

            border-radius: 50%;

            display: flex;
            align-items: center;
            justify-content: center;

            color: white;

            font-size: 11px;
            font-weight: 700;
        }

        .arrow {
            text-align: center;
            color: #34445c;

            font-size: 11px;
            font-weight: 700;
        }

        .arrow-symbol {
            font-size: 25px;
            line-height: 25px;
        }

        /* =========================
           DEPLOYMENT ARCHITECTURE
           ========================= */

        .deployment-flow {
            min-width: 1250px;

            display: grid;

            grid-template-columns:
                145px
                55px
                205px
                65px
                220px
                85px
                320px;

            align-items: center;

            justify-content: center;

            gap: 8px;
        }

        .github-node {
            background: #f3f5f8;
            border-color: #9aa8bb;
        }

        .github-icon {
            background: #111827;
        }

        .jenkins-node {
            background: #fff8e8;
            border-color: #e6bd55;
        }

        .jenkins-icon {
            background: #f28c28;
        }

        .ansible-node {
            background: #eefbf2;
            border-color: #77c487;
        }

        .ansible-icon {
            background: #111111;
        }

        .docker-icon {
            background: #2496ed;
        }

        .deployment-targets {
            display: flex;
            flex-direction: column;
            gap: 12px;
            min-width: 300px;
        }

        .target-box {
            background: #eef6ff;

            border: 2px solid #7baff1;
            border-radius: 9px;

            padding: 12px;

            display: grid;

            grid-template-columns: 46px 1fr;

            align-items: center;

            gap: 10px;
        }

        .target-box .arch-icon {
            width: 40px;
            height: 40px;
            margin: 0;
        }

        .target-title {
            font-size: 14px;
            font-weight: 700;
        }

        .target-subtitle {
            color: #607086;
            font-size: 11px;
        }

        .container-box {
            background: white;

            border: 1px dashed #aab7c8;
            border-radius: 6px;

            padding: 7px 8px;

            margin-top: 7px;

            text-align: center;
        }

        .container-box strong {
            color: #334155;
            font-size: 11px;
        }

        .container-box span {
            color: #64748b;
            font-size: 10px;
        }

        /* =========================
           ACCESS ARCHITECTURE
           ========================= */

        .access-flow {
            min-width: 1180px;

            display: grid;

            grid-template-columns:
                180px
                65px
                220px
                100px
                1fr;

            align-items: center;

            justify-content: center;

            gap: 10px;
        }

        .user-node {
            background: #f5efff;
            border-color: #a88bd7;
        }

        .user-icon {
            background: #7c3aed;
        }

        .alb-node {
            background: #fff1f1;
            border-color: #ef9b9b;
        }

        .alb-icon {
            background: #232f3e;
            color: #ffb300;
        }

        .access-targets {
            display: flex;
            flex-direction: column;
            gap: 12px;
        }

        .access-server {
            background: #eef6ff;

            border: 2px solid #7baff1;
            border-radius: 9px;

            padding: 13px 17px;

            display: flex;
            align-items: center;
            justify-content: space-between;

            gap: 20px;
        }

        .access-server strong {
            display: block;
            color: #24344d;
            font-size: 14px;
        }

        .access-server span {
            display: block;
            color: #64748b;
            font-size: 11px;
        }

        /* =========================
           INFORMATION
           ========================= */

        .info-grid {
            display: grid;

            grid-template-columns:
                repeat(3, minmax(0, 1fr));

            gap: 18px;

            margin-top: 25px;
        }

        .info-card {
            background: white;

            border: 1px solid #e1e6ed;
            border-radius: 10px;

            overflow: hidden;

            box-shadow:
                0 3px 10px rgba(30, 50, 80, 0.05);
        }

        .info-card h3 {
            background: #f8fafc;

            color: #172b4d;

            font-size: 17px;

            padding: 14px 16px;

            border-bottom: 1px solid #e4e9f0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 9px 14px;

            border-bottom: 1px solid #edf0f4;

            font-size: 13px;
        }

        tr:last-child td {
            border-bottom: 0;
        }

        td:first-child {
            width: 45%;
            color: #64748b;
        }

        td:last-child {
            color: #1e293b;
            font-weight: 600;
        }

        /* =========================
           TECHNOLOGIES
           ========================= */

        .technology-list {
            padding: 10px 16px;
        }

        .technology {
            display: flex;
            align-items: center;

            gap: 12px;

            padding: 9px 0;

            border-bottom: 1px solid #edf0f4;
        }

        .technology:last-child {
            border-bottom: 0;
        }

        .technology-icon {
            width: 34px;
            height: 34px;

            border-radius: 7px;

            display: flex;
            align-items: center;
            justify-content: center;

            color: white;

            font-size: 11px;
            font-weight: 700;

            flex-shrink: 0;
        }

        .technology strong {
            display: block;
            font-size: 13px;
        }

        .technology span {
            display: block;
            color: #718096;
            font-size: 11px;
        }

        /* =========================
           FOOTER
           ========================= */

        footer {
            background: #071426;

            color: #dce5f5;

            text-align: center;

            padding: 24px;
        }

        footer strong {
            color: white;
        }

        footer p {
            font-size: 13px;
            margin-top: 6px;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media (max-width: 1150px) {

            .info-grid {
                grid-template-columns: 1fr;
            }

            .pipeline {
                gap: 9px;
            }

            .stage {
                padding-left: 7px;
                padding-right: 7px;
            }

            .stage h3 {
                font-size: 15px;
            }

            .stage p {
                font-size: 11px;
            }
        }

        @media (max-width: 750px) {

            header {
                min-height: 60px;
                height: auto;
                padding: 14px 5%;
            }

            nav {
                display: none;
            }

            .hero {
                padding: 35px 6%;
            }

            .hero h1 {
                font-size: 32px;
            }

            .hero p {
                font-size: 15px;
            }

            .container {
                width: 94%;
                padding-top: 28px;
            }

            .pipeline {
                flex-direction: column;
            }

            .stage {
                width: 100%;
            }

            .section-title {
                font-size: 24px;
            }

            .architecture-card {
                padding: 18px;
            }
        }

    </style>

</head>


<body>


<!-- =====================================================
     HEADER
     ===================================================== -->

<header>

    <div class="logo">
        DevOps Pipeline Demo
    </div>

    <nav>

        <a href="#home">Home</a>

        <a href="#pipeline">Pipeline</a>

        <a href="#architecture">Architecture</a>

        <a href="#info">Information</a>

    </nav>

</header>


<!-- =====================================================
     HERO
     ===================================================== -->

<section class="hero" id="home">

    <div class="hero-content">

        <h1>
            DevOps CI/CD Pipeline
        </h1>

        <p>
            Automated Java application delivery using GitHub,
            Jenkins, Maven, Ansible, Docker, Tomcat and AWS EC2.
        </p>

        <button
            class="health-button"
            onclick="checkHealth()">

            &#10003; Check Application Health

        </button>

        <div id="healthMessage"></div>

    </div>

</section>


<!-- =====================================================
     MAIN
     ===================================================== -->

<main class="container">


    <!-- =================================================
         PIPELINE
         ================================================= -->

    <section class="section" id="pipeline">

        <h2 class="section-title">
            Pipeline Stages
        </h2>

        <p class="section-description">
            Source code is committed to GitHub, Jenkins performs
            continuous integration, Maven builds and tests the
            application, and Ansible deploys the WAR file into
            Dockerized Tomcat environments running on AWS EC2.
        </p>


        <div class="pipeline">


            <!-- 1 -->

            <div class="stage">

                <div class="stage-number">
                    1
                </div>

                <h3>
                    GitHub
                </h3>

                <p>
                    Source Code
                </p>

                <div class="success">
                    &#10003; SUCCESS
                </div>

            </div>


            <!-- 2 -->

            <div class="stage">

                <div class="stage-number">
                    2
                </div>

                <h3>
                    Jenkins
                </h3>

                <p>
                    CI Pipeline
                </p>

                <div class="success">
                    &#10003; SUCCESS
                </div>

            </div>


            <!-- 3 -->

            <div class="stage">

                <div class="stage-number">
                    3
                </div>

                <h3>
                    Maven
                </h3>

                <p>
                    Build &amp; Test
                </p>

                <div class="success">
                    &#10003; SUCCESS
                </div>

            </div>


            <!-- 4 -->

            <div class="stage">

                <div class="stage-number">
                    4
                </div>

                <h3>
                    Ansible
                </h3>

                <p>
                    Deployment
                </p>

                <div class="success">
                    &#10003; SUCCESS
                </div>

            </div>


            <!-- 5 -->

            <div class="stage">

                <div class="stage-number">
                    5
                </div>

                <h3>
                    AWS EC2 + Docker
                </h3>

                <p>
                    Production Containers
                </p>

                <div class="success">
                    &#10003; RUNNING
                </div>

            </div>


        </div>

    </section>


    <!-- =================================================
         ARCHITECTURE
         ================================================= -->

    <section class="section" id="architecture">


        <!-- =================================================
             DEPLOYMENT ARCHITECTURE
             ================================================= -->

        <div class="architecture-card">

            <h2 class="architecture-title">
                Deployment Architecture
            </h2>

            <p class="architecture-subtitle">
                GitHub triggers Jenkins on AWS EC2 #1. Jenkins uses Maven
                to build and test the Java application and produces
                webapp.war. The artifact is transferred to AWS EC2 #2,
                which acts as the Ansible Controller. Ansible then deploys
                the application to EC2 #3 and the Auto Scaling Group
                application instances running Dockerized Tomcat.
            </p>


            <div class="deployment-flow">


                <!-- =================================================
                     GITHUB
                     ================================================= -->

                <div class="arch-node github-node">

                    <div class="arch-icon github-icon">
                        GH
                    </div>

                    <h3>
                        GitHub
                    </h3>

                    <p>
                        Source Code
                    </p>

                </div>


                <!-- =================================================
                     WEBHOOK
                     ================================================= -->

                <div class="arrow">

                    Webhook

                    <div class="arrow-symbol">
                        &rarr;
                    </div>

                </div>


                <!-- =================================================
                     EC2 #1
                     ================================================= -->

                <div class="arch-node jenkins-node">

                    <div class="arch-icon jenkins-icon">
                        J
                    </div>

                    <h3>
                        AWS EC2 #1
                    </h3>

                    <p>
                        Jenkins Server
                    </p>

                    <p>
                        Maven Build &amp; Test
                    </p>

                </div>


                <!-- =================================================
                     ARTIFACT
                     ================================================= -->

                <div class="arrow">

                    webapp.war

                    <div class="arrow-symbol">
                        &rarr;
                    </div>

                </div>


                <!-- =================================================
                     EC2 #2
                     ================================================= -->

                <div class="arch-node ansible-node">

                    <div class="arch-icon ansible-icon">
                        A
                    </div>

                    <h3>
                        AWS EC2 #2
                    </h3>

                    <p>
                        Ansible Controller
                    </p>

                    <p>
                        Dynamic AWS Inventory
                    </p>

                </div>


                <!-- =================================================
                     ANSIBLE
                     ================================================= -->

                <div class="arrow">

                    SSH + Ansible

                    <div class="arrow-symbol">
                        &rarr;
                    </div>

                </div>


                <!-- =================================================
                     DEPLOYMENT TARGETS
                     ================================================= -->

                <div class="deployment-targets">


                    <!-- =================================================
                         EC2 #3
                         ================================================= -->

                    <div class="target-box">

                        <div class="arch-icon docker-icon">
                            D
                        </div>

                        <div>

                            <div class="target-title">
                                EC2 #3 — Application Server
                            </div>

                            <div class="target-subtitle">
                                Fixed EC2 Instance
                            </div>

                            <div class="container-box">

                                <span>
                                    Docker Container
                                </span>

                                <br>

                                <strong>
                                    Tomcat : 8080
                                </strong>

                                <br>

                                <span>
                                    webapp.war
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- =================================================
                         ASG INSTANCE #1
                         ================================================= -->

                    <div class="target-box">

                        <div class="arch-icon docker-icon">
                            D
                        </div>

                        <div>

                            <div class="target-title">
                                ASG Instance #1
                            </div>

                            <div class="target-subtitle">
                                Auto Scaling Group
                            </div>

                            <div class="container-box">

                                <span>
                                    Docker Container
                                </span>

                                <br>

                                <strong>
                                    Tomcat : 8080
                                </strong>

                                <br>

                                <span>
                                    webapp.war
                                </span>

                            </div>

                        </div>

                    </div>


                    <!-- =================================================
                         ASG INSTANCE #2
                         ================================================= -->

                    <div class="target-box">

                        <div class="arch-icon docker-icon">
                            D
                        </div>

                        <div>

                            <div class="target-title">
                                ASG Instance #2
                            </div>

                            <div class="target-subtitle">
                                Auto Scaling Group
                            </div>

                            <div class="container-box">

                                <span>
                                    Docker Container
                                </span>

                                <br>

                                <strong>
                                    Tomcat : 8080
                                </strong>

                                <br>

                                <span>
                                    webapp.war
                                </span>

                            </div>

                        </div>

                    </div>


                </div>

            </div>

        </div>


        <!-- =================================================
             APPLICATION ACCESS ARCHITECTURE
             ================================================= -->

        <div class="architecture-card">

            <h2 class="architecture-title">
                Application Access Architecture
            </h2>

            <p class="architecture-subtitle">
                Users access the application through the AWS Application
                Load Balancer. The ALB forwards requests to the webapp-tg
                target group on port 8080. The target group distributes
                traffic across EC2 #3 and the Auto Scaling Group
                application instances. EC2 #2 is not an application target
                because it is used only as the Ansible Controller.
            </p>


            <div class="access-flow">


                <!-- =================================================
                     USER
                     ================================================= -->

                <div class="arch-node user-node">

                    <div class="arch-icon user-icon">
                        USER
                    </div>

                    <h3>
                        User / Browser
                    </h3>

                    <p>
                        Application Request
                    </p>

                </div>


                <!-- =================================================
                     HTTP
                     ================================================= -->

                <div class="arrow">

                    HTTP

                    <div class="arrow-symbol">
                        &rarr;
                    </div>

                </div>


                <!-- =================================================
                     ALB
                     ================================================= -->

                <div class="arch-node alb-node">

                    <div class="arch-icon alb-icon">
                        ALB
                    </div>

                    <h3>
                        AWS ALB
                    </h3>

                    <p>
                        webapp-alb
                    </p>

                    <p>
                        Application Load Balancer
                    </p>

                </div>


                <!-- =================================================
                     TARGET GROUP
                     ================================================= -->

                <div class="arrow">

                    webapp-tg : 8080

                    <div class="arrow-symbol">
                        &rarr;
                    </div>

                </div>


                <!-- =================================================
                     APPLICATION TARGETS
                     ================================================= -->

                <div class="access-targets">


                    <!-- =================================================
                         EC2 #3
                         ================================================= -->

                    <div class="access-server">

                        <div>

                            <strong>
                                EC2 #3 — Application Server
                            </strong>

                            <span>
                                Fixed EC2 Instance
                            </span>

                        </div>

                        <div>

                            <strong>
                                Docker + Tomcat
                            </strong>

                            <span>
                                webapp.war : 8080
                            </span>

                        </div>

                    </div>


                    <!-- =================================================
                         ASG
                         ================================================= -->

                    <div class="access-server">

                        <div>

                            <strong>
                                Auto Scaling Group
                            </strong>

                            <span>
                                devops-ec2-3-asg
                            </span>

                        </div>

                        <div>

                            <strong>
                                2 Instances
                            </strong>

                            <span>
                                Port 8080
                            </span>

                        </div>

                    </div>


                    <!-- =================================================
                         ASG INSTANCE #1
                         ================================================= -->

                    <div class="access-server">

                        <div>

                            <strong>
                                ASG Instance #1
                            </strong>

                            <span>
                                Docker Container
                            </span>

                        </div>

                        <div>

                            <strong>
                                Tomcat
                            </strong>

                            <span>
                                webapp.war : 8080
                            </span>

                        </div>

                    </div>


                    <!-- =================================================
                         ASG INSTANCE #2
                         ================================================= -->

                    <div class="access-server">

                        <div>

                            <strong>
                                ASG Instance #2
                            </strong>

                            <span>
                                Docker Container
                            </span>

                        </div>

                        <div>

                            <strong>
                                Tomcat
                            </strong>

                            <span>
                                webapp.war : 8080
                            </span>

                        </div>

                    </div>


                </div>

            </div>

        </div>


        <!-- =================================================
             INFORMATION CARDS
             ================================================= -->

        <div class="info-grid" id="info">


            <!-- =================================================
                 DEPLOYMENT INFORMATION
                 ================================================= -->

            <div class="info-card">

                <h3>
                    Deployment Information
                </h3>

                <table>

                    <tr>
                        <td>Source Control</td>
                        <td>GitHub</td>
                    </tr>

                    <tr>
                        <td>CI Server</td>
                        <td>Jenkins</td>
                    </tr>

                    <tr>
                        <td>Build Tool</td>
                        <td>Maven</td>
                    </tr>

                    <tr>
                        <td>Artifact</td>
                        <td>webapp.war</td>
                    </tr>

                    <tr>
                        <td>Deployment Tool</td>
                        <td>Ansible</td>
                    </tr>

                    <tr>
                        <td>Container Platform</td>
                        <td>Docker</td>
                    </tr>

                    <tr>
                        <td>Application Server</td>
                        <td>Tomcat</td>
                    </tr>

                    <tr>
                        <td>Cloud Platform</td>
                        <td>AWS EC2</td>
                    </tr>

                    <tr>
                        <td>Deployment Status</td>

                        <td class="success">
                            &#10003; SUCCESSFUL
                        </td>
                    </tr>

                </table>

            </div>


            <!-- =================================================
                 EC2 SERVERS
                 ================================================= -->

            <div class="info-card">

                <h3>
                    AWS EC2 Infrastructure
                </h3>

                <table>

                    <tr>
                        <td>EC2 #1</td>
                        <td>Jenkins + Maven</td>
                    </tr>

                    <tr>
                        <td>EC2 #2</td>
                        <td>Ansible Controller</td>
                    </tr>

                    <tr>
                        <td>EC2 #3</td>
                        <td>Docker + Tomcat</td>
                    </tr>

                    <tr>
                        <td>ASG Instances</td>
                        <td>Docker + Tomcat</td>
                    </tr>

                    <tr>
                        <td>Application</td>
                        <td>webapp.war</td>
                    </tr>

                    <tr>
                        <td>Container</td>
                        <td>Docker</td>
                    </tr>

                    <tr>
                        <td>Application Server</td>
                        <td>Tomcat</td>
                    </tr>

                    <tr>
                        <td>Deployment Controller</td>
                        <td>EC2 #2</td>
                    </tr>

                    <tr>
                        <td>Load Balancer</td>
                        <td>AWS ALB</td>
                    </tr>

                    <tr>
                        <td>ALB Targets</td>
                        <td>EC2 #3 + ASG Instances</td>
                    </tr>

                    <tr>
                        <td>Environment</td>
                        <td>Production</td>
                    </tr>

                </table>

            </div>


            <!-- =================================================
                 TECHNOLOGIES
                 ================================================= -->

            <div class="info-card">

                <h3>
                    Technologies Used
                </h3>


                <div class="technology-list">


                    <!-- GITHUB -->

                    <div class="technology">

                        <div class="technology-icon github-icon">
                            GH
                        </div>

                        <div>

                            <strong>
                                GitHub
                            </strong>

                            <span>
                                Source Code Management
                            </span>

                        </div>

                    </div>


                    <!-- JENKINS -->

                    <div class="technology">

                        <div class="technology-icon jenkins-icon">
                            J
                        </div>

                        <div>

                            <strong>
                                Jenkins
                            </strong>

                            <span>
                                Continuous Integration
                            </span>

                        </div>

                    </div>


                    <!-- MAVEN -->

                    <div class="technology">

                        <div class="technology-icon"
                             style="background:#1976d2;">
                            M
                        </div>

                        <div>

                            <strong>
                                Maven
                            </strong>

                            <span>
                                Build &amp; Testing
                            </span>

                        </div>

                    </div>


                    <!-- ANSIBLE -->

                    <div class="technology">

                        <div class="technology-icon"
                             style="background:#111111;">
                            A
                        </div>

                        <div>

                            <strong>
                                Ansible
                            </strong>

                            <span>
                                Deployment Automation
                            </span>

                        </div>

                    </div>


                    <!-- DOCKER -->

                    <div class="technology">

                        <div class="technology-icon docker-icon">
                            D
                        </div>

                        <div>

                            <strong>
                                Docker
                            </strong>

                            <span>
                                Containerization
                            </span>

                        </div>

                    </div>


                    <!-- AWS -->

                    <div class="technology">

                        <div class="technology-icon"
                             style="background:#232f3e;color:#ffb300;">
                            AWS
                        </div>

                        <div>

                            <strong>
                                AWS EC2 + ALB
                            </strong>

                            <span>
                                Cloud Infrastructure
                            </span>

                        </div>

                    </div>


                </div>

            </div>


        </div>


    </section>


</main>


<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer>

    <strong>
        DevOps CI/CD Pipeline
    </strong>

    <p>
        GitHub | Jenkins | Maven | Ansible | Docker | Tomcat | AWS EC2 | ALB
    </p>

    <p>
        Automated Java Application Deployment
    </p>

</footer>


<!-- =====================================================
     JAVASCRIPT
     ===================================================== -->

<script>

    function checkHealth() {

        const message =
            document.getElementById("healthMessage");

        message.innerHTML =
            "&#10003; Application is healthy and responding successfully.";

    }

</script>


</body>

</html>