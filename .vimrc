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

" Color column
highlight ColorColumn ctermbg=DarkMagenta
highlight ColorColumn ctermfg=15
highlight FoldColumn ctermbg=3
highlight FoldColumn ctermfg=1
set cc=1,2,3,4,80


filetype off

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'bling/vim-bufferline'
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
