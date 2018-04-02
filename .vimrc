" Mappings
" --------
" Spacebar is <leader>
" Spacebar+c or <c-spacebar> - shortcut to switch to normal and cmd modes
" <leader>x	-  		- Replace the word under cursor
" <leader>t	- F9	- Toggle Taglist
" <leader>u	- 		- Update Taglist
" <leader>b	- F10	- opens the buffer list
" <leader>d	-  		- Toggle NerdTree
" <leader>r	-  		- Show Recently opened file-list
" <leader>s/l/D 	- Session save/load/delete
" <leader>h	-		- Toggle highlighting
" <leader>m	- 		- Toggle mouse capability
" bd 				- closes the current buffer
" b[np] 			- next/prev. buffer
" <leader>vv/v 		- edit, source .vimrc
" <C-h/j/k/l>		- Switch windows
" <leader>w - F8	- Toggle windows
" <leader><tab>		- Toggle buffer

" Enable general
" --------------
set nocp				" VIM mode
filetype plugin indent on
set bg=dark				" Show dark black background
set syn=on				" Enable syntax coloring
set sm					" Show matching parantheses
set hls					" Highlight search matches
set is					" Incremental search
set ic					" Ignore case while searching
set scs					" Smart case while searching
set magic				" Escape char in pattern
set wmnu				" Set wildmenu (tab complete)
set hi=50				" Set history size
set cf					" Ask action instead of error
set novb				" No visual bell
set noeb				" No error bell (sound)
set hid					" Allow switching dirty files
set nu					" Enable line number display
set sw=4				" Shift width for intendation
set ts=4				" Size of tab
set expandtab				" Expand tab to spaces"
set bs=indent,eol,start			" Backspace in insert mode
set tw=0				" Don't wrap words
set ls=2				" Display status always
set ru					" Display cursor position status
set sc					" Show partial command
set wmh=0				" Minimum window height
set wmw=0				" Minimum window width
set wrap				" Enable wrapping long lines
set noswf				" No swap file

" Mappings general
" ----------------
let mapleader=" "
map <silent> <Leader>h :se invhlsearch<CR>
imap <C-@> <Esc>
nnoremap <C-@> :
cnoremap <C-@> <Esc>
noremap <Leader><Tab> :b #<CR>
noremap <Leader>x <Esc>viwpyiw
noremap <Leader>w :w<CR>
noremap <Leader>q :qa<CR>
map bd :bdelete<cr>
map bn :bnext<cr>
map bp :bprev<cr>
nmap <Leader>vv :e ~/.vimrc<CR>
nmap <Leader>v :source ~/.vimrc<CR>
" noremap <C-h> :%s/<C-r><C-w>//gc<Left><Left><Left>
" inoremap <C-h> <Esc>:%s/<C-r><C-w>//gc<Left><Left><Left>

" Visual mode mappings
" --------------------
vmap / y:execute "/".escape(@",'[]/\.*')<CR>
vmap <C-h> y:execute "%s/".escape(@",'[]/')."//gc"<Left><Left><Left><Left>

" Temporary Mappings
" ------------------
map <F5> :TlistClose<CR>1<C-w>w<C-w>J1<C-w>w<C-w>J1<C-w>w<C-w>J1<C-w>w<C-w>J3<C-w>w<C-w>_
map <F6> :TlistClose<CR>1<C-w>w<C-w>L1<C-w>w<C-w>L1<C-w>w<C-w>L1<C-w>w<C-w>L3<C-w>w<C-w>|
map <F7> :%d<CR><C-w><DOWN>:%y<CR><C-w><UP>P
map <F8> :w<CR>:qa<CR>

" Abbreviations general
" ---------------------
ab #d #define
ab #i #include
ab #b /************************************************
ab #e ************************************************/

" Colorscheme
" -----------
colorscheme nishanth

" Move cursor to last known cursor position while opening
" -------------------------------------------------------
autocmd BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\   exe "normal g`\"" |
\ endif

" Remove trailing spaces while saving file
" ----------------------------------------
autocmd BufWritePre * :%s/\s\+$//e

" Taglist plugin
" --------------
let Tlist_Auto_Open = 1			" Automatically open
let Tlist_Show_One_File = 1		" Show tag for only one
let Tlist_Exit_OnlyWindow = 1		" Close vim on main close
let Tlist_Enable_Fold_Column = 0  	" no fold column (only showing one file)
let Tlist_Sort_Type = "order"		" default sort
let Tlist_Max_Tag_Length = 30		" Maximum size for tag
let Tlist_Auto_Highlight_Tag = 1	" highlight in taglist window
nnoremap <leader>t :TlistToggle<cr>
noremap  <F9> :TlistToggle<CR>
noremap! <F9> <esc>:TlistToggle<CR>
nnoremap <leader>u :TlistUpdate<cr>:TlistHighlightTag<cr>

" bufexplorer plugin
" ------------------
nnoremap <leader>b :BufExplorer<cr>
noremap  <F10> :BufExplorer<CR>
noremap! <F10> <esc>:BufExplorer<CR>

" NerdTree Plugin
" ---------------
let NERDTreeChDirMode = 2
let NERDTreeShowBookmarks = 1
let NERDTreeShowHidden = 1
let NERDTreeIgnore = []
let NERDTreeSortOrder = ['\/$', '\.c$', '\.h$', '*', '\.swp$',  '\.bak$', '\~$']
let NERDTreeWinPos = "right"
nnoremap <leader>d :NERDTreeToggle<CR>

" MRU Plugin
" ----------
nnoremap <leader>r :MRU<CR>

" Sesiones Plugin
" ---------------
nnoremap <leader>s :SessionSave<CR>
nnoremap <leader>l :SessionLoad<CR>
nnoremap <leader>D :SessionDelete<CR>

" Ctags
" -----
set tags=tags;/,${CSCOPE_DIR}/tags						" Search for tags till root
" au! CursorHold *.[ch] nested exe "silent! ptag " . expand("<cword>")

