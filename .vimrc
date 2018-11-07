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
Plug 'pearofducks/ansible-vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ervandew/supertab'
Plug 'vim-airline/vim-airline'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'w0ng/vim-hybrid'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'skalnik/vim-vroom'
Plug 'tpope/vim-unimpaired'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mileszs/ack.vim'
Plug 'Chiel92/vim-autoformat'
Plug 'tpope/vim-ragtag'
Plug 'tpope/vim-rbenv'
Plug 'vim-ruby/vim-ruby'
Plug 'flazz/vim-colorschemes'
Plug 'mattn/emmet-vim'
Plug 'takac/vim-hardtime'
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

""" BEGIN: Auto relativenumber
" if has('autocmd')
" augroup vimrc_linenumbering
    " autocmd!
    " autocmd WinLeave *
                " \ if &number |
                " \   set norelativenumber |
                " \ endif
    " autocmd BufWinEnter *
                " \ if &number |
                " \   set relativenumber |
                " \ endif
    " autocmd VimEnter *
                " \ if &number |
                " \   set relativenumber |
                " \ endif
" augroup END
" endif
"""" END: Auto relativenumber

" On start, display numbers and, assuming we'll be moving, enable relative
" number
set number
set relativenumber

" above autocommands for relative and absolute number not working, trying this
" switch to absolute number when Vim loses focus
:au FocusLost * :set number
:au FocusGained * :set relativenumber

" set to number mode on insert, relative mode when moving
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber

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
set ts=4 sw=4 expandtab

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

"NERDTree settings"
"-- automatically open nerdtree if vim has no files specified on startup"
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

"-- map NERDTREE to CTRL+n"
map <C-n> :NERDTreeToggle<CR>

"NERDcommenter settings"

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code
" let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a
" region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

""" Remove trailing whitespaces:
autocmd BufWritePre * :%s/\s\+$//e

""" BEGIN: Highlight trailing whitespace but not in INSERT
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()
""" END: Highlight trailing whitespace

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

""" NEOVIM python settings """
" let g:python_host_prog = "/Users/dave/.pyenv/versions/neovim2/bin/python"
" let g:python3_host_prog = "/Users/dave/.pyenv/versions/neovim3/bin/python"

""" Javascript plugin """
let g:javascript_plugin_flow = 1
let g:jsx_ext_required = 0

"""BEGIN: VIM-JSX Plugin for react """

""" By default, JSX syntax highlighting and indenting will be enabled only for
""" files with the JSX extension. Set to 0 to allow JSX in a '.js' file
let g:jsx_ext_required=0
"
""" END: VIM-JSX Plugin for React"""


""" Ale syntax plugins """
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 0

""" Vim-hardtime """
" To enable hardtime to ignore certain buffer patterns set
let g:hardtime_ignore_buffer_patterns = [ "CustomPatt[ae]rn", "NERD.*" ]

" The quickfix window cannot be added to the ignore buffers array to have
" hardtime ignore it set
let g:hardtime_ignore_quickfix = 1

""" END: Vim-hardtime
