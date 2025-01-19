#!/bin/bash

APP_IMAGES_FOLDER=/Applications
FIRMWARE="http://dus01.psv.update.playstation.net/update/psv/image/2022_0209/rel_f2c7b12fe85496ec88a0391b514d6e3b/PSVUPDAT.PUP"
FONTS="http://dus01.psp2.update.playstation.net/update/psp2/image/2022_0209/sd_59dcf059d3328fb67be7e51f8aa33418/PSP2UPDAT.PUP?dest=us"
VITA3K_CONFIG="/cfg/vita3k"
mkdir -p "${VITA3K_CONFIG}"

# Download firmware and fonts
wget -q --show-progress "${FIRMWARE}" --output-document="${VITA3K_CONFIG}/PSVUPDAT.PUP"
wget -q --show-progress "${FONTS}" --output-document="${VITA3K_CONFIG}/PSP2UPDAT.PUP"

"${APP_IMAGES_FOLDER}/vita3k-emu.AppImage" --firmware ${VITA3K_CONFIG}/PSVUPDAT.PUP
"${APP_IMAGES_FOLDER}/vita3k-emu.AppImage" --firmware ${VITA3K_CONFIG}/PSP2UPDAT.PUP

