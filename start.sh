#!/bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
NC='\033[0m'

echo -e "${CYAN}"
echo "  =================================="
echo "   រៀនអត់? — Learning Marketplace"
echo "  =================================="
echo -e "${NC}"

# Detect container engine (podman-compose or docker-compose)
if command -v podman-compose &> /dev/null; then
    COMPOSE="podman-compose"
    ENGINE="Podman"
elif command -v docker-compose &> /dev/null; then
    COMPOSE="docker-compose"
    ENGINE="Docker"
elif command -v docker &> /dev/null && docker compose version &> /dev/null; then
    COMPOSE="docker compose"
    ENGINE="Docker"
else
    echo -e "${RED}Error: No container engine found. Please install Docker Desktop or Podman Desktop.${NC}"
    exit 1
fi

echo -e "${YELLOW}Using: ${ENGINE} (${COMPOSE})${NC}"

# Get script directory
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"
cd "$SCRIPT_DIR"

# Auto-detect compose file
if [ -f "Podman-compose.yml" ]; then
    COMPOSE_FILE="Podman-compose.yml"
elif [ -f "docker-compose.yml" ]; then
    COMPOSE_FILE="docker-compose.yml"
else
    echo -e "${RED}Error: No compose file found (Podman-compose.yml or docker-compose.yml)${NC}"
    exit 1
fi

echo -e "${YELLOW}Compose file: ${COMPOSE_FILE}${NC}"

# Create .env if not exists
if [ ! -f "./rean-ot-backend/.env" ]; then
    echo -e "${YELLOW}Creating .env file from .env.example...${NC}"
    cp ./rean-ot-backend/.env.example ./rean-ot-backend/.env
    echo -e "${GREEN}.env file created!${NC}"
else
    echo -e "${GREEN}.env file already exists.${NC}"
fi

# Create config directories if not exists
mkdir -p nginx prometheus

# Start containers
echo ""
echo -e "${YELLOW}Starting all 14 containers...${NC}"
$COMPOSE -f "$COMPOSE_FILE" -p reanot up -d --build

if [ $? -eq 0 ]; then
    echo ""
    echo -e "${GREEN}✅ All containers started successfully!${NC}"
    echo ""
    echo -e "${CYAN}  ┌────────────────────────────────────────────────────────────────────┐"
    echo -e "  │  Service              │  URL                     │  Login             │"
    echo -e "  ├────────────────────────────────────────────────────────────────────┤"
    echo -e "  │  Frontend             │  http://localhost:8088    │  —                 │"
    echo -e "  │  Backend API          │  http://localhost:3000    │  —                 │"
    echo -e "  │  Nginx (Proxy)        │  http://localhost:8080    │  —                 │"
    echo -e "  │  Mailhog (Email)      │  http://localhost:8025    │  —                 │"
    echo -e "  │  RabbitMQ             │  http://localhost:15672   │  reanot             │"
    echo -e "  │                       │                          │  reanot_rabbit      │"
    echo -e "  │  Grafana              │  http://localhost:3001    │  admin              │"
    echo -e "  │                       │                          │  reanot_grafana     │"
    echo -e "  │  Prometheus           │  http://localhost:9090    │  —                 │"
    echo -e "  │  pgAdmin              │  http://localhost:5050    │  admin@reanot.com   │"
    echo -e "  │                       │                          │  admin123           │"
    echo -e "  │  MinIO Console        │  http://localhost:9003    │  minioadmin         │"
    echo -e "  │                       │                          │  minioadmin123      │"
    echo -e "  │  RedisInsight         │  http://localhost:5540    │  host: redis        │"
    echo -e "  │                       │                          │  pass: reanot123    │"
    echo -e "  │  Elasticsearch        │  http://localhost:9200    │  — (API only)      │"
    echo -e "  │  LiveKit              │  http://localhost:7880    │  — (API only)      │"
    echo -e "  │  PostgreSQL           │  localhost:5434           │  reanot             │"
    echo -e "  │                       │                          │  reanot_secret      │"
    echo -e "  │  Redis                │  localhost:6379           │  pass: reanot123    │"
    echo -e "  └────────────────────────────────────────────────────────────────────┘${NC}"
    echo ""
    echo -e "${GREEN}  Total: 14 containers running 🚀${NC}"
    echo ""
else
    echo -e "${RED}❌ Failed to start containers. Check the errors above.${NC}"
    exit 1
fi
