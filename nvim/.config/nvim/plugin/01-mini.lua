vim.pack.add({
	"https://github.com/nvim-mini/mini.icons",
	"https://github.com/nvim-mini/mini.pairs",
	"https://github.com/nvim-mini/mini.comment",
	"https://github.com/nvim-mini/mini.icons",
})
-- mini.nvim(the goat)
require("mini.pairs").setup()
require("mini.comment").setup()

require("mini.icons").setup({
	style = "glyph",
})
