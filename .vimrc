call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-fugitive'
Plug 'scrooloose/nerdtree'
call plug#end()

syntax on
set number
set ai
command E Ex
set list
set listchars=tab:>-,trail:.
set expandtab
set tabstop=2
set paste
set clipboard=unnamed,autoselect

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
