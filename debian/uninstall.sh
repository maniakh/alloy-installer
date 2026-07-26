#!/bin/bash
set -euo pipefail
if [[ $EUID -ne 0 ]]; then echo "[ERROR] Run as root"; exit 1; fi
systemctl disable --now alloy 2>/dev/null || true
apt-get purge -y alloy
apt-get autoremove -y
echo "[OK] Grafana Alloy removed."