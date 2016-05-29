

" files encoding
set encoding=utf8
set ffs=unix,dos,mac

" fold methods
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

" history size
set history=700

" autoread when a file is changed from the outside
set autoread

" set the 80-column mark
set colorcolumn=80

" share clipboard with X
set clipboard=unnamedplus

" leader key
let mapleader = ","
let g:mapleader = ","
set tm=2000
noremap ,, ,
let maplocalleader = "\\"

" the ESC key is so far
:inoremap jk <esc>

" enable backspace
:set backspace=indent,eol,start

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General shortcuts

" editing and sourcing the .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" make
:nnoremap <leader>mm :make<cr>

" open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" spell checking
map <leader>ss :setlocal spell!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle

" set bash as shell (vundle doesn't like non-posix shell)
set shell=bash

set nocompatible
filetype off
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage itself
Plugin 'gmarik/vundle'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Support bundles

Plugin 'shougo/vimproc.vim'
Plugin 'ervandew/supertab'
Plugin 'moll/vim-bbye'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'vim-scripts/gitignore'
Plugin 'majutsushi/tagbar'

nmap <leader>= :TagbarToggle<CR>
let g:tagbar_autofocus = 1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tmux integration

Plugin 'ad0/slimux'
map <Leader>s :SlimuxREPLSendLine<CR>
vmap <Leader>s :SlimuxREPLSendSelection<CR>
map <Leader>a :SlimuxShellLast<CR>
map <Leader>k :SlimuxSendKeysLast<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git

Plugin 'tpope/vim-fugitive'
Plugin 'int3/vim-extradite'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Text manipulation

Plugin 'vim-scripts/gundo'
nmap <silent> <leader>u :GundoToggle<CR>

Plugin 'tpope/vim-commentary'

Plugin 'valloric/youcompleteme'
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/youcompleteme/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_key_list_select_completion = []
let g:ycm_key_list_previous_completion = []
let g:ycm_collect_identifiers_from_tags_files = 1

let g:ycm_semantic_triggers = {'haskell' : ['.']}

Plugin 'sirver/ultisnips'
Plugin 'honza/vim-snippets'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Languages support

"""""""""" Syntastic
Plugin 'scrooloose/syntastic'
map <silent> <Leader>E :Errors<CR>
map <Leader>S :SyntasticToggleMode<CR>

"""""""""" Haskell
Plugin 'neovimhaskell/haskell-vim'
Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'
let g:necoghc_enable_detailed_browse = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

Plugin 'twinside/vim-hoogle'
nnoremap <silent> <leader>hh :Hoogle<CR>
nnoremap <silent> <leader>ho :HoogleInfo<CR>
nnoremap <silent> <leader>hz :HoogleClose<CR>

Plugin 'bitc/vim-hdevtools'
nnoremap <leader>ht :HdevtoolsType<CR>
nnoremap <leader>hc :HdevtoolsClear<CR>
nnoremap <leader>hi :HdevtoolsInfo<CR>

"""""""""" OCaml
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
execute "set rtp+=" . g:opamshare . "/merlin/vim"
nnoremap <silent> <leader>t :MerlinTypeOf<CR>

"""""""""" Scala
Plugin 'derekwyatt/vim-scala'

"""""""""" GLSL
Plugin 'tikhomirov/vim-glsl'

"""""""""" Elm
Plugin 'lambdatoast/elm.vim'

"""""""""" AVR
Plugin 'vim-scripts/avr.vim'

"""""""""" Rust
Plugin 'rust-lang/rust.vim'
Plugin 'timonv/vim-cargo'

"""""""""" Clojure
Plugin 'tpope/vim-salve'
Plugin 'tpope/vim-projectionist'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-fireplace'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status bar

set so=7

set wildmenu
set wildmode=list:longest,full

" always show current position
set ruler
set number

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1

" status line
set laststatus=2



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options

set ignorecase
set smartcase
set hlsearch   " hightlight search results
set incsearch
set lazyredraw
set magic

Plugin 'mileszs/ack.vim'

set showmatch
set mat=2

" no sound
set noerrorbells
set vb t_vb=

" supports mouse as default
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Theme and colors
"

" enable syntax highlighting
syntax enable

" enable filetype plugins
filetype on
filetype plugin on
filetype indent on

Plugin 'altercation/vim-colors-solarized'
set t_Co=256
let g:solarized_termcolors=256
set background=dark
colorscheme solarized


" turn backup off
set nobackup
set nowb
set noswapfile

" tabulations
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent

" don't close buffer when are not displayed
set hidden

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>
