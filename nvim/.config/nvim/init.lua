vim.pack.add({
	'https://github.com/rose-pine/neovim',
	'https://github.com/nvim-treesitter/nvim-treesitter',
	'https://github.com/nvim-telescope/telescope.nvim',
	'https://github.com/nvim-telescope/telescope-ui-select.nvim',
	'https://github.com/nvim-lua/plenary.nvim',
	'https://github.com/stevearc/oil.nvim',
	'https://github.com/nvim-mini/mini.icons',
	'https://github.com/nvim-mini/mini.pairs',
	'https://github.com/nvim-mini/mini.comment',
	'https://github.com/windwp/nvim-ts-autotag',
})


-- Default Keymaps
vim.g.mapleader = " "
vim.keymap.set("i","jj", "<Esc>", {noremap = true, silent = true})


-- Custom Vim configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Visual", { bg = "#c4a7e7" })
  end,
})


-- Color Scheme
vim.cmd.colorscheme('rose-pine')


-- oil.nvim config
require('oil').setup()
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })


-- telescope config
local builtin = require("telescope.builtin")
require("telescope").setup({
	extensions = {
	  ["ui-select"] = {
	    require("telescope.themes").get_dropdown({}),
	  },
	},
	defaults = {
	  cwd = vim.fn.getcwd(),
	  file_ignore_patterns = {
	    "node_modules",
	    ".git/",
	    ".nuxt",
	  },
	},
	pickers = {
	  find_files = {
	    hidden = true,
	  },
	}
})
require("telescope").load_extension("ui-select")
vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })


-- treesitter
require("nvim-treesitter").setup({
	build = ':TSUpdate',
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = false }
})


-- mini.nvim(the goat)
require("mini.pairs").setup()
require("mini.comment").setup()

require("mini.icons").setup({
	style = "glyph",
})


-- auto tags
require('nvim-ts-autotag').setup({
	opts = {
	  -- Defaults
	  enable_close = true,    -- Auto close tags
	  enable_rename = true,   -- Auto rename pairs of tags
	  enable_close_on_slash = false -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
	  ["html"] = {
	    enable_close = false
	  }
	}
})
