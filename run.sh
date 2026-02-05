#!/bin/bash

ENV_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(pwd)"

echo "🔧 Configs loaded from: $ENV_ROOT"
echo "📂 Mounting project:   $PROJECT_ROOT"

PROJECT_PATH="$PROJECT_ROOT" podman-compose \
  -f "$ENV_ROOT/compose.yml" \
  --in-pod False \
   run --rm env
