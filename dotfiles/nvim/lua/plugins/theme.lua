return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000, -- Garante que o tema carregue antes de tudo
    config = function()
        require("catppuccin").setup({
            transparent_background = true,
        })
      -- Ativa a variação 'mocha' (escuro moderno)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
