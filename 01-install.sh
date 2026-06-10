#!/usr/bin/env bash
set -euo pipefail

eval "$(/opt/homebrew/bin/brew shellenv)"

sudo softwareupdate --install-rosetta --agree-to-license # to run old x86 applications

brew install gcc llvm lld libusb clang-format emscripten make cmake ccache
brew install --build-from-source odin

brew install uv lua luarocks
curl -fsSL https://install.julialang.org | sh
curl -sSL https://github.com/koka-lang/koka/releases/latest/download/install.sh | sh

brew install atomicparsley eza wget tree helix htop fswatch duti python-yq pandoc mas cfonts yt-dlp qrencode unison

brew install yazi file-formula ffmpeg sevenzip jq poppler fd ripgrep fzf zoxide resvg xclip imagemagick

brew install qemu sile

brew install --cask font-victor-mono font-fairfax font-iosevka font-juliamono font-gentium-plus font-hack font-hasklig font-libertinus font-ruthie

brew install --cask adobe-digital-editions combine-pdfs ghostty nikitabobko/tap/aerospace typora xquartz zed

mas lucky SiteSucker
mas lucky Keynote
mas lucky Pages
mas lucky Numbers
mas lucky Monodraw
mas lucky Kagi
mas lucky 1Blocker
mas lucky Vinegar
mas lucky "Baking Soda"
mas lucky "The Unarchiver"
mas lucky "UTM Virtual Machines"
