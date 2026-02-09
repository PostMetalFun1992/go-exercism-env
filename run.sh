#!/bin/bash

ENV_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(pwd)"

echo "🔧 Configs loaded from: $ENV_ROOT"
echo "📂 Mounting project:   $PROJECT_ROOT"

PROJECT_PATH="$PROJECT_ROOT" docker compose \
  -f "$ENV_ROOT/docker-compose.yml" \
  run --rm env
