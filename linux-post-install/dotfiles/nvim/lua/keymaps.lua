-- Define a tecla líder global (espaço)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

local keymap = vim.keymap.set

-- Sair do modo de inserção digitando 'jk' rápido (opcional, muito popular)
-- keymap("i", "jk", "<ESC>", { desc = "Sair do modo de inserção" })

-- Limpar os destaques de busca com <Leader> + h
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", { desc = "Limpar destaque de busca" })

-- Mover linhas selecionadas para cima/baixo no modo Visual (igual ao VS Code)
keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

-- Manter o cursor centralizado ao rolar a tela com Ctrl+d e Ctrl+u
keymap("n", "<C-d>", "<C-d>zz")
keymap("n", "<C-u>", "<C-u>zz")

-- Navegar entre janelas divididas (Splits) mais facilmente
keymap("n", "<C-h>", "<C-w>h", { desc = "Janela da esquerda" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Janela de baixo" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Janela de cima" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Janela da direita" })

-- Abre/Fecha o Neo-tree na lateral esquerda com Espaço + e
keymap("n", "<leader>e", "<cmd>Neotree toggle left<CR>", { desc = "Toggle Neo-tree" })

-- Alternar para o buffer/aba da esquerda/direita
keymap("n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Aba anterior" })
keymap("n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Próxima aba" })

-- Fechar a aba atual
keymap("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Fechar aba atual" })

-- Mapeamentos para o LSP
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Ações de Código" })
vim.keymap.set("n", "<leader>rr", vim.lsp.buf.references, { desc = "Mostrar Referências" })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Renomear Símbolo" })

-- Abre a janela flutuante do erro atual instantaneamente
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Mostrar Detalhes do Erro" })

