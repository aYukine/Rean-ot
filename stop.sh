#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "  =================================="
echo "   រៀនអត់? — Stopping Services"
echo "  =================================="
echo -e "${NC}"

# Detect container engine
if command -v podman-compose &> /dev/null; then
    COMPOSE="podman-compose"
elif command -v docker-compose &> /dev/null; then
    COMPOSE="docker-compose"
elif command -v docker &> /dev/null && docker compose version &> /dev/null; then
    COMPOSE="docker compose"
else
    echo -e "${RED}Error: No container engine found.${NC}"
    exit 1
fi

SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Auto-detect compose file
if [ -f "Podman-compose.yml" ]; then
    COMPOSE_FILE="Podman-compose.yml"
elif [ -f "docker-compose.yml" ]; then
    COMPOSE_FILE="docker-compose.yml"
else
    echo -e "${RED}Error: No compose file found.${NC}"
    exit 1
fi

echo -e "${YELLOW}Stopping all Rean-ot containers...${NC}"
$COMPOSE -f "$COMPOSE_FILE" -p reanot down

echo -e "${GREEN}✅ All 14 containers stopped.${NC}"
