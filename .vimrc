set nocompatible
set showtabline=2
set ruler
set number
set mouse=a
" set relativenumber
set scrolloff=5
"set list
set laststatus=2
set numberwidth=1
set foldcolumn=1
set autoindent
set expandtab
set smarttab
set shiftwidth=4    
set sessionoptions=blank,buffers,curdir,folds,help,options,tabpages,winsize
set softtabstop=4                                                               
set tabstop=4

" Splits open to the right then bottom
set splitbelow
set splitright

" Highlight search
set hlsearch

if !has('gui_running')
    set t_Co=256
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='badwolf'

syntax on
syntax enable
colorscheme default
set background=dark


set pastetoggle=<F3>

" just Ctrl + JKLH to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Space toggles folds
nnoremap <Space> za
vnoremap <Space> za
"
" " z0 = recursively open top-level fold we're in
nnoremap z0 zCz0



" fix diff colors
highlight DiffText ctermbg=1

if has("autocmd")
    filetype plugin on
    filetype indent on
    let php_folding=1
    " let php_sql_query=1
    let php_htmlInStrings=1
endif




" Highlight conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

set statusline=%f    " Path.
set statusline+=%m   " Modified flag.
set statusline+=%r   " Readonly flag.
set statusline+=%w   " Preview window flag.
set statusline+=\    " Space.

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

set statusline+=%=   " Right align.

" File format, encoding and type.  Ex: "(unix/utf-8/python)"
set statusline+=(
set statusline+=%{&ff}                        " Format (unix/DOS).
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc}   " Encoding (utf-8).
set statusline+=/
set statusline+=%{&ft}                        " Type (python).
set statusline+=)


" Line and column position and counts.
set statusline+=\ (line\ %l\/%L,\ col\ %03c)

if &term == "screen" || &term == "screen-256color"

    set ttymouse=xterm2
endif


" Set window title to same as statusline
let &titlestring=&statusline


" We know xterm-debian is a color terminal
if &term =~ "xterm-debian" || &term =~ "xterm-xfree86"

    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm

endif



" keybindings
let mapleader=","
nmap ; :
vmap ; :
cmap w!! w !sudo tee > /dev/null %

" Disable man key
nnoremap K <nop>
nnoremap ` <nop>
nnoremap tn :tabnew<Space>

nnoremap <Tab> >>
nnoremap <Tab> >>

nnoremap q <nop>

vnoremap <Tab> >gv 
vnoremap <S-Tab> <gv

" clears search highlight
nnoremap <silent> // :noh<CR> 

" Quick workd jumping
inoremap <Esc>[C <S-Right>
inoremap <Esc>[D <S-Left>

nnoremap <Esc>[A { 
nnoremap <Esc>[B }
nnoremap <Esc>[C <S-Right>
nnoremap <Esc>[D <S-Left>

" Tab movememnt
nnoremap <silent> <Esc><Right> :tabn<CR>
nnoremap <silent> <Esc><Left> :tabp<CR>

" Change Y to copy from current character to end of line
noremap Y y

" Make p in Visual mode replace the selected text with the "" register.
vnoremap p "_dP
vnoremap P "_dP

" Removing Ctrl-B behavior
nmap <C-b> <nop>
imap <C-b> <nop>

" Map _$ to trim whitespace on the end of lines
function! Preserve(command)
    let _s=@/
    let l = line(".")
    let c = col(".")
    execute a:command
    let @/=_s
    call cursor(l, c)
endfun

nmap <silent> _$ :call Preserve("%s/\\s\\+$//e")<CR><C-l> 

" Fix keys over ssh
inoremap <Esc>Oq 1
inoremap <Esc>Or 2
inoremap <Esc>Os 3
inoremap <Esc>Ot 4
inoremap <Esc>Ou 5
inoremap <Esc>Ov 6
inoremap <Esc>Ow 7
inoremap <Esc>Ox 8
inoremap <Esc>Oy 9
inoremap <Esc>Op 0
inoremap <Esc>On .
inoremap <Esc>OR *
inoremap <Esc>OQ /
inoremap <Esc>Ol +
inoremap <Esc>OS -

noremap  <Esc>[1~ <Home>
cnoremap <Esc>[1~ <Home>

noremap  <Esc>[4~ <End>
cnoremap <Esc>[4~ <End>
inoremap <Esc>[4~ <End>


" resize splits if/when windows resizes
au VimResized * exe "normal! \<c-w>="


" keybindings for Tcomment
nmap C :TComment<CR>
vmap C :TComment<CR>

" dbext
nmap <F7> :DBResultsClose<CR>
nmap <F8> :DBPromptForBufferParameters<Cr>
vnoremap <F9> :DBExecVisualSQL<cr>

nnoremap <leader>, A,<Esc>A
" leader key <,> + A to add commad at end of line
nnoremap <leader>; A;
" press ; twice to add ; at end of current line
inoremap ;; <Esc>A; 

" resize horizontal split
nmap <C-Up> <C-W>-<C-W>-
nmap <C-Down> <C-W>+<C-W>+

" resize vertical split
nmap <C-Left> <C-W>><C-W>>
nmap <C-Right> <C-W><<C-W>< 

" Color column
highlight ColorColumn ctermbg=DarkMagenta
highlight ColorColumn ctermfg=15
highlight FoldColumn ctermbg=3
highlight FoldColumn ctermfg=1
set cc=1,2,3,4,80

"fix different colors
highlight DiffText ctermbg=1

" Highlight conflic error msg
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
" Plugin 'bling/vim-bufferline'
Plugin 'vim-scripts/tComment'
" Plugin 'scrooloose/nerdcommenter'
"Plugin 'vim-scripts/AfterColors'
Plugin 'easymotion/vim-easymotion'
" Plugin 'powerline/powerline'
" Plugin 'vim-scripts/dbext.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/syntastic'
Plugin 'chrisbra/csv.vim.git'
Plugin 'ervandew/supertab'
Plugin 'sudar/vim-arduino-syntax'
" Plugin 'jplaut/vim-arduino-ino'
Plugin 'tclem/vim-arduino'
Plugin 'danro/rename.vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'groenewege/vim-less'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'vim-scripts/python.vim--Vasiliev'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'vim-scripts/functionlist.vim'
" Plugin 'easymotion/vim-easymotion'
"Plugin 'tclem/vim-arduino'
"Plugin 'itchyny/lightline.vim'

" let g:Powerline_symbols = 'fancy'

let g:syntastic_python_flake8_args = '--ignore=W191,E501,E128,W291,E126,E101'
" let b:syntastic_checkers = ['flake8']
let g:syntastic_php_checkers = ['php']
" let b:syntastic_checkers = ['pylint']
let b:syntastic_python_checkers = ['flake8']
unlet! g:python_space_error_highlight
let g:pymode_syntax_indent_errors = 0
let g:pymode_syntax_space_errors = 0

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_loc_list_height=3


let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<leader><tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"


" Arduino installation path
let g:vim_arduino_library_path='/usr/share/share/arduino'

" location of arduino serial port
let g:vim_arduino_serial_port='/dev/ttyACM0'

" enable keys
let g:vim_arduino_map_keys=1

"let g:lightline.separator={'left': '', 'right': ''}
"let g:lightline = {
"            \'colorscheme': 'powerline',
"            \'separator':{'left': '', 'right': ''}}

"let g:lightline.component = {
"            \'mode': '%{lightline#mode()}',
"            \'absolutepath': '%F',
"            \'relativepath': '%f',
"            \'filename': '%t',
"            \'modified': '%M',
"            \'bufnum': '%n',
"            \'paste': '%{&paste?"PASTE":""}',
"            \'readonly': '%R',
"            \'charvalue': '%b',
"            \'charvaluehex': '%B',
"            \'fileencoding': '%{strlen(&fenc)?&fenc:&enc}',
"            \'fileformat': '%{&fileformat}',
"            \'filetype': '%{strlen(&filetype)?&filetype:"no ft"}',
"            \'percent': '%3p%%',
"            \'percentwin': '%P',
"            \'spell': '%{&spell?&spelllang:"no spell"}',
"            \'lineinfo': '%3l:%-2v',
"            \'line': '%l',
"            \'column': '%c',
"            \'close': '%999X X '}
" set rtp+=/usr/local/lib/python2.7/dist-packages/powerline/bindings/vim/


" Show NERDTree
noremap <silent> <F2> :NERDTreeToggle<CR>

" Show Tabman
" noremap <silent> <F3> :TMToggle<CR>

" Show Function List
" noremap <silent> <F4> :Flisttoggle<CR>
noremap <silent> <F4> :TlistToggle<CR>


" Gif config
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" " These `n` & `N` mappings are options. You do not have to map `n` & `N` to
" EasyMotion.
" " Without these mappings, `n` & `N` works fine. (These mappings just provide
" " different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

let g:tmux_navigator_no_mappings = 1

nnoremap <silent> {Left-mapping} :TmuxNavigateLeft<cr>
nnoremap <silent> {Down-Mapping} :TmuxNavigateDown<cr>
nnoremap <silent> {Up-Mapping} :TmuxNavigateUp<cr>
nnoremap <silent> {Right-Mapping} :TmuxNavigateRight<cr>
nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>


"Default: /Applications/Arduino.app/Contents/Resources/Java
let g:vim_arduino_library_path = "/usr/local/share/arduino"
""Default: result of `$(ls /dev/tty.* | grep usb)`
let g:vim_arduino_serial_port = "/dev/ttyACM0"

call vundle#end()
filetype plugin indent on
