" Load plugins with vim-plug
call plug#begin($RCPATH.'/plugged')

Plug 'srcery-colors/srcery-vim'     " https://github.com/srcery-colors/srcery-terminal
Plug 'AxolotlC/Fox.vim'             " https://github.com/Pougher/Fox.vim

Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommended)

Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

Plug 'mattn/emmet-vim'

let g:coc_global_extesions = [
            \ 'coc-tsserver'
            \ ]

call plug#end()

" Set a default colorschema from srcery plugin
colorscheme srcery
