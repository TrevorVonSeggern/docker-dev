" line endings
set fileformats=unix,mac,dos

" tab configuration
set smartindent
set tabstop=4
set softtabstop=4
set shiftwidth=4

" can use backspace
set backspace=indent,eol,start

" sync clipboard
set clipboard=unnamedplus

set wildignore+=*/.git/*,*/.idea/*,*/.DS_Store

" can be used from fish or other terminal
"set shell=sh

set ttimeoutlen=50

" set backups, swapfiles, and other vim directories to be out of the worknig
" directory. Keeps things neat.
set backupdir=.backup/,~/.backup/,/tmp//
set directory=.swp/,~/.swp/,/tmp//
set undodir=.undo/,~/.undo/,/tmp//
