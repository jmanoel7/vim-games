let s:sources = []
let s:sokobans = split(glob(expand('<sfile>:p:h:h:h') . '/plugin/VimSokoban/level*.sok'))
for s:sokoban in s:sokobans
	let s:sources += [matchstr(s:sokoban, 'level\zs.*\ze\.')]
endfor
function! leaderf#sokoban#sort(a, b) abort "{{{
	return str2nr(a:a) - str2nr(a:b)
endfunction "}}}

let s:sources = sort(s:sources, 'leaderf#sokoban#sort')

function! leaderf#sokoban#source(args) abort "{{{
	return s:sources
endfunction "}}}

function! leaderf#sokoban#accept(line, args) abort "{{{
	execute 'Sokoban ' . a:line
endfunction "}}}
