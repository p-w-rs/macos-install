#!/usr/bin/env bash
set -euo pipefail

FIRST_NAME="Joshua"
LAST_NAME="Powers"
EMAIL="joshua@powerslabs.org"
EDITOR_ID="" # make this amp somehow
BASH_CONFIG="$HOME/.bash_profile"

# ── Default editor for file types ─────────────────────────────────────────────

echo "Setting file type associations to $EDITOR_ID..."

# Pull every known extension from GitHub Linguist and assign it to the editor
curl -fsSL "https://raw.githubusercontent.com/github/linguist/master/lib/linguist/languages.yml" \
    | yq -r "to_entries | (map(.value.extensions) | flatten) - [null] | unique | .[]" \
    | xargs -L 1 -I "{}" duti -s "$EDITOR_ID" {} all

# UTIs (Uniform Type Identifiers) — broad catch-alls
for uti in \
    public.plain-text \
    public.source-code \
    public.data
do
    duti -s "$EDITOR_ID" "$uti" all
done

# Specific extensions not covered (or not reliably covered) by Linguist
for ext in \
    .css .gitattributes .gitignore .htaccess \
    .js .ts .json .md .scss .sh .txt .xml \
    .yaml .toml .odin .swift .rs .jai \
    .c .cc .h .cpp .hpp \
    .zig .jl .py .bqn .lidr .zsh .kk .idris \
    .link .mv .mvt
do
    duti -s "$EDITOR_ID" "$ext" all
done
