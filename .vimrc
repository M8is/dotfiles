" ===> Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'Valloric/YouCompleteMe'

Plugin 'heavenshell/vim-pydocstring'

call vundle#end()
filetype plugin indent on
" ===> Vundle end

set t_Co=256    " set 256 colors
set showmatch   " highlight matching surrounding elements
syntax on       " enable syntax highlighting
set autoread	  " read files changed outside vim

let mapleader=" "

" save buffer using leader key
nnoremap <leader>w :w<cr>

" switch to previous buffer
nnoremap <leader><leader> :e#<cr>

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


" YCM configuration
let g:ycm_autoclose_preview_window_after_insertion = 1
let g:ycm_autoclose_preview_window_after_completion = 1


" create tag file
command! MakeTags !ctags -R .
" Shortcuts for tag jumping:
" - ^] to jump to tag under cursor
" - g^] for ambiguous tags
" - ^t to jump back up the tag stack

