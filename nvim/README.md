# Neovim

Oh boy, here's a lot of things included

> ⚠️WARNING: Might change these configuration once nvim v.0.12 is offically released

## Package Manager

Neovim uses [lazy.nvim](https://lazy.folke.io/) (Not to be confused with LazyVim, which is a Neovim distro btw).


## Configuration

```
.config
    └── nvim
        ├── init.lua
        ├── lazy-lock.json
        └── lua
            ├── config
            └── plugins
```

- ```/nvim/init.lua``` is where the main configuration was.
- ```/nvim/lua/config``` is where some of the Neovim configuration was (such as keybinds, etc.).
- ```/nvim/lua/plugins``` is where the plugins configuration was.
- ```/nvim/lazy-lock.json``` is where the json of plugins was.

## Plugins

- [mini.nvim](https://github.com/nvim-mini/mini.nvim)
- [mini.files](https://github.com/nvim-mini/mini.files)
- [mini.files](https://github.com/nvim-mini/mini.icons)
- [mini.comment](https://github.com/nvim-mini/mini.comment)
- [mini.pairs](https://github.com/nvim-mini/mini.pairs)
- [treesitters](https://github.com/nvim-treesitter/nvim-treesitter)
- [telescope](https://github.com/nvim-telescope/telescope.nvim)
- [lsp](https://github.com/neovim/nvim-lspconfig)
- [lsp manager](https://github.com/mason-org/mason-lspconfig.nvim)
- [lsp diagnostics](https://github.com/nvimtools/none-ls.nvim)
- [lsp diagnostics](https://github.com/nvimtools/none-ls.nvim)
- [the best file tree](https://github.com/stevearc/oil.nvim)
- [autocompletes](https://github.com/hrsh7th/nvim-cmp)
- [autocompletes like vscode](https://github.com/L3MON4D3/LuaSnip)
- [auto tags](https://github.com/windwp/nvim-ts-autotag)
- [theme](https://github.com/rose-pine/neovim)

## Symbolic Link

To link these files into you ```~/.config``` file, simply:

```
rm -rf ~/.config/nvim & stow nvim
```
