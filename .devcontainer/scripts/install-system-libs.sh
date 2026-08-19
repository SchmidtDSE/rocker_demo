#!/usr/bin/env bash
# Installs system libraries (must run as root).
set -euo pipefail

if [ "$(id -u)" -ne 0 ]; then
  echo "install-system-libs.sh must be run as root" >&2
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

apt-get update
apt-get install -y --no-install-recommends \
  ca-certificates \
  curl \
  git

rm -rf /var/lib/apt/lists/*
