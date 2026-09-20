return {
  -- 1. Plugin que ensina o lua_ls sobre as globais do Neovim
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  -- 2. O gerenciador de servidores LSP (Carregamento garantido)
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "folke/lazydev.nvim",
    },
    config = function()
      -- Inicializa o Mason primeiro
      require("mason").setup()

      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Função on_attach com os seus atalhos
      local on_attach = function(_, bufnr)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Ir para Definição" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Mostrar Informações" })
        vim.keymap.set("n", "[d", function() vim.diagnostic.jump({ count = 1 }) end, { buffer = bufnr, desc = "Próximo Erro" })
        vim.keymap.set("n", "]d", function() vim.diagnostic.jump({ count = -1 }) end, { buffer = bufnr, desc = "Erro Anterior" })
        vim.keymap.set("n", "gy", vim.lsp.buf.implementation, { buffer = bufnr, desc = "Ir para implementação" })
        vim.keymap.set("n", "gr", vim.lsp.buf.references, { buffer = bufnr, desc = "Ver referências" })
      end

      -- Configuração do mason-lspconfig unificada
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vtsls",
          "omnisharp",
          "clangd",
          "intelephense",
          "pyright",
          "emmet_language_server",
          "jdtls"
        },
        handlers = {
          -- Handler Padrão para os servidores genéricos
          function(server_name)
            lspconfig[server_name].setup({
              capabilities = lsp_capabilities,
              on_attach = on_attach,
            })
          end,

          -- Handler Específico para o lua_ls
          ["lua_ls"] = function()
            lspconfig.lua_ls.setup({
              capabilities = lsp_capabilities,
              on_attach = on_attach,
              settings = {
                Lua = {
                  diagnostics = {
                    globals = { "vim" },
                  },
                  workspace = {
                    checkThirdParty = false,
                  },
                  telemetry = { enable = false },
                },
              },
            })
          end,

          -- Handler Específico para o Emmet
          ["emmet_language_server"] = function()
            lspconfig.emmet_language_server.setup({
              capabilities = lsp_capabilities,
              on_attach = on_attach,
              filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "vue", "svelte", "php" },
              init_options = {
                html = {
                  options = {
                    ["bem.enabled"] = true,
                  },
                },
              },
            })
          end,
        },
      })
    end,
  },
}
