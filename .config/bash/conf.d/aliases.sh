# ─── General aliases ─────────────────────────────────────────────────────────
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias mkdir='mkdir -p'
alias df='df -h'
alias du='du -h'
alias free='free -h 2>/dev/null'
alias grep='grep --color=auto'
alias path='echo -e "${PATH//:/\\n}"'
alias reload='source "$HOME/.bashrc"'

# Safer file ops (interactive on overwrite/remove).
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'

# tree via eza if present (already aliased lt/lta in eza.sh); plain `tree` kept.
have tree && alias tree='tree -C'

# Git shorthands that complement the rich aliases already in ~/.config/git/config
alias g='git'
alias gs='git st'      # uses your `st = status -sb` alias
alias gl='git lg'      # uses your `lg` graph alias
