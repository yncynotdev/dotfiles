vim.pack.add({
	"https://github.com/mfussenegger/nvim-lint",
})

-- linters
require("lint").linters_by_ft = {
	astro = { "biome", "oxlint" },
	javascript = { "biome", "oxlint" },
	typescript = { "biome", "oxlint" },
	javascriptreact = { "biome", "oxlint" },
	typescriptreact = { "biome", "oxlint" },
	vue = { "biome", "oxlint" },
	yaml = { "yamllint" },
}
