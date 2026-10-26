vim.pack.add({
	"https://github.com/rose-pine/neovim",
})

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "*",
	callback = function()
		vim.api.nvim_set_hl(0, "Visual", { bg = "#c4a7e7" })
	end,
})

-- Color Scheme
vim.cmd.colorscheme("rose-pine")
