# ─── Terminal editor: Helix ──────────────────────────────────────────────────
# EDITOR/VISUAL are what git, crontab, less -v, etc. invoke when no GUI editor
# is available. We want Helix (`hx`) for all of that. Fall back gracefully so a
# fresh box without helix doesn't end up with an empty $EDITOR.
if have hx; then
    export EDITOR="hx"
    export VISUAL="hx"
elif have nano; then
    export EDITOR="nano"
    export VISUAL="nano"
else
    export EDITOR="vi"
    export VISUAL="vi"
fi

# `helix` package name varies (hx vs helix); alias for muscle memory.
have hx && ! have helix && alias helix='hx'

# Tell Helix where its config lives (XDG default already, but explicit is fine).
export HELIX_RUNTIME="${HELIX_RUNTIME:-}"   # leave empty unless you build from source
