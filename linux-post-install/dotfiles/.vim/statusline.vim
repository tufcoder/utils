hi statusline gui=bold guibg=#658e48 guifg=#2a2b3d
hi statuslinenc gui=NONE cterm=NONE guibg=#5f6060 guifg=#B0B1C0

augroup ModeEvents
	autocmd!
	au InsertEnter * hi statusline guibg=#3588cc
	au InsertLeavePre * hi statusline guibg=#658e48
	au ModeChanged *:[vV\x16]* hi statusline guibg=#b321e0
	au Modechanged [vV\x16]*:* hi statusline guibg=#658e48
	au ModeChanged *:[R]* hi statusline guibg=#bf3f3f
	au ModeChanged [R]* hi statusline guibg=#658e48
augroup end

function! ActiveStatusLine()
    let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V-Line ',
       \ "\<C-V>" : 'V-Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'Replace',
       \ 'Rv' : 'V-Replace ',
       \ 'c'  : 'Command ',
       \ 't'  : 'Terminal-Job',
       \ 'nt'  : 'Terminal-Normal',
       \}

    set statusline=%0*\ %{toupper(mode())}
	set statusline+=\ %1*\ [%n]\ %t%{&modified!=''?'\ \|\ +':''}

	set statusline+=\ %2*%=

	set statusline+=%{&ff}\ \|\ %{&fenc!=''?&fenc:&enc}
	set statusline+=\ \|\ %{&filetype!=''?tolower(&filetype):'no\ ft'}

	set statusline+=\ %1*\ %p%%\ %0*\ \ %l:%c\ \

	hi User1 gui=NONE cterm=NONE guifg=#b0b1c0 guibg=#3E4452
	hi User2 gui=NONE cterm=NONE guifg=#b0b1c0 guibg=#35363d
endfunction

call ActiveStatusLine()
