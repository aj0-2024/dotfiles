" Use only vim settings (instead of vi)
set nocompatible

" Plugins
filetype plugin indent on

" Editor General Settings
set showmode
set nowrap
set expandtab
set backspace=indent,eol,start
set number relativenumber
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
set magic

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

" NERDTree customization
map <C-n> :NERDTreeToggle<CR>

" CtrlP Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/]\/(node_modules|git)$'
  \ }

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'zhou13/vim-easyescape'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'kien/ctrlp.vim'

" Javascript VIM Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'isruslan/vim-es6'
Plug 'w0rp/ale'
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Vim Colorschemes
Plug 'dracula/vim'

call plug#end()

" ESC key remap
let g:easyescape_chars = { "j": 1, "k": 1}

" Disable sqap files
set noswapfile

" Ale configuration - automatic formatting on save
autocmd bufwritepost *.js silent !standard --fix %
set autoread

" Enable vim-jsx on .js files also
let g:jsx_ext_required = 0

" Colorscheme is dracula
color dracula
