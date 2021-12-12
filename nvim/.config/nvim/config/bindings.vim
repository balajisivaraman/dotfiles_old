" use fd in quick succession for escape
imap fd <Esc>
" Enter clears searches. Nifty trick borrowed from Gary Bernhardt.
nmap <Enter> :nohlsearch<cr>
" Alias semicolon in normal to colon
nmap ; :

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

" Easy Align
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
