#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
cd "$ROOT"
npx newman run "postman/Restful-Booker-API-Automation.postman_collection.json" \
  -e "postman/Restful-Booker-Environment.postman_environment.json" \
  --reporters cli,htmlextra \
  --reporter-htmlextra-export "newman/final-run-report.html"
