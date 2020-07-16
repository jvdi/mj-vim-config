"####Vim config####"
set nu "show  line number

syntax enable "enable color sheme code
set termguicolors "sync colorsheme with terminal
colorscheme gruvbox "install them from AUR -> vim-gruvbox-git & vim-airline-gruvbox-git
set bg=dark "set dark mode in gruvbox theme

"switch between tab
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>

"####Vim plug####"
call plug#begin()

Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'

call plug#end()

"####Plugin config####"
"airline
let g:airline_theme='gruvbox' "select them for aireline
let g:airline#extensions#tabline#enabled = 1 "showing tabs
"set symbols for open file tab
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '▶'
let g:airline_powerline_fonts = 0
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
"--unicode symbols
"let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
"--airline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = ''
"--unicode->airline symbol
"let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'
