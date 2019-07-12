set encoding=utf-8
set history=1000                                    "number of command lines to remember
set ttyfast                                         "assume fast terminal connection
set viewoptions=folds,options,cursor,unix,slash     "unix/windows compatibility

call plug#begin('~/.vim/plugged')

Plug 'flazz/vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

" Theme
set t_Co=256
set t_ut=
colorscheme codedark

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme = 'codedark'
set noshowmode

" Show line numbers
set number

set listchars=eol:$,tab:>-,trail:~,extends:>,precedes:<
