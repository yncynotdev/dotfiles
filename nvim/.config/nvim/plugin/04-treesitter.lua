vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

-- treesitter
require("nvim-treesitter").setup({
	build = ":TSUpdate",
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = false },
})
