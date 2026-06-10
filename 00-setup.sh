#!/usr/bin/env bash
set -euo pipefail

# Install Xcode from the App Store first, then run this.
# Point the command-line tools at the full Xcode install. (Do NOT follow this
# with `xcode-select --reset` — that immediately undoes the switch.)
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
xcodebuild -license accept 2>/dev/null || true

# https://brew.sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Load brew into this shell for the rest of the script (Apple Silicon path).
eval "$(/opt/homebrew/bin/brew shellenv)"

sudo mkdir -p /usr/local/bin /usr/local/lib /usr/local/include

# Modern bash (macOS ships bash 3.2) and make it a valid login shell.
brew install bash
if ! grep -qx /opt/homebrew/bin/bash /etc/shells; then
    echo /opt/homebrew/bin/bash | sudo tee -a /etc/shells
fi
chsh -s /opt/homebrew/bin/bash
