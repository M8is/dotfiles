" .vimrc by M8is

" GENERAL CONFIG {{{

set path+=**

" open split window below or to the right
set splitbelow
set splitright

set cursorline	" highlight current line
set lazyredraw	" redraw only when needed, e.g. not during macros
set showmatch	" highlight matching [{()}] 

set encoding=utf-8

set t_Co=256
set background=dark

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

" open this file with folded sections
set modelines=1
" vim:foldmethod=marker:foldlevel=0
