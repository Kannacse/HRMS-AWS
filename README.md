# HRMS-AWS: Enterprise DevSecOps Platform

## Project Overview

HRMS-AWS is an end-to-end DevSecOps project built around a Human Resource Management System (HRMS). The goal of this project was to simulate how a real enterprise application is developed, secured, tested, deployed, and monitored using modern DevOps practices.

Instead of focusing only on application development, this project demonstrates the complete software delivery lifecycle—from code commit to production deployment on Kubernetes—while integrating security, automation, monitoring, and GitOps.

The application consists of a Flutter Web frontend, a Node.js backend, and a MySQL database, all deployed on a K3s Kubernetes cluster running on AWS EC2.

---

# Objectives

The primary objectives of this project were:

* Build a production-style DevSecOps pipeline.
* Automate software delivery using Jenkins CI/CD.
* Containerize applications with Docker.
* Deploy applications to Kubernetes.
* Implement GitOps using Argo CD.
* Integrate security scanning throughout the CI/CD pipeline.
* Monitor infrastructure and applications using Prometheus and Grafana.
* Centralize application logs with Loki and Promtail.
* Host the complete solution on AWS EC2.
* Prepare the infrastructure for future automation using Terraform.

---

# High-Level Architecture

```
Developer
     │
     ▼
Git → GitHub
     │
     ▼
GitHub Webhook
     │
     ▼
Jenkins Pipeline
     │
     ├── Checkout Source Code
     ├── Gitleaks Scan
     ├── Build Application
     ├── SonarQube Analysis
     ├── Quality Gate
     ├── Docker Image Build
     ├── Trivy Image Scan
     ├── Docker Push
     ├── Helm Chart Update
     └── Git Commit
              │
              ▼
          Argo CD
              │
              ▼
        Kubernetes (K3s)
              │
      ┌───────┴────────┐
      ▼                ▼
Frontend          Backend
      │                │
      └──────► MySQL ◄─┘
              │
              ▼
Monitoring Stack
(Prometheus + Grafana + Loki + Promtail)
```

---

# Technologies Used

### Version Control

* Git
* GitHub

### Continuous Integration / Continuous Deployment

* Jenkins
* GitHub Webhooks

### Security

* Gitleaks
* SonarQube
* Trivy

### Containerization

* Docker
* Docker Hub

### Kubernetes

* K3s
* kubectl
* Helm
* Traefik Ingress Controller

### GitOps

* Argo CD

### Monitoring

* Prometheus
* Grafana
* Loki
* Promtail

### Cloud

* AWS EC2
* Amazon Linux 2023

### Application Stack

* Flutter Web
* Node.js
* MySQL

---

# Project Structure

```
HRMS-AWS/

├── Backend/
├── frontend/
├── database/
├── kubernetes/
├── helm/
├── automation/
├── Infra/
├── reports/
├── Jenkinsfile
└── README.md
```

---

# DevSecOps Workflow

## 1. Development

Development begins with writing application code locally. Once changes are complete, the code is committed and pushed to GitHub.

## 2. Source Control

GitHub acts as the central source repository. Every push automatically triggers the Jenkins pipeline using a webhook.

## 3. Jenkins Pipeline

Jenkins performs the complete CI/CD workflow, including:

* Checking out the latest source code
* Running security scans with Gitleaks
* Building the application
* Performing static code analysis using SonarQube
* Validating the Quality Gate
* Building Docker images
* Scanning container images with Trivy
* Pushing images to Docker Hub
* Updating Helm chart image tags
* Committing deployment changes
* Triggering deployment through Argo CD

This automation removes manual deployment steps and ensures consistent releases.

---

# Security

Security checks are integrated into every deployment.

### Gitleaks

Before the application is built, Gitleaks scans the repository for accidentally committed secrets such as passwords, API keys, or access tokens. If secrets are detected, the pipeline stops immediately.

### SonarQube

SonarQube performs static code analysis and reports:

* Bugs
* Security vulnerabilities
* Code smells
* Duplicate code
* Maintainability issues

### Quality Gate

The Quality Gate ensures that only code meeting predefined quality standards proceeds further in the pipeline.

### Trivy

After Docker images are created, Trivy scans them for operating system and application vulnerabilities before they are pushed to the container registry.

---

# Containerization

Both frontend and backend applications are packaged as Docker images.

Each image is tagged using the Jenkins build number to provide version tracking.

Example:

```
kannancloud/hrms-backend:24
kannancloud/hrms-frontend:24
```

The images are then uploaded to Docker Hub for deployment.

---

# GitOps with Argo CD

Instead of deploying directly from Jenkins, deployment is managed using GitOps principles.

When Jenkins updates the image tag in the Helm chart, the change is committed back to GitHub.

Argo CD continuously watches the repository. Whenever it detects a new commit, it automatically synchronizes the Kubernetes cluster with the desired state defined in Git.

This approach provides version-controlled deployments, rollback capability, and a clear deployment history.

---

# Kubernetes Deployment

The application is deployed on a K3s Kubernetes cluster.

The deployment includes:

* Namespace
* Deployments
* Services
* ConfigMaps
* Secrets
* Persistent Volume Claims
* Traefik Ingress

### Backend

The Node.js backend runs with multiple replicas and includes readiness and liveness probes to improve availability.

### Frontend

The Flutter Web application is served through an NGINX container.

### Database

MySQL uses persistent storage to ensure data remains available even if the container restarts.

### Ingress

Traefik acts as the Ingress Controller and routes external traffic to the appropriate Kubernetes services.

---

# Monitoring and Observability

A complete monitoring stack is deployed alongside the application.

### Prometheus

Prometheus collects metrics from Kubernetes, application workloads, and infrastructure components.

### Grafana

Grafana provides dashboards for visualizing performance, resource utilization, and application health.

### Loki

Loki stores centralized application logs.

### Promtail

Promtail reads Kubernetes container logs and forwards them to Loki.

This setup allows both metrics and logs to be viewed from Grafana, making troubleshooting significantly easier.

---

# AWS Deployment

The complete environment is hosted on an AWS EC2 instance running Amazon Linux 2023.

The server hosts:

* Docker
* K3s Kubernetes
* HRMS Application
* MySQL
* Traefik
* Prometheus
* Grafana
* Loki
* Promtail

The application is accessible externally through the EC2 public IP using Traefik Ingress.

---

# Troubleshooting Experience

During implementation, several real-world deployment issues were encountered and resolved, including:

* ImagePullBackOff errors
* Docker authentication failures
* Incorrect Docker image tags
* KUBECONFIG configuration issues
* Kubernetes rollout failures
* Service connectivity problems
* Traefik Ingress configuration
* AWS EC2 Security Group rules
* Disk pressure
* Ephemeral storage exhaustion
* Container image pull failures
* Pod scheduling issues
* Monitoring deployment failures

Troubleshooting these issues helped build practical experience with Kubernetes operations and production deployments.

---

# Skills Demonstrated

This project demonstrates hands-on experience with:

* Git and GitHub
* GitHub Webhooks
* Jenkins CI/CD
* DevSecOps
* Docker
* Docker Hub
* Kubernetes
* K3s
* Helm
* Argo CD
* GitOps
* Traefik
* Flutter Web
* Node.js
* MySQL
* Prometheus
* Grafana
* Loki
* Promtail
* AWS EC2
* Linux Administration
* Production Troubleshooting

---

# Current Status

| Component                | Status      |
| ------------------------ | ----------- |
| Git & GitHub             | ✅ Completed |
| GitHub Webhooks          | ✅ Completed |
| Jenkins Pipeline         | ✅ Completed |
| Gitleaks                 | ✅ Completed |
| SonarQube                | ✅ Completed |
| Quality Gate             | ✅ Completed |
| Docker                   | ✅ Completed |
| Docker Hub               | ✅ Completed |
| Trivy                    | ✅ Completed |
| Helm                     | ✅ Completed |
| Kubernetes (K3s)         | ✅ Completed |
| Argo CD                  | ✅ Completed |
| Local Deployment         | ✅ Completed |
| Monitoring Stack         | ✅ Completed |
| AWS EC2 Deployment       | ✅ Completed |
| Terraform Infrastructure | 🚧 Planned  |

---

# Future Improvements

The project is designed to evolve further with additional cloud-native capabilities, including:

* Infrastructure provisioning using Terraform
* Custom VPC architecture
* Public and Private Subnets
* Security Groups
* IAM Roles
* Application Load Balancer
* Amazon RDS
* Route 53
* AWS WAF
* AWS Secrets Manager
* Amazon ECR
* Alertmanager integration
* Multi-node Kubernetes cluster
* Amazon EKS migration
* Horizontal Pod Autoscaler
* Cluster Autoscaler
* Production-grade high availability

---

# Key Achievements

* Built a complete end-to-end DevSecOps pipeline.
* Automated application delivery using Jenkins.
* Integrated security scanning into every deployment.
* Containerized frontend and backend services using Docker.
* Implemented GitOps-based deployments with Argo CD.
* Successfully deployed the application on Kubernetes.
* Implemented centralized monitoring and logging.
* Hosted the complete platform on AWS EC2.
* Resolved multiple production-style deployment issues through hands-on troubleshooting.
* Established a solid foundation for future Infrastructure as Code using Terraform.

---

# Author

**Kannan T**

DevOps | Cloud | Kubernetes | AWS | DevSecOps Engineer

---

# License

This project is intended for learning, portfolio demonstration, and hands-on enterprise DevSecOps practice. It showcases the implementation of modern CI/CD, GitOps, Kubernetes, security, monitoring, and cloud-native deployment practices in a production-style environment.
