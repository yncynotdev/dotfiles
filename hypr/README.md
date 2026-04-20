# Hyprland

It is a Window Tiling Manger, it also includes glorious hypr plugins and ecosystem.

## Configuration

```
.config
    └── hypr
        ├── hypridle.conf
        ├── hyprland.conf
        ├── hyprlock.conf
        └── hyprpaper.conf
```

- ```hypridland.conf``` is where the main configuration was.
- ```hypridle.conf``` is where the idle configuration was (useful for any idle actions).
- ```hyprlock.conf``` is where the lock screen configuration was.
- ```hyrpaper.conf``` is where the wallpaper configuration was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/hypr & stow hypr
```

## Thanks to
- [hypr](https://hypr.land/)
