# Alacritty

- Theme: Rosepine Dawn
- Font: FiraCode Mono

## Configuration

```
.config
    └── alacritty
        ├── alacritty.toml
        └── rose-pine-dawn.toml
```

- ```alacritty.toml``` is where the main configuration was.
- ```rose-pine-dawn.toml``` is where the theme configuration was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/alacritty & stow alacritty
```

## Thanks to

- [rose-pine/alacritty](https://github.com/rose-pine/alacritty)
