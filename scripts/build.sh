#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
QMK_DIR="${QMK_DIR:-$ROOT_DIR/third_party/vial-qmk}"
KEYBOARD="${KEYBOARD:-crkbd/rev1}"
KEYMAP="${KEYMAP:-sbaek293}"
LAYOUT="${1:-42}"

case "$LAYOUT" in
  42|36) ;;
  all)
    "$0" 42
    "$0" 36
    exit 0
    ;;
  *)
    echo "Usage: $0 [42|36|all]" >&2
    exit 1
    ;;
esac

"$ROOT_DIR/scripts/bootstrap_qmk.sh"
"$ROOT_DIR/scripts/sync_keymap.sh"

if command -v qmk >/dev/null 2>&1; then
  (cd "$QMK_DIR" && SKIP_GIT=1 qmk compile -kb "$KEYBOARD" -km "$KEYMAP" -e "KEY_LAYOUT=$LAYOUT")
  exit 0
fi

if command -v docker >/dev/null 2>&1; then
  docker run --rm \
    -e SKIP_GIT=1 \
    -v "$QMK_DIR:/qmk_firmware" \
    -w /qmk_firmware \
    qmkfm/qmk_cli \
    qmk compile -kb "$KEYBOARD" -km "$KEYMAP" -e "KEY_LAYOUT=$LAYOUT"
  exit 0
fi

echo "Neither 'qmk' CLI nor 'docker' is installed. Install one of them to build locally." >&2
exit 1
