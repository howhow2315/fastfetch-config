#!/bin/bash

copymark="// howhow-fastfetch-config"
repo="https://github.com/howhow2315/fastfetch-config"
ff_conf_dir="$HOME/.local/share/fastfetch"
ff_conf="$ff_conf_dir/config.jsonc"

mkdir -p "$ff_conf_dir" "$ff_conf_dir/ascii"
curl -L "$repo/raw/main/ascii/akigomi-dot.txt" -o "$ff_conf_dir/ascii.txt"

if [[ ! -f "$cfg" ]] || head -n1 "$cfg" == "$copymark" ; then
    mkdir -p "$(dirname "$cfg")"
    curl -L "$repo/raw/main/config.jsonc" -o "$cfg"
    sed -i "1i$copymark" "$cfg"
fi
