<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>DevOps Pipeline Demo</title>

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

        /* Header */
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
        }

        /* Hero */
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
            max-width: 700px;
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
        }

        .btn:hover {
            background: #e5e7eb;
        }

        /* Container */
        .container {
            width: 84%;
            margin: 40px auto;
        }

        .section-title {
            margin-bottom: 20px;
            font-size: 25px;
        }

        /* Pipeline */
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
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
            position: relative;
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
        }

        .stage h3 {
            margin-bottom: 8px;
        }

        .success {
            color: #16a34a;
            font-weight: bold;
            font-size: 14px;
        }

        /* Cards */
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
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
        }

        .card h3 {
            margin-bottom: 12px;
            color: #2563eb;
        }

        .card p {
            line-height: 1.6;
            color: #4b5563;
        }

        /* Deployment Info */
        .deployment {
            margin-top: 30px;
            background: white;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 3px 12px rgba(0,0,0,0.08);
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
        }

        /* Footer */
        footer {
            margin-top: 50px;
            background: #111827;
            color: #d1d5db;
            text-align: center;
            padding: 25px;
        }

        /* Responsive */
        @media (max-width: 900px) {
            .pipeline {
                grid-template-columns: repeat(2, 1fr);
            }

            .cards {
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
        }
    </style>
</head>

<body>

<header>
    <h1>DevOps Pipeline</h1>
    <div class="status">● SYSTEM ONLINE</div>
</header>

<section class="hero">
    <h2>DevOps CI/CD Pipeline</h2>

    <p>
        Welcome to the DevOps deployment demonstration.
        This application is deployed automatically through a CI/CD pipeline
        using GitHub, Jenkins, Maven, Ansible, Docker and AWS.
    </p>

    <button class="btn" onclick="checkHealth()">
        Check Application Health
    </button>

    <p id="healthMessage" style="margin-top:15px;"></p>
</section>


<div class="container">

    <h2 class="section-title">Pipeline Stages</h2>

    <div class="pipeline">

        <div class="stage">
            <div class="stage-icon">1</div>
            <h3>GitHub</h3>
            <p>Source Code</p>
            <div class="success">✓ SUCCESS</div>
        </div>

        <div class="stage">
            <div class="stage-icon">2</div>
            <h3>Jenkins</h3>
            <p>CI Pipeline</p>
            <div class="success">✓ SUCCESS</div>
        </div>

        <div class="stage">
            <div class="stage-icon">3</div>
            <h3>Maven</h3>
            <p>Build & Test</p>
            <div class="success">✓ SUCCESS</div>
        </div>

        <div class="stage">
            <div class="stage-icon">4</div>
            <h3>Ansible</h3>
            <p>Deployment</p>
            <div class="success">✓ SUCCESS</div>
        </div>

        <div class="stage">
            <div class="stage-icon">5</div>
            <h3>AWS</h3>
            <p>Production</p>
            <div class="success">✓ RUNNING</div>
        </div>

    </div>


    <div class="cards">

        <div class="card">
            <h3>Continuous Integration</h3>

            <p>
                Developer pushes code to GitHub.
                Jenkins detects the change and starts the pipeline.
                Maven compiles the application and executes automated tests.
            </p>
        </div>


        <div class="card">
            <h3>Continuous Deployment</h3>

            <p>
                After successful testing, Jenkins triggers deployment.
                Ansible connects to the target EC2 servers and deploys
                the latest application version.
            </p>
        </div>


        <div class="card">
            <h3>Load Balancing</h3>

            <p>
                Application traffic is distributed across multiple
                EC2 instances using an AWS Application Load Balancer.
            </p>
        </div>

    </div>


    <div class="deployment">

        <h2 class="section-title">Deployment Information</h2>

        <table>

            <tr>
                <th>Application</th>
                <td>DevOps Pipeline Demo</td>
            </tr>

            <tr>
                <th>Environment</th>
                <td>Production</td>
            </tr>

            <tr>
                <th>Build Tool</th>
                <td>Maven</td>
            </tr>

            <tr>
                <th>CI/CD</th>
                <td>Jenkins</td>
            </tr>

            <tr>
                <th>Configuration Management</th>
                <td>Ansible</td>
            </tr>

            <tr>
                <th>Containerization</th>
                <td>Docker</td>
            </tr>

            <tr>
                <th>Cloud Platform</th>
                <td>AWS EC2 + ALB</td>
            </tr>

            <tr>
                <th>Deployment Status</th>
                <td class="success">✓ SUCCESSFUL</td>
            </tr>

        </table>

    </div>

</div>


<footer>
    DevOps Pipeline Demo | CI/CD | AWS | Jenkins | Ansible | Docker
</footer>


<script>

    function checkHealth() {

        const message = document.getElementById("healthMessage");

        message.innerHTML = "✓ Application is healthy and responding successfully.";

        message.style.color = "#bbf7d0";
    }

</script>

</body>
</html>