# Performance and development settings
export JULIA_NUM_THREADS="auto"                     # Use all available cores
export JULIA_EDITOR="amp"                           # Set your preferred editor
export JULIA_PKG_PRESERVE_TIERED_INSTALLED="true"   # Prevent accidental downgrades
export JULIA_PKG_USE_CLI_GIT="true"                 # Use system git for packages
export JULIA_ERROR_COLOR="#fa5750"                  # Selenized red
export JULIA_WARN_COLOR="#dbb32d"                   # Selenized yellow
export JULIA_INFO_COLOR="#41c7b9"                   # Selenized cyan

# Python interop via PythonCall
# JULIA_CONDAPKG_BACKEND "Null" — By setting the CondaPkg backend to Null, it will never install any Conda packages.
# In this case, PythonCall will use whichever Python is currently installed and in your PATH.
# You must have already installed any Python packages that you need.
# JULIA_PYTHONCALL_EXE "@venv" — If you have a Python virtual environment at .venv in your current active project,
# you can set JULIA_PYTHONCALL_EXE=@venv to use it.
export JULIA_CONDAPKG_BACKEND="Null"
export JULIA_PYTHONCALL_EXE="@venv"

# Julia helper functions
jlp() {
    env -u LD_LIBRARY_PATH julia --project=. "$@"
}

julia() {
    env -u LD_LIBRARY_PATH julia "$@"
}
