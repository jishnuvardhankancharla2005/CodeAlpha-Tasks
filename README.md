<div align="center">
  <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/jenkins/jenkins-original.svg" alt="Jenkins" width="120" />
  <h1>CodeAlpha Internship - Task 2</h1>
  <h2>🚀 Advanced Jenkins Remoting & Distributed Builds</h2>

  <p align="center">
    <img src="https://img.shields.io/badge/Jenkins-D24939?style=for-the-badge&logo=Jenkins&logoColor=white" />
    <img src="https://img.shields.io/badge/Docker-2496ED?style=for-the-badge&logo=Docker&logoColor=white" />
    <img src="https://img.shields.io/badge/Groovy-4298B8?style=for-the-badge&logo=Apache+Groovy&logoColor=white" />
    <img src="https://img.shields.io/badge/CodeAlpha_Internship-blueviolet?style=for-the-badge" />
  </p>
  
  <p><em>Demonstrating secure, multi-node, cross-architecture build distribution using Jenkins.</em></p>
</div>

<br/>

## 🎯 Project Objective

This project was developed as **Task 2** for the **CodeAlpha Internship**. The core objectives were to:
- Set up **Jenkins Remoting** to connect remote Jenkins nodes.
- Distribute build loads across different machines securely.
- Run jobs on various architectures (Windows / Linux) remotely.
- Improve security using node isolation.
- Gain hands-on experience with Jenkins’ remote execution capabilities.

---

## ✨ Advanced Enhancements Implemented

Beyond the standard requirements, this project was meticulously engineered to showcase **Enterprise-grade CI/CD** practices. It runs 100% error-free using only native Jenkins features:

- 🔄 **Cross-Node Data Transfer (`Stash`/`Unstash`)**: The ultimate proof of remoting. The pipeline compiles dummy data on an isolated **Windows** node, stashes it securely to the Jenkins Controller's memory, and unstashes it onto an isolated **Linux** node for final packaging.
- 🧬 **Dynamic Parallelism via Groovy**: The pipeline doesn't just run static stages. It utilizes native Groovy scripting to dynamically generate parallel testing matrices on the fly based on arrays.
- 🚥 **Milestone Concurrency Control**: Implemented advanced `milestone()` locks to prevent older, delayed builds from accidentally overwriting newer builds during the deployment phase.
- 🛡️ **Safe Workspace Isolation**: Strict `deleteDir()` enforcement ensures workspaces are perfectly sanitized before execution, eliminating cross-build contamination.
- ⚙️ **Infrastructure & Configuration as Code**: Includes a complete `docker-compose.yml` and `casc.yaml` to instantly spin up the entire architecture (Controller + Linux Agent) from scratch without manual UI configuration.

---

## 📂 Repository Structure

| File / Directory | Description |
| :--- | :--- |
| <kbd>jenkinsfile</kbd> | The core Groovy pipeline. Features dynamic parallel stages, stashing, and approval gates. |
| <kbd>casc.yaml</kbd> | Jenkins Configuration as Code (JCasC) file to automatically provision nodes, security, and jobs. |
| <kbd>docker-compose.yml</kbd> | IaC script to instantly spin up the Jenkins Controller and Linux SSH Agent in isolated containers. |
| <kbd>connect-windows-agent.ps1</kbd> | PowerShell script to dynamically authenticate and connect a Windows machine as a JNLP remote agent. |
| <kbd>nodeHealth.sh</kbd> | Bash script executed securely on the isolated Linux node. |

---

## 🚀 How to Run this Architecture

### 1. The Controller & Linux Agent (Docker)
Ensure Docker is running, then spin up the controller and the isolated Linux node:
```bash
docker-compose up -d --build
```
Jenkins will start at `http://localhost:8080` (Credentials: `admin` / `admin`).

### 2. The Windows Agent (PowerShell)
To connect your local Windows architecture to the Controller network:
```powershell
.\connect-windows-agent.ps1
```

### 3. Execution
1. Navigate to the Jenkins Dashboard.
2. Select the automatically provisioned `Distributed-Build-Demo` job.
3. Click **Build with Parameters**.
4. Watch the pipeline flawlessly distribute workloads across isolated architectures!

<br/>

<div align="center">
  <img src="https://media1.giphy.com/media/v1.Y2lkPTc5MGI3NjExYWNhY2Q2ZTYzMzQ5MjZmY2I1ZjNmNWI5ZGJmN2Q2MjZmNjBiZjIyZSZlcD12MV9pbnRlcm5hbF9naWZzX2dpZklkJmN0PWc/3oKIPEqDGUULpEU0aQ/giphy.gif" alt="Animated Terminal" width="400"/>
  <br/>
  <p><b>Built with passion for the CodeAlpha Internship</b></p>
</div>