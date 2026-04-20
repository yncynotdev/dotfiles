# TMUX

An terminal emulator for faster workflow.

## Configuration

```
.config
    └── tmux
        ├── .gitignore
        ├── plugins
        └── tmux.conf
```

- ```/tmux/tmux.conf``` is where the main configuration was.
- ```/tmux/plugins/``` is where the plugins configuration was.
- ```/tmux/.gitignore``` just to make sure the ```/plugins``` directory will not be included

## Applying TMUX Plugins

To apply changes

```
prefix I
```

Also don't forget to source the file

```
tmux source ~/.config/tmux/tmux.conf
```

## Prefix Keybind

```
<C-Space>
```

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/tmux & stow tmux
```

## Thanks to

- [tpm](https://github.com/tmux-plugins/tpm)
- [rosepine](https://github.com/rose-pine/tmux)
