local opt = vim.opt

-- Números de linha (relativos ajudam muito a pular linhas rápido)
opt.number = true
opt.relativenumber = true

-- Tabulações e Espaços (padrão de 4 espaços)
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true

-- Aparência e Interface
opt.termguicolors = true -- Cores reais no terminal
opt.signcolumn = "yes"   -- Mantém a coluna de sinais aberta (evita a tela "pular" com o LSP)
opt.cursorline = true    -- Destaca a linha onde o cursor está
opt.scrolloff = 8        -- Mantém 8 linhas visíveis acima/abaixo do cursor ao rolar

-- Comportamento de Busca
opt.hlsearch = false     -- Não deixa tudo amarelo para sempre após buscar
opt.incsearch = true     -- Busca incremental (mostra o resultado enquanto digita)
opt.ignorecase = true    -- Ignora maiúsculas/minúsculas na busca
opt.smartcase = true     -- Mas respeita se você digitar uma letra maiúscula

-- Clipboard (Área de Transferência)
-- Permite copiar/colar entre o Neovim e o Windows usando o clipboard do sistema
opt.clipboard = "unnamedplus"

-- Mostra o balão de erro automaticamente após parar o cursor por um instante
-- vim.o.updatetime = 250
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   group = vim.api.nvim_create_augroup("float_diagnostic", { clear = true }),
--   callback = function()
--     vim.diagnostic.open_float(nil, { focus = false })
--   end,
-- })

-- Função para aplicar a transparência
-- local function habilitar_transparencia()
--   local highlights = {
--     "Normal", "NormalFloat", "NormalNC", "SignColumn",
--     "LineNr", "CursorLineNr", "FoldColumn", "NeoTreeNormal",
--     "NeoTreeNormalNC", "NvimTreeNormal"
--   }
--   
--   for _, group in ipairs(highlights) do
--     vim.cmd(string.format("hi %s ctermbg=none guibg=none", group))
--   end
-- end

-- Executa a função imediatamente
-- habilitar_transparencia()
