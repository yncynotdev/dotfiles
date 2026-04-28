-- Fuzzy finder for Neovim
-- @see https://github.com/nvim-telescope/telescope.nvim
-- @see https://github.com/nvim-telescope/telescope-ui-select.nvim
-- @see https://github.com/nvim-lua/plenary.nvim
--
-- @return {}

return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>p", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })

      require("telescope").setup({
        defaults = {
          cwd = vim.fn.getcwd(),
          file_ignore_patterns = {
            "node_modules",
            ".git/",
            ".nuxt",
          },
        },
        pickers = {
          find_files = {
            hidden = true,
          },
        },
      })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      -- This is your opts table
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
