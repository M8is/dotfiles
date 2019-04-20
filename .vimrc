" .vimrc by M8is

" VUNDLE CONFIG {{{

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Run tmux commands from vim
Plugin 'benmills/vimux'

" Surround stuff
Plugin 'tpope/vim-surround'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" }}}
" GENERAL CONFIG {{{

" open split window below or to the right
set splitbelow
set splitright

set cursorline	" highlight current line
set lazyredraw	" redraw only when needed, e.g. not during macros
set showmatch	" highlight matching [{()}] 

set encoding=utf-8

set t_Co=256
set background=dark

function! VimuxRunAndInspect(command)
    call VimuxInterruptRunner()
    call VimuxRunCommand("stty -echo")
    call VimuxRunCommand("PS1=''")
    call VimuxRunCommand("clear")
    call VimuxRunCommand(a:command)
endfunction

function! LeaveVim()
    call VimuxCloseRunner()
endfunction

" }}}
" KEY MAPPINGS {{{

let mapleader=" "

" git commands
noremap <silent> <leader>gs :call VimuxRunAndInspect("git status")<CR>
noremap <silent> <leader>ga :call VimuxRunAndInspect("git add -p .")<CR>
noremap <silent> <leader>gc :call VimuxRunAndInspect("git commit")<CR>
noremap <silent> <leader>gd :call VimuxRunAndInspect("git diff")<CR>

" split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" }}}
" PLUGIN CONFIG {{{ 

" spawn vimux split horizontally with 40% width
let g:VimuxOrientation = "h"
let g:VimuxHeight = "40"
" don't use existing window for vimux command
let g:VimuxUseNearest = 0

" }}}
" PYTHON {{{

" PEP8 indentation for Python
au BufNewFile,BufRead *.py
	\ setlocal tabstop=4
	\|setlocal softtabstop=4
	\|setlocal shiftwidth=4
	\|setlocal expandtab
	\|setlocal autoindent 
	\|setlocal fileformat=unix

syntax on

" }}}
" INITIALIZATION INSTRUCTIONS {{{

" Setup Vundle
" git clone https://github.com/VundleVim/Vundle.vim.git
" ~/.vim/bundle/Vundle.vim
" run :PluginInstall in vim 

" }}}

" open this file with folded sections
set modelines=1
" vim:foldmethod=marker:foldlevel=0
