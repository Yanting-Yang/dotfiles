set number
set tabstop=4
set autoindent
set listchars=tab:>·,trail:~,extends:>,precedes:<
set list
set showcmd
set expandtab

" status line
set laststatus=2 " always show status line
set statusline=%t " tail of the file name
set statusline+=[%{&fileencoding},%{&fileformat},%{&filetype}]
set statusline+=%m " modified flag
set statusline+=%r " read only flag
set statusline+=%= " separation between left and right aligned items
set statusline+=[%l/%L,\ %c]
set statusline+=\ %p%% " percentage through file

call plug#begin(has('nvim') ? stdpath('data') . '/plugged' : '~/.vim/plugged')
    Plug 'preservim/nerdtree'
call plug#end()
