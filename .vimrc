set nocompatible

" Ruler
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
set encoding=UTF-8


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
set smartindent

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

" Ctags
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set tags=~/mytags

" vim-plug setup
call plug#begin('~/.vim/plugged')

" Yank history
Plug 'svermeulen/vim-yoink'

" swap the most recent paste around in yank history
nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Cycle thorugh history
nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

" Swap the most recent paste around yank history
nmap <c-h> <plug>(YoinkPostPasteSwapBack)
nmap <c-y> <plug>(YoinkPostPasteSwapForward)

" Fancy
Plug 'mhinz/vim-signify'
Plug 'yggdroot/indentline'
let g:indentLine_char_list = ['┆']
let g:indentLine_enabled = 0

" ESC key remap
Plug 'zhou13/vim-easyescape'
let g:easyescape_chars = { "j": 1, "k": 1}

" Copy with system's clipboard
Plug 'christoomey/vim-system-copy'

" Custom bar at the bottom
Plug 'itchyny/lightline.vim'

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
nnoremap <C-s> :Ag<CR>

" Set root directory for a project
Plug 'airblade/vim-rooter'
let g:rooter_patterns = ['.git']

" Tmux
Plug 'tmux-plugins/vim-tmux-focus-events'

" Commenting
Plug 'preservim/nerdcommenter'

" File browsing
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
let g:NERDTreeWinSize=35
set autochdir
map <C-n> :NERDTreeToggle<CR>
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

" Brackets
Plug 'tpope/vim-surround'

" Relative numbers
Plug 'jeffkreeftmeijer/vim-numbertoggle'

" Yaml
Plug 'stephpy/vim-yaml'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'mzlogin/vim-markdown-toc'


" Language check
Plug 'rhysd/vim-grammarous'
Plug 'dpelle/vim-languagetool'

" Async lite engine 
set autoread
Plug 'dense-analysis/ale'
let g:ale_enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_sign_column_always = 1
let g:airline#extensions#ale#enabled = 1
let g:ale_linters = {
\   'typescript': ['tsserver'],
\   'typescriptreact': ['tsserver'],
\   'elm': ['elm-ls'],
\   'python': ['flake8', 'pylint'],
\   'json': ['prettier'],
\   'go': ['golangci-lint']
\}
let g:ale_fixers = {
\   'typescript': ['prettier'],
\   'typescriptreact': ['prettier'],
\   'javascript': ['prettier'],
\   'css': ['prettier'],
\   'html': ['prettier'],
\   'elm': ['elm-format'],
\   'python': ['yapf'],
\   'markdown': ['prettier'],
\   'json': ['prettier'],
\   'go': ['golangci-lint']
\}
nnoremap <silent> <Leader>f :ALEFix<CR>

" navigate to next errors quickly
nnoremap <silent> <C-k> <Plug>(ale_previous_wrap)
nnoremap <silent> <C-j> <Plug>(ale_next_wrap)


" Test
Plug 'vim-test/vim-test'

" TODO, FIXME
Plug 'gilsondev/searchtasks.vim'

" tags 
Plug 'universal-ctags/ctags'
Plug 'preservim/tagbar'
nmap <F8> :TagbarToggle<CR>
autocmd FileType go,python TagbarOpen

" Comments
Plug 'preservim/nerdcommenter'

" custom plugins
Plug '~/dotfiles/my-vim-plugins/elm-mdl-to-mdc'

" Go lang 
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" colorscheme
Plug 'haishanh/night-owl.vim'

" spell check with camelcase
Plug 'kamykn/spelunker.vim'

" snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsListSnippets="<c-l>"

" Repeat last commands
Plug 'tpope/vim-repeat'

call plug#end()

" disable the built in spell check
set nospell

" Disable swap files
set noswapfile

" Colorscheme 
colorscheme night-owl
let g:lightline = {'colorscheme': 'nightowl'}

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

" Ruler
highlight ColorColumn ctermbg=8

" change to underline
hi clear SpellBad
hi SpellBad cterm=underline

