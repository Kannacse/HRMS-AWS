#!/bin/bash

set -e

source validation/utils.sh

section "Flutter Validation"

cd frontend/hrms_feb_flutter

info "Cleaning Flutter project"
flutter clean
pass "flutter clean"

info "Downloading packages"
flutter pub get
pass "flutter pub get"

info "Running analyzer"
flutter analyze
pass "flutter analyze"

info "Running tests"
flutter test
pass "flutter test"

info "Building Flutter Web"
flutter build web --dart-define=BASE_URL=
pass "flutter build web"
