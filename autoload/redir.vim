" ====== REDIR ===============================================================
" Filename: /autoload/redir.vim
" Author: homogulosus
" License: same as neovim
" Last Change: Tue Jul  7 15:45:19 EDT 2020
" ============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! redir#Redir(cmd, rng, start, end) abort
  for win in range(1, winnr('$'))
    if getwinvar(win, 'scratch')
	  execute win . 'windo close'
	endif
  endfor
  if a:cmd =~ '^!'
    let cmd = a:cmd =~' %'
      \ ? matchstr(substitute(a:cmd, ' %', ' ' . expand('%:p'), ''), '^!\zs.*')
      \ : matchstr(a:cmd, '^!\zs.*')
	  if a:rng == 0
		let output = systemlist(cmd)
	  else
		let joined_lines = join(getline(a:start, a:end), '\n')
		let cleaned_lines = substitute(shellescape(joined_lines), "'\\\\''", "\\\\'", 'g')
		let output = systemlist(cmd . " <<< $" . cleaned_lines)
	  endif
    else
	  redir => output
	  execute a:cmd
	  redir END
	  let output = split(output, "\n")
  endif
  vnew
  let w:scratch = 1
  setlocal buftype=nofile bufhidden=wipe nobuflisted noswapfile
  call setline(1, output)
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo

" vim:set ft=vim sw=2 sts=2:
