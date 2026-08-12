<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>DevOps CI/CD Pipeline</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, Helvetica, sans-serif;
            background: #f4f7fb;
            color: #1f2937;
        }

        header {
            background: #111827;
            color: white;
            padding: 25px 50px;
            text-align: center;
        }

        header h1 {
            font-size: 32px;
            margin-bottom: 8px;
        }

        header p {
            color: #cbd5e1;
            font-size: 16px;
        }

        .container {
            width: 92%;
            max-width: 1250px;
            margin: 30px auto;
        }

        .section-title {
            text-align: center;
            margin-bottom: 25px;
            font-size: 25px;
            color: #111827;
        }

        /* =========================
           CI/CD ARCHITECTURE
           ========================= */

        .architecture {
            background: white;
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .pipeline {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 12px;
            flex-wrap: wrap;
        }

        .box {
            width: 190px;
            min-height: 120px;
            border: 2px solid #2563eb;
            border-radius: 10px;
            background: #eff6ff;
            padding: 20px 12px;
            text-align: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .box h3 {
            color: #1d4ed8;
            margin-bottom: 10px;
            font-size: 18px;
        }

        .box p {
            font-size: 14px;
            line-height: 1.5;
        }

        .arrow {
            font-size: 30px;
            font-weight: bold;
            color: #64748b;
        }

        /* Artifact */

        .artifact {
            border-color: #d97706;
            background: #fffbeb;
        }

        .artifact h3 {
            color: #b45309;
        }

        /* =========================
           DEPLOYMENT
           ========================= */

        .deployment {
            margin-top: 35px;
            border-top: 2px solid #e5e7eb;
            padding-top: 30px;
        }

        .controller {
            width: 300px;
            margin: auto;
            border: 2px solid #7c3aed;
            background: #f5f3ff;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }

        .controller h3 {
            color: #6d28d9;
            margin-bottom: 10px;
        }

        .controller p {
            font-size: 14px;
            line-height: 1.6;
        }

        .down-arrow {
            text-align: center;
            font-size: 35px;
            color: #64748b;
            margin: 12px;
        }

        .deployment-label {
            text-align: center;
            font-weight: bold;
            color: #6d28d9;
            margin-bottom: 20px;
            font-size: 15px;
        }

        .deployment-targets {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 30px;
            flex-wrap: wrap;
        }

        .server {
            width: 280px;
            padding: 25px;
            border-radius: 10px;
            text-align: center;
            border: 2px solid #059669;
            background: #ecfdf5;
        }

        .server h3 {
            color: #047857;
            margin-bottom: 12px;
        }

        .server p {
            font-size: 14px;
            line-height: 1.7;
        }

        /* =========================
           DEPLOYMENT ASG
           ========================= */

        .deployment-asg {
            width: 590px;
            max-width: 100%;
            padding: 25px;
            border: 2px dashed #0891b2;
            border-radius: 12px;
            background: #ecfeff;
        }

        .deployment-asg h3 {
            text-align: center;
            color: #0e7490;
            margin-bottom: 8px;
        }

        .deployment-asg .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            margin-bottom: 20px;
        }

        .asg-instances {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .instance {
            width: 240px;
            background: white;
            border: 2px solid #0891b2;
            border-radius: 8px;
            padding: 18px;
            text-align: center;
        }

        .instance h4 {
            color: #0e7490;
            margin-bottom: 8px;
        }

        .instance p {
            font-size: 13px;
            line-height: 1.6;
        }

        /* =========================
           APPLICATION ACCESS
           ========================= */

        .access {
            margin-top: 35px;
            background: white;
            border-radius: 12px;
            padding: 35px;
            box-shadow: 0 4px 15px rgba(0,0,0,0.08);
        }

        .access-flow {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-wrap: wrap;
            gap: 15px;
        }

        .access-box {
            width: 220px;
            min-height: 110px;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
            border: 2px solid #ea580c;
            background: #fff7ed;
        }

        .access-box h3 {
            color: #c2410c;
            margin-bottom: 10px;
        }

        .access-box p {
            font-size: 14px;
            line-height: 1.5;
        }

        .access-arrow {
            font-size: 30px;
            font-weight: bold;
            color: #64748b;
        }

        /* =========================
           TARGET GROUP
           ========================= */

        .target-group {
            margin-top: 30px;
            padding: 25px;
            border: 2px solid #f59e0b;
            border-radius: 12px;
            background: #fffbeb;
        }

        .target-group h3 {
            text-align: center;
            color: #b45309;
            margin-bottom: 8px;
        }

        .target-group .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            margin-bottom: 22px;
        }

        .access-targets {
            display: flex;
            justify-content: center;
            align-items: flex-start;
            gap: 25px;
            flex-wrap: wrap;
        }

        .access-instance {
            width: 280px;
            background: white;
            border: 2px solid #059669;
            border-radius: 10px;
            padding: 20px;
            text-align: center;
        }

        .access-instance h4 {
            color: #047857;
            margin-bottom: 10px;
        }

        .access-instance p {
            font-size: 13px;
            line-height: 1.6;
        }

        /* =========================
           ACCESS ASG
           ========================= */

        .access-asg {
            width: 590px;
            max-width: 100%;
            padding: 25px;
            border: 2px dashed #0891b2;
            border-radius: 12px;
            background: #ecfeff;
        }

        .access-asg h4 {
            text-align: center;
            color: #0e7490;
            margin-bottom: 8px;
        }

        .access-asg .subtitle {
            text-align: center;
            color: #64748b;
            font-size: 13px;
            margin-bottom: 20px;
        }

        .access-asg-instances {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .access-asg-instance {
            width: 240px;
            background: white;
            border: 2px solid #0891b2;
            border-radius: 8px;
            padding: 18px;
            text-align: center;
        }

        .access-asg-instance h5 {
            color: #0e7490;
            margin-bottom: 8px;
            font-size: 15px;
        }

        .access-asg-instance p {
            font-size: 13px;
            line-height: 1.5;
        }

        .healthy {
            color: #059669;
            font-weight: bold;
        }

        /* =========================
           TECHNOLOGY
           ========================= */

        .technology {
            margin-top: 35px;
        }

        .tech-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 15px;
        }

        .tech {
            background: white;
            border-radius: 8px;
            padding: 18px;
            text-align: center;
            box-shadow: 0 3px 10px rgba(0,0,0,0.06);
        }

        .tech strong {
            display: block;
            margin-bottom: 7px;
            color: #1d4ed8;
        }

        /* =========================
           STATUS
           ========================= */

        .status {
            margin-top: 35px;
            background: #111827;
            color: white;
            border-radius: 10px;
            padding: 25px;
            text-align: center;
        }

        .status h2 {
            margin-bottom: 12px;
        }

        .status span {
            color: #4ade80;
            font-weight: bold;
        }

        /* =========================
           FOOTER
           ========================= */

        footer {
            margin-top: 40px;
            background: #111827;
            color: #9ca3af;
            text-align: center;
            padding: 20px;
            font-size: 13px;
            line-height: 1.8;
        }

        /* =========================
           RESPONSIVE
           ========================= */

        @media(max-width: 700px) {

            .pipeline,
            .access-flow {
                flex-direction: column;
            }

            .arrow,
            .access-arrow {
                transform: rotate(90deg);
            }

            .box,
            .access-box,
            .server {
                width: 90%;
                max-width: 300px;
            }

            .deployment-targets,
            .access-targets {
                flex-direction: column;
                align-items: center;
            }

            .deployment-asg,
            .access-asg {
                width: 90%;
            }

        }

    </style>

</head>


<body>


<header>

    <h1>DevOps CI/CD Pipeline</h1>

    <p>
        Automated Build, Test, Deployment and Application Delivery on AWS
    </p>

</header>


<div class="container">


    <!-- =====================================================
         COMPLETE CI/CD PIPELINE
         ===================================================== -->

    <section class="architecture">

        <h2 class="section-title">
            CI/CD Pipeline Architecture
        </h2>


        <div class="pipeline">


            <!-- GITHUB -->

            <div class="box">

                <h3>GitHub</h3>

                <p>
                    Source Code Repository<br>
                    Webhook Trigger
                </p>

            </div>


            <div class="arrow">→</div>


            <!-- JENKINS -->

            <div class="box">

                <h3>Jenkins</h3>

                <p>
                    AWS EC2 #1<br>
                    CI Pipeline<br>
                    Build & Test
                </p>

            </div>


            <div class="arrow">→</div>


            <!-- MAVEN -->

            <div class="box">

                <h3>Maven</h3>

                <p>
                    Build<br>
                    Unit Tests<br>
                    Package
                </p>

            </div>


            <div class="arrow">→</div>


            <!-- WAR -->

            <div class="box artifact">

                <h3>webapp.war</h3>

                <p>
                    Build Artifact<br>
                    Generated by Maven
                </p>

            </div>


            <div class="arrow">→</div>


            <!-- EC2 #2 -->

            <div class="box">

                <h3>EC2 #2</h3>

                <p>
                    Ansible Controller<br>
                    Receives webapp.war<br>
                    Starts Deployment
                </p>

            </div>


        </div>


        <!-- =================================================
             DEPLOYMENT ARCHITECTURE
             ================================================= -->

        <div class="deployment">

            <h2 class="section-title">
                Automated Deployment
            </h2>


            <!-- ANSIBLE CONTROLLER -->

            <div class="controller">

                <h3>
                    EC2 #2 — Ansible Controller
                </h3>

                <p>
                    Private IP: 172.31.3.172<br>
                    Ansible Controller<br>
                    IAM Role: AnsibleControllerRole<br>
                    amazon.aws Collection<br>
                    Dynamic EC2 Inventory<br>
                    Deploys webapp.war
                </p>

            </div>


            <div class="down-arrow">
                ↓
            </div>


            <div class="deployment-label">

                SSH + Ansible

                <br>

                <span style="font-size:13px;font-weight:normal;color:#64748b;">
                    EC2 #2 deploys to all three application targets
                </span>

            </div>


            <!-- DEPLOYMENT TARGETS -->

            <div class="deployment-targets">


                <!-- FIXED EC2 #3 -->

                <div class="server">

                    <h3>
                        EC2 #3 — Fixed
                    </h3>

                    <p>
                        Private IP: 172.31.45.146<br>
                        Docker Host<br>
                        Docker Container<br>
                        Tomcat : 8080<br>
                        webapp.war<br>
                        Application Server
                    </p>

                </div>


                <!-- ASG -->

                <div class="deployment-asg">

                    <h3>
                        Auto Scaling Group
                    </h3>

                    <div class="subtitle">
                        ASG-managed application instances
                    </div>


                    <div class="asg-instances">


                        <!-- ASG #1 -->

                        <div class="instance">

                            <h4>
                                ASG Instance #1
                            </h4>

                            <p>
                                Private IP: 172.31.32.227<br>
                                Docker Host<br>
                                Docker Container<br>
                                Tomcat : 8080<br>
                                webapp.war<br>
                                Managed by ASG
                            </p>

                        </div>


                        <!-- ASG #2 -->

                        <div class="instance">

                            <h4>
                                ASG Instance #2
                            </h4>

                            <p>
                                Private IP: 172.31.37.170<br>
                                Docker Host<br>
                                Docker Container<br>
                                Tomcat : 8080<br>
                                webapp.war<br>
                                Managed by ASG
                            </p>

                        </div>


                    </div>

                </div>


            </div>

        </div>

    </section>



    <!-- =====================================================
         APPLICATION ACCESS ARCHITECTURE
         ===================================================== -->

    <section class="access">

        <h2 class="section-title">
            Application Access Architecture
        </h2>


        <!-- USER → ALB → TARGET GROUP -->

        <div class="access-flow">


            <!-- CLIENT -->

            <div class="access-box">

                <h3>
                    Client
                </h3>

                <p>
                    User / Browser<br>
                    Application Request
                </p>

            </div>


            <div class="access-arrow">
                →
            </div>


            <!-- ALB -->

            <div class="access-box">

                <h3>
                    AWS ALB
                </h3>

                <p>
                    Application Load Balancer<br>
                    webapp-alb<br>
                    HTTP : 80
                </p>

            </div>


            <div class="access-arrow">
                →
            </div>


            <!-- TARGET GROUP -->

            <div class="access-box">

                <h3>
                    Target Group
                </h3>

                <p>
                    webapp-tg<br>
                    HTTP : 8080<br>
                    Health Checks<br>
                    Load Balancing
                </p>

            </div>


        </div>


        <!-- TARGET GROUP CONNECTION -->

        <div class="target-group">

            <h3>
                Application Targets
            </h3>

            <div class="subtitle">

                Target Group routes traffic to EC2 #3 and the ASG instances

            </div>


            <div class="access-targets">


                <!-- EC2 #3 -->

                <div class="access-instance">

                    <h4>
                        EC2 #3 — Fixed
                    </h4>

                    <p>
                        Private IP: 172.31.45.146<br>
                        Docker Container<br>
                        customcontainer<br>
                        Tomcat : 8080<br>
                        <span class="healthy">
                            ● Healthy
                        </span>
                    </p>

                </div>


                <!-- ASG -->

                <div class="access-asg">

                    <h4>
                        Auto Scaling Group
                    </h4>

                    <div class="subtitle">
                        ASG instances registered as application targets
                    </div>


                    <div class="access-asg-instances">


                        <!-- ASG INSTANCE #1 -->

                        <div class="access-asg-instance">

                            <h5>
                                ASG Instance #1
                            </h5>

                            <p>
                                172.31.32.227<br>
                                Docker Container<br>
                                customcontainer<br>
                                Tomcat : 8080<br>

                                <span class="healthy">
                                    ● Healthy
                                </span>
                            </p>

                        </div>


                        <!-- ASG INSTANCE #2 -->

                        <div class="access-asg-instance">

                            <h5>
                                ASG Instance #2
                            </h5>

                            <p>
                                172.31.37.170<br>
                                Docker Container<br>
                                customcontainer<br>
                                Tomcat : 8080<br>

                                <span class="healthy">
                                    ● Healthy
                                </span>
                            </p>

                        </div>


                    </div>

                </div>


            </div>

        </div>

    </section>



    <!-- =====================================================
         TECHNOLOGIES
         ===================================================== -->

    <section class="technology">

        <h2 class="section-title">
            Technologies Used
        </h2>


        <div class="tech-grid">


            <div class="tech">
                <strong>GitHub</strong>
                Source Control
            </div>


            <div class="tech">
                <strong>Jenkins</strong>
                CI/CD
            </div>


            <div class="tech">
                <strong>Maven</strong>
                Build & Test
            </div>


            <div class="tech">
                <strong>Ansible</strong>
                Deployment
            </div>


            <div class="tech">
                <strong>AWS EC2</strong>
                Compute
            </div>


            <div class="tech">
                <strong>Docker</strong>
                Containerization
            </div>


            <div class="tech">
                <strong>Tomcat</strong>
                Application Server
            </div>


            <div class="tech">
                <strong>ALB</strong>
                Load Balancing
            </div>


            <div class="tech">
                <strong>Target Group</strong>
                Traffic Distribution
            </div>


            <div class="tech">
                <strong>Auto Scaling</strong>
                High Availability
            </div>


            <div class="tech">
                <strong>IAM</strong>
                AWS Access Control
            </div>


        </div>

    </section>



    <!-- =====================================================
         STATUS
         ===================================================== -->

    <section class="status">

        <h2>
            Deployment Status
        </h2>

        <p>
            Application is deployed through the automated CI/CD pipeline
            and served through the AWS Application Load Balancer.
        </p>

        <br>

        <p>

            <span>● HEALTHY</span>

            &nbsp; | &nbsp;

            GitHub

            &nbsp; | &nbsp;

            Jenkins

            &nbsp; | &nbsp;

            Maven

            &nbsp; | &nbsp;

            Ansible

            &nbsp; | &nbsp;

            Docker

            &nbsp; | &nbsp;

            Tomcat

            &nbsp; | &nbsp;

            ALB

            &nbsp; | &nbsp;

            Auto Scaling

        </p>

    </section>


</div>



<!-- =====================================================
     FOOTER
     ===================================================== -->

<footer>

    DevOps CI/CD Demo Application

    <br>

    Deployment:
    GitHub → Jenkins/EC2 #1 → Maven → webapp.war →
    EC2 #2 Ansible Controller →
    EC2 #3 + ASG Instance #1 + ASG Instance #2

    <br>

    Application Access:
    User → AWS ALB → Target Group →
    EC2 #3 + ASG Instance #1 + ASG Instance #2

</footer>


</body>
</html>