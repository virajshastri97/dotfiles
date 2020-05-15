set nocompatible
filetype off    " Required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/vundle'

Plugin 'scrooloose/nerdtree'
Plugin 'xuyuanp/nerdtree-git-plugin'
Plugin 'itchyny/lightline.vim'
" Plugin 'valloric/youcompleteme'

Plugin 'altercation/vim-colors-solarized'
Plugin 'dracula/vim'

call vundle#end()

set number
syntax enable
set tabstop=4
set shiftwidth=4
" set background=dark
" let g:solarized_termcolors = 256
" colorscheme solarized
let g:dracula_colorterm=0
colorscheme dracula

filetype plugin indent on " Required

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-p><C-i> :PluginInstall<CR>
