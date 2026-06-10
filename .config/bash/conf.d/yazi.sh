# ─── yazi (terminal file manager) ────────────────────────────────────────────
if have yazi; then
    # `y` opens yazi and cd's the shell to wherever you left off (official
    # wrapper from the yazi docs). Plain `yazi` still works without the cd.
    y() {
        local tmp cwd
        tmp="$(mktemp -t yazi-cwd.XXXXXX)"
        yazi "$@" --cwd-file="$tmp"
        if cwd="$(command cat -- "$tmp")" && [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
            builtin cd -- "$cwd" || return
        fi
        rm -f -- "$tmp"
    }
    # Helper deps yazi uses for previews are installed via brew:
    # ffmpeg, 7zz (sevenzip), jq, poppler, fd, ripgrep, fzf, zoxide, resvg, imagemagick.
fi
