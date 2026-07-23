<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg" alt="Jenkins" width="120" />
  <h1>CodeAlpha Internship - Task 2</h1>
  <h2>🚀 Advanced Enterprise Jenkins Remoting & Distributed Pipeline</h2>

  <p align="center">
    <img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white" />
    <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white" />
    <img src="https://img.shields.io/badge/Groovy-4298B8?style=for-the-badge&logo=Apache+Groovy&logoColor=white" />
    <img src="https://img.shields.io/badge/CodeAlpha_Internship-blueviolet?style=for-the-badge" />
  </p>
  
  <p><em>Enterprise-grade distributed build automation, cross-platform remoting, visual pipeline graphs, dynamic parallel matrix testing, and security gates.</em></p>
</div>

<br/>

## 🎯 Project Objective

This project was developed as **Task 2** for the **CodeAlpha Internship**. The core objectives are:
- Provision **Jenkins Remoting** across isolated environments.
- Distribute build workloads across architectures (Windows / Linux / Controller) safely.
- Implement **Advanced CI/CD Pipelines** with interactive visualization in Jenkins UI (`Pipeline-Dashboard`, Stage View, and Graph View).
- Enable dynamic parameterization, artifact fingerprinting, vulnerability gates, and automated deployment strategies.

---

## ✨ Advanced Features & Architecture

- 📊 **Visual Pipeline Dashboard & Graph View**: Integrated `pipeline-stage-view` and `pipeline-graph-view` with JCasC (`casc.yaml`) to automatically display visual pipeline graphs and stage execution details right on the Jenkins dashboard.
- 🔄 **Cross-Platform Payload Stashing (`stash`/`unstash`)**: Compiles core binary payloads on isolated **Windows** nodes, stashes them to Controller memory, and unstashes them onto **Linux** nodes for security patching and assembly.
- 🔀 **Dynamic Groovy Parallel Test Matrix**: Programmatically generates parallel test suites (PenTest Security, Integration Suite, Performance Load Test, API Contract Verification) via Groovy closures.
- 🔒 **Security & Vulnerability Audit Gate**: Automated SAST and dependency analysis stage before release promotion.
- 🛑 **Milestone Concurrency & Approval Lock**: Interactive manual gate for PROD promotions with `milestone()` step guards to abort delayed older builds automatically.
- 🏷️ **Resilient Agent Selectors**: Built-in fallback label logic (`windows || linux || built-in`) ensures builds execute seamlessly even if specific agent nodes are offline or initializing.

---

## 📂 Repository Structure

| File / Directory | Description |
| :--- | :--- |
| <kbd>Jenkinsfile</kbd> / <kbd>jenkinsfile</kbd> | Enterprise multi-stage pipeline featuring remoting, dynamic parallel matrix, security gate, MD5 fingerprinting, and deployment strategies. |
| <kbd>casc.yaml</kbd> | Jenkins Configuration as Code (JCasC) file to auto-provision nodes, JNLP/SSH agents, jobs, and dashboard views. |
| <kbd>plugins.txt</kbd> | Complete list of Jenkins plugins required for JCasC, Job DSL, Stage View, and Pipeline Graph View. |
| <kbd>docker-compose.yml</kbd> | Infrastructure-as-Code script to launch Jenkins Controller & Linux SSH Agent containers. |
| <kbd>connect-windows-agent.ps1</kbd> | PowerShell script to connect a Windows machine as a JNLP remote agent node. |
| <kbd>nodeHealth.sh</kbd> | Linux system health check script executed during pipeline initialization. |

---

## 🚀 Quick Start Guide

### 1. Launch Jenkins & Agents via Docker
```bash
docker-compose up -d --build
```
Jenkins will start at **http://localhost:8080** (Admin User: `admin` / Password: `admin`).

### 2. Connect Remote Windows Agent (Optional)
To attach a Windows remote execution agent:
```powershell
.\connect-windows-agent.ps1
```

### 3. View & Execute Pipelines in Jenkins
1. Open **http://localhost:8080**.
2. On the **Pipeline-Dashboard**, select either:
   - **`⚡ Enterprise Advanced CI/CD Pipeline`**
   - **`🌐 Distributed Cross-Node Remoting Demo`**
3. Click **Build with Parameters** and select target parameters (`ENVIRONMENT`, `DEPLOY_STRATEGY`, `SECURITY_SCAN`, `RUN_FULL_SUITE`).
4. Enjoy the real-time visual stage execution graph!