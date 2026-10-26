vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/rafamadriz/friendly-snippets",
	"https://github.com/saghen/blink.lib",
	{ src = "https://github.com/saghen/blink.cmp", version = "v1" },
	"https://github.com/L3MON4D3/LuaSnip",
})
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
	"clangd",
	"csskit",
	-- "eslint",
	"gdscript",
	"gdshader_lsp",
	"gopls",
	"gradle_lsp",
	"html",
	"jdtls",
	"jsonls",
	"kotlin_lsp",
	"oxfmt",
	"oxlint",
	"markdown_oxide",
	"postgrestools",
	"prettier",
	"pylsp",
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
