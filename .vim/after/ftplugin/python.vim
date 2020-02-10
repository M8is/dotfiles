" Python specific settings.

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

nmap <silent> <leader>d <Plug>(pydocstring)

function! Format()
  silent execute "!PYTHONPATH=~/yapf python3 ~/yapf/yapf -i " . bufname("%")
endfunction
 
autocmd BufWritePost <buffer> :call Format()

