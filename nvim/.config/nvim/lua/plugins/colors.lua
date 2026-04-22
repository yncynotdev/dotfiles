-- Customize your own Neovim theme here
-- @see https://github.com/catppuccin/nvim
-- @see https://github.com/ellisonleao/gruvbox.nvim
--
-- You can switch between themes without removing the piece of code
-- @example
-- {
--   "my-theme-plugin"
--   enabled = false
-- }

-- @return {}
return {
  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "auto",
        dark_variant = "main",
        styles = {
          transparency = true
        }
      })

      vim.cmd("colorscheme rose-pine")
    end
  }
}
