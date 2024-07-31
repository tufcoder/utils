map <F2> :Lexplore<CR><C-w>:vertical resize 30<CR>
map <F3> :set wrap!<CR>
map <F4> :term<CR><C-w>:resize 10<CR>
map <F6> :set list!<CR>
map <F7> :set rnu!<CR>

let mapleader = " "
map <leader>w :w<CR>
map <leader>q :q<CR>
map <leader>x :x<CR>
map <leader>, :bn<CR>
map <leader>. :bp<CR>
map <leader>wa :wa<CR>
map <leader>bn :enew<CR>
map <leader>bv :vnew<CR>
map <leader>bd :bd<CR>
map <silent> <leader>hh :let @/ = ""<CR>

inoremap `` ``<LEFT>
inoremap '' ''<LEFT>
inoremap "" ""<LEFT>
inoremap () ()<LEFT>
inoremap [] []<LEFT>
inoremap {} {}<LEFT>
inoremap <> <><LEFT>
inoremap ** **<LEFT>
