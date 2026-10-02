#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
newman run "$ROOT/postman/Restful-Booker-API-Automation.postman_collection.json" \
  -e "$ROOT/postman/Restful-Booker-Environment.postman_environment.json" \
  --reporters cli,json,html \
  --reporter-json-export "$ROOT/newman/newman-run-report.json" \
  --reporter-html-export "$ROOT/newman/newman-run-report.html"
