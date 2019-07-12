set nocompatible
source $HOME/.vim/rc/general.vim
source $HOME/.vim/rc/mappings.vim
source $HOME/.vim/rc/plugins.vim
source $HOME/.vim/rc/ui.vim

silent! if plug#begin('~/.vim/plugged')
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'

Plug 'flazz/vim-colorschemes'

"Plug 'w0rp/ale'
"Plug 'SirVer/ultisnips'
"Plug 'prabirshrestha/asyncomplete.vim'
call plug#end()
endif

set backspace=2
set nocompatible

filetype plugin indent on
set tabstop=4
set shiftwidth=4

filetype indent plugin on

set completeopt=menuone,noinsert,noselect,preview
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1


let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

let g:omnicomplete_fetch_full_documentation = 1

let g:ale_linters = { 'cs': ['OmniSharp'] }
