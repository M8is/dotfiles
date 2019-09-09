" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoindent
set smartindent

" configure tabwidth and insert spaces instead of tabs
set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces

" wrap lines at 120 chars
set textwidth=120

" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" switch between header/source
map <leader>jh :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>

" recreate tags file
map <leader>tc :!ctags -R ?c++-kinds=+p ?fields=+iaS ?extra=+q .<CR>

" build
map <leader>ma :make all<CR>
" clean
map <leader>mc :make clean all<CR>

" move between methods using alt+shift+J/K
nnoremap <M-J> /\v^(\w+\s+)?\w+::\w+\(.*\)
nnoremap <M-K> ?\v^(\w+\s+)?\w+::\w+\(.*\)

