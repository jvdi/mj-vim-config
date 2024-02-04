"####Vim config####"
set encoding=utf-8

set t_Co=256 "makes Vim use 256 colors

set nu "show line number

set autoindent "automatic indentation
set si "smart indent
set cindent "turns on C style indentation

set showmatch "show matching brackets

set hlsearch "highlight in search

set pastetoggle=<C-p> "paste mode toggle

syntax enable "enable color sheme code
if(empty($TMUX)) | set termguicolors | endif "sync colorsheme with terminal
"autocmd vimenter * ++nested colorscheme gruvbox
colorscheme gruvbox "install them from AUR -> vim-gruvbox-git & vim-airline-gruvbox-git
set bg=dark "set dark mode in gruvbox theme

"switch between tab
nnoremap <C-Left> :tabprevious<CR>                                                                            
nnoremap <C-Right> :tabnext<CR>
nnoremap <C-h> :tabprevious<CR>                                                                            
nnoremap <C-l> :tabnext<CR>

"auto complete for ( , " , ' , [ , { 
inoremap        (  ()<Left>
inoremap        "  ""<Left>
inoremap        `  ``<Left>
inoremap        '  ''<Left>
inoremap        [  []<Left>
inoremap        {  {}<Left>

"####Vim plug####"
call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'preservim/nerdtree'
Plug 'tpope/vim-fugitive'
Plug 'mattn/emmet-vim'
Plug 'vim-scripts/AutoComplPop'
Plug 'alvan/vim-closetag'
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --tern-completer' }
Plug 'lvht/phpcd.vim', { 'for': 'php', 'do': 'composer install' }
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'phpactor/phpactor' ,  {'do': 'composer install', 'for': 'php'} "Include phpactor
Plug 'phpactor/ncm2-phpactor' "Require ncm2 and this plugin

call plug#end()

"####Plugin config####"
"airline
let g:airline_theme='gruvbox' "select them for aireline
let g:airline#extensions#tabline#enabled = 1 "showing tabs
"--set symbols for open file tab
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

"nerdtree
"--NERDTree shortcut toggle
map <C-e> :NERDTreeToggle<CR>
"--open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"--open NERDTree and a new edit window in folder
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
"--close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
"--close nerdree after open a file
let NERDTreeQuitOnOpen=1

"--NERDTress File highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('htm', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')

"vim-closetag
"These are the file extensions where this plugin is enabled.
let g:closetag_filenames = '*.html,*.htm,*.xhtml,*.phtml,*.php'

"Php autocomplete
autocmd BufEnter * call ncm2#enable_for_buffer() "enable ncm2 for all buffers
set completeopt=noinsert,menuone,noselect "IMPORTANT: :help Ncm2PopupOpen for more information
