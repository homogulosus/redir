" ====== REDIR ===============================================================
" Filename: redir.vim
" Author: homogulosus
" License: same as neovim
" Last Change: Tue Jul  7 15:45:19 EDT 2020
" ============================================================================
if exists('g:loaded_redir')
  finish
endif
let g:loaded_redir = 1

let s:save_cpo = &cpo
set cpo&vim

command! -nargs=1 -complete=command -bar -range Redir silent call redir#Redir(<q-args>, <range>, <line1>, <line2>)

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim sw=2 sts=2:
