#!/bin/bash
set -euo pipefail

# Run a command silently, suppressing stdout and stderr, shell-dependent
case "$(basename "$SHELL")" in
    bash|zsh) _silently() { "$@" &> /dev/null; } ;;
    *) _silently() { "$@" > /dev/null 2>&1; } ;; # Default to POSIX-compatible syntax
esac

# Check if a command exists in PATH
_hascmd() { _silently command -v "$1"; }


# Uninstaller

copymark="// howhow-fastfetch-config"
repo="https://github.com/howhow2315/fastfetch-config"
ff_conf_dir="$HOME/.config/fastfetch"
ff_conf="$ff_conf_dir/config.jsonc"
ascii_dir="$ff_conf_dir/ascii"
ascii_file="$ascii_dir/ascii.txt"

[[ -f "$ascii_file" ]] && rm "$ascii_file"
[[ -z "$(ls -A "$ascii_dir")" ]] && rm -r "$ascii_dir"
[[ -f "$ff_conf" ]] && [[ $(head -n 1 "$ff_conf") == "$copymark" ]] && rm "$ff_conf"
[[ -z "$(ls -A "$ff_conf_dir")" ]] && rm -r "$ff_conf_dir"
_hascmd fastfetch && clear && fastfetch