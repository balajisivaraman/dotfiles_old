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

  " User Interface
  call dein#add ('icymind/neosolarized')
  call dein#add ('vim-airline/vim-airline')
  call dein#add ('vim-airline/vim-airline-themes')

  " Git/VCS
  call dein#add ('airblade/vim-gitgutter')
  call dein#add ('tpope/vim-fugitive')

  " Navigation
  call dein#add ('scrooloose/nerdtree')
  call dein#add ('Xuyuanp/nerdtree-git-plugin')
  call dein#add ('Shougo/denite.nvim')

  " Editing
  call dein#add ('tpope/vim-surround')
  call dein#add ('easymotion/vim-easymotion')
  call dein#add ('Shougo/deoplete.nvim')
  call dein#add ('jiangmiao/auto-pairs')
  call dein#add ('ntpeters/vim-better-whitespace')
  call dein#add ('scrooloose/nerdcommenter')

  " Languages
  call dein#add ('derekwyatt/vim-scala')
  call dein#add ('ensime/ensime-vim')

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
set expandtab
if executable("/usr/bin/python3")
  let g:python_host_prog = "/usr/bin/python"
  let g:python3_host_prog = "/usr/bin/python3"
elseif executable("/usr/local/bin/python3")
  let g:python_host_prog="/usr/local/bin/python"
  let g:python3_host_prog="/usr/local/bin/python3"
endif
" }}}

" {{{ Editing Settings
let g:deoplete#enable_at_startup = 1 " Enable completion with deoplete
let g:deoplete#complete_method = "omnifunc"
" Remap ctrl-c for this issue:
" https://github.com/Shougo/deoplete.nvim/issues/460
inoremap <C-c> <Esc>
autocmd BufEnter * EnableStripWhitespaceOnSave
" Comments with NerdCommenter: Add spaces after delimiters, allow to comment
" empty lines and automatically trim trailing whitespaces when uncommenting
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
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
let maplocalleader = ','
nnoremap <leader>fd :e ~/.config/nvim/init.vim<cr>
nnoremap <leader>fs :w<cr>
nnoremap <leader>fR :source ~/.config/nvim/init.vim<cr>
nnoremap <leader>bd :bd<cr>
nnoremap <leader>qq :confirm quit<cr>

" Dein
nnoremap <leader>Pu :call dein#update()<cr>
nnoremap <leader>Pr :call map(dein#check_clean(), "delete(v:val, 'rf')")<cr>

" Git
nmap gp <Plug>GitGutterPrevHunk
nmap gn <Plug>GitGutterNextHunk
nmap ga <Plug>GitGutterStageHunk
nmap gr <Plug>GitGutterUndoHunk
nmap gv <Plug>GitGutterPreviewHunk
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gl :Glog<cr>
nnoremap <leader>gP :Gpull<cr>
nnoremap <leader>gp :Gpush<cr>

" Easymotion
map <Leader>j <Plug>(easymotion-prefix)
map <Leader>jf <Plug>(easymotion-lineforward)
map <Leader>jj <Plug>(easymotion-j)
map <Leader>jk <Plug>(easymotion-k)
map <Leader>jb <Plug>(easymotion-linebackward)

" Simpler navigation for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>
nnoremap <C-Left> <C-W><C-H>
" }}}

" {{{ Nerdtree
" Below lines will load NERDTree when Vim starts if no file is specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Close NERDTree when it is the only buffer remaining in Vim
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeShowHidden = 1
map <C-n> :NERDTreeToggle<CR>
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

" {{{ Scala
let ensime_server_v2 = 1
autocmd BufWritePost *.scala silent :EnTypeCheck
" }}}
