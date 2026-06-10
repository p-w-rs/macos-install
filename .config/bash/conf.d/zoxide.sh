# ─── zoxide (smarter cd) ─────────────────────────────────────────────────────
# `have` is defined in config.sh, sourced before this snippet.
if have zoxide; then
    export _ZO_DATA_DIR="$XDG_DATA_HOME/zoxide"
    eval "$(zoxide init --cmd cd bash)"
fi
