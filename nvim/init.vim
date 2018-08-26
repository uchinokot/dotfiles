if &compatible
 set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

if dein#load_state('~/.cache/dein')
 call dein#begin('~/.cache/dein')

 call dein#add('~/.cache/dein')
 call dein#add('joshdick/onedark.vim')
 call dein#add('Shougo/deoplete.nvim')
 if !has('nvim')
   call dein#add('roxma/nvim-yarp')
   call dein#add('roxma/vim-hug-neovim-rpc')
 endif
 call dein#add('cohama/lexima.vim')
 call dein#add('Yggdroot/indentLine')
 call dein#add('vim-airline/vim-airline')
 call dein#add('itchyny/lightline.vim')
 call dein#add('bronson/vim-trailing-whitespace')
 call dein#add('Shougo/denite.nvim')
 call dein#add('rking/ag.vim')
" call dein#add('ctrlpvim/ctrlp.vim')
" call dein#add('tacahiroy/ctrlp-funky')
" call dein#add('suy/vim-ctrlp-commandline')

 if dein#check_install()
   call dein#install()
 endif

 call dein#end()
 call dein#save_state()
endif

filetype plugin indent on
syntax enable

syntax on
set encoding=utf-8
set number
set ai
command E Ex
set list
set listchars=tab:>-,trail:.
set tabstop=2
set clipboard+=unnamedplus
set encoding=utf8
set fileencoding=utf-8
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
set termguicolors

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

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0


" indentLine

let g:indentLine_faster = 1
let g:indentLine_leadingSpaceEnabled=1
let g:indentLine_leadingSpaceChar='·'

" deoplete

let g:deoplete#enable_at_startup = 1

" onedark.vim

colorscheme onedark

if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" ag.vim

" denite

" grep
call denite#custom#option('default', 'prompt', '>')
" " denite/insert モードのときは，C- で移動できるようにする
call denite#custom#map('insert', "<C-j>", '<denite:move_to_next_line>')
call denite#custom#map('insert', "<C-k>", '<denite:move_to_previous_line>')

" tabopen や vsplit のキーバインドを割り当て
call denite#custom#map('insert', "<C-t>", '<denite:do_action:tabopen>')
call denite#custom#map('insert', "<C-v>", '<denite:do_action:vsplit>')
call denite#custom#map('normal', "v", '<denite:do_action:vsplit>')

" jj で denite/insert を抜けるようにする
call denite#custom#map('insert', 'jj', '<denite:enter_mode:normal>')
nnoremap <silent> / :<C-u>Denite -buffer-name=search -auto-resize line<CR>

" 普通にgrep
nnoremap <silent> <C-p> :<C-u>Denite file_rec<CR><Paste>
" カーソル以下の単語をgrep
nnoremap <silent> ;cg :<C-u>DeniteCursorWord grep -buffer-name=search line<CR><C-R><C-W><CR>
" 普通にgrep
nnoremap <silent> ;g :<C-u>Denite -buffer-name=search -mode=normal grep<CR>
" hi CursorLine guifg=#E19972
