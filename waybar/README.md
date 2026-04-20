# Waybar

## Configuration

```
 .config
    └── waybar
        ├── config.jsonc
        └── style.css
```

- ```/waybar/config.jsonc``` is where the main configuration was.
- ```style.css``` is where the styles configuration was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/waybar & stow waybar
```

## Thanks to
- [typecraft](https://github.com/typecraft-dev/dotfiles/tree/master/waybar/.config/waybar)
