call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/unite.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

syntax on
set number
set ai
command E Ex
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

" vim-airline

let g:airline_theme = 'solarized'
let g:airline_solarized_bg='dark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0

" nerdtree

let NERDTreeShowHidden = 1

nmap <Leader>n :NERDTreeToggle<CR>

" indentLine
let g:indentLine_color_term='DarkGray'
let g:indentLine_faster = 1
"let g:indentLine_leadingSpaceEnabled=1
"let g:indentLine_leadingSpaceChar='·'
