" Copyright (c) 2018  Balaji Sivaraman <balaji@balajisivaraman.com>
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

" Enable Truecolor support
set termguicolors
" Do not show mode since we're using Lightline
set noshowmode

" Use One Dark Theme
" onedark.vim override: Don't set a background color when running in a terminal;
" just use the terminal's background color
" `gui` is the hex color code used in GUI mode/nvim true-color mode
" `cterm` is the color code used in 256-color mode
" `cterm16` is the color code used in 16-color mode
if (has("autocmd") && !has("gui_running"))
  augroup colorset
    autocmd!
    let s:white = { "gui": "#ABB2BF", "cterm": "145", "cterm16" : "7" }
    autocmd ColorScheme * call onedark#set_highlight("Normal", { "fg": s:white }) " `bg` will not be styled since there is no `bg` setting
  augroup END
endif
colorscheme onedark
set background=dark
let g:lightline = {
      \ 'colorscheme': 'onedark',
      \ }

" Basic UI Settings
set relativenumber  " Show relative line numbers
set number          " Show absolute number on current line
set colorcolumn=80  " ruler at 80 chars width
set cursorline      " Highlight current line

" Navigation
set scrolloff=3 " some lines around scroll for context

" Set textwidth to 80 for text files
au FileType vim setlocal textwidth=80
au FileType markdown setlocal textwidth=80
