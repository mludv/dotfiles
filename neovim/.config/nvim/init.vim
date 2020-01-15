let g:mapleader = "\<Space>"

" Don't try to be vi compatible
set nocompatible


" Enable mouse
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

"  Load plugins here
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'
Plug 'ntpeters/vim-better-whitespace'
Plug 'zxqfl/tabnine-vim'
Plug 'Konfekt/FastFold' " Fast automatic folding
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'vim-python/python-syntax'
Plug 'pangloss/vim-javascript'  " JS folding
Plug 'HerringtonDarkholme/yats.vim'  " Typescript syntax
Plug 'mxw/vim-jsx'
Plug 'janko-m/vim-test'  " test runner
Plug '5long/pytest-vim-compiler'
Plug 'tpope/vim-dispatch'
call plug#end()

let g:python_highlight_all = 1
let g:dispatch_compilers = {
    \ 'pytest': 'pytest'}

" For plugins to load correctly
filetype plugin indent on

" Tags
command! MakePyTags !ctags -R --python-kinds=-i --languages=Python .
command! AddToPyTags !ctags -aR --python-kinds=-i $VIRTUAL_ENV/lib/python*/site-packages/<cword><cr>

" Common
nnoremap <silent> <leader>s :vsplit<CR>
nnoremap <silent> <leader>h :split<CR>
nnoremap <silent> <leader>t :split<CR>:terminal<CR>:setlocal nonumber<CR>i

" Windows
tnoremap <C-h> <C-\><C-N><C-w>h
tnoremap <C-j> <C-\><C-N><C-w>j
tnoremap <C-k> <C-\><C-N><C-w>k
tnoremap <C-l> <C-\><C-N><C-w>l
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Vim test mappings
nnoremap <silent> <leader>1 :TestNearest<CR>
nnoremap <silent> <leader>2 :TestFile<CR>
nnoremap <silent> <leader>3 :TestSuite<CR>
nnoremap <silent> <leader>4 :TestLast<CR>
nnoremap <silent> <leader>5 :TestVisit<CR>
let test#strategy = "dispatch"
let test#python#runner = "pytest"

" Esc in terminal
tnoremap <Esc> <C-\><C-n>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>

" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>j :Lines<CR>
nnoremap <silent> <leader>A :Windows<CR>

" Command for using ripgrep and fzf to search in files
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" FZF custom search (modify dir for current alternative path)
command! -bang LibFiles call fzf#vim#files($VIRTUAL_ENV . "/lib/python3.7/site-packages", <bang>0)
nnoremap <silent> <leader>v :LibFiles<CR>

" Whitespace
nnoremap <leader>c :StripWhitespace<CR>

" Folding
set foldmethod=syntax
set foldlevelstart=0
let javaScript_fold=1         " JavaScript

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Turn on syntax highlighting
syntax on

" Use <leader>w to toggle whitespace highlighting
nnoremap <silent> <leader>w :ToggleWhitespace<CR>

" Remove YCM preview window
set completeopt-=preview

" Turn off backup files
set nobackup
set nowritebackup
set noswapfile

" Split naturally
set splitbelow
set splitright

" Security
set modelines=0

" Show line numbers
set nonumber

" Show file stats
set ruler

" Hide python files in netrw
let g:netrw_list_hide='.*\.pyc$,^__pycache__/$'

" Encoding
set encoding=utf-8

" Linewrap
set cc=88
set wrap

" Whitespace
set textwidth=79
set formatoptions=qrn1
set tabstop=4
set shiftwidth=4
set softtabstop=0
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
"nnoremap / /\v
"vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

" Python - run flake8
autocmd FileType python map <leader>8 :call Flake8()<CR>
let g:flake8_show_in_gutter=0
let g:flake8_show_in_file=0

" Scss -> use css folding
autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

set background=dark
colorscheme solarized
highlight! VertSplit ctermbg=NONE guibg=NONE
