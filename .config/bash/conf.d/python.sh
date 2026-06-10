# Python Configuration
# Disable cache and bytecode generation for cleaner development
export PYTHONDONTWRITEBYTECODE=1                 # Prevents .pyc files
export PYTHONUNBUFFERED=1                         # Ensures output is displayed immediately
export PYTHONNODEBUGRANGES=1                      # Reduces memory usage in 3.11+
export PYTHONPYCACHEPREFIX="$XDG_CACHE_HOME/python" # Redirect __pycache__ (XDG)

# UV Configuration
if have uv; then
    export UV_LINK_MODE=copy  # Required when cache and home are on different filesystems
    export UV_NO_CACHE=0      # Set to 1 to disable UV caching
fi
