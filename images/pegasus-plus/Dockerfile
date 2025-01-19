ARG PEGASUS_BASE_APP_IMAGE

# hadolint ignore=DL3006
FROM ${PEGASUS_BASE_APP_IMAGE}

ARG DEBIAN_FRONTEND=noninteractive
# see: https://github.com/AppImage/AppImageKit/wiki/FUSE#docker
ENV APPIMAGE_EXTRACT_AND_RUN=1

ARG APP_IMAGES_FOLDER=/Applications

# Install Vita3k AppImage
#RUN \
#    echo "**** Install Vita3k Dependencies ****" && \
#        apt-get update && \
#        apt-get install -y --no-install-recommends \
#            cmake \
#            clang \
#            libgtk-3-dev \
#            libsdl2-dev \
#            libsdl2-net-dev \
#            libsdl2-2.0-0 \
#            libssl-dev \
#            lld \
#            mesa-utils \
#            ninja-build \
#            openssl \
#            pkg-config \
#            vulkan-tools \
#            xdg-desktop-portal \
#            xdg-desktop-portal-wlr \
#            && \
#    # Cleanup \
#		apt-get autoremove -y && \
#		rm -rf /var/lib/apt/lists/*

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

# Install

# Copy config files
# COPY --chmod=777 scripts/startup.sh /opt/gow/startup-app.sh

# Copy Pegasus related files
RUN chmod -v -R a+x ${APP_IMAGES_FOLDER}/
COPY --chmod=777 scripts/launchers/*.sh /bin/
COPY scripts/tools/*.sh /bin/
COPY configs /cfg

ENV XDG_RUNTIME_DIR=/tmp/.X11-unix

ARG IMAGE_SOURCE
LABEL org.opencontainers.image.source $IMAGE_SOURCE
