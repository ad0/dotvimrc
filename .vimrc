set nocompatible

" setting up vundle
if !isdirectory(expand("~/.vim/bundle/vundle/.git"))
  !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
endif
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" remapping <Leader>
let mapleader = ","

" setting on syntax highlighting...
Bundle 'scrooloose/syntastic'
syntax on
map <silent> <Leader>e :Errors<CR>
map <Leader>s :SyntasticToggleMode<CR>
" ... and color theme
Bundle 'altercation/vim-colors-solarized'
set t_Co=256
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

set guifont=Inconsolata\ for\ Powerline\ 10

" air (powerline)
Bundle 'bling/vim-airline'
let g:airline_powerline_fonts=1
set laststatus=2

" vim-slime with tmux
Bundle 'jpalardy/vim-slime'
let g:slime_target="tmux"
let g:slime_paste_file=tempname()

filetype plugin indent on
set expandtab
set shiftwidth=2
set softtabstop=2
set smartindent
set wildmenu
set cursorline

" nop arrow keys
noremap <Up>    <Nop>
noremap <Down>  <Nop>
noremap <Left>  <Nop>
noremap <Right> <Nop>

" fast mode esc
imap kj <Esc>

" vimrc editing and sourcing
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

" buffers
:nnoremap <leader>b :ls<cr>:b

" cabal shortcuts
map <F5> :!cabal clean<cr>
map <F6> :!cabal build<cr>
map <F7> :!cabal run<space>

Bundle 'shougo/vimproc.vim'
Bundle 'eagletmt/ghcmod-vim'

" tagbar
Bundle 'majutsushi/tagbar'

" buffers management
:nnoremap <leader>d :bp<bar>sp<bar>bn<bar>bd<CR>

