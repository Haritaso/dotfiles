#!/bin/sh

sudo -v

# Set fish as default shell
FISH_PATH="$(which fish)"

if ! sudo grep -Fxq "$FISH_PATH" /etc/shells; then
  sudo sh -c "echo "$FISH_PATH" >> /etc/shells"
  sudo chsh -s "$FISH_PATH"
fi

if test ! $(which fisher); then
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install
fi

exit 0