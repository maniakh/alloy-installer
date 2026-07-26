#!/bin/bash
set -euo pipefail
if [[ $EUID -ne 0 ]]; then echo "[ERROR] Run as root"; exit 1; fi
echo "[INFO] Removing Grafana Alloy..."
systemctl disable --now alloy 2>/dev/null || true
dnf remove -y alloy
rm -f /etc/yum.repos.d/grafana.repo
echo "[OK] Grafana Alloy removed."