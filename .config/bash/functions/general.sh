# ─── Handy functions ─────────────────────────────────────────────────────────

# mkcd: make a directory and cd into it.
mkcd() { mkdir -p -- "$1" && cd -- "$1" || return; }

# extract: unpack most archive types.
extract() {
    [[ -f "$1" ]] || { echo "extract: '$1' is not a file" >&2; return 1; }
    case "$1" in
        *.tar.bz2|*.tbz2) tar xjf "$1" ;;
        *.tar.gz|*.tgz)   tar xzf "$1" ;;
        *.tar.xz)         tar xJf "$1" ;;
        *.tar)            tar xf  "$1" ;;
        *.bz2)            bunzip2 "$1" ;;
        *.gz)             gunzip  "$1" ;;
        *.zip)            unzip   "$1" ;;
        *.7z)             7z x    "$1" ;;
        *.rar)            unar    "$1" ;;
        *)                echo "extract: unknown archive type '$1'" >&2; return 1 ;;
    esac
}
