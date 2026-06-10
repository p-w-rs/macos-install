# ─── zoxide ──────────────────────────────────────────────────────────────────
# Smarter `cd`. Guarded so the shared config doesn't error on a box where
# zoxide hasn't been installed yet.
if have zoxide; then
    eval "$(zoxide init --cmd cd bash)"
fi
