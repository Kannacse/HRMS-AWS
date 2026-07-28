#!/bin/bash

set -e

GREEN='\033[0;32m'
RED='\033[0;31m'
NC='\033[0m'

echo "======================================"
echo "HRMS VALIDATION PIPELINE"
echo "======================================"

PROJECT_ROOT="$(cd "$(dirname "$0")/.." && pwd)"

cd "$PROJECT_ROOT/frontend/hrms_feb_flutter"

echo -e "${GREEN}Flutter Clean${NC}"
flutter clean

echo -e "${GREEN}Flutter Pub Get${NC}"
flutter pub get

echo -e "${GREEN}Flutter Analyze${NC}"
flutter analyze

echo -e "${GREEN}Flutter Tests${NC}"
flutter test

echo -e "${GREEN}Flutter Build${NC}"
flutter build web --dart-define=BASE_URL=

echo "Flutter validation completed."
