#!/bin/bash
set -euo pipefail

if [[ $EUID -ne 0 ]]; then
  echo "[ERROR] Run as root: sudo bash install.sh"
  exit 1
fi

echo "[INFO] Installing Grafana Alloy on Ubuntu..."

apt-get update -qq
apt-get install -y wget
mkdir -p /etc/apt/keyrings
wget -q -O /etc/apt/keyrings/grafana.gpg https://apt.grafana.com/gpg.key
echo "deb [signed-by=/etc/apt/keyrings/grafana.gpg] https://apt.grafana.com stable main" \
  | tee /etc/apt/sources.list.d/grafana.list
apt-get update -qq
apt-get install -y alloy
systemctl enable --now alloy

echo "[OK] Grafana Alloy installed successfully."
alloy --version