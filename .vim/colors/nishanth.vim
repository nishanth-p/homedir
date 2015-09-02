set background=dark
highlight clear
if exists("syntax on")
	syntax reset
endif
let g:colors_name="nishanth"
hi Normal					ctermbg=black
hi Search 	cterm=reverse	ctermfg=yellow	ctermbg=black

hi DiffAdd	cterm=bold	ctermfg=Black	ctermbg=LightGreen
hi DiffChange	cterm=bold	ctermfg=Black	ctermbg=Cyan
hi DiffDelete	cterm=bold	ctermfg=Black	ctermbg=LightYellow
hi DiffText	cterm=bold	ctermfg=White	ctermbg=Red

hi Comment	cterm=bold	ctermfg=Red
hi Constant	cterm=bold	ctermfg=Magenta
hi Special	cterm=bold	ctermfg=Magenta
hi Identifier 	cterm=bold	ctermfg=Cyan
hi Statement 	cterm=bold	ctermfg=LightGreen
hi PreProc	cterm=bold	ctermfg=Blue
hi Type		cterm=bold	ctermfg=LightGreen
hi Function	cterm=bold	ctermfg=Cyan
hi Repeat	cterm=bold	ctermfg=White
hi Operator			ctermfg=Red
hi Ignore			ctermfg=black
hi Error	cterm=reverse 	ctermfg=White	ctermbg=Red 
hi Todo		cterm=standout	ctermfg=Black	ctermbg=Yellow 

" Common groups that link to default highlighting.
" You can specify other highlighting easily.

hi link String		Constant
hi link Character	Constant
hi link Number		Constant
hi link Boolean		Constant
hi link Float		Number

hi link Conditional	Type
hi link Label		Type
hi link Exception	Type
hi link Macro		PreProc
hi link PreCondit	PreProc

hi link Keyword		Type
hi link Include		Type
hi link Define		Type
hi link StorageClass	Type
hi link Structure	Type
hi link Typedef		Type

hi link Tag		Special
hi link SpecialChar	Special
hi link Delimiter	Special
hi link SpecialComment	Special
hi link Debug		Special

