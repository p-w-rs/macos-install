# ─── fzf ─────────────────────────────────────────────────────────────────────
# Colors are ANSI palette slots (-1 = terminal default) instead of hardcoded
# Selenized hex, so the picker inherits whichever Selenized variant the terminal
# shows and looks right in BOTH light and dark mode.
#   1 red  2 green  3 yellow  4 blue  5 magenta  6 cyan  7 white  8 bright-black
export FZF_DEFAULT_OPTS="\
  --height=40% --layout=reverse --border --cycle \
  --color=fg:-1,bg:-1,hl:3 \
  --color=fg+:-1,bg+:8,hl+:3 \
  --color=info:6,prompt:4,pointer:5 \
  --color=marker:2,spinner:6,header:8,border:8"

if have fd; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
fi

if have fzf; then
    eval "$(fzf --bash)"
fi
