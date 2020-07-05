" ====== REDIR ======= "
command! -nargs=1 -complete=command -bar -range Redir silent call redir#Redir(<q-args>, <range>, <line1>, <line2>)

" vim:set ft=vim sw=2 sts=2:
