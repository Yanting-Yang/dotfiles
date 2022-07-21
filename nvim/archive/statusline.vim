function Mode2Str()
	let flag = mode()
	if flag =~ 'n'
		return ' Normal '
	elseif flag =~ 'v'
		return ' Visual '
	elseif flag =~ 's'
		return ' Select '
	elseif flag =~ 'i'
		return ' Insert '
	elseif flag =~ 'c'
		return ' Command-line '
	else
		return ' Unknown mode '
	endif
endfunction

hi StatusLine ctermfg=15 ctermbg=0
hi StatusLineNC ctermfg=15 ctermbg=0
set statusline=%{Mode2Str()}
set statusline+=\|\ 
set statusline+=%t
set statusline+=\ %m\ %r\ 
set statusline+=%=
set statusline+=%{&fileencoding}\ \|\ %{&fileformat}\ \|\ %{&filetype}
set statusline+=\ \|\ 
set statusline+=[%l/%L,\ %c]
set statusline+=\ \|\ 
set statusline+=%p%%\ 
