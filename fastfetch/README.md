# Fastfetch

It is a tool to display information about your cool Linux system


## Configuration

```
.config
    └── fastfetch
        ├── config.jsonc
        └── logo
```

- ```/fastfetch/config.jsonc``` is where the main configuration was.
- ```/logo``` is where the ascii-art or images was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/fastfetch & stow fastfetch
```

## Thanks to

[The fastfetch config that I use](https://github.com/fastfetch-cli/fastfetch/tree/dev/presets/examples)
