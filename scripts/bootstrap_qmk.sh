#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
THIRD_PARTY_DIR="$ROOT_DIR/third_party"
QMK_DIR="${QMK_DIR:-$THIRD_PARTY_DIR/vial-qmk}"
QMK_GIT_URL="${QMK_GIT_URL:-https://github.com/vial-kb/vial-qmk.git}"
QMK_REF="${QMK_REF:-vial}"

if [[ -f "$QMK_DIR/Makefile" && -f "$QMK_DIR/lib/lufa/LUFA/makefile" ]]; then
  exit 0
fi

rm -rf "$QMK_DIR"
mkdir -p "$THIRD_PARTY_DIR"

git clone --depth 1 --branch "$QMK_REF" --recurse-submodules "$QMK_GIT_URL" "$QMK_DIR"
git -C "$QMK_DIR" submodule update --init --recursive
