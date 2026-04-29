vim.pack.add({
	"https://github.com/rose-pine/neovim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-telescope/telescope-ui-select.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.comment",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvimtools/none-ls-extras.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
})

-- Default Keymaps
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

vim.o.number = true
vim.o.relativenumber = true
vim.o.tabstop = 2
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.softtabstop = 2
vim.o.shiftwidth = 2
vim.o.smartindent = true
vim.o.autoindent = true
vim.opt.swapfile = false
vim.diagnostic.config({ virtual_text = true })

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Visual", { bg = "#c4a7e7" })
	end,
})

-- Color Scheme
vim.cmd.colorscheme("rose-pine")

-- oil.nvim config
require("oil").setup()
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
	},
})
require("telescope").load_extension("ui-select")
vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

-- treesitter
require("nvim-treesitter").setup({
	build = ":TSUpdate",
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = false },
})

-- mini.nvim(the goat)
require("mini.pairs").setup()
require("mini.comment").setup()

require("mini.icons").setup({
	style = "glyph",
})

-- auto tags
require("nvim-ts-autotag").setup({
	opts = {
		-- Defaults
		enable_close = true, -- Auto close tags
		enable_rename = true, -- Auto rename pairs of tags
		enable_close_on_slash = false, -- Auto close on trailing </
	},
	-- Also override individual filetype configs, these take priority.
	-- Empty by default, useful if one of the "opts" global settings
	-- doesn't work well in a specific filetype
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})

-- none ls
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
		null_ls.builtins.formatting.prettier,
		-- require("none-ls.diagnostics.eslint_d")
		require("none-ls.diagnostics.eslint"),
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- LSP's
vim.lsp.enable({
	"lua_ls",
	"vtsls",
	"vue_ls",
	"eslint",
	"gdscript",
	"html",
	"jsonls",
	"prettier",
	"stylua",
	"tailwindcss",
	"ts_ls",
})

vim.lsp.config("tailwindcss", {
	filetypes = { "html", "css", "scss" },
})

-- vim.lsp.enable({ "vtsls", "vue_ls" })
-- vim.lsp.enable("cssls")
-- vim.lsp.enable("eslint")
-- vim.lsp.enable("gdscript")
-- vim.lsp.enable("gopls")
-- vim.lsp.enable("html")
-- vim.lsp.enable("jsonls")
-- vim.lsp.enable("lua_ls")
-- vim.lsp.enable("markdown-oxide")
-- vim.lsp.enable("markdownlint")
-- vim.lsp.enable("omnisharp")
-- vim.lsp.enable("pgformatter")
-- vim.lsp.enable("postgrestools")
-- vim.lsp.enable("prettier")
-- vim.lsp.enable("rust_analyzer")
-- vim.lsp.enable("sqlls")
-- vim.lsp.enable("stylua")
-- vim.lsp.enable("tailwindcss")
-- vim.lsp.enable("tombi")
-- vim.lsp.enable("ts_ls")
-- vim.lsp.enable("yamlls")
-- vim.lsp.enable("yamlfix")
-- vim.lsp.enable("yamlfmt")
-- vim.lsp.enable("yamllint")
