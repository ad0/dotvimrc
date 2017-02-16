" Vundle
set shell=bash
set nocompatible
filetype off
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle
call vundle#rc()

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/zenburn'

Plugin 'luochen1990/rainbow'
let g:rainbow_active=1

Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tomtom/tlib_vim'
Plugin 'marcweber/vim-addon-mw-utils'
Plugin 'shougo/vimproc.vim'

Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
let g:airline_theme='zenburn'
let g:airline_left_sep=''
let g:airline_right_sep=''

Plugin 'garbas/vim-snipmate'
Plugin 'shougo/neocomplete.vim'

Plugin 'godlygeek/tabular'
Plugin 'ervandew/supertab'

Plugin 'vim-scripts/indentpython.vim'

Plugin 'tpope/vim-fireplace'

Plugin 'eagletmt/ghcmod-vim'
Plugin 'eagletmt/neco-ghc'


call vundle#end()
filetype plugin indent on

" Leader keys
let mapleader=","
let g:mapleader=","
set tm=2000
noremap ,, ,
let maplocalleader="\\"

" Encoding
set encoding=utf-8

" Enable folding
set foldmethod=indent
set foldlevel=99
set foldnestmax=5
set foldcolumn=0
nnoremap <space> za

" X integration
set clipboard=unnamedplus,autoselect
set mouse=a

" Turn backup off
set nobackup
set nowb
set noswapfile

" Search options
set ignorecase
set smartcase
set hlsearch
set incsearch
set lazyredraw
set magic

" Colors
set t_Co=256
if has('gui_running')
  set background=dark
endif
colorscheme zenburn
syntax on
set colorcolumn=80

" Status bar
let g:airline_powerline_fonts=0
let g:airline#extensions#tabline#enable=1
set laststatus=2


" Relative line numbers
set rnu

" Most important remap!
inoremap kj <ESC>

" Indentations
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set softtabstop=2
set autoindent
set fileformat=unix

" Buffers management
set hidden " (don't close buffer when not displayed)
noremap <leader>bd :Bd<CR>

" File browsing
map <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore=['\.pyc$', '\~$']

" Syntastic configuration
map <leader>s :SyntasticToggleMode<CR>
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0

" SuperTab configuration
let g:SuperTabDefaultCompletionType='<c-x><c-o>'
if has("gui_running")
  imap <c-space> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<CR>
else
  if has("unix")
    inoremap <Nul> <c-r>=SuperTabAlternateCompletion("\<lt>c-x>\<lt>c-o>")<CR>
  endif
endif
let g:haskellmode_completion_ghc = 1
autocmd FileType haskell setlocal omnifunc=necoghc#omnifunc

" Clojure support shortcuts
au FileType clojure nmap <C-c><C-r> :Require<CR>
au FileType clojure nmap <C-c><C-e> :Eval<CR>
au FileType clojure nmap <C-c><C-t> :RunTests<CR>

" Haskell support shortcuts
map <silent> tw :GhcModTypeInsert<CR>
map <silent> ts :GhcModSplitFunCase<CR>
map <silent> tq :GhcModType<CR>
map <silent> te :GhcModTypeClear<CR>
