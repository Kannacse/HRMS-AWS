#!/bin/bash

#############################################################
# Validation Functions
#############################################################

validate_root_user() {

    if [ "$EUID" -ne 0 ]; then
        log_error "Run this script as root."
        exit 1
    fi

}

validate_internet() {

    if ! ping -c 2 google.com >/dev/null 2>&1; then
        log_error "Internet connection unavailable."
        exit 1
    fi

}

validate_os() {

    if [ ! -f /etc/os-release ]; then
        log_error "Unsupported operating system."
        exit 1
    fi

}

validate_environment() {

    validate_root_user

    validate_os

    validate_internet

    log_success "Environment validation completed."

}
