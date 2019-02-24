"########## Plugins #########

""" BEGIN: Vim-plug automatic installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
""" END: Vim-plug

""" BEGIN: vim plugin declaration
call plug#begin('~/.vim/bundle')
Plug 'w0rp/ale'
Plug 'vim-airline/vim-airline'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'mattn/emmet-vim'

" Nice to have? these insert snippets for javascript
" see https://www.youtube.com/watch?v=LoF-7GJOdVo
" Plug 'SirVer/ultisnips'
" Plug 'epilande/vim-es2015-snippets'
" Plug 'epilande/vim-react-snippets'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mileszs/ack.vim'
Plug 'Valloric/MatchTagAlways'
" Trigger post install script for YouCompleteMe
" see
" https://github.com/junegunn/vim-plug#post-update-hooks
" Plug 'Valloric/YouCompleteMe', { 'do': './install.sh' }
Plug 'Raimondi/delimitMate'
Plug 'ervandew/supertab'
Plug 'ntpeters/vim-better-whitespace'
" Disabled, not doing Ruby development
" Plug 'tpope/vim-bundler'
" Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'pearofducks/ansible-vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
call plug#end()
""" END: vim plugins declaration

"########## Editor #########
"

" Set colorscheme
colorscheme elflord

set nocompatible

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/__pycache__/*,*.pyc,*/staticfiles/*,'*/static/*'     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*,*.pyc,*\\staticfiles\\*,'*\\static\\*'  " Windows

" enable syntax highlighting
syntax on

" Opens quickfix window after any grep invocation
autocmd QuickFixCmdPost *grep* cwindow

" turn hybrid line numbers on
set number
set relativenumber

" indent when moving to the next line while writing code
set autoindent

" search incrementally as typing occurs
set incsearch

" highlight the string matched by the search
set hlsearch

" case sensitivity when searching
set ignorecase
set smartcase

" show a visual line under the cursor's current line
set cursorline

" briefly jump to matching pair for [] {} and ()
" set showmatch
" But turn off the default matchparen plugin (on demand)
" Use this to disable the matchparen plugin entirely
let loaded_matchparen = 1

" enable all Python syntax highlighting features
let python_highlight_all = 1

autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2 ts=2 expandtab
autocmd FileType html setlocal shiftwidth=2 softtabstop=2 ts=2 expandtab
autocmd FileType xhtml setlocal shiftwidth=2 softtabstop=2 ts=2 expandtab
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 ts=2 expandtab
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 ts=2 expandtab
autocmd FileType python setlocal shiftwidth=4 softtabstop=4 ts=4 expandtab

filetype plugin indent on
set ts=2 sw=2 expandtab

set omnifunc=syntaxcomplete#Complete

set clipboard=unnamed
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
let mapleader=","
inoremap jj <ESC>

set backupdir=/tmp
set directory=/tmp

" Filter out file types from nerdtree "
let NERDTreeIgnore = ['\.pyc$', '.git', '__pycache__', '.vagrant', 'build', 'archive', 'dist', '\.egg.*', 'node_modules', 'public', '.cache']

"-- map NERDTREE to CTRL+n"
map <C-n> :NERDTreeToggle<CR>

"-- map NERDTreeFind to CTRL+m"
map <C-m> :NERDTreeFind<CR>

" BEGIN: NERDcommenter settings
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" END: NERDcommenter

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"split default to right and bottom
set splitbelow
set splitright

""" BEGIN: quickly move line or block up or down with ALT+(j or k)"

"have to remap ALT+J and ALT+k for mac
" <ALT+j> ==> ∆
" <ALT+k> ==> ˚

nnoremap  ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv
""" END: Quickly move line or block up or down

""" CTRL+P should show hidden files
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc$|node_modules$\|DS_Store$\|public$\|\.cache$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }

""" BEGIN: VIM-Javascript plugin
let g:javascript_plugin_flow = 1
""" END: VIM-Javascript plugin

"""BEGIN: VIM-JSX Plugin for react

" By default, JSX syntax highlighting and indenting will be enabled only for
" files with the JSX extension. Set to 0 to allow JSX in a '.js' file
let g:jsx_ext_required=0

""" END: VIM-JSX Plugin for React


""" BEGIN: Ale plugins
" ALE by default runs all linters and fixers for all languages
" instead, let's tell ALE to only run linters explicitly configured
" let g:ale_linters_explicit = 1
"
let g:ale_fixers = {
    \ 'javascript': ['prettier'],
    \ 'css': ['prettier'],
    \ 'json': ['prettier'],
    \}

let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

" Enable ESLint only for JavaScript
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \}

" Display error information on status bar
let g:airline#extensions#ale#enabled = 1
""" END: ALE plugin

""" BEGIN: Better Whitespace plugin """
let g:strip_whitespace_on_save = 1
let g:strip_whitespace_confirm=1
""" END: Better Whitespace plugin """

""" BEGIN: Match Tag Always plugin

let g:mta_filetypes = {
    \ 'html' : 1,
    \ 'xml' : 1,
    \ 'jinja' : 1,
    \ 'javascript.jsx': 1,
    \}
""" END: Match Tag Always plugin


""" BEGIN: Vim indent guides
" have indent guides enabled by default
" optionally, can disable and use the <Leader>ig toggle
let g:indent_guides_enable_on_vim_startup =0
""" END: VIM indent guides
