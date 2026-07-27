return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp", -- Fonte do LSP
      "hrsh7th/cmp-buffer",   -- Fonte do texto do arquivo
      "hrsh7th/cmp-path",     -- Fonte de caminhos do sistema
      "L3MON4D3/LuaSnip",     -- Motor de snippets obrigatório
    },
    config = function()
      local cmp = require("cmp")

      cmp.setup({
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(), -- Janela com bordinha bonita
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- Forçar abrir o menu com Ctrl + Espaço
          ["<C-e>"] = cmp.mapping.abort(),         -- Fechar o menu com Ctrl + e
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar sugestão com ENTER

          -- Navegar pelas sugestões usando Tab e Shift+Tab
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        -- Fontes que vão aparecer no menu (em ordem de prioridade)
        sources = cmp.config.sources({
          { name = "nvim-lsp" }, -- 1º sugestões do código (LSP)
          { name = "buffer" },   -- 2º palavras do arquivo
          { name = "path" },     -- 3º caminhos de arquivos
        }),
      })
    end,
  },
}
