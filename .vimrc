
" use indentation for folds
set foldmethod=indent
set foldnestmax=5
set foldlevelstart=99
set foldcolumn=0

" history settings
set history=700

" set to autoread when a file is changed from the outside
set autoread

" set column80 mark
set colorcolumn=80

" leader key
let mapleader = ","
let g:mapleader = ","
set tm=2000
noremap ,, ,
let maplocalleader = "\\"

" easy insert mode exit
:inoremap jk <esc>

" disable some keys
:inoremap <esc>   <nop>
:nnoremap <up>    <nop>
:nnoremap <down>  <nop>
:nnoremap <left>  <nop>
:nnoremap <right> <nop>

" enable backspace
:set backspace=indent,eol,start

" editing the .vimrc
:nnoremap <leader>ev :split $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" uppercase a word in insert mode
:inoremap <c-u> <esc>vbUea


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vundle

set nocompatible
filetype off
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

" Let Vundle manage itself
Bundle 'gmarik/vundle'

" Support bundles
Bundle 'jgdavey/tslime.vim'
Bundle 'shougo/vimproc.vim'
Bundle 'ervandew/supertab'
Bundle 'scrooloose/syntastic'
Bundle 'moll/vim-bbye'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'vim-scripts/gitignore'

" Git
Bundle 'tpope/vim-fugitive'
Bundle 'int3/vim-extradite'

" Bars, panels and files
"Bundle 'scrooloose/nerdtree'
"Bundle 'bling/vim-airline'
"Bundle 'kien/ctrlp.vim'
"Bundle 'majutsushi/tagbar'

" Text manipulation
"Bundle 'vim-scripts/align'
Bundle 'vim-scripts/gundo'
Bundle 'tpope/vim-commentary'
"Bundle 'godlygeek/tabular'
"Bundle 'michaeljsmith/vim-indent-object'

" Allow pane movement to jump out of vim into tmux
"Bundle 'christoomey/vim-tmux-navigator'

" Haskell
"Bundle 'raichoo/haskell-vim'
"Bundle 'enomsg/vim-haskellconcealplus'
Bundle 'eagletmt/ghcmod-vim'
"Bundle 'eagletmt/neco-ghc'
Bundle 'twinside/vim-hoogle'

" Elm
Bundle 'lambdatoast/elm.vim'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set so=7

set wildmenu
set wildmode=list:longest,full

" always show current position
set ruler
set number


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search options

set ignorecase
set smartcase
set hlsearch   " hightlight search results
set incsearch
set lazyredraw
set magic





set showmatch
set mat=2

" no sound
set noerrorbells
set vb t_vb=


" disable Background Color Erase (BCE)
if &term =~'256color'
  set t_ut=
endif

" supports mouse as default
set mouse=a

Bundle 'vim-scripts/wombat256.vim'
try
  colorscheme wombat256mod
catch
endtry

" enable syntax highlighting
syntax enable

" adjust sugnscolumn and syntastic to match wombat
hi! link SignColumn LineNr
hi! link SyntasticErrorSign ErrorMsg
hi! link SyntasticWarningSign WarningMsg

" enable filetype plugins
filetype plugin on
filetype indent on

" match wombat colors in nerd tree
hi Directory guifg=#8ac6f2

hi Cursor guibg=red
hi clear Conseal

" set extra options when running in GUI mode
if has("gui_running")
  set guioptions-=T
  set guioptions-=e
  set guitablabel=%M\ %t
endif
set t_Co=256

" set utf8 as standard encoding
set encoding=utf8

" set Unix as the standard file type
set ffs=unix,dos,mac

" turn backup off
set nobackup
set nowb
set noswapfile

" open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" show undo tree
nmap <silent> <leader>u :GundoToggle<CR>

" tabulations
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set autoindent

" window navigation
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" don't close buffer when are not displayed
set hidden

" previous buffer, next buffer
nnoremap <leader>bp :bp<cr>
nnoremap <leader>bn :bn<cr>

" delete buffer without closing pane
noremap <leader>bd :Bd<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" status line

set laststatus=2


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" spell checking

map <leader>ss :setlocal spell!<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Haskell features

nmap <silent> <leader>ht :GhcModType<CR>
nmap <silent> <leader>hT :GhcModTypeInsert<CR>
nmap <silent> <leader>hc :SyntasticCheck ghc_mod<CR>
nmap <silent> <leader>hl :SyntasticCheck hlint<CR>
nnoremap <silent> <leader>hh :Hoogle<CR>
nnoremap <leader>hH :Hoogle
nnoremap <silent> <leader>hi :HoogleInfo<CR>
nnoremap <leader>hI :HoogleInfo
nnoremap <silent> <leader>hz :HoogleClose<CR>

