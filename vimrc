set number
set tabstop=4
set autoindent
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list
set showcmd
set expandtab

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'preservim/nerdtree'
call plug#end()
