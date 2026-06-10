# ─── fd ──────────────────────────────────────────────────────────────────────
# `fd` is a fast, user-friendly alternative to `find`. It has no global rc file,
# but it reads a global ignore list and a couple of conventions we set up here.

if have fd; then
    # A global ignore file shared across both machines.
    export FD_IGNORE_FILE="$XDG_CONFIG_HOME/fd/ignore"
    if [[ ! -f "$FD_IGNORE_FILE" ]]; then
        mkdir -p "$(dirname "$FD_IGNORE_FILE")"
        cat > "$FD_IGNORE_FILE" <<'IGNORE'
.git/
.DS_Store
node_modules/
target/
__pycache__/
.venv/
IGNORE
    fi

    # Convenience aliases. `fda` searches everything incl. hidden + ignored.
    alias fd='fd --hidden --follow'
    alias fda='fd --hidden --follow --no-ignore'
fi
