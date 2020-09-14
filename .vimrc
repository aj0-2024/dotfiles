set nocompatible

set colorcolumn=100
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
nnoremap <Leader>s :w<CR>
nnoremap <Leader>i :TsuImport<CR>


" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" vim-plug setup
call plug#begin('~/.vim/plugged')

" ESC key remap
Plug 'zhou13/vim-easyescape'
let g:easyescape_chars = { "j": 1, "k": 1}

" Copy with system's clipboard
Plug 'christoomey/vim-system-copy'

" Custom bar at the bottom
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Git plugins
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" Fuzzy file search
" Check fzf docs for dependencies
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :<C-u>FZF<CR> 

Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git']

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" Commenting
Plug 'preservim/nerdcommenter'

" File browsing
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

" Graphql
Plug 'jparise/vim-graphql'

" Relative numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Yaml
Plug 'stephpy/vim-yaml'

" Elm VIM Plugins
Plug 'ElmCast/elm-vim'
let g:elm_jump_to_error = 1
let g:elm_make_show_warnings = 1
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 0
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 1

" syntastic Elm recommendations
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:elm_syntastic_show_warnings = 1

" Async lite engine 
set autoread
Plug 'dense-analysis/ale'
let g:ale_linters_explicit = 1
let g:ale_linters = {
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier']
\}
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier']
\}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

call plug#end()


" Disable swap files
set noswapfile

" Colorscheme 
colorscheme desert
let g:airline_theme = 'dark'

" Term gui
if (has("+termguicolors"))
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

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
hi Normal     cterm=NONE ctermbg=NONE

