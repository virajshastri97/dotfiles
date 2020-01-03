set nocompatible
filetype off    " Required

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle 'altercation/vim-colors-solarized'

Bundle 'scrooloose/nerdtree'

Bundle 'xuyuanp/nerdtree-git-plugin'

set number
syntax enable
set background=dark
let g:solarized_termcolors = 256
colorscheme solarized

filetype plugin indent on " Required
