#!/bin/bash
#
# ==========================================================
# HRMS Enterprise DevOps Platform
# Bootstrap Script
#
# Author  : Kannan
# Purpose : Main entry point for complete infrastructure setup
# ==========================================================

set -e

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
HEALTH_DIR="${SCRIPT_DIR}/healthcheck"

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

    bash "${INSTALL_DIR}/install_os.sh"
    bash "${INSTALL_DIR}/install_git.sh"
    bash "${INSTALL_DIR}/install_java.sh"
    bash "${INSTALL_DIR}/install_node.sh"
    bash "${INSTALL_DIR}/install_python.sh"
    bash "${INSTALL_DIR}/install_docker.sh"
    bash "${INSTALL_DIR}/install_terraform.sh"
    bash "${INSTALL_DIR}/install_awscli.sh"
    bash "${INSTALL_DIR}/install_kubectl.sh"
    bash "${INSTALL_DIR}/install_k3s.sh"

    #########################################################
    # Docker Stack
    #########################################################

    bash "${DOCKER_DIR}/build_jenkins.sh"
    bash "${DOCKER_DIR}/build_hrms.sh"
    bash "${DOCKER_DIR}/start_stack.sh"

    #########################################################
    # Jenkins
    #########################################################

    python3 "${JENKINS_DIR}/install_plugins.py"
    python3 "${JENKINS_DIR}/configure_jenkins.py"
    python3 "${JENKINS_DIR}/create_credentials.py"
    python3 "${JENKINS_DIR}/create_pipeline.py"

    #########################################################
    # SonarQube
    #########################################################

    python3 "${SONAR_DIR}/configure_sonar.py"

    #########################################################
    # Monitoring
    #########################################################

    bash "${MONITORING_DIR}/install_prometheus.sh"
    bash "${MONITORING_DIR}/install_node_exporter.sh"
    bash "${MONITORING_DIR}/install_grafana.sh"
    bash "${MONITORING_DIR}/install_loki.sh"
    bash "${MONITORING_DIR}/install_promtail.sh"

    #########################################################
    # Kubernetes
    #########################################################

    bash "${K8S_DIR}/deploy_hrms.sh"

    #########################################################
    # Health Check
    #########################################################

    bash "${HEALTH_DIR}/verify_services.sh"
    bash "${HEALTH_DIR}/verify_ports.sh"
    bash "${HEALTH_DIR}/verify_pipeline.sh"

    #########################################################
    # Completed
    #########################################################

    log_success "Automation completed successfully."
}

#############################################################
# Execute
#############################################################

main
