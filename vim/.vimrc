let g:mapleader = "\<Space>"
set nocompatible " don't try to emulate vi
set mouse=a
filetype off " helps force plugins to load correctly when it's turned back on

call plug#begin('~/.vim/plugged')

Plug 'lifepillar/vim-solarized8'

    set termguicolors
    set background=dark
    colorscheme solarized8
    highlight! VertSplit ctermbg=NONE guibg=NONE
call plug#end()

syntax enable
filetype plugin on

set path+=**  " search down subdirectories
set wildmenu  " show options during command autocomplete

" TAGS
command! MakeTags !ctags -R .
command! AddToTags !ctags -aR $VIRTUAL_ENV/lib/python*/site-packages/<cword><cr>

" SNIPPETS
nnoremap <leader>,html :-1read $HOME/.vim/.skeleton.html<cr>3jwf>a
