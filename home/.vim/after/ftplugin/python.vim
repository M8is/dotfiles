" Python specific settings.

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal autoindent
setlocal smarttab
setlocal formatoptions=croql

nmap <silent> <leader>d <Plug>(pydocstring)

function! Format()
  execute "!yapf -i " . bufname("%")
endfunction
 
augroup auto_format
  autocmd! <buffer>
  autocmd BufWritePost *.py :call Format()
augroup END

