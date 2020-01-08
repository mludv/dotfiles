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
Plug 'rizzatti/dash.vim'  " Open dash with :dash
Plug 'justinmk/vim-sneak'  " s + two characters to jump
" Plug 'kshenoy/vim-signature'  " better marks support
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
Plug 'mcmire/vim-grakn'  " Grakn syntax
Plug 'mxw/vim-jsx'
Plug 'janko-m/vim-test'  " test runner
Plug 'kassio/neoterm'  " Open same terminal
Plug 'benmills/vimux'  " VimuxRunCommand
Plug 'gdetrez/vim-gf'
Plug 'psf/black'  " use `:Black` to run black formatter
call plug#end()

let g:python_highlight_all = 1

" Black
nnoremap <leader>b :Black<CR>
" autocmd BufWritePre *.py execute ':Black'

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
" let test#strategy = "vimux"
let test#strategy = "neoterm"
let test#python#runner = "pytest"
let test#python#pytest#executable = "docker exec -it django ./manage.py test -- --reuse-db -v"
" let test#python#pytest#executable = "./manage.py test -- --reuse-db -v"


" Vimux
map <leader>r :call VimuxRunCommand("clear; python " . bufname("%"))<CR>
" Prompt for a command to run
map <Leader>vp :VimuxPromptCommand<CR>
" Run last command executed by VimuxRunCommand
map <Leader>vl :VimuxRunLastCommand<CR>
" Inspect runner pane
map <Leader>vi :VimuxInspectRunner<CR>
" Close vim tmux runner opened by VimuxRunCommand
map <Leader>vq :VimuxCloseRunner<CR>
" Interrupt any command running in the runner pane
map <Leader>vx :VimuxInterruptRunner<CR>
" Open IPython
map <leader>ip :VimuxRunCommand "docker exec -it django ./manage.py shell_plus"<CR>
" Send text to REPL
function! VimuxSlime()
 call VimuxSendText(@v)
 call VimuxSendKeys("Enter")
endfunction
" If text is selected, save it in the v buffer and send that buffer it to tmux
vmap <Leader>vs "vy :call VimuxSlime()<CR>

" Esc in terminal
tnoremap <Esc> <C-\><C-n>

" Fugitive
nnoremap <silent> <leader>gs :Gstatus<CR>

" FZF
nnoremap <silent> <leader>f :Files<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>j :Lines<CR>
nnoremap <silent> <leader>A :Windows<CR>

" FZF custom search (modify dir for current alternative path)
command! -bang LibFiles call fzf#vim#files('~/.venvs/chatbot-socket/lib/python3.6/site-packages', <bang>0)
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

" Command for using ripgrep and fzf to search in files
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

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

" For plugins to load correctly
filetype plugin indent on

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

" Blink cursor on error instead of beeping (grr)
" set visualbell

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

" let g:nord_bold = 0

" augroup nord-theme-overrides
"   autocmd!

"   autocmd ColorScheme nord highlight! link djangoTagBlock Tag
"   autocmd ColorScheme nord highlight! link djangoVarBlock Tag
"   autocmd ColorScheme nord highlight! link djangoStatement Character
"   autocmd ColorScheme nord highlight! Folded ctermfg=12 ctermbg=0 guibg=#2e3440
" augroup END

" colorscheme nord
"
set background=dark
colorscheme solarized
highlight! VertSplit ctermbg=NONE guibg=NONE
