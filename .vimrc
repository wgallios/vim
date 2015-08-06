set nocompatible
set showtabline=2
set ruler
set number
set mouse=a
set relativenumber
set scrolloff=5
"set list
set laststatus=2
set numberwidth=1
set foldcolumn=1


set autoindent                                                                  
set expandtab                                                                   
set smarttab                                                                    
set shiftwidth=4                                                                
set softtabstop=4                                                               
set tabstop=4                                                                   

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

let mapleader=","
nmap ; :
vmap ; :
cmap w!! w !sudo tee > /dev/null %

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
Plugin 'bling/vim-bufferline'
Plugin 'vim-scripts/tComment'
Plugin 'vim-scripts/AfterColors'
Plugin 'easymotion/vim-easymotion'
Plugin 'vim-scripts/dbext.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'scrooloose/syntastic'
Plugin 'chrisbra/csv.vim.git'
Plugin 'ervandew/supertab'
"Plugin 'itchyny/lightline.vim'


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

call vundle#end()
filetype plugin indent on
