# ─── fd (fast find) ──────────────────────────────────────────────────────────
if have fd; then
    # Global ignore list shared across machines, under XDG.
    export FD_IGNORE_FILE="$XDG_CONFIG_HOME/fd/ignore"

    alias fd='fd --hidden --follow'
    alias fda='fd --hidden --follow --no-ignore'
fi
