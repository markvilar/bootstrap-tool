#!/usr/bin/bash

TPM_DESTINATION="${HOME}/.tmux/plugins/tpm"

# Clone tpm to destination
if [ ! -d "${TPM_DESTINATION}" ]; then
  git clone https://github.com/tmux-plugins/tpm "${TPM_DESTINATION}"
fi

# Get parent directory of path
PARENT_PATH=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

# Get source and destination for tmux configuration file
TMUX_CONFIG_SOURCE="${PARENT_PATH}/../config/tmux.conf"
TMUX_CONFIG_DESTINATION="${HOME}/.config/tmux/tmux.conf"

# Copy tmux configuration file to destination
cp "${TMUX_CONFIG_SOURCE}" "${TMUX_CONFIG_DESTINATION}"
