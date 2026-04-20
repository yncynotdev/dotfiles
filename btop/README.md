# Btop

Btop is a resource monitor in your terminal

- Theme: Rosepine Dawn

## Configuration

```
└── .config
    └── btop
        ├── btop.conf
        └── themes
```

- ```/btop/btop.conf``` is where the main configuration was.
- ```/themes``` is where the theme configuration was.

## Running Btop

Simply run:

```
btop
```

## Thanks to 

[rose-pine-dawn](https://github.com/rose-pine/btop)


## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/btop & stow btop
```
