-- Retrieves configuration at "/nvim/lua/config" directory
-- @param {string} get the path directory via config.*
--
-- @example
-- if you have "nvim/lua/config/keymaps"
-- require("config.keymaps") -- where the directory is in "/config/keymaps"

require("config.lazy")
require("config.keymaps")

-- Custom Vim configuration
vim.cmd("set expandtab")
vim.cmd("set tabstop=4")
vim.cmd("set softtabstop=4")
vim.cmd("set shiftwidth=4")

vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.swapfile = false

vim.api.nvim_create_autocmd("ColorScheme", {
  pattern = "*",
  callback = function()
    vim.api.nvim_set_hl(0, "Visual", { bg = "#c4a7e7" })
  end,
})

-- local projectfile = vim.fn.getcwd() .. '/project.godot'
-- if projectfile then
--     vim.fn.serverstart './godothost'
-- end
