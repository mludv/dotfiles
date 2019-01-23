let g:mapleader = "\<Space>"

" Don't try to be vi compatible
set nocompatible

" Enable mouse
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

"  Load plugins here
call plug#begin('~/.vim/plugged')
Plug 'icymind/NeoSolarized'
Plug 'nvie/vim-flake8'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'justinmk/vim-sneak'  " s + two characters to jump
Plug 'kshenoy/vim-signature'
Plug 'vimwiki/vimwiki'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-dadbod'
Plug 'ntpeters/vim-better-whitespace'
Plug 'zxqfl/tabnine-vim'
Plug 'Konfekt/FastFold' " Fast automatic folding
Plug 'tmhedberg/SimpylFold' " Python folding
Plug 'janko-m/vim-test'
Plug 'kassio/neoterm'  " Open same terminal
Plug 'benmills/vimux'  " VimuxRunCommand
call plug#end()

" Common
nnoremap <silent> <leader>s :vsplit<CR>
nnoremap <silent> <leader>h :split<CR>
nnoremap <silent> <leader>t :split<CR>:terminal<CR>:setlocal nonumber<CR>i

" Windows
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" Vim test mappings
nnoremap <silent> <leader>1 :TestNearest<CR>
nnoremap <silent> <leader>2 :TestFile<CR>
nnoremap <silent> <leader>3 :TestSuite<CR>
nnoremap <silent> <leader>4 :TestLast<CR>
nnoremap <silent> <leader>5 :TestVisit<CR>
let test#strategy = "vimux"
let test#python#runner = "pytest"
let test#python#pytest#executable = "docker exec -it django ./manage.py test -- --reuse-db"


" Vimux
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
nnoremap <silent> <leader>g :GFiles<CR>
nnoremap <silent> <leader>a :Buffers<CR>
nnoremap <silent> <leader>A :Windows<CR>

" Whitespace
nnoremap <leader>c :StripWhitespace<CR>

" Easy Align
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" Command for using ripgrep and fzf to search in files
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)

" Turn on syntax highlighting
syntax on

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
set number

" Show file stats
set ruler

" Hide python files in netrw
let g:netrw_list_hide='.*\.pyc$,^__pycache__/$'

" Blink cursor on error instead of beeping (grr)
" set visualbell

" Encoding
set encoding=utf-8

" Linewrap
set cc=80
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

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

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


" Color scheme (terminal)
" set t_Co=256
" set background=dark
" let g:solarized_termcolors=16
" let g:solarized_termtrans=1
" " put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
 " in ~/.vim/colors/ and uncomment:
" colorscheme solarized

let &t_8f="\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b="\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors

set background=dark
colorscheme NeoSolarized
