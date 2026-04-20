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
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = "latte",
        transparent_background = true,
        background = { light = "latte", dark = "mocha" },
      })

      vim.cmd.colorscheme("catppuccin")
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    enabled = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        transparent_mode = true,
      })
      vim.o.background = "light"
      vim.cmd("colorscheme gruvbox")
    end,
  },
  -- lua/plugins/rose-pine.lua
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        variant = "dawn",
        dark_variant = "dawn",
        styles = {
          transparency = true
        }
      })

      vim.cmd("colorscheme rose-pine")
    end
  }
}
