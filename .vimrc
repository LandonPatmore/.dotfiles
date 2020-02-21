set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

"Plugins
Plugin 'vim-airline/vim-airline'
Plugin 'vim-syntastic/syntastic'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'bling/vim-bufferline'
Plugin 'fugitive.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tomasiser/vim-code-dark'

call vundle#end()            " required
filetype plugin indent on    " requiredn

colorscheme codedark
:syntax on

let g:airline_theme='codedark' "airline theme (status bar)

set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set relativenumber "shows relative numbers to current line
set number "show line numbers
set laststatus=2 "for airline
set t_Co=256
set hidden
set cursorline
set colorcolumn=80
set backspace=2
set ignorecase
set smartcase


"For proper tabbing and bracket insertion"
inoremap {<cr> {<cr>}<c-o><s-o>
inoremap [<cr> [<cr>]<c-o><s-o>
inoremap (<cr> (<cr>)<c-o><s-o>

"Mapping buttons"
map <C-o> :NERDTreeToggle<CR>
