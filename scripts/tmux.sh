#!/usr/bin/bash

# Clone tpm
git clone https://github.com/tmux-plugins/tpm "${HOME}/.tmux/plugins/tpm"

TMUX_CONFIG="${HOME}/.tmux.conf"

# Create tmux config file
touch "${TMUX_CONFIG}"

# Configure tpm
echo "set -g @plugin 'tmux-plugins/tpm'" >> "${TMUX_CONFIG}"
echo "set -g @plugin 'tmux-plugins/tmux-sensible'" >> "${TMUX_CONFIG}"
echo "run '~/.tmux/plugins/tpm/tpm'" >> "${TMUX_CONFIG}"
echo "" >> "${TMUX_CONFIG}"

# This should fix tmux terminal colors according to:
# https://unix.stackexchange.com/questions/1045/getting-256-colors-to-work-in-tmux
# For future reference; NeoVims 'checkhealth' command is useful for debugging tmux.
echo "set -g default-terminal 'screen-256color'" >> "${TMUX_CONFIG}"
