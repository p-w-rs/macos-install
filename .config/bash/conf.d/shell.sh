# ─── Shell options ───────────────────────────────────────────────────────────
shopt -s histappend     # append, don't overwrite, history
shopt -s checkwinsize    # keep $LINES/$COLUMNS correct after resize
shopt -s globstar        # ** recursive glob
shopt -s nocaseglob      # case-insensitive globbing
shopt -s cdspell         # autocorrect minor cd typos
shopt -s autocd 2>/dev/null  # `mydir` == `cd mydir` (bash 4+)

# ─── History (XDG-located, generous, de-duplicated) ──────────────────────────
export HISTFILE="$XDG_STATE_HOME/bash/history"
mkdir -p "$(dirname "$HISTFILE")"
export HISTSIZE=100000
export HISTFILESIZE=200000
export HISTCONTROL=ignoreboth:erasedups   # no dup/space-prefixed lines
export HISTTIMEFORMAT="%F %T  "           # timestamps in `history`
export HISTIGNORE="ls:ll:la:cd:pwd:clear:exit:history"

# Write each command to history immediately (good across multiple terminals).
PROMPT_COMMAND="history -a; ${PROMPT_COMMAND:-}"

# ─── Sane defaults ───────────────────────────────────────────────────────────
export LANG="${LANG:-en_US.UTF-8}"
export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export PAGER="less"
export LESS="-FRX"      # match git pager: quit-if-one-screen, raw color, no clear
export LESSHISTFILE="$XDG_STATE_HOME/less/history"
