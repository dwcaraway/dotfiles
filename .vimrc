""" BEGIN: Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
""" END: Pathogen

set nocompatible

" enable syntax highlighting
syntax on

""" BEGIN: Auto relativenumber
if has('autocmd')
augroup vimrc_linenumbering
    autocmd!
    autocmd WinLeave *
                \ if &number |
                \   set norelativenumber |
                \ endif
    autocmd BufWinEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
    autocmd VimEnter *
                \ if &number |
                \   set relativenumber |
                \ endif
augroup END
endif
""" END: Auto relativenumber

"(dont have autocmd setup yet) Set relative and absolute number toggle for Vim"
set relativenumber
set number

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

" show the matching part of the pair for [] {} and ()
set showmatch

" enable all Python syntax highlighting features
let python_highlight_all = 1

set ts=2 sw=2 expandtab "Set the default spacing Ruby on Rails style, 2 spaces per indentation level"
autocmd FileType ruby setlocal shiftwidth=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 softtabstop=4
filetype plugin indent on
set omnifunc=syntaxcomplete#Complete

set clipboard=unnamed
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>
let mapleader=","
inoremap jj <ESC>

set backupdir=/tmp
set directory=/tmp

" Filter out file types from nerdtree "
let NERDTreeIgnore = ['\.pyc$', '.git', '__pycache__', '.vagrant']

"NERDTree settings"
"-- automatically open nerdtree if vim has no files specified on startup"
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

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

""" BEGIN: Syntastic shellcheck/pylint
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
if system('command -v ansible-lint') != ''
  let g:syntastic_ansible_ansible_lint_exec = '/usr/bin/ansible-lint'
  let g:syntastic_ansible_checkers = ['ansible_lint']
endif
if system('command -v yamllint') != ''
  let g:syntastic_yaml_checkers = ['yamllint']
endif

"let g:syntastic_python_python_exec = '/usr/bin/python3'
""let g:syntastic_python_checkers = ['python']
""" END: Syntastic

