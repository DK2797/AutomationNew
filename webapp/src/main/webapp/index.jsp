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

        /* Architecture */

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

        /* Deployment */

        .deployment {
            margin-top: 35px;
            border-top: 2px solid #e5e7eb;
            padding-top: 30px;
        }

        .controller {
            width: 260px;
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
            line-height: 1.5;
        }

        .down-arrow {
            text-align: center;
            font-size: 35px;
            color: #64748b;
            margin: 12px;
        }

        .servers {
            display: flex;
            justify-content: center;
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

        /* Application Access */

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

        /* ASG */

        .asg {
            margin-top: 30px;
            padding: 25px;
            border: 2px dashed #0891b2;
            border-radius: 12px;
            background: #ecfeff;
        }

        .asg h3 {
            text-align: center;
            color: #0e7490;
            margin-bottom: 20px;
        }

        .asg-instances {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .instance {
            width: 230px;
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
            line-height: 1.5;
        }

        /* Technology */

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

        /* Status */

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

        footer {
            margin-top: 40px;
            background: #111827;
            color: #9ca3af;
            text-align: center;
            padding: 20px;
            font-size: 13px;
        }

        @media(max-width: 700px) {

            .pipeline,
            .access-flow {
                flex-direction: column;
            }

            .arrow {
                transform: rotate(90deg);
            }

            .box,
            .access-box,
            .server {
                width: 90%;
                max-width: 300px;
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

    <!-- CI/CD PIPELINE -->

    <section class="architecture">

        <h2 class="section-title">
            CI/CD Pipeline Architecture
        </h2>

        <div class="pipeline">

            <div class="box">
                <h3>GitHub</h3>
                <p>
                    Source Code Repository<br>
                    Webhook Trigger
                </p>
            </div>

            <div class="arrow">→</div>

            <div class="box">
                <h3>Jenkins</h3>
                <p>
                    AWS EC2 #1<br>
                    CI Pipeline
                </p>
            </div>

            <div class="arrow">→</div>

            <div class="box">
                <h3>Maven</h3>
                <p>
                    Build<br>
                    Unit Tests<br>
                    webapp.war
                </p>
            </div>

            <div class="arrow">→</div>

            <div class="box">
                <h3>Ansible</h3>
                <p>
                    AWS EC2 Controller<br>
                    Dynamic AWS Inventory
                </p>
            </div>

        </div>


        <!-- DEPLOYMENT -->

        <div class="deployment">

            <h2 class="section-title">
                Automated Deployment
            </h2>

            <div class="controller">

                <h3>Ansible Controller</h3>

                <p>
                    AWS EC2 Instance<br>
                    IAM Role: AnsibleControllerRole<br>
                    amazon.aws Collection<br>
                    Dynamic EC2 Inventory
                </p>

            </div>

            <div class="down-arrow">
                ↓
            </div>


            <div class="servers">

                <div class="server">

                    <h3>ASG Instance 1</h3>

                    <p>
                        Amazon EC2<br>
                        Docker<br>
                        Tomcat<br>
                        Port 8080<br>
                        Managed by ASG
                    </p>

                </div>


                <div class="server">

                    <h3>ASG Instance 2</h3>

                    <p>
                        Amazon EC2<br>
                        Docker<br>
                        Tomcat<br>
                        Port 8080<br>
                        Managed by ASG
                    </p>

                </div>

            </div>

        </div>

    </section>


    <!-- APPLICATION ACCESS -->

    <section class="access">

        <h2 class="section-title">
            Application Access Architecture
        </h2>


        <div class="access-flow">

            <div class="access-box">

                <h3>Client</h3>

                <p>
                    User / Browser
                </p>

            </div>


            <div class="arrow">
                →
            </div>


            <div class="access-box">

                <h3>AWS ALB</h3>

                <p>
                    webapp-alb<br>
                    HTTP : 80
                </p>

            </div>


            <div class="arrow">
                →
            </div>


            <div class="access-box">

                <h3>Target Group</h3>

                <p>
                    webapp-tg<br>
                    HTTP : 8080<br>
                    Health Checks
                </p>

            </div>

        </div>


        <!-- ASG -->

        <div class="asg">

            <h3>
                Auto Scaling Group: devops-ec2-3-asg
            </h3>


            <div class="asg-instances">

                <div class="instance">

                    <h4>EC2 Instance 1</h4>

                    <p>
                        Docker Container<br>
                        customcontainer<br>
                        Tomcat : 8080<br>
                        Healthy
                    </p>

                </div>


                <div class="instance">

                    <h4>EC2 Instance 2</h4>

                    <p>
                        Docker Container<br>
                        customcontainer<br>
                        Tomcat : 8080<br>
                        Healthy
                    </p>

                </div>

            </div>

        </div>

    </section>


    <!-- TECHNOLOGIES -->

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
                <strong>Auto Scaling</strong>
                High Availability
            </div>

            <div class="tech">
                <strong>IAM</strong>
                AWS Access Control
            </div>

        </div>

    </section>


    <!-- STATUS -->

    <section class="status">

        <h2>Deployment Status</h2>

        <p>
            Application is deployed through the automated CI/CD pipeline
            and served through the AWS Application Load Balancer.
        </p>

        <br>

        <p>
            <span>● HEALTHY</span>
            &nbsp; | &nbsp;
            Docker &nbsp; | &nbsp;
            Tomcat &nbsp; | &nbsp;
            ALB &nbsp; | &nbsp;
            Auto Scaling
        </p>

    </section>

</div>


<footer>

    DevOps CI/CD Demo Application |
    GitHub → Jenkins → Maven → Ansible → AWS ASG → ALB → Tomcat

</footer>

</body>
</html>