return {
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = "nvim-tree/nvim-web-devicons", -- Ícones coloridos nas abas
    event = "VeryLazy",
    opts = {
      options = {
        mode = "buffers", -- Trata os buffers como abas na barra superior
        diagnostics = "nvim_lsp", -- Mostra os erros/warnings do LSP direto na aba
        always_show_bufferline = true,
        offsets = {
          {
            filetype = "neo-tree", -- Se usar neo-tree / NvimTree, ajusta a barra para não cobrir a sidebar
            text = "Explorador",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    },
  },
}
