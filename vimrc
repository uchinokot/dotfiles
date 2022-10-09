call plug#begin()
call plug#end()

syntax on
set number
set ai
set list
set listchars=tab:>-,trail:.
set tabstop=2
set paste
set clipboard=unnamed,autoselect
set encoding=utf8
set fileencodings=utf-8,iso-2022-jp,euc-jp,sjis
set expandtab
set softtabstop=2
set tabstop=2
set autoindent
set smartindent
set smarttab
set shiftwidth=2
set incsearch
set ignorecase
set smartcase
set hlsearch
set cursorline
set showmatch
set wildmenu
set history=5000
set mouse=a
set laststatus=2
set ruler

"
" Keymaps
"

let mapleader = "\<Space>"

noremap j gj
noremap k gk
noremap <Leader>h ^
noremap <Leader>l $
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>
inoremap jj <ESC>

"
" Plugin settings
"
