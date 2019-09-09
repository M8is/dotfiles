" ===> Vundle
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

call vundle#end()
filetype plugin indent on
" ===> Vundle end

set t_Co=256    " set 256 colors
set showmatch   " highlight matching surrounding elements
syntax on       " enable syntax highlighting
set autoread	  " read files changed outside vim

let mapleader=" "


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

