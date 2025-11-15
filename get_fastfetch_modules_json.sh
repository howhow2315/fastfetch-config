#!/bin/bash

# I got this list from the all.jsonc example provided at https://github.com/fastfetch-cli/fastfetch/blob/dev/presets/all.jsonc
# https://github.com/fastfetch-cli/fastfetch/wiki/Json-Schema-root
modules=(
    "title"
    "separator"
    "os"
    "host"
    "bios"
    "bootmgr"
    "board"
    "chassis"
    "kernel"
    "initsystem"
    "uptime"
    "loadavg"
    "processes"
    "packages"
    "shell"
    "editor"
    "display"
    "brightness"
    "monitor"
    "lm"
    "de"
    "wm"
    "wmtheme"
    "theme"
    "icons"
    "font"
    "cursor"
    "wallpaper"
    "terminal"
    "terminalfont"
    "terminalsize"
    "terminaltheme"
    "cpu"
    "cpucache"
    "cpuusage"
    "gpu"
    "memory"
    "physicalmemory"
    "swap"
    "disk"
    "btrfs"
    "zpool"
    "battery"
    "poweradapter"
    "player"
    "media"
    "publicip"
    "localip"
    "dns"
    "wifi"
    "datetime"
    "locale"
    "vulkan"
    "opengl"
    "opencl"
    "users"
    "bluetooth"
    "bluetoothradio"
    "sound"
    "camera"
    "gamepad"
    "mouse"
    "keyboard"
    "weather"
    "netio"
    "diskio"
    "physicaldisk"
    "tpm"
    "version"
    "break"
    "colors"
)

convert_to_json() {
    local module=$1

    # Try to get fastfetch help output
    if ! help_output=$(fastfetch -h "${module}-format" 2>/dev/null); then
        # echo "# Skipping module '$module': no format available" >&2
        return
    fi

    # Skip first 4 lines
    help_body=$(echo "$help_output" | tail -n +5)

    # Extract variables like {user-name}, {host-name}, etc.
    vars=$(echo "$help_body" | grep -o '{[^}]*}')

    # If no variables, skip
    if [ -z "$vars" ]; then
        # echo "# Skipping module '$module': no variables found" >&2
        return
    fi

    # Build the formatted variables string
    format_vars=""
    while read -r var; do
        key="${var#\{}"
        key="${key%\}}"
        format_vars+="${key}: ${var}, "
    done <<< "$vars"
    format_vars="${format_vars%, }"

    # Output JSON block
    cat <<EOF
{
    "type": "${module}",
    "key": "$(echo "${module}")",
    "format": "${format_vars}"
},
EOF
}

# Output entire JSON array
for module in "${modules[@]}"; do
    convert_to_json "$module"
done
