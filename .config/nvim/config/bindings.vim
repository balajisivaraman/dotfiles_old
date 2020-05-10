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

" use fd in quick succession for escape
imap fd <Esc>
" Enter clears searches. Nifty trick borrowed from Gary Bernhardt.
nmap <Enter> :nohlsearch<cr>

let mapleader = ' '
let maplocalleader = ','

" Easy quit from Neovim
nnoremap <silent> <leader>qq :confirm quit<cr> <Paste>

" Easier Bindings for VIMRC file
nnoremap <silent> <leader>fd :e ~/.config/nvim/init.vim<cr>
nnoremap <silent> <leader>fR :source ~/.config/nvim/init.vim<cr>

" File Bindings
nnoremap <silent> <leader>ff :Files<cr>
nnoremap <silent> <leader>fs :w<cr>

" Git
nmap gp <Plug>GitGutterPrevHunk
nmap gn <Plug>GitGutterNextHunk
nmap ga <Plug>GitGutterStageHunk
nmap gr <Plug>GitGutterUndoHunk
nmap gv <Plug>GitGutterPreviewHunk

" Buffers
nnoremap <silent> <leader>bd :bd<cr>
nnoremap <silent> <leader>bb :Buffers<cr>

" Plug
nnoremap <silent> <leader>pi :PlugInstall<cr>
nnoremap <silent> <leader>pc :PlugClean<cr>
nnoremap <silent> <leader>pu :PlugUpdate<cr>

" Jumping Around
nmap <Leader>ji :BTags<CR>

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Simpler navigation for splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
nnoremap <C-Down> <C-W><C-J>
nnoremap <C-Up> <C-W><C-K>
nnoremap <C-Right> <C-W><C-L>

" Gundo
nnoremap <Leader>u :GundoToggle<CR>
