-- I honestly still don't know what Treesitter is all about
-- @see https://github.com/nvim-treesitter/nvim-treesitter
--
-- @return {}

return {
    {
        "nvim-treesitter/nvim-treesitter",
        branch = "master",
        lazy = false,
        build = ":TSUpdate",
        config = function()
            local configs = require("nvim-treesitter.configs")

            configs.setup({
                -- ensure_installed = {
                --     "gdscript",
                --     "godot_resource",
                --     "gd_shader"
                -- },
                auto_install = true,
                highlight = { enable = true },
                indent = { enable = false }
            })
        end
    },
    {
        "habamax/vim-godot",
        event = "VimEnter"
    }
}
