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
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/nvimtools/none-ls.nvim",
	"https://github.com/nvimtools/none-ls-extras.nvim",
	"https://github.com/rafamadriz/friendly-snippets",
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	"https://github.com/saghen/blink.lib",
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/stevearc/conform.nvim",
	"https://github.com/mfussenegger/nvim-lint",
	"https://github.com/vyfor/cord.nvim",
	"https://github.com/lukas-reineke/indent-blankline.nvim",
})

-- Default Keymaps
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "gl", vim.diagnostic.open_float)

-- Vim Config
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
	per_filetype = {
		["html"] = {
			enable_close = false,
		},
	},
})

-- formatters
require("conform").setup({
	event = { "BufReadPre", "BufNewFile" },
	formatters_by_ft = {
		lua = { "stylua" },
		gdscript = { "gdscript-formatter" },
		javascript = { "biome", "oxfmt", "prettier" },
		typescript = { "biome", "oxfmt", "prettier" },
		javascriptreact = { "biome", "oxfmt", "prettier" },
		typescriptreact = { "biome", "oxfmt", "prettier" },
		vue = { "biome", "oxfmt", "prettier" },
	},
	formatters = {
		biome = { require_cwd = true },
	},
	format_on_save = {
		-- These options will be passed to conform.format()
		timeout_ms = 500,
		lsp_format = "fallback",
	},
	default_format_opts = {
		stop_after_first = true,
	},
})

vim.keymap.set("n", "<leader>gf", function()
	require("conform").format({
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	})
end)

-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- linters
require("lint").linters_by_ft = {
	javascript = { "biome", "oxlint" },
	typescript = { "biome", "oxlint" },
	javascriptreact = { "biome", "oxlint" },
	typescriptreact = { "biome", "oxlint" },
	vue = { "biome", "oxlint" },
}

-- auto completes
local cmp = require("blink.cmp")
cmp.build():wait(60000)
cmp.setup({
	snippets = { preset = "luasnip" },
	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
	},
})
local capabilities = require("blink.cmp").get_lsp_capabilities({
	textDocument = { completion = { completionItem = { snippetSupport = false } } },
})

-- snippets
require("luasnip.loaders.from_vscode").lazy_load()

-- LSP's
vim.lsp.enable({
	"lua_ls",
	"biome",
	"csskit",
	"eslint",
	"gdscript",
	"gdshader_lsp",
	"gopls",
	"html",
	"jsonls",
	"oxfmt",
	"oxlint",
	"postgrestools",
	"prettier",
	"rust_analyzer",
	"stylua",
	"tailwindcss",
	"yamlls",
})

vim.lsp.config("*", { capabilities = capabilities })

local vue_language_server_path = "~/.bun/install/global/node_modules/@vue/language-server"
local tsserver_filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" }
local vue_plugin = {
	name = "@vue/typescript-plugin",
	location = vue_language_server_path,
	languages = { "vue" },
	configNamespace = "typescript",
}
local vtsls_config = {
	settings = {
		vtsls = {
			tsserver = {
				globalPlugins = {
					vue_plugin,
				},
			},
		},
	},
	filetypes = tsserver_filetypes,
}

local ts_ls_config = {
	init_options = {
		plugins = {
			vue_plugin,
		},
	},
	filetypes = tsserver_filetypes,
}

-- If you are on most recent `nvim-lspconfig`
local vue_ls_config = {}

-- nvim 0.11 or above
vim.lsp.config("vtsls", vtsls_config)
vim.lsp.config("vue_ls", vue_ls_config)
vim.lsp.config("ts_ls", ts_ls_config)
vim.lsp.enable({ "vtsls", "vue_ls" })

-- Godot configs LSP
local godotProjectFile = vim.fn.getcwd() .. "/project.godot"
if godotProjectFile then
	vim.fn.serverstart("./godothost")
end

-- Better Indents
require("ibl").setup()

-- Flex on Discord that you use Neovim
require("cord").setup()
