" Load plugins with vim-plug
call plug#begin($RCPATH.'/plugged')

Plug 'srcery-colors/srcery-vim'     " https://github.com/srcery-colors/srcery-terminal
Plug 'AxolotlC/Fox.vim'             " https://github.com/Pougher/Fox.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommended)

call plug#end()

colorscheme srcery
