#!/usr/bin/env bash
# Creates the timestamped output directory tree for a crypto-research run.
# Usage: setup-output-dir.sh [base_dir]
# Prints the created run directory path on stdout so callers can capture it.
set -euo pipefail

BASE_DIR="${1:-$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)/outputs}"
TIMESTAMP="$(date +%Y-%m-%d_%H-%M-%S)"
RUN_DIR="${BASE_DIR}/${TIMESTAMP}"

mkdir -p \
  "${RUN_DIR}/crypto_market" \
  "${RUN_DIR}/crypto_analysis" \
  "${RUN_DIR}/crypto_macro" \
  "${RUN_DIR}/crypto_plays" \
  "${RUN_DIR}/crypto_news"

echo "${RUN_DIR}"
