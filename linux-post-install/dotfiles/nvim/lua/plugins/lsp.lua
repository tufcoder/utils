return {
  -- 1. Plugin que ensina o lua_ls sobre as globais do Neovim ('vim', APIs, plugins, etc.)
  {
    "folke/lazydev.nvim",
    ft = "lua", -- carrega apenas quando abrir arquivos Lua
    opts = {
      library = {
        -- Carrega os tipos das variávies e plugins
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },

  -- 2. O gerenciador de servidores LSP
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },

  -- 3. A ponte que gerencia e ativa os servidores automaticamente
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
      "folke/lazydev.nvim", -- Adicionado aqui como dependência
    },
    config = function()
      local lspconfig = require("lspconfig")
      local lsp_capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- Sua função on_attach com os atalhos
      local on_attach = function(_, bufnr)
        vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr, desc = "Ir para Definição" })
        vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr, desc = "Mostrar Informações" })
        vim.keymap.set("n", "[d", vim.diagnostic.goto_next, { desc = "Próximo Erro" })
        vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, { desc = "Erro Anterior" })
      end

      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "vtsls",
          "omnisharp",
          "clangd",
          "intelephense",
          "pyright",
        },
        handlers = {
          -- Handler Padrão: Configura todos os servidores genéricos
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
                    -- Remove o aviso 'undefined global vim'
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
        },
      })
    end,
  },

  -- 4. LSP Config base
  {
    "neovim/nvim-lspconfig",
  },
}
