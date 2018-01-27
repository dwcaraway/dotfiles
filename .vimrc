""" BEGIN: Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
""" END: Pathogen

set nocompatible

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/__pycache__/*,*.pyc     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe,*\\node_modules\\*,*.pyc  " Windows

" enable syntax highlighting
syntax on

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
autocmd FileType javascript setlocal shiftwidth=2 softtabstop=2 ts=2 expandtab
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
let NERDTreeIgnore = ['\.pyc$', '.git', '__pycache__', '.vagrant', 'build', 'archive', 'dist', '\.egg.*', 'node_modules']

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

""" CTRL+P should show hidden files
let g:ctrlp_show_hidden = 1

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
