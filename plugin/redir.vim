" REDIR
command! -nargs=1 -complete=command -bar -range Redir silent call Redir(<q-args>, <range>, <line1>, <line2>)
