-------------------------------------------------------------------------------
-- 1. AMBIENTE E VARIÁVEIS GLOBAIS (Precisa vir ANTES de tudo)
-------------------------------------------------------------------------------

-- Isolamento do WSL (Gambiarra necessária do PATH)
local path = vim.fn.getenv("PATH")
local new_paths = {}
for p in string.gmatch(path, "[^:]+") do
    if not string.match(p, "^/mnt/c/") then
        table.insert(new_paths, p)
    end
end
vim.fn.setenv("PATH", table.concat(new_paths, ":"))

-------------------------------------------------------------------------------
-- 2. BOOTSTRAP DO LAZY.NVIM
-------------------------------------------------------------------------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git", "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-------------------------------------------------------------------------------
-- 3. MÓDULOS DE CONFIGURAÇÃO (Opções do Vim e Atalhos)
-------------------------------------------------------------------------------

require("options")
require("keymaps")

-------------------------------------------------------------------------------
-- 4. CARREGAMENTO DOS PLUGINS
-------------------------------------------------------------------------------

require("lazy").setup("plugins")
