-- Formerly known as null-ls, it provides formatters and linters plugin
-- @see https://github.com/nvimtools/none-ls.nvim
-- @see https://github.com/nvimtools/none-ls-extras.nvim
--
-- @return {}
return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvimtools/none-ls-extras.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        -- Sets up formatter and linters that you installed
        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.prettier,
                require("none-ls.diagnostics.eslint_d")
            },
        })

        vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
    end,
}
