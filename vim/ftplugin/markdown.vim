set wrap
set spell spelllang=en_us
au BufRead,BufNewFile *.md setlocal textwidth=80



let g:vim_markdown_folding_disabled = 1

iabbrev #c ```
iabbrev #p ```python<cr>```
iabbrev #j ```javascript<cr>```


" gq - format
" ]s [s - navigation misspelled words
" z= - suggest alternatives
" zg - add to dictionary
" zw - mark as incorrect

