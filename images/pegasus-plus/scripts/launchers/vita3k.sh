#!/bin/bash
set -e
source /opt/gow/bash-lib/utils.sh

gow_log "Starting Vita3k with DISPLAY=${DISPLAY}"
cd /Applications
./vita3k-emu.AppImage --appimage-extract-and-run
