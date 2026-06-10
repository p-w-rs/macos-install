# ─── Julia ───────────────────────────────────────────────────────────────────
export JULIA_NUM_THREADS="auto"                     # Use all available cores
export JULIA_EDITOR="${EDITOR:-hx}"                 # Follow the shared editor (Helix)
export JULIA_PKG_PRESERVE_TIERED_INSTALLED="true"   # Prevent accidental downgrades
export JULIA_PKG_USE_CLI_GIT="true"                 # Use system git for packages
export JULIA_ERROR_COLOR="#fa5750"                  # Selenized red
export JULIA_WARN_COLOR="#dbb32d"                   # Selenized yellow
export JULIA_INFO_COLOR="#41c7b9"                   # Selenized cyan

# Python interop via PythonCall: don't let CondaPkg install its own python,
# and prefer a project-local .venv.
export JULIA_CONDAPKG_BACKEND="Null"
export JULIA_PYTHONCALL_EXE="@venv"

# Helpers. NOTE: use `command julia` to call the real binary, otherwise the
# function below would recurse into itself forever.
jlp() {
    env -u LD_LIBRARY_PATH command julia --project=. "$@"
}
julia() {
    env -u LD_LIBRARY_PATH command julia "$@"
}
