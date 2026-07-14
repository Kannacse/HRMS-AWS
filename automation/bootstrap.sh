#!/bin/bash
#
# ==========================================================
# HRMS Enterprise DevOps Platform
# Bootstrap Script
#
# Author  : Kannan
# Purpose : Main entry point for complete infrastructure setup
# ==========================================================

set -euo pipefail

#############################################################
# Project Paths
#############################################################

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

COMMON_DIR="${SCRIPT_DIR}/common"
CONFIG_DIR="${SCRIPT_DIR}/config"
INSTALL_DIR="${SCRIPT_DIR}/install"
DOCKER_DIR="${SCRIPT_DIR}/docker"
JENKINS_DIR="${SCRIPT_DIR}/jenkins"
SONAR_DIR="${SCRIPT_DIR}/sonarqube"
MONITORING_DIR="${SCRIPT_DIR}/monitoring"
K8S_DIR="${SCRIPT_DIR}/kubernetes"
DEPLOY_DIR="${SCRIPT_DIR}/deploy"
HEALTH_DIR="${SCRIPT_DIR}/health"
BACKUP_DIR="${SCRIPT_DIR}/backups"

#############################################################
# Load Configuration
#############################################################

source "${CONFIG_DIR}/environment.conf"
source "${CONFIG_DIR}/deployment.conf"
source "${CONFIG_DIR}/variables.conf"
source "${CONFIG_DIR}/versions.conf"

#############################################################
# Load Common Libraries
#############################################################

source "${COMMON_DIR}/logger.sh"
source "${COMMON_DIR}/utils.sh"
source "${COMMON_DIR}/validation.sh"

#############################################################
# Main
#############################################################

main() {

    log_info "==============================================="
    log_info "HRMS Enterprise DevOps Platform Automation"
    log_info "==============================================="

    #########################################################
    # Validation
    #########################################################

    validate_environment

    #########################################################
    # Install Required Software
    #########################################################

    log_info "Installing Required Software..."

    bash "${INSTALL_DIR}/install_os.sh"
    bash "${INSTALL_DIR}/install_git.sh"
    bash "${INSTALL_DIR}/install_java.sh"
    bash "${INSTALL_DIR}/install_python.sh"
    bash "${INSTALL_DIR}/install_node.sh"
    bash "${INSTALL_DIR}/install_docker.sh"
    bash "${INSTALL_DIR}/install_docker_compose.sh"
    bash "${INSTALL_DIR}/install_awscli.sh"
    bash "${INSTALL_DIR}/install_kubectl.sh"
    bash "${INSTALL_DIR}/install_helm.sh"
    bash "${INSTALL_DIR}/install_k3s.sh"

    #########################################################
    # Docker Platform
    #########################################################

    log_info "Building Docker Images..."

    bash "${DOCKER_DIR}/build_images.sh"

    log_info "Starting Docker Platform..."

    bash "${DOCKER_DIR}/start_platform.sh"

    #########################################################
    # Jenkins
    #########################################################

    log_info "Configuring Jenkins..."

    python3 "${JENKINS_DIR}/install_plugins.py"
    python3 "${JENKINS_DIR}/configure_jenkins.py"
    python3 "${JENKINS_DIR}/create_credentials.py"
    python3 "${JENKINS_DIR}/configure_tools.py"
    python3 "${JENKINS_DIR}/create_pipeline.py"

    #########################################################
    # SonarQube
    #########################################################

    log_info "Configuring SonarQube..."

    python3 "${SONAR_DIR}/configure_sonarqube.py"
    python3 "${SONAR_DIR}/create_project.py"
    python3 "${SONAR_DIR}/configure_quality_gate.py"

    #########################################################
    # Monitoring
    #########################################################

    log_info "Installing Monitoring Stack..."

    bash "${MONITORING_DIR}/install_monitoring.sh"

    python3 "${MONITORING_DIR}/configure_prometheus.py"
    python3 "${MONITORING_DIR}/configure_grafana.py"
    python3 "${MONITORING_DIR}/configure_loki.py"
    python3 "${MONITORING_DIR}/configure_promtail.py"

    #########################################################
    # Kubernetes
    #########################################################

    log_info "Deploying Kubernetes Platform..."

    bash "${K8S_DIR}/initialize_cluster.sh"
    bash "${K8S_DIR}/deploy_platform.sh"
    bash "${K8S_DIR}/deploy_hrms.sh"

    #########################################################
    # Deployment Verification
    #########################################################

    log_info "Verifying Deployment..."

    python3 "${DEPLOY_DIR}/verify_deployment.py"

    #########################################################
    # Health Check
    #########################################################

    log_info "Running Health Checks..."

    python3 "${HEALTH_DIR}/health_check.py"

    bash "${HEALTH_DIR}/verify_platform.sh"

    python3 "${HEALTH_DIR}/report.py"

    #########################################################
    # Backup
    #########################################################

    log_info "Creating Initial Platform Backup..."

    bash "${BACKUP_DIR}/backup_platform.sh"

    #########################################################
    # Completed
    #########################################################

    log_success "==============================================="
    log_success "HRMS Enterprise DevOps Platform Setup Complete"
    log_success "==============================================="
}

#############################################################
# Execute
#############################################################

main
