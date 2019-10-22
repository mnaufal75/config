set nocompatible
filetype off

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary' " Easy commenting
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'pangloss/vim-javascript' " Js hightlight
Plug 'maxmellon/vim-jsx-pretty' " Jsx highlight
Plug 'joshdick/onedark.vim' " One Dark Theme
Plug 'Yggdroot/indentLine' " Show indentation line
Plug 'junegunn/fzf' " Fuzzy finder
Plug 'junegunn/fzf.vim'
Plug 'ryanoasis/vim-devicons' " Icon on Vim
Plug 'iamcco/markdown-preview.nvim' " Markdown
" Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

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

" Better display for messages
set cmdheight=2

" You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

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
" Add underline syntax details
syntax enable

" Set color scheme
let g:onedark_color_overrides = {
\ "comment_grey": {"gui": "#69747C","cterm": "245", "cterm16": "8"},
\ "gutter_fg_grey": { "gui": "#69747C", "cterm": "245", "cterm16": "8"}
\}
let g:onedark_terminal_italics = 1
colorscheme onedark 

" Black theme
set background=dark

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

"""""""
" ALE "
"""""""
" let g:ale_sign_column_always = 1
" let g:ale_fixers = {'javascript': ['prettier', 'eslint']}
" let g:ale_linters = {'javascript': ['eslint']}

" " Enable completion where available.
" " let g:ale_completion_enabled = 1

" " Set this variable to 1 to fix files when you save them.
" let g:ale_fix_on_save = 1

" " Keep the sign gutter open at all time
" let g:ale_sign_column_always = 1

""""""""""""""
"  coc.nvim  "
""""""""""""""
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
