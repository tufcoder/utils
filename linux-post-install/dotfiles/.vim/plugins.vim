" Load plugins with vim-plug
call plug#begin($RCPATH.'/plugged')

Plug 'srcery-colors/srcery-vim'     " https://github.com/srcery-colors/srcery-terminal
Plug 'AxolotlC/Fox.vim'             " https://github.com/Pougher/Fox.vim

Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'jparise/vim-graphql'

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommended)
let g:coc_global_extesions = [
            \ 'coc-tsserver'
            \ ]

call plug#end()

colorscheme srcery
