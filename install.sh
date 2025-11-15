#!/bin/bash
set -euo pipefail

CMD=$(basename "$0")

# Display a message "[*] with a symbol prefix"
_notif() {
    local msg="${1:-""}" sym=${2:-"*"}
    [[ -n "$msg" ]] && echo "[$sym] $msg"
}

# Display an error message and exit with a specified code (default 1)
_err() {
    local msg="$1" code=${2:-1}
    _notif "$CMD ERROR: $msg" !
    exit "$code"
}

# Run a command silently, suppressing stdout and stderr, shell-dependent
case "$(basename "$SHELL")" in
    bash|zsh) _silently() { "$@" &> /dev/null; } ;;
    *) _silently() { "$@" > /dev/null 2>&1; } ;; # Default to POSIX-compatible syntax
esac

# Check if a command exists in PATH
_hascmd() { _silently command -v "$1"; }


# Installer

repo="https://github.com/howhow2315/fastfetch-config"
ff_conf_dir="$HOME/.config/fastfetch"
ff_conf="$ff_conf_dir/config.jsonc"
ascii_dir="$ff_conf_dir/ascii"
ascii_file="$ascii_dir/ascii.txt"

_hascmd fastfetch || _err "are you really installing a fastfetch config without fastfetch installed?"
_hascmd curl || _err "'curl' is required."

mkdir -p "$ff_conf_dir" "$ascii_dir"
[[ ! -f "$ascii_file" ]] && _silently curl -fL "$repo/raw/main/ascii/akigomi-dot.txt" -o "$ascii_file"
[[ ! -f "$ff_conf" ]] && _silently curl -fL "$repo/raw/main/config.jsonc" -o "$ff_conf"

clear && fastfetch