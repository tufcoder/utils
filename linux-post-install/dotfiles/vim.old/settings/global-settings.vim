" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if has('termguicolors')
   set termguicolors
endif

syntax on

filetype plugin indent on

" Configure sets
set nocompatible
set encoding=utf-8
set backspace=indent,eol,start
set mouse=a
set title
set number
set relativenumber
set belloff=all
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set colorcolumn=80
set noswapfile
set confirm
set hidden
set splitbelow
set splitright
set undodir=~/.vim/undodir
set undofile
set scrolloff=2
set cursorline
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartcase
set ignorecase
set hlsearch
set incsearch
set nowrap
set linebreak
set nolist
set listchars=tab:>-,space:.,trail:◀,eol:↲
set fillchars=vert:│
set laststatus=2
set wildmenu
set wildmode=longest,full
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set spelllang=en,pt_br
set nospell
set foldmethod=marker
set autoread
set noshowmode
set grepprg=rg\ --vimgrep\ --follow\ --no-messages
