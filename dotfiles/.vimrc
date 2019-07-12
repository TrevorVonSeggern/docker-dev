source $HOME/.vim/rc/plugins.vim
source $HOME/.vim/rc/general.vim
source $HOME/.vim/rc/mappings.vim
source $HOME/.vim/rc/ui.vim

call plug#begin('~/.vim/plugged')
" Ui
Plug 'flazz/vim-colorschemes'
Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'

" C#
Plug 'OmniSharp/omnisharp-vim'
Plug 'w0rp/ale'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'janko/vim-test'
Plug 'tpope/vim-dispatch'

" General editing
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'

call plug#end()


filetype plugin indent on
filetype indent plugin on

set completeopt=menuone,noinsert,noselect,preview
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_auto_completeopt = 0
let g:asyncomplete_force_refresh_on_context_changed = 1

let g:OmniSharp_server_stdio = 1
let g:OmniSharp_highlight_types = 2

let g:test#csharp#runner='dotnettest'
let test#strategy = "dispatch"

" This adds a large preview split screen on the top of the terminal
" let g:omnicomplete_fetch_full_documentation = 1

let g:ale_linters = { 'cs': ['OmniSharp'] }

" supertab config
let g:SuperTabDefaultCompletionType = "<c-n>"

" nerdtree config
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
map <C-w><C-w> :NERDTreeToggle %<CR> " ctrl ww opens nerdtree
