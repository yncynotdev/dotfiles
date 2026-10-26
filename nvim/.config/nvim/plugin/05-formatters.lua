vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
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
		markdown = { "markdown_oxide" },
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
