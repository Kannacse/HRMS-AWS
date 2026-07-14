#!/bin/bash

LOG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/../logs" && pwd)"

mkdir -p "$LOG_DIR"

LOG_FILE="${LOG_DIR}/automation.log"

log_info() {
    echo "[INFO] $(date '+%F %T') $1"
    echo "[INFO] $(date '+%F %T') $1" >> "$LOG_FILE"
}

log_warn() {
    echo "[WARN] $(date '+%F %T') $1"
    echo "[WARN] $(date '+%F %T') $1" >> "$LOG_FILE"
}

log_error() {
    echo "[ERROR] $(date '+%F %T') $1"
    echo "[ERROR] $(date '+%F %T') $1" >> "$LOG_FILE"
}

log_success() {
    echo "[SUCCESS] $(date '+%F %T') $1"
    echo "[SUCCESS] $(date '+%F %T') $1" >> "$LOG_FILE"
}
