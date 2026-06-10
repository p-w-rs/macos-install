# ─── eza (modern `ls`) ───────────────────────────────────────────────────────
if have eza; then
    # Common flags: icons, group dirs first, git status, human sizes.
    _eza='eza --group-directories-first --icons=auto --git'

    alias ls="$_eza"
    alias l="$_eza --oneline"
    alias ll="$_eza --long --header --git"
    alias la="$_eza --long --header --git --all"
    alias lt="$_eza --tree --level=2"
    alias lta="$_eza --tree --level=2 --all"
    unset _eza

    # eza reads LS_COLORS / EZA_COLORS. Use ANSI slots so it tracks the active
    # Selenized variant instead of hardcoding dark-only hex.
    #   di dirs(blue) ln links(cyan) ex executables(green) *.tar archives(red)
    export EZA_COLORS="di=34:ln=36:ex=32:*.tar=31:*.zip=31:*.gz=31"
else
    # Fall back to coreutils ls with color (GNU on Linux, BSD on macOS).
    if is_linux; then
        alias ls='ls --color=auto --group-directories-first'
    else
        export CLICOLOR=1
        alias ls='ls -G'
    fi
    alias ll='ls -lh'
    alias la='ls -lhA'
fi
