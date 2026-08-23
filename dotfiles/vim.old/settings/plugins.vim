" Load plugins with vim-plug
call plug#begin($RCPATH.'/plugged')

" Plug 'srcery-colors/srcery-vim'     " https://github.com/srcery-colors/srcery-terminal
" Plug 'AxolotlC/Fox.vim'             " https://github.com/Pougher/Fox.vim
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Use release branch (recommended)
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'

let g:coc_global_extesions = [
            \ 'coc-tsserver'
            \ ]

call plug#end()

" Gruvbox configs
" autocmd vimenter * ++nested colorscheme gruvbox
colorscheme gruvbox
set background=dark
let g:gruvbox_transparent_bg = 0

nnoremap <silent> [oh :call gruvbox#hls_show()<CR>
nnoremap <silent> ]oh :call gruvbox#hls_hide()<CR>
nnoremap <silent> coh :call gruvbox#hls_toggle()<CR>

nnoremap * :let @/ = ""<CR>:call gruvbox#hls_show()<CR>*
nnoremap / :let @/ = ""<CR>:call gruvbox#hls_show()<CR>/
nnoremap ? :let @/ = ""<CR>:call gruvbox#hls_show()<CR>?
