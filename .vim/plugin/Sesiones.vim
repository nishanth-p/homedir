"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File:  "Sesiones.vim"
" URL:  http://vim.sourceforge.net/script.php?script_id=3542
" Version: 0.2
" Last Modified: 06/04/2011
" Author: jmpicaza at gmail dot com
" Description: Plugin for managing sesions the easy way
" GetLatestVimScripts: 1823 1 :AutoInstall: Sesiones.vim
" 
" TODO: let customize path where to save the sessions (l:path) from within .vimrc
"
" Installation
" ------------
" 1. Copy the Sesiones.vim script to the $HOME/.vim/plugin or the
"    $HOME/vimfiles/plugin or the $VIM/vimfiles directory.  Refer to the
"    ':help add-plugin', ':help add-global-plugin' and ':help runtimepath'
"    topics for more details about Vim plugins.
"
" Usage
" -----
" Manage it from the menu in plugins or with the keyboard:
" s<F3> to save a session
" l<F3> to load a session
" d<F3> to delete an existing session
"
"""""""""""""""""""""""""""""""""""""""""""
" Function for writing and loading sessions
"""""""""""""""""""""""""""""""""""""""""""
function! s:Sesiones(save_load)
	" echomsg "<F3> to save, <F4> to load, d<F3> to delete"
	if exists('g:sesiones_path')
		let l:sesiones_path = g:sesiones_path
	else
		if has('unix') || has('macunix')
			let l:sesiones_path = $HOME . '/.vimSessions'
		else
			let l:sesiones_path = $VIM . '/_vimSessions'
			if has('win32')
				" MS-Windows
				if $USERPROFILE != ''
					let l:sesiones_path = $USERPROFILE . '/_vimSessions'
				endif
			endif
		endif
	endif

	" let l:sesiones_path=substitute(expand(l:sesiones_path),"\\","\/","g") . "/" . substitute(substitute(expand('%:p').'.vim',"\\","=+","g"),":","=-","")
	let l:sesiones_path=substitute(expand(l:sesiones_path),"\\","\/","g") . $PWD
	let l:sesiones_file=expand(l:sesiones_path) . '/Session.vim'
	if (a:save_load == 0)
		if (filewritable(l:sesiones_file))
			exe ":mksession! " . l:sesiones_file
			echohl NonText
			echomsg "Session successfully overwritten in file: " . l:sesiones_file
			echohl none
		else
			call mkdir(expand(l:sesiones_path), "p")
			exe ":mksession " . l:sesiones_file
			echohl NonText
			echomsg "Session successfully saved in file: " . l:sesiones_file
			echohl None
		end
	elseif (a:save_load == 1)
		if (filereadable(l:sesiones_file))
			exe ":source " . l:sesiones_file | redraw
			echohl NonText
			echomsg "Load session file: " . l:sesiones_file 
			echohl None
		else
			echohl ErrorMSG
			echomsg "WARNING: Session file does not exist: " . l:sesiones_file
			echohl None
		endif
	elseif (a:save_load == 2)
		if (delete(l:sesiones_file))
			echohl ErrorMSG
			echomsg "ERROR: Not possible to delete the session file: " . l:sesiones_file
			echohl None
		else
			echohl NonText
			echomsg "Deleted session file: " . l:sesiones_file
			echohl None
		endif
	else
		echohl ErrorMSG
		echomsg "No valid option selected. Please review your code or command"
		echohl None
	endif
endfunction

command! -nargs=0 -bar SessionSave call s:Sesiones(0)
command! -nargs=0 -bar SessionLoad call s:Sesiones(1)
command! -nargs=0 -bar SessionDelete call s:Sesiones(2)

