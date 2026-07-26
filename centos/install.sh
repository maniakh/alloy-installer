#!/bin/bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] Run as root: sudo bash install.sh"
  exit 1
fi

echo "[INFO] Installing Grafana Alloy on CentOS..."

cat > /etc/yum.repos.d/grafana.repo <<EOF
[grafana]
name=grafana
baseurl=https://rpm.grafana.com
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://rpm.grafana.com/gpg.key
EOF
dnf install -y alloy
systemctl enable --now alloy

echo "[OK] Grafana Alloy installed successfully."
alloy --version