vim.pack.add({
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/mfussenegger/nvim-dap",
})

-- Default Keymaps
vim.g.mapleader = " "
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })
vim.keymap.set("n", "gl", vim.diagnostic.open_float)
vim.opt.textwidth = 148 -- Breaks line after 80 characters

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
vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({ virtual_text = true })

-- vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
