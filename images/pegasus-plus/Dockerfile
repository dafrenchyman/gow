ARG PEGASUS_BASE_APP_IMAGE

# hadolint ignore=DL3006
FROM ${PEGASUS_BASE_APP_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
# see: https://github.com/AppImage/AppImageKit/wiki/FUSE#docker
ENV APPIMAGE_EXTRACT_AND_RUN=1

ARG APP_IMAGES_FOLDER=/Applications

# Install Vita3k AppImage
RUN \
    echo "**** Install Vita3k Dependencies ****" && \
        apt-get update && \
        apt-get install -y --no-install-recommends \
            cmake \
            clang \
            libgtk-3-dev \
            libsdl2-dev \
            libsdl2-net-dev \
            libsdl2-2.0-0 \
            libssl-dev \
            lld \
            mesa-utils \
            ninja-build \
            openssl \
            pkg-config \
            vulkan-tools \
            xdg-desktop-portal \
            xdg-desktop-portal-wlr \
            && \
    # Cleanup \
		apt-get autoremove -y && \
		rm -rf /var/lib/apt/lists/*

#sudo apt install git cmake ninja-build libsdl2-dev pkg-config libgtk-3-dev clang lld xdg-desktop-portal openssl libssl-dev
ARG VITA3K_APP_IMAGE_URL=https://github.com/Vita3K/Vita3K/releases/download/continuous/Vita3K-x86_64.AppImage
RUN wget -O ${APP_IMAGES_FOLDER}/vita3k-emu.AppImage "${VITA3K_APP_IMAGE_URL}"
RUN chmod +x ${APP_IMAGES_FOLDER}/vita3k-emu.AppImage

# Install YUZU AppImage
COPY --chmod=777 ./yuzu-mainline-20240303-7ffac53c9.AppImage $APP_IMAGES_FOLDER/yuzu-emu.AppImage

# Install Supermodel3
ARG SUPERMODEL_APP_IMAGE=https://github.com/dafrenchyman/Supermodel/releases/download/latest/Supermodel-x86_64.AppImage
RUN wget -O ${APP_IMAGES_FOLDER}/supermodel-emu.AppImage "${SUPERMODEL_APP_IMAGE}"
# COPY --chmod=777 ./Supermodel-x86_64_3.AppImage $APP_IMAGES_FOLDER/supermodel-emu.AppImage

# Install software to mount iso
RUN \
    echo "**** Install mount iso dependencies ****" && \
        apt-get update && \
        apt-get install -y \
            fuseiso \
            fuse-zip \
            && \
    # Cleanup \
		apt-get autoremove -y && \
		rm -rf /var/lib/apt/lists/*

# Setup ISO mounting location
RUN mkdir -p /media/iso_mount && chown 1000:1000 /media/iso_mount

RUN <<_INSTALL_EMULATORS
set -e

EMULATORS_DIR=/Applications
mkdir -p $EMULATORS_DIR
cd $EMULATORS_DIR

github_download(){
    curl -H "X-GitHub-Api-Version: "$(GITHUB_REST_VERSION)"" \
        https://api.github.com/repos/$1/releases/latest | \
        jq '.assets[]|select(.name|endswith(".AppImage")).browser_download_url' | \
        xargs wget -O $2
}

echo "**** Downloading Dolphin AppImage ****"
# TODO: This is some randomly found AppImage. Need to find something more official
github_download "qurious-pixel/dolphin" "dolphin-emu.AppImage"

echo "**** Downloading RPCS3 AppImage ****"
github_download "rpcs3/rpcs3-binaries-linux" "rpcs3-emu.AppImage"

chmod -v -R 777 $EMULATORS_DIR
chmod -v -R a+x $EMULATORS_DIR
_INSTALL_EMULATORS

# Copy Pegasus related files
RUN chmod -v -R a+x ${APP_IMAGES_FOLDER}/
COPY --chmod=777 scripts/launchers/*.sh /Applications/launchers/
COPY --chmod=777 scripts/launchers/rom_launcher.sh /bin/rom_launcher.sh
COPY scripts/tools/*.sh /bin/
COPY configs /cfg

ENV XDG_RUNTIME_DIR=/tmp/.X11-unix

ARG IMAGE_SOURCE
LABEL org.opencontainers.image.source $IMAGE_SOURCE
