" Copyright (c) 2017  Balaji Sivaraman <balaji@balajisivaraman.com>
"
" This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software
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

" Dein
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif
" Required:
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.config/nvim/dein')
  call dein#begin('~/.config/nvim/dein')

  " Let dein manage dein
  " Required:
  call dein#add('~/.config/nvim/dein/repos/github.com/Shougo/dein.vim')

  call dein#add ('icymind/neosolarized')
  call dein#add ('vim-airline/vim-airline')
  call dein#add ('vim-airline/vim-airline-themes')
  call dein#add ('airblade/vim-gitgutter')
  call dein#add ('Shougo/denite.nvim')

  if dein#check_install()
    call dein#install()
    let pluginsExist=1
  endif

  " Required:
  call dein#remote_plugins()
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

"End dein Scripts-------------------------

" {{{ Sensible Defaults
set autoread
set autoindent
set backspace=indent,eol,start
set complete-=i
set smarttab
set incsearch
set visualbell " Don't beep, please
set display+=lastline
" }}}

" {{{ UI Settings
set termguicolors
set background=dark
let g:neosolarized_bold = 1
let g:neosolarized_underline = 1
let g:neosolarized_italic = 1
colorscheme NeoSolarized
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1

set relativenumber " Show relative line numbers
set number " Show absolute number on current line
" }}}

" {{[ Global Bindings
imap fd <Esc>
nmap <Enter> :nohlsearch<cr>
nnoremap ; :
" }}}

" {{{ Leader Bindings
let mapleader = ' '
nnoremap <leader>fd :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fR :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>qq :confirm quit<cr>

" Dein
nnoremap <leader>Pu :call dein#update()<cr>
" }}}

" {{{ Denite
call denite#custom#alias('source', 'file_rec/git', 'file_rec')
call denite#custom#alias('source', 'file_rec/rg', 'file_rec')
call denite#custom#var('file_rec/git', 'command',
      \ ['git', 'ls-files-root', '--full-name', '-co', '--exclude-standard'])
call denite#custom#var('file_rec/rg', 'command',
      \ ['rg', '--files', '-uuu', '--maxdepth', '1'])
call denite#custom#var('file_rec', 'command',
      \ ['rg', '--files', '--glob', '!.git', ''])
nnoremap <leader>ph :DeniteProjectDir file_rec/git<cr>
nnoremap <leader>bb :Denite buffer<cr>
nnoremap <leader>ff :DeniteBufferDir file_rec/rg<cr>
nnoremap <leader>fF :DeniteBufferDir file_rec<cr>
call denite#custom#map(
      \ 'insert',
      \ '<Down>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<Up>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-g>',
      \ '<denite:leave_mode>',
      \ 'noremap'
      \)
" }}}

" {{{ Custom Functions
function! CycleThemes()
  let current_background = &background
  if current_background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction
nnoremap <leader>Tn :call CycleThemes()<cr>
" }}}
