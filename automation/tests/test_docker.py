#!/usr/bin/env python3

import subprocess

result = subprocess.run(
    ["docker", "--version"],
    capture_output=True,
    text=True
)

assert result.returncode == 0

print(result.stdout)

print("Docker Test Passed") 
