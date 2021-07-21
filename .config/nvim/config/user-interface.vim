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

colorscheme tempus_totus
set background=light
highlight Normal     ctermbg=NONE guibg=NONE
highlight LineNr     ctermbg=NONE guibg=NONE
highlight SignColumn ctermbg=NONE guibg=NONE

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

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = { "bash", "css", "go", "java", "json", "regex", "rust", "typescript" },
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
}
EOF
