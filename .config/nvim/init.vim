"""""""""""""""""""""""""
" PLUGIN INITIALIZATION "
"""""""""""""""""""""""""
call plug#begin()
Plug 'neoclide/coc.nvim'
Plug 'jiangmiao/auto-pairs'
Plug 'mcchrish/nnn.vim'
Plug 'tomasr/molokai'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()

"TAB SPACING FOR HTML
autocmd BufRead,BufNewFile *.htm,*.html setlocal tabstop=2 shiftwidth=2 softtabstop=2


""""""""""""""""""""""""""""""""""""""""""""
" CUSTOM SCRIPT TO OPEN AND CLOSE TERMINAL "
""""""""""""""""""""""""""""""""""""""""""""
let g:term_buf = 0
let g:term_win = 0
function! TermToggle(height)
	if win_gotoid(g:term_win)
		hide
	else
		botright new
		exec "resize " . a:height
		try
			exec "buffer " . g:term_buf
		catch
			call termopen($SHELL, {"detach": 0})
			let g:term_buf = bufnr("")
			set nonumber
			set norelativenumber
			set signcolumn=no
		endtry
		startinsert!
		let g:term_win = win_getid()
	endif
endfunction

" Toggle terminal on/off
nnoremap <A-t> :call TermToggle(12)<CR>
inoremap <A-t> <Esc>:call TermToggle(12)<CR>
tnoremap <A-t> <C-\><C-n>:call TermToggle(12)<CR>

" Terminal go back to normal mode
tnoremap <Esc> <C-\><C-n>
tnoremap :q! <C-\><C-n>:q!<CR>


"""""""""""""""""""""
" VIM CONFIGURATION "
"""""""""""""""""""""
colorscheme molokai
set number
set relativenumber


"""""""""""""""""""""
" NNN CONFIGURATION "
"""""""""""""""""""""
nnoremap <C-o> :Np<CR>
let g:nnn#layout = { 'window': { 'width': 0.9, 'height': 0.6, 'highlight': 'Debug' } }
let g:nnn#action = {
      \ '<c-t>': 'tab split',
      \ '<c-x>': 'split',
      \ '<c-v>': 'vsplit' }


"""""""""""""""""""""""""""""""""
" VIM AIRLINE POWERLINE SYMBOLS "
""""""""""""""""""""""""""""""""" 
let g:airline_symbols = {}
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.colnr = ' :'
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ' :'
let g:airline_symbols.maxlinenr = '☰ '
let g:airline_symbols.dirty='⚡'
