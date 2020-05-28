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

" Colorschemes
Plug 'chriskempson/base16-vim'

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

colorscheme base16-solarized-light

set showmatch   " highlight matching surrounding elements
set autoread	  " read files changed outside vim
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
    return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction
" Use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

set laststatus=2 " necessary to show lightline

" Transparent left-most column (only sometimes shown)
highlight clear SignColumn

let mapleader=" "

" switch to previous buffer
nnoremap <leader><leader> <c-^>

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

" Jump to start and end of line using the home row keys
map H ^
map L $

" ; as :
nnoremap ; :

