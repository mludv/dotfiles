let g:mapleader = "\<Space>"

" Don't try to be vi compatible
set nocompatible

" Enable mouse
set mouse=a

" Helps force plugins to load correctly when it is turned back on below
filetype off

"  Load plugins here
call plug#begin('~/.vim/plugged')
Plug 'iCyMind/NeoSolarized'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-vinegar'            " Extends netrw
Plug 'tpope/vim-dispatch'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/vim-peekaboo' " Shows registers in sidebar
Plug 'junegunn/gv.vim'
Plug 'vim-scripts/ReplaceWithRegister' " `gr` to replace from register
Plug 'ntpeters/vim-better-whitespace'
Plug 'itchyny/lightline.vim'

" Plug 'zxqfl/tabnine-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'Konfekt/FastFold'             " Fast automatic folding
Plug 'tmhedberg/SimpylFold'         " Python folding
Plug 'vim-python/python-syntax'     " Better Python syntax
Plug 'pangloss/vim-javascript'      " JS folding
Plug 'HerringtonDarkholme/yats.vim' " Typescript syntax
Plug 'MaxMEllon/vim-jsx-pretty'     " JSX
Plug 'janko-m/vim-test'             " test runner
Plug 'benmills/vimux'               " Open tmux pane
Plug 'psf/black'
call plug#end()

let g:lightline = {
    \ 'colorscheme': 'solarized',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'cocstatus': 'coc#status'
	\ },
\ }
set noshowmode
let g:python_host_prog = '/Users/max/.pyenv/versions/neovim2/bin/python'
let g:python3_host_prog = '/Users/max/.pyenv/versions/neovim3/bin/python'
let g:python_highlight_all = 1
let g:dispatch_compilers = {
    \ 'pytest': 'pytest'}

" For plugins to load correctly
filetype plugin indent on

" Tags
command! MakePyTags !ctags -R --python-kinds=-i --languages=Python .
command! AddToPyTags !ctags -aR --python-kinds=-i (pyenv prefix)/lib/python*/site-packages/<cword><cr>

" Common
nnoremap <silent> <leader>s :vsplit<CR>
nnoremap <silent> <leader>h :split<CR>
nnoremap <silent> <leader>t :split<CR>:terminal<CR>:setlocal nonumber<CR>i

" Vim test mappings
nnoremap <silent> <leader>1 :TestNearest -vv<CR>
nnoremap <silent> <leader>2 :TestFile -vv<CR>
nnoremap <silent> <leader>3 :TestSuite<CR>
nnoremap <silent> <leader>4 :TestLast<CR>
nnoremap <silent> <leader>5 :TestLast --pdb<CR>
let test#strategy = "vimux"
let test#python#runner = "pytest"

" Format
nnoremap <silent> <leader>b :Black<CR>

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
command! -bang LibFiles call fzf#vim#files($VIRTUAL_ENV . "/lib/python3.6/site-packages", <bang>0)
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

" Make `s` work as d but without putting deletions in the unnamed register
nnoremap s "_d
nnoremap ss "_dd
nnoremap S "_S

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
set noshowmode
set showcmd

" Searching
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

" Yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" set background=dark
if has("termguicolors")
    set termguicolors
endif
colorscheme NeoSolarized
highlight! VertSplit ctermbg=NONE guibg=NONE

" SNIPPETS
nnoremap <leader>,html :-1read $HOME/.vim/.skeleton.html<cr>3jwf>a

" Zip Right
"
" Moves the character under the cursor to the end of the line.  Handy when you
" have something like:
"
"     foo
"
" And you want to wrap it in a method call, so you type:
"
"     println()foo
"
" Once you hit escape your cursor is on the closing paren, so you can 'zip' it
" over to the right with this mapping.
"
" This should preserve your last yank/delete as well.
nnoremap zl :let @z=@"<cr>x$p:let @"=@z<cr>

" =================== Coc =======================

set shortmess+=c  " Don't show completion messages
" set cmdheight=2   " More space for showing messages
set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>p  <Plug>(coc-format-selected)
nmap <leader>p  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
" nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
" nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
" nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
" nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
" nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
" nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
" nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
" nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
" nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
