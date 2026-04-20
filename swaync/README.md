# swaync

> This configuration is currently WIP

## Configuration

```
.config
    └── swaync
        ├── config.json
        ├── configSchema.json
        └── style.css
```

- ```/swaync/config.json``` is where the main configuration was.
- ```/swaync/configSchema.json``` is where the schema configuration was **(DO NOT TOUCH)**.
- ```/swaync/style.css``` is where the styles configuration was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/swaync & stow swaync
```

## Thanks to

- [rosepine](https://github.com/rose-pine/swaync)
