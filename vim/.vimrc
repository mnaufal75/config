set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-commentary' " Easy commenting
Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'pangloss/vim-javascript' " Js hightlight
Plugin 'mxw/vim-jsx' " Jsx highlight
Plugin 'joshdick/onedark.vim' " One Dark Theme
Plugin 'Yggdroot/indentLine' " Show indentation line
Plugin 'junegunn/fzf' " Fuzzy finder
Plugin 'junegunn/fzf.vim'
Plugin 'ryanoasis/vim-devicons' " Icon on Vim

call vundle#end()

set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set number
set relativenumber
set undofile
set mouse=a

" Turn off backup
set nobackup
set nowb
set noswapfile

au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

highlight BadWhitespace ctermbg=red guibg=darkred
au BufNewFile,BufRead *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

au FileType javascript setlocal formatprg=prettier
au FileType javascript.jsx setlocal formatprg=prettier
au FileType typescript setlocal formatprg=prettier\ --parser\ typescript
au FileType html setlocal formatprg=js-beautify\ --type\ html
au FileType css setlocal formatprg=prettier\ --parser\ css

let mapleader = ','

" Remap ESC to ii
inoremap jk <Esc>
" Disable ESC key in Insert mode
inoremap <Esc> <nop>

" Disable arrow keys in Normal mode
nnoremap <Up> <Nop>
nnoremap <Down> <Nop>
nnoremap <Left> <Nop>
nnoremap <Right> <Nop>

" Disable arrow keys in Insert mode
inoremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Left> <Nop>
inoremap <Right> <Nop>

"""""""""""
"  Theme  "
"""""""""""
" Black theme
set background=dark

" Add underline syntax details
syntax enable

" Set color scheme
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#69747C","cterm": "245", "cterm16": "8"},
\ "gutter_fg_grey": { "gui": "#69747C", "cterm": "245", "cterm16": "8"}
\}
let g:onedark_terminal_italics = 1
colorscheme onedark 

""""""""""""""""""""
"  NerdTreeToogle  "
""""""""""""""""""""
" Activate with <F3>
nmap <silent> <F3> :NERDTreeToggle<CR>

" Make NERDTree Prettier
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

"""""""""
"  FZF  "
"""""""""
" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

nnoremap <silent> <leader>f :GFiles<CR> " Search for file in git project
nnoremap <silent> <leader>F :Files<CR> " Search for file
nnoremap <silent> <leader>b :Buffers<CR> " List all buffers
nnoremap <silent> <leader>l :BLines<CR> " Search line on current buffer
nnoremap <silent> <leader>L :Lines<CR> " Search line on all loaded buffers
nnoremap <silent> <leader>/ :Ag<CR> " Search on all project
nnoremap <silent> <leader>gs :GFiles?<CR> " Search for git status

""""""""""""""""""
" Vim-commentary "
""""""""""""""""""
autocmd FileType python setlocal commentstring=#\ %s
