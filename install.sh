#!/bin/sh

set -eu

BIN_DIR=${HOME}/.local/bin

# Check if the `chezmoi` command is available
if ! chezmoi="$(command -v chezmoi)"; then
  echo "Installing chezmoi..."
  chezmoi=${BIN_DIR}/chezmoi
  sh -c "$(curl -fsLS get.chezmoi.io)" -- -b ${BIN_DIR}
fi

# Set up the dotfiles
echo "Setting up dotfiles..."
${chezmoi} init --apply https://github.com/foogee36/dotosx.git

# Install UDEV fonts if not installed
if [ ! -f "/Library/Fonts/UDEVGothicNF-Regular.ttf" ]; then
    echo "Installing UDEV fonts..."
    curl -L -O https://github.com/yuru7/udev-gothic/releases/download/v2.0.0/UDEVGothic_NF_v2.0.0.zip
    unzip -j UDEVGothic_NF_v2.0.0.zip -d /Library/Fonts/
fi
