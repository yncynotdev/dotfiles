# WezTerm

One of the best terminal, uses luastyle to configure the terminal. It just feels heavy for me. But I used it for the longest time.

> ⚠️WARNING: The theme configuration here is not the same as Alacritty and Kitty

## Configuration

```
.config
    └── wezterm
        ├── helpers.lua
        └── wezterm.lua
```

- ```/wezterm/helpers.lua``` is where the root configuration was.
- ```/wezterm/wezterm.lua``` is where the main configuration was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/wezterm & stow wezterm
```
