set nocompatible
filetype off    " Required

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'scrooloose/nerdtree'

Bundle 'xuyuanp/nerdtree-git-plugin'

Bundle 'valloric/youcompleteme'

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

filetype plugin indent on " Required

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nmap <C-n> :NERDTreeToggle<CR>
nmap <C-b><C-i> :BundleInstall<CR>
