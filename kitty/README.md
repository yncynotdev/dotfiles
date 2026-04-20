# Kitty

Probably one of the best terminal out there. But I don't understand why I like Alacritty more.

## Configuration

```
kitty
        ├── current-theme.conf
        ├── kitty.conf
        ├── kitty.conf.bak
        ├── light-theme.auto.conf
        └── Rosé Pine Dawn.conf
```

- ```kitty.conf``` is where the main configuration was.
- ```kitty.conf.bak``` kitty auto backs up.
- ```current-theme.conf``` is where the theme configuration was.

You don't have to worry about manually configuring theme as ```kitty``` has a builtin cli tools. Simply run:

```
kitten --help
```

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/kitty & stow kitty
```

## Thanks to 
- [kitty](https://github.com/kovidgoyal/kitty)
