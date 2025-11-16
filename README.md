## howhow-fastfetch-config

This is a simple detailed fastfetch `config.jsonc` template

![Example](https://raw.githubusercontent.com/howhow2315/fastfetch-config/main/examples/example.png)

---
#### Install/Uninstall

If you want to simply install my presets then feel free to run install.sh
```sh
curl -fL https://github.com/howhow2315/fastfetch-config/raw/main/install.sh | sh # Install
```
```sh
curl -fL https://github.com/howhow2315/fastfetch-config/raw/main/uninstall.sh | sh # Uninstall
```

If you want to install as root (not recommended) put the files in `/etc/fastfetch`, fix the ASCII path in `config.jsonc`, and disable `"sound"` if you get the `XDG_RUNTIME_DIR` error.

---

#### Customization

To use your own ASCII art, replace:
```
~/.config/fastfetch/ascii/ascii.txt
```

Or to customize the `fastfetch` structure, modify:
```
~/.config/fastfetch/config.jsonc
```


<br>

If you want to modify anything and need information, I (heartbreakingly) recommend looking at the provided Json-Schema.
```sh
git clone https://github.com/fastfetch-cli/fastfetch.wiki.git
```

I left as much information as I could regarding possible configuration, however as its straight forward and purely information driven its partially up to you to fill in the gaps.

If you want to check a modules modern json formatting then you can run 
`fastfetch -h <module>-format`

> [!NOTE]
> If the ASCII shows up as a solid color, your terminal’s default font doesn’t support the Braille characters used.  
> Mine (`blackbox-terminal`) defaulted to “Monospace”, and I fixed it by switching to “Hack”.  
> Both fonts came pre-installed on my system.

----

This repository’s code and config are licensed under the MIT License (see `LICENSE`).

> [!IMPORTANT]
> The character inside `ascii/*` is my own and has its own license (see `ascii/AKIGOMI_LICENSE`). You may redistribute it non-commercially, but you may not claim authorship.
