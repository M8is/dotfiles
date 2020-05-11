" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'andymass/vim-matchup'

Plug 'heavenshell/vim-pydocstring'

" Fuzzy file finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Semantic language support
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rust-lang/rust.vim'
Plug 'rhysd/vim-clang-format'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'

" Initialize plugin system
call plug#end()

set showmatch   " highlight matching surrounding elements
set autoread	  " read files changed outside vim
let g:lightline = { 'colorscheme': 'solarized' }

set laststatus=2 " necessary to show lightline

" Transparent left-most column (only sometimes shown)
highlight clear SignColumn

let mapleader=" "

" switch to previous buffer
nnoremap <leader><leader> :e#<cr>

" search with fzf
nnoremap <leader>o :Files .<cr>

" save buffer using leader key
nnoremap <leader>w :w<cr>

" save current buffer as root
cmap w!! w !sudo tee > /dev/null %

set gdefault	" default to global search
set ignorecase	" ignore case by default
set hlsearch	" highlight search results

" remove highlighting
nnoremap <silent> <leader>, :noh<cr>

" these options are overwritten by language specific settings
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" configure line numbers
set number
set relativenumber
set numberwidth=4
highlight LineNr ctermfg=blue

" paste from clipboard and keep formatting
map <silent><Leader>p :set paste<CR>o<esc>"*]p:set nopaste<cr>"
map <silent><Leader><S-p> :set paste<CR>O<esc>"*]p:set nopaste<cr>"

" add supfolders to path (enables search in subfolders)
set path+=**
set wildmenu

" create tag file
command! MakeTags !ctags -R .
" Shortcuts for tag jumping:
" - ^] to jump to tag under cursor
" - g^] for ambiguous tags
" - ^t to jump back up the tag stack
