# ~/.config/bash/config.sh — shared bash setup (macOS + Linux).
# Load order matters: 0) platform + helpers, 1) env, 2) conf.d, 3) functions, 4) completions.

# ─── 0. XDG base dirs (referenced by snippets below) ─────────────────────────
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# ─── 0b. Platform detection ──────────────────────────────────────────────────
# $OS is "macos" or "linux"; snippets gate themselves with `is_macos`/`is_linux`.
case "$(uname -s)" in
    Darwin) export OS="macos" ;;
    Linux)  export OS="linux" ;;
    *)      export OS="unknown" ;;
esac
is_macos() { [[ "$OS" == "macos" ]]; }
is_linux() { [[ "$OS" == "linux" ]]; }

# ─── 0c. `have`: true if a command exists. Used to guard optional tools. ─────
have() { command -v "$1" &>/dev/null; }

# ─── 0d. Homebrew shellenv (macOS Apple Silicon / Intel; Linuxbrew too) ──────
if   [[ -x /opt/homebrew/bin/brew ]]; then eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew   ]]; then eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ─── 1. conf.d snippets (env vars, tool init). Each self-guards. ─────────────
if [[ -d "$XDG_CONFIG_HOME/bash/conf.d" ]]; then
    for f in "$XDG_CONFIG_HOME/bash/conf.d"/*.sh; do
        [[ -f "$f" ]] && source "$f"
    done
fi

# ─── 2. functions ────────────────────────────────────────────────────────────
if [[ -d "$XDG_CONFIG_HOME/bash/functions" ]]; then
    for f in "$XDG_CONFIG_HOME/bash/functions"/*; do
        [[ -f "$f" ]] && source "$f"
    done
fi

# ─── 3. user completions dir ─────────────────────────────────────────────────
if [[ -d "$XDG_CONFIG_HOME/bash/completions" ]]; then
    export BASH_COMPLETION_USER_DIR="$XDG_CONFIG_HOME/bash/completions"
fi

# Load bash-completion itself if present (brew installs it under its prefix).
if [[ -n "${HOMEBREW_PREFIX:-}" && -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
    source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
elif [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi

unset f
