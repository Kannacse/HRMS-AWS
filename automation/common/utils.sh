#!/bin/bash

#############################################################
# Utility Functions
#############################################################

command_exists() {
    command -v "$1" >/dev/null 2>&1
}

create_directory() {
    mkdir -p "$1"
}

file_exists() {
    [ -f "$1" ]
}

directory_exists() {
    [ -d "$1" ]
}

run_command() {
    "$@"
}

download_file() {
    curl -L "$1" -o "$2"
}
