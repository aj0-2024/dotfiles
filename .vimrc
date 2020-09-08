set nocompatible

set colorcolumn=80
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
set tabstop=4
set expandtab

" Indent with '>'
set shiftwidth=4
set autoindent

" Code Folding
set nofoldenable
set foldcolumn=2

" Paste toggle
set pastetoggle=<F2>

" Leader commands  
let mapleader = "\\"                           
nnoremap <Leader>q :wq<CR>
nnoremap <Leader><C-r> :source ~/.vimrc<CR>
" Substitute under the word where cursor is
nnoremap <Leader>rep :%s/\<<C-r><C-w>\>/
" nnoremap <Leader>s :w <bar> !elm-format --elm-version=0.19 --yes %:p<CR><CR>
nnoremap <Leader>s :w<CR>
nnoremap <Leader>i :TsuImport<CR>

" CtrlP Options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_root_markers = ['ctrl-p-marker.vim'] 
let g:ctrlp_custom_ignore = {
  \ 'dir': '\v[\/](node_modules|git|elm-stuff)$'
  \ }
set wildignore +=*/node_modules/*,*/elm-stuff*/
nnoremap <leader>. :CtrlPTag<cr>

" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" vim-plug setup
call plug#begin('~/.vim/plugged')

Plug 'zhou13/vim-easyescape'
Plug 'christoomey/vim-system-copy'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

Plug 'kien/ctrlp.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'scrooloose/nerdcommenter'

" Netrw - built-in file browser
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4 " Open file in horizontal split
let g:netrw_altv = 1
let g:netrw_winsize = 18 " Window size
set autochdir
map <C-n> :NERDTreeToggle<CR>

Plug 'tpope/vim-surround'
Plug 'tomasiser/vim-code-dark'
Plug 'haishanh/night-owl.vim'

" Graphql
Plug 'jparise/vim-graphql'

" Fish shell plugins
Plug 'dag/vim-fish'
 
" Javascript VIM Plugins
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jelera/vim-javascript-syntax'
Plug 'isruslan/vim-es6'
" Plug 'vim-syntastic/syntastic'
Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'stephpy/vim-yaml'
Plug 'mattn/emmet-vim'

" Typescript VIM Plugins
Plug 'leafgarland/typescript-vim'

" Python VIM Plugins

" Elm VIM Plugins
Plug 'ElmCast/elm-vim'
let g:elm_jump_to_error = 1
let g:elm_make_show_warnings = 1
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" w0rp/Ale
" Ale configuration - automatic formatting on save
Plug 'w0rp/ale'
autocmd bufwritepost *.js silent !standard --fix %
set autoread
let g:ale_linters_explicit = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:ale_typescript_tsserver_config_path = 'tsconfig.app.json'
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier']
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
nnoremap <Leader>f :ElmFormat<CR>

" syntastic elm recommendations
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

" Vim Colorschemes
Plug 'flazz/vim-colorschemes'
Plug 'ayu-theme/ayu-vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'jacoborus/tender.vim'
Plug 'jdsimcoe/abstract.vim'

" Time Tracking
Plug 'wakatime/vim-wakatime'

call plug#end()

" ESC key remap
let g:easyescape_chars = { "j": 1, "k": 1}

" Disable swap files
set noswapfile

" Enable vim-jsx on .js files also
let g:jsx_ext_required = 0
let g:xml_syntax_folding = 1

" Colorscheme 
colorscheme night-owl
let g:airline_theme = 'dark'

" Term gui
if (has("+termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif




" Salt Stack stuff - open .sls files with yaml syntax
au BufRead,BufNewFile *.sls set filetype=yaml

" Integration for grep
function! GrepFind(str)
  execute "grep -rnw " . getcwd() . " -e " . a:str . " --exclude-dir={build, node_modules, public}" 
endfunction

" per project .vimrc files
" set exrc
" set secure
set tags=./tags,tags;$HOME


" Resize panes
nnoremap <silent> <Leader>= :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>

" Move more easily
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Only color comments
set background=dark
highlight clear
if exists("syntax_on")
    syntax reset
endif

let colors_name = "comments"

" First set Normal to regular white on black text colors:
hi Normal ctermfg=LightGray ctermbg=Black guifg=#dddddd	guibg=Black

" Syntax highlighting (other color-groups using default, see :help group-name):
hi Comment    cterm=NONE ctermfg=08
hi Constant   cterm=NONE ctermfg=White
hi Identifier cterm=NONE ctermfg=White
hi Function   cterm=NONE ctermfg=White
hi Statement  cterm=NONE ctermfg=White
hi PreProc    cterm=NONE ctermfg=White
hi Type	      cterm=NONE ctermfg=White
hi Special    cterm=NONE ctermfg=White
hi Delimiter  cterm=NONE ctermfg=White

