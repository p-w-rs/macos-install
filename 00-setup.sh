#!/usr/bin/env bash

set -euo pipefail

# Install xcode first and then run this
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
sudo xcode-select --reset

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
eval "$(/opt/homebrew/bin/brew shellenv)"
sudo mkdir -p /usr/local/bin
sudo mkdir -p /usr/local/lib
sudo mkdir -p /usr/local/include

brew install bash
echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
chsh -s /opt/homebrew/bin/bash
