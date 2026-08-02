#!/bin/bash
# nodeHealth.sh

echo "======================================"
echo "Checking Linux Node Health..."
echo "======================================"

echo "[1/4] Disk Space:"
df -h /
echo ""

echo "[2/4] Memory Usage:"
free -m
echo ""

echo "[3/4] Uptime:"
uptime
echo ""

echo "[4/4] Current User & Workspace:"
echo "User: $(whoami)"
echo "Workspace: $(pwd)"
echo ""

echo "Node health check completed successfully."
echo "======================================"
