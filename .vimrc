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

" Optimize search
set ignorecase
set smartcase
set hlsearch
set incsearch

set gdefault
set nolist
set smarttab
set magic

" Tab with spaces
set tabstop=2
set expandtab

" Indent with '>'
set shiftwidth=2
set autoindent

" Code Folding
set nofoldenable
set foldcolumn=2

" Syntax highlighting
syntax enable

" Leader commands  
let mapleader = "\\"                           
nnoremap <Leader>s :w<CR>
nnoremap <Leader>q :wq<CR>
nnoremap <Leader>p :!git a; git c<CR>
nnoremap <Leader><C-r> :source ~/.vimrc<CR>
" Substitute under the word where cursor is
nnoremap <Leader>rep :%s/\<<C-r><C-w>\>/
" set paste and no paste for removing autoindent during paste
nnoremap <Leader>sp :set paste
nnoremap <Leader>np :set nopaste


" CtrlP Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_root_markers = ['marker.vim'] 
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|git)$'
  \ }
set wildignore +=*/node_modules/*

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'zhou13/vim-easyescape'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'kien/ctrlp.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tomasiser/vim-code-dark'

" Fish shell plugins
Plug 'dag/vim-fish'
 
" Javascript VIM Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'isruslan/vim-es6'
Plug 'w0rp/ale'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'stephpy/vim-yaml'
Plug 'mattn/emmet-vim'

" Python VIM Plugins
Plug 'klen/python-mode'
let g:pymode_python = 'python3'
let g:pymode_rope_completion = 1
let g:pymode_rope_complete_on_dot = 0

nnoremap <Leader>pyl :PymodeLintAuto<CR>

" Elm VIM Plugins
Plug 'ElmCast/elm-vim'
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" Vim Colorschemes
Plug 'dracula/vim'

call plug#end()

" ESC key remap
let g:easyescape_chars = { "j": 1, "k": 1}

" Disable swap files
set noswapfile

" Ale configuration - automatic formatting on save
autocmd bufwritepost *.js silent !standard --fix %
set autoread
let g:ale_fix_on_save = 1

" Enable vim-jsx on .js files also
let g:jsx_ext_required = 0
let g:xml_syntax_folding = 1

" Colorscheme is dracula
colorscheme dracula
let g:airline_theme = 'codedark'

" Customize Netrw - built-in file browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 " Open file in horizontal split
let g:netrw_altv = 1
let g:netrw_winsize = 18 " Window size
set autochdir
map <C-n> :NERDTreeToggle<CR>

" Salt Stack stuff - open .sls files with yaml syntax
au BufRead,BufNewFile *.sls set filetype=yaml

" Integration for grep
function! GrepFind(str)
  execute "grep -rnw " . getcwd() . " -e " . a:str . " --exclude-dir={build, node_modules, public}" 
endfunction
