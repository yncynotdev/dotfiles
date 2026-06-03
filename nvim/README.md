# Neovim

My personal Neovim configuration

## Package Manager

It uses the Neovim native package manager called [Pack](https://neovim.io/doc/user/pack/)


## Configuration

```
.config
    └── nvim
        ├── init.lua
        ├── nvim-pack-lock.json
```

- ```/nvim/init.lua``` is where the main configuration and packages was was.
- ```/nvim/nvim-pack-lock.json``` is where the json of plugins was.

## Plugins

- [mini.nvim](https://github.com/nvim-mini/mini.nvim)
- [mini.icons](https://github.com/nvim-mini/mini.icons)
- [mini.comment](https://github.com/nvim-mini/mini.comment)
- [mini.pairs](https://github.com/nvim-mini/mini.pairs)
- [treesitters](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [lsp](https://github.com/neovim/nvim-lspconfig)
- [linter](https://github.com/mfussenegger/nvim-lint)
- [formatters](https://github.com/stevearc/conform.nvim)
- [the best file manager](https://github.com/stevearc/oil.nvim)
- [autocompletes](https://github.com/saghen/blink.cmp)
- [autocompletes like vscode](https://github.com/L3MON4D3/LuaSnip)
- [auto tags](https://github.com/windwp/nvim-ts-autotag)
- [theme](https://github.com/rose-pine/neovim)
- [flex you use neovim on discord](https://github.com/vyfor/cord.nvim)

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/nvim & stow nvim
```
