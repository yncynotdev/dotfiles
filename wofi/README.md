# Wofi

It is a simple app launcher.

> NOTE: As far as I read, wofi is not maintained anymore? So be cautious.


## Configuration

```
.config
    └── wofi
        ├── config
        └── style.css
```

- ```config``` is where the main configuration was.
- ```style.css``` is where the styles configuration was.

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/wofi & stow wofi
```

## Thanks to

- [typecraft](https://github.com/typecraft-dev/dotfiles/tree/master/wofi)
