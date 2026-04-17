#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QMK_DIR="${QMK_DIR:-$ROOT_DIR/third_party/vial-qmk}"
SRC_KEYMAP_DIR="$ROOT_DIR/keyboards/crkbd/keymaps/sbaek293"
DST_KEYMAP_DIR="$QMK_DIR/keyboards/crkbd/keymaps/sbaek293"

if [[ ! -d "$SRC_KEYMAP_DIR" ]]; then
  echo "Source keymap directory not found: $SRC_KEYMAP_DIR" >&2
  exit 1
fi

if [[ ! -d "$QMK_DIR" ]]; then
  echo "QMK source directory not found: $QMK_DIR" >&2
  exit 1
fi

rm -rf "$DST_KEYMAP_DIR"
mkdir -p "$(dirname "$DST_KEYMAP_DIR")"
cp -R "$SRC_KEYMAP_DIR" "$DST_KEYMAP_DIR"
