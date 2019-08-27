" VUNDLE SETUP {{{

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" }}}

" GENERAL {{{

set t_Co=256       " set 256 colors
set showmatch      " highlight matching surrounding elements
let mapleader="\"  " set leader explicitly
syntax on          " enable syntax highlighting

" }}}

" KEYBINDINGS {{{

" TODO

" }}}

" open this file with folded sections
set modelines=1
" vim:foldmethod=marker:foldlevel=0
