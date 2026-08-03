<div align="center">

<img src="https://capsule-render.vercel.app/api?type=waving&color=0:0f172a,100:2496ED&height=200&section=header&text=DevOps%20%26%20Cloud%20Engineering&fontSize=42&fontColor=ffffff&animation=twinkling&fontAlignY=38&desc=CodeAlpha%20Internship%20%E2%80%94%20Compound%20Project%20Repository&descAlignY=58&descSize=18" width="100%"/>

<br/>

<img src="https://readme-typing-svg.demolab.com?font=Fira+Code&amp;size=22&amp;duration=3000&amp;pause=1000&amp;color=38BDF8&amp;center=true&amp;vCenter=true&amp;width=780&amp;lines=Jenkins+Remoting+%E2%80%A2+Distributed+Build+Pipelines;Java+%2B+Gradle+%E2%80%A2+Automated+CI%2FCD+Microservices;Docker+%E2%80%A2+Load-Balanced%2C+Self-Healing+Web+Infrastructure" alt="Typing SVG" />

<br/><br/>

[![Jenkins](https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=jenkins&logoColor=white)](#-task-2--jenkins-remoting)
[![Java](https://img.shields.io/badge/Java-21_LTS-orange?style=for-the-badge&logo=openjdk)](#-task-3--java-application-using-gradle)
[![Gradle](https://img.shields.io/badge/Gradle-8.13-02303A?style=for-the-badge&logo=gradle&logoColor=white)](#-task-3--java-application-using-gradle)
[![Docker](https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=docker&logoColor=white)](#-task-4--web-server-using-docker)
[![Nginx](https://img.shields.io/badge/Nginx-009639?style=for-the-badge&logo=nginx&logoColor=white)](#-task-4--web-server-using-docker)
[![Prometheus](https://img.shields.io/badge/Prometheus-E6522C?style=for-the-badge&logo=prometheus&logoColor=white)](#-task-3--java-application-using-gradle)
[![Grafana](https://img.shields.io/badge/Grafana-F46800?style=for-the-badge&logo=grafana&logoColor=white)](#-task-3--java-application-using-gradle)

<p><b>Three end-to-end DevOps engineering projects — remote build orchestration, automated Java delivery, and containerized infrastructure — built as a single, coherent internship portfolio.</b></p>

</div>

---

## 👋 About This Repository

This repository consolidates my **CodeAlpha DevOps & Cloud Engineering Internship** deliverables into one submission. Rather than three disconnected exercises, I designed them to interlock as a single pipeline narrative: a change is picked up by a **distributed Jenkins remoting setup**, built and validated by a **Gradle-automated Java service with full observability**, and the result is shipped to a **self-healing, load-balanced Docker infrastructure**. That flow is what the animated diagram below represents.

Each task lives in its own dedicated repository, linked below, with full setup instructions, architecture notes, and demo scripts. This page exists to give a reviewer the complete picture in one pass — what was built, why it was built that way, and what it demonstrates.

---

## 🗺️ Architecture Overview

<div align="center">
<img src="./assets/architecture-animated.svg" alt="Animated architecture diagram of the three-task DevOps pipeline" width="100%"/>
</div>

<p align="center"><i>The unified pipeline view above. Each task also has its own detailed, animated architecture diagram in its section below.</i></p>

---

## 📁 Project Repositories

| Task | Repository |
| :--- | :--- |
| ⚙️ Task 2 — Jenkins Remoting | [CodeAlpha_Jenkins-Remoting-Project](https://github.com/jishnuvardhankancharla2005/CodeAlpha_Jenkins-Remoting-Project) |
| ☕ Task 3 — Java Application using Gradle | [CodeAlpha_java_application_by_gradle](https://github.com/jishnuvardhankancharla2005/CodeAlpha_java_application_by_gradle) |
| 🐳 Task 4 — Web Server using Docker | [CodeAlpha_Web_Server_Using_Docker](https://github.com/jishnuvardhankancharla2005/CodeAlpha_Web_Server_Using_Docker) |

---

## 🧭 Table of Contents

- [Task 2 — Jenkins Remoting](#-task-2--jenkins-remoting)
- [Task 3 — Java Application using Gradle](#-task-3--java-application-using-gradle)
- [Task 4 — Web Server using Docker](#-task-4--web-server-using-docker)
- [Skills Demonstrated](#-skills-demonstrated-across-all-three-tasks)
- [How Everything Connects](#-how-the-three-projects-connect)
- [Running Each Project](#-running-each-project)
- [About Me](#-about-me)

---

## ⚙️ Task 2 — Jenkins Remoting

**Goal:** Set up distributed Jenkins nodes to run builds securely across architectures, with node-level isolation as a first-class security concern rather than an afterthought.

**What's inside:**
- A Jenkins Controller with **Windows JNLP** and **Linux SSH** remote agents, provisioned declaratively via **Jenkins Configuration as Code (`casc.yaml`)** instead of manual UI clicking.
- A pipeline that **compiles on Windows, stashes the payload to the controller, and unstashes it onto Linux** for patching and final assembly — a genuine cross-architecture remoting pattern, not just "two agents that exist."
- A **dynamic Groovy-generated parallel test matrix** (security, integration, performance, contract testing) instead of hardcoded stages.
- **Node isolation controls**: zero executors on the controller, least-privilege agent service accounts, containerized agent sandboxing on an isolated network, and per-node scoped credentials — so a compromised agent can't reach the controller's trust boundary.
- **Milestone-gated production promotion** with manual approval and automatic abortion of stale builds.

**Why it matters:** This goes beyond "connect two agents" — it demonstrates understanding of *why* remoting exists (workload distribution, architecture coverage) and *how* to keep it secure (isolation, least privilege, scoped trust), which is the part most junior setups skip.

<div align="center">
<img src="./assets/task2-jenkins-remoting-animated.svg" alt="Animated architecture diagram of Jenkins Remoting setup" width="100%"/>
</div>

📂 **[Full README →](https://github.com/jishnuvardhankancharla2005/CodeAlpha_Jenkins-Remoting-Project#readme)**

---

## ☕ Task 3 — Java Application using Gradle

**Goal:** Automate a Java application's build lifecycle end-to-end and integrate it into a CI/CD pipeline — not just "run gradle build" but a service that's actually observable and deployable.

**What's inside:**
- A **Spring Boot 3.4.1 REST microservice** with full CRUD endpoints, built and validated by an automated **Gradle 8.13 lifecycle**: `checkstyle` → `test` → `integrationTest` → `jacoco` → `bootJar`.
- An **8-stage declarative Jenkins pipeline** (checkout → lint → unit tests → integration tests → security scan → package → Docker build → smoke test) that auto-detects OS and runs `sh` or `gradlew.bat` accordingly.
- **Custom application telemetry** via Micrometer (counters, gauges, timers) scraped by **Prometheus** and visualized in auto-provisioned **Grafana dashboards** — plus host-level metrics via Node Exporter.
- A **one-command orchestration script** (`start.sh` / `start.bat`) that stands up the entire 5-container stack (app, Prometheus, Grafana, Node Exporter, Jenkins) in one shot.

**Why it matters:** Anyone can run `gradle build`. This demonstrates that a build pipeline isn't finished until you can *see* what the application is doing in production — dependency management, testing, and delivery all in service of an observable, deployable artifact.

<div align="center">
<img src="./assets/task3-java-gradle-animated.svg" alt="Animated architecture diagram of the Java Gradle build and observability pipeline" width="100%"/>
</div>

📂 **[Full README →](https://github.com/jishnuvardhankancharla2005/CodeAlpha_java_application_by_gradle#readme)**

---

## 🐳 Task 4 — Web Server using Docker

**Goal:** Deploy and manage a web server in Docker with a real understanding of container lifecycle, health, and troubleshooting — not just `docker run nginx`.

**What's inside:**
- An **Nginx reverse proxy** load-balancing across **horizontally scalable replicas** (`least_conn` routing, scales to 5+ nodes with zero downtime).
- **Two-tier network isolation**: a `frontend-net` bridge exposed to the host, and an internal-only `backend-net` that a Redis cache sits behind — direct host access to the database is blocked by design.
- **Proactive health checks** (`HEALTHCHECK` probes every 10s) driving **auto-healing**: containers that crash are detected and restarted automatically, with Nginx routing around the failure in the meantime.
- **Enforced resource governance** — explicit CPU (0.5 core) and memory (256MB) limits per container, with reservations to prevent noisy-neighbor issues.
- A **PowerShell demo suite** that proves each of these claims live: `scale-demo.ps1`, `simulate-crash.ps1` (kills PID 1 inside a container to test failover), `test-advanced.ps1`, and `test-lifecycle.ps1`.

**Why it matters:** This treats "web server in Docker" as a systems problem — availability, isolation, and resource governance — and then proves each property with a runnable script instead of just asserting it in prose.

<div align="center">
<img src="./assets/task4-docker-webserver-animated.svg" alt="Animated architecture diagram of the load-balanced, self-healing Docker web server cluster" width="100%"/>
</div>

📂 **[Full README →](https://github.com/jishnuvardhankancharla2005/CodeAlpha_Web_Server_Using_Docker#readme)**

---

## 🧩 How the Three Projects Connect

| Stage | Project | What Happens |
| :--- | :--- | :--- |
| 1️⃣ Trigger | **Jenkins Remoting** | A commit triggers a pipeline distributed across Windows/Linux remote agents, isolated from the controller |
| 2️⃣ Build & Validate | **Java + Gradle** | The Jenkins pipeline drives a Gradle build: compile, lint, unit + integration tests, package as a JAR, containerize |
| 3️⃣ Observe | **Java + Gradle** | The running service exposes metrics that Prometheus scrapes and Grafana visualizes |
| 4️⃣ Deploy | **Docker Web Server** | The built artifact is served behind a load-balanced, auto-healing, network-isolated Nginx cluster |

Each project stands on its own, but together they cover the full loop: **remote build → automated validation → observability → resilient deployment**.

---

## 🛠️ Skills Demonstrated Across All Three Tasks

| Category | Skills |
| :--- | :--- |
| **CI/CD** | Declarative Jenkins pipelines, multi-agent orchestration, Jenkins Configuration as Code (JCasC), parallel/dynamic stage generation |
| **Build Automation** | Gradle lifecycle management, dependency resolution, static analysis (Checkstyle), coverage (JaCoCo) |
| **Containerization** | Docker Compose multi-service stacks, multi-stage Dockerfiles, health checks, resource quotas |
| **Networking & Security** | Bridge network isolation, internal-only networks, least-privilege service accounts, credential scoping |
| **Observability** | Prometheus metrics, Grafana dashboard provisioning, custom application telemetry (Micrometer), host metrics |
| **Reliability Engineering** | Auto-healing, load balancing, horizontal scaling, zero-downtime failover |
| **Automation Scripting** | PowerShell/Bash test harnesses, one-command environment orchestration |

---

## ▶️ Running Each Project

Each task lives in its own repository — clone whichever one you want to run:

```bash
# Task 2 — Jenkins Remoting
git clone https://github.com/jishnuvardhankancharla2005/CodeAlpha_Jenkins-Remoting-Project.git
cd CodeAlpha_Jenkins-Remoting-Project
docker-compose up -d --build

# Task 3 — Java Application using Gradle
git clone https://github.com/jishnuvardhankancharla2005/CodeAlpha_java_application_by_gradle.git
cd CodeAlpha_java_application_by_gradle
./start.sh        # or start.bat on Windows

# Task 4 — Web Server using Docker
git clone https://github.com/jishnuvardhankancharla2005/CodeAlpha_Web_Server_Using_Docker.git
cd CodeAlpha_Web_Server_Using_Docker
docker compose up -d
```

Each repository's own README has full prerequisites, port mappings, and demo instructions.

---

## 🙋 About Me

**Jishnu Vardhan Kancharla**
DevOps & Cloud Engineering Intern @ CodeAlpha

I'm looking to bring this same approach — building things that don't just meet the requirement but prove their own reliability — to a full-time DevOps/Platform Engineering role. Happy to walk through any part of this repo in more depth.

[![GitHub](https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=github&logoColor=white)](https://github.com/jishnuvardhankancharla2005)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/JishnuVardhanKancharla)
[![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:jishnuvardhan558@gmail.com)

---

<div align="center">
<img src="https://capsule-render.vercel.app/api?type=waving&color=0:2496ED,100:0f172a&height=100&section=footer&animation=twinkling" width="100%"/>
</div>
