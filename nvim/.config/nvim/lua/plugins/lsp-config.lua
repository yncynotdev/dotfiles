-- An essentail plugins that allows autocompletion and more 
-- For organizing lsp's:
-- @see https://github.com/mason-org/mason-lspconfig.nvim
-- @see https://github.com/mason-org/mason.nvim
-- For lsp's configuration:
-- @see https://github.com/neovim/nvim-lspconfig
--
-- @return {}

return {
  {
    "mason-org/mason-lspconfig.nvim",
    opts = {},
    dependencies = {
      { "mason-org/mason.nvim", opts = {} },
    },
    config = function()
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "eslint",
          "gopls",
          "jsonls",
          "omnisharp",
          "tailwindcss",
          "ts_ls",
          "vtsls",
          "vue_ls",
        },
        auto_install = true,
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("eslint", {
        capabilities = capabilities,
      })
      vim.lsp.config("eslint_d", {
        capabilities = capabilities,
      })
      vim.lsp.config("gdscript", {
        capabilities = capabilities,
      })
      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })
      vim.lsp.config("markdown-oxide", {
        capabilities = capabilities,
      })
      vim.lsp.config("markdownlint", {
        capabilities = capabilities,
      })
      vim.lsp.config("prettier", {
        capabilities = capabilities,
      })
      vim.lsp.config("pgformatter", {
        capabilities = capabilities,
      })
      vim.lsp.config("postgrestools", {
        capabilities = capabilities,
      })
      vim.lsp.config("rust_analyzer", {
        capabilities = capabilities,
      })
      vim.lsp.config("stylua", {
        capabilities = capabilities,
      })
      vim.lsp.config("tailwindcss", {
        capabilities = capabilities,
      })
      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
      })
      vim.lsp.config("yamlls", {
        capabilities = capabilities,
      })
      vim.lsp.config("yamlfix", {
        capabilities = capabilities,
      })
      vim.lsp.config("yamlfmt", {
        capabilities = capabilities,
      })
      vim.lsp.config("yamllint", {
        capabilities = capabilities,
      })

      -- vue_ls support from ts_ls to vtsls
      -- issue: https://github.com/neovim/nvim-lspconfig/pull/3943
      -- vue_ls will not work without vtsls
      -- this implementation was not available on nvim-treesitter
      local vue_language_server_path = vim.fn.stdpath("data")
          .. "/mason/packages/vue-language-server/node_modules/@vue/language-server"
      local vue_plugin = {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue" },
        configNamespace = "typescript",
      }

      local vtsls_config = {
        settings = {
          vtsls = {
            tsserver = {
              globalPlugins = {
                vue_plugin,
              },
            },
          },
        },
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      }

      local vue_ls_config = {
        on_init = function(client)
          client.handlers["tsserver/request"] = function(_, result, context)
            local clients = vim.lsp.get_clients({ bufnr = context.bufnr, name = "vtsls" })
            if #clients == 0 then
              vim.notify(
                "Could not find `vtsls` lsp client, `vue_ls` would not work without it.",
                vim.log.levels.ERROR
              )
              return
            end
            local ts_client = clients[1]

            local param = unpack(result)
            local id, command, payload = unpack(param)
            ts_client:exec_cmd({
              title = "vue_request_forward", -- You can give title anything as it's used to represent a command in the UI, `:h Client:exec_cmd`
              command = "typescript.tsserverRequest",
              arguments = {
                command,
                payload,
              },
            }, { bufnr = context.bufnr }, function(_, r)
              local response_data = { { id, r.body } }
              ---@diagnostic disable-next-line: param-type-mismatch
              client:notify("tsserver/response", response_data)
            end)
          end
        end,
      }
      -- Configuration exclusively for Vue.js
      -- nvim 0.11 or above
      vim.lsp.config("vtsls", vtsls_config)
      vim.lsp.config("vue_ls", vue_ls_config)
      vim.lsp.enable({ "vtsls", "vue_ls" })

      -- Enabling lsp
      vim.lsp.enable("cssls")
      vim.lsp.enable("eslint")
      vim.lsp.enable("eslint_d")
      vim.lsp.enable("gdscript")
      vim.lsp.enable("gopls")
      vim.lsp.enable("html")
      vim.lsp.enable("jsonls")
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("markdown-oxide")
      vim.lsp.enable("markdownlint")
      vim.lsp.enable("omnisharp")
      vim.lsp.enable("pgformatter")
      vim.lsp.enable("postgrestools")
      vim.lsp.enable("prettier")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("sqlls")
      vim.lsp.enable("stylua")
      vim.lsp.enable("tailwindcss")
      vim.lsp.enable("tombi")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("yamlls")
      vim.lsp.enable("yamlfix")
      vim.lsp.enable("yamlfmt")
      vim.lsp.enable("yamllint")

      vim.diagnostic.config({
        virtual_text = true, -- shows inline errors
        signs = true,    -- signs in sign column
        underline = true, -- underlines error lines
        update_in_insert = false,
        severity_sort = true,
      })

      -- Custome keybindings
      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
