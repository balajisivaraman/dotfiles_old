" General
set nocompatible          " Be iMproved
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
syntax enable             " enable syntax highlighting

set autoread      " auto-reload files changed on disk
set updatecount=0 " disable swap files
set visualbell    " Don't beep, please
set display+=lastline
set expandtab " expand tabs into spaces

" Ensure Python executable is set properly
if executable("/usr/bin/python3")
  let g:python_host_prog = "/usr/bin/python2"
  let g:python3_host_prog = "/usr/bin/python3"
elseif executable("/usr/local/bin/python3")
  let g:python_host_prog="/usr/local/bin/python2"
  let g:python3_host_prog="/usr/local/bin/python3"
endif

" Leave paste mode when leaving insert mode
au InsertLeave * set nopaste

" Use system clipboard for yanks.
set clipboard+=unnamedplus
