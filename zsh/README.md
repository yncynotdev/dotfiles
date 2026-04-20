# zsh

Modern shell, it's just simple and awesome

## Configuration

```
.config
    └── .zshrc
```

- ```.zshrc``` is where the main configuration was.

## Plugins

It uses [oh-my-zsh](https://ohmyz.sh/) under the hood

## Switching Shell

If you want to use ```zsh``` simply run either of these commands:

```
chsh -s usr/bin/zsh
```

or

```
chsh -s bin/zsh
```

Verifiy the shell you use by running:
```
echo $SHELL
```

## Symbolic Link

To link these files into you ```~/.zshrc``` file, simply:

```
rm -rf ~/.zshrc & stow zshrc
```
