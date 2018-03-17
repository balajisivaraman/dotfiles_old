" Copyright (c) 2017  Balaji Sivaraman <balaji@balajisivaraman.com>
"
" This program is free software: you can redistribute it and/or modify it under
" the terms of the GNU General Public License as published by the Free Software
" Foundation, either version 3 of the License, or (at your option) any later
" version.
"
" This program is distributed in the hope that it will be useful, but WITHOUT
" ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
" FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more
" details.
"
" You should have received a copy of the GNU General Public License along with
" this program.  If not, see <http://www.gnu.org/licenses/>.

if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let g:vim_bootstrap_editor = "nvim"

" {{{ Plug
if empty(glob('~/.config/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Required:
call plug#begin('~/.config/nvim/plugged')
  " User Interface
  Plug 'dracula/vim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
  endif
call plug#end()
"}}}

" Required:
filetype plugin indent on

" {{{ Sensible Defaults
set autoread
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set incsearch
set visualbell " Don't beep, please
set display+=lastline
set expandtab
if executable("/usr/bin/python3")
  let g:python_host_prog = "/usr/bin/python"
  let g:python3_host_prog = "/usr/bin/python3"
elseif executable("/usr/local/bin/python3")
  let g:python_host_prog="/usr/local/bin/python"
  let g:python3_host_prog="/usr/local/bin/python3"
endif
" }}}

" {{{ UI Settings
set termguicolors
colorscheme dracula
let g:airline_theme='dracula'
let g:airline#extensions#tabline#enabled = 1
set relativenumber " Show relative line numbers
set number " Show absolute number on current line
" }}}

" {{{ FZF
set wildmode=list:longest,list:full
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
set grepprg=rg\ --vimgrep
"}}}

" {{[ Global Bindings
imap fd <Esc>
nmap <Enter> :nohlsearch<cr>
nnoremap ; :
" }}}

" {{{ Leader Bindings
let mapleader = ' '
let maplocalleader = ','
nnoremap <leader>fd :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>ff :Files<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fR :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>qq :confirm quit<cr> <Paste>

" Simpler navigation for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
" }}}

