-- A collection of plugins in Neovim
-- @see https://github.com/nvim-mini/mini.nvim
--
-- @return {}

return {
  -- mini.nvim
  {
    "nvim-mini/mini.nvim",
    version = false,
  },
  -- mini.files
  {
    "nvim-mini/mini.files",
    version = false,
    enabled = false,
    config = function()
      require("mini.files").setup()

      vim.keymap.set("n", "<leader>n", ":lua MiniFiles.open()<CR>", {})
    end,
  },
  -- mini.icons
  {
    "nvim-mini/mini.icons",
    version = false,
    config = function()
      require("mini.icons").setup({
        style = "glyph",
      })
    end,
  },
  --mini.comments
  {
    "nvim-mini/mini.comment",
    version = false,
  },
  --mini.pairs
  {
    "nvim-mini/mini.pairs",
    version = false,
    config = function ()
      require("mini.pairs").setup()
    end
  },
}
