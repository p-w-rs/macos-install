# ~/.config/bash/config.sh — shared bash setup (macOS + Linux).

# ─── XDG base dirs ───────────────────────────────────────────────────────────
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_STATE_HOME="${XDG_STATE_HOME:-$HOME/.local/state}"

# ─── Platform detection ──────────────────────────────────────────────────────
case "$(uname -s)" in
    Darwin) export OS="macos" ;;
    Linux)  export OS="linux" ;;
    *)      export OS="unknown" ;;
esac
is_macos() { [[ "$OS" == "macos" ]]; }
is_linux() { [[ "$OS" == "linux" ]]; }

# ─── have: true if a command exists ──────────────────────────────────────────
have() { command -v "$1" &>/dev/null; }

# ─── Homebrew ────────────────────────────────────────────────────────────────
if   [[ -x /opt/homebrew/bin/brew ]]; then eval "$(/opt/homebrew/bin/brew shellenv)"
elif [[ -x /usr/local/bin/brew    ]]; then eval "$(/usr/local/bin/brew shellenv)"
elif [[ -x /home/linuxbrew/.linuxbrew/bin/brew ]]; then eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ─── Shell options ───────────────────────────────────────────────────────────
shopt -s histappend
shopt -s checkwinsize
shopt -s globstar
shopt -s nocaseglob
shopt -s cdspell
shopt -s autocd 2>/dev/null

# ─── History ─────────────────────────────────────────────────────────────────
export HISTFILE="$XDG_STATE_HOME/bash/history"
mkdir -p "$(dirname "$HISTFILE")"
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTCONTROL=ignoreboth:erasedups
export HISTTIMEFORMAT="%F %T  "
export HISTIGNORE="ls:ll:la:cd:pwd:clear:exit:history"

# ─── Pager ───────────────────────────────────────────────────────────────────
export PAGER="less"
export LESS="-FRX"
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
mkdir -p "$(dirname "$LESSHISTFILE")"

# ─── Locale ──────────────────────────────────────────────────────────────────
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"

# ─── Editor ──────────────────────────────────────────────────────────────────
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
have hx && ! have helix && alias helix='hx'

# ─── Prompt ──────────────────────────────────────────────────────────────────
# Two-line prompt. ANSI palette slots (not hardcoded hex) so it inherits
# whichever Selenized variant the terminal is using.
#
#   ~/path/here  (git-branch)
#   ❯              (green = ok, red = last command failed)

__set_prompt() {
    local last=$?   # must be first — captures the user command's exit code

    local cyan='\[\e[36m\]' green='\[\e[32m\]'
    local red='\[\e[31m\]' yellow='\[\e[33m\]' dim='\[\e[2m\]' reset='\[\e[0m\]'

    local glyph_color="$green"
    [[ $last -ne 0 ]] && glyph_color="$red"

    local branch="" raw
    raw=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [[ -n "$raw" ]] && branch=" ${yellow} ${raw}${reset}"

    local host=""
    [[ -n "${SSH_CONNECTION:-}" ]] && host="${dim}\u@\h ${reset}"

    PS1="\n${host}${cyan}\w${reset}${branch}\n${glyph_color}❯${reset} "
}

# __set_prompt must run before history -a so it captures the real $?.
PROMPT_COMMAND="__set_prompt; history -a"

# ─── Optional tool config (conf.d) ───────────────────────────────────────────
if [[ -d "$XDG_CONFIG_HOME/bash/conf.d" ]]; then
    for _f in "$XDG_CONFIG_HOME/bash/conf.d"/*.sh; do
        [[ -f "$_f" ]] && source "$_f"
    done
    unset _f
fi

# ─── Functions ───────────────────────────────────────────────────────────────
if [[ -d "$XDG_CONFIG_HOME/bash/functions" ]]; then
    for _f in "$XDG_CONFIG_HOME/bash/functions"/*; do
        [[ -f "$_f" ]] && source "$_f"
    done
    unset _f
fi

# ─── Completions ─────────────────────────────────────────────────────────────
if [[ -d "$XDG_CONFIG_HOME/bash/completions" ]]; then
    export BASH_COMPLETION_USER_DIR="$XDG_CONFIG_HOME/bash/completions"
fi

if [[ -n "${HOMEBREW_PREFIX:-}" && -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]]; then
    source "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"
elif [[ -r /usr/share/bash-completion/bash_completion ]]; then
    source /usr/share/bash-completion/bash_completion
fi
