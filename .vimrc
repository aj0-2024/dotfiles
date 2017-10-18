
colorscheme desert

" Use only vim settings (instead of vi)
set nocompatible

" Plugins
filetype plugin indent on

" Editor General Settings
set showmode
set nowrap
set expandtab
set backspace=indent,eol,start
set number
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set gdefault
set nolist
set smarttab
set autoindent
set copyindent
set autoread

" Tab with spaces
set tabstop=2
set expandtab

" Indent with '>'
set shiftwidth=2

" Code Folding
set foldenable
set foldcolumn=2

" Syntax highlighting
syntax enable

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'zhou13/vim-easyescape'
Plug 'christoomey/vim-system-copy'

call plug#end()

" ESC key remap
let g:easyescape_chars = { "j": 1, "k": 1}

" Disable sqap files
set noswapfile
