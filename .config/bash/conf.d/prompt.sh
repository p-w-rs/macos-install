# ─── Prompt ──────────────────────────────────────────────────────────────────
# Simple, friendly, two-line prompt. Colors use ANSI palette slots (not hard
# coded hex) so it inherits whichever Selenized variant the terminal shows and
# looks right in BOTH light and dark mode — same approach as fzf.sh.
#
#   slot: 2 green  3 yellow  4 blue  5 magenta  6 cyan
#   Layout:
#     ~/path/here              (git-branch)
#     ❯                         (green if last cmd ok, red if it failed)

# Lightweight git branch (no plumbing forks on every prompt where possible).
__prompt_git_branch() {
    local b
    b=$(git symbolic-ref --quiet --short HEAD 2>/dev/null) || \
    b=$(git rev-parse --short HEAD 2>/dev/null) || return
    printf ' \001\e[3m\002%s\001\e[0m\002' "$b"   # yellow-ish via dim italic
}

__set_prompt() {
    local last=$?

    # Color helpers (\[ \] tells bash these are non-printing).
    local cyan='\[\e[36m\]' blue='\[\e[34m\]' green='\[\e[32m\]'
    local red='\[\e[31m\]' yellow='\[\e[33m\]' dim='\[\e[2m\]' reset='\[\e[0m\]'

    # Prompt glyph: green ❯ on success, red ❯ on failure.
    local glyph_color="$green"
    [[ $last -ne 0 ]] && glyph_color="$red"

    # Git branch (yellow), only inside a repo.
    local branch=""
    local raw
    raw=$(git symbolic-ref --quiet --short HEAD 2>/dev/null || git rev-parse --short HEAD 2>/dev/null)
    [[ -n "$raw" ]] && branch=" ${yellow} ${raw}${reset}"

    # SSH hint: show user@host only when connected remotely.
    local host=""
    [[ -n "$SSH_CONNECTION" ]] && host="${dim}\u@\h ${reset}"

    PS1="\n${host}${cyan}\w${reset}${branch}\n${glyph_color}❯${reset} "
}
PROMPT_COMMAND="__set_prompt; ${PROMPT_COMMAND:-}"
