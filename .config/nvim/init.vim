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

" {{{ Bootstrap
if has('vim_starting')
  set nocompatible               " Be iMproved
endif

let g:vim_bootstrap_editor = "nvim"
" }}}

" {{{ Plug
if empty(glob('~/.config/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Required:
call plug#begin('~/.config/nvim/plugged')
  " User Interface
  Plug 'dracula/vim'
  Plug 'morhetz/gruvbox'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  "Editing
  Plug 'scrooloose/nerdcommenter'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-surround'
  Plug 'jiangmiao/auto-pairs'
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'thinca/vim-visualstar'

  " Git/VCS
  Plug 'airblade/vim-gitgutter'

  " Languages
  Plug 'majutsushi/tagbar'
  Plug 'vim-syntastic/syntastic'
  Plug 'rust-lang/rust.vim'
  Plug 'racer-rust/vim-racer'
  Plug 'autozimu/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins'  }
  Plug 'roxma/nvim-completion-manager'
  Plug 'roxma/nvim-cm-racer'
  Plug 'Shougo/neco-vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'cespare/vim-toml'
  Plug 'dag/vim-fish'

  " FZF
  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
  endif
call plug#end()
"}}}

" {{{ Sensible Defaults
" Required:
filetype plugin indent on
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
:autocmd FileType vim setlocal foldmethod=marker
" Leave paste mode when leaving insert mode
autocmd InsertLeave * set nopaste
" }}}

" {{{ UI Settings
set termguicolors
colorscheme gruvbox
set background=dark
let g:airline_theme='gruvbox'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
set relativenumber " Show relative line numbers
set number " Show absolute number on current line
set textwidth=80
" }}}

" {{{ Editing Settings

" Comments with NerdCommenter: Add spaces after delimiters, allow to comment
" empty lines and automatically trim trailing whitespaces when uncommenting
let g:NERDSpaceDelims = 1
let g:NERDCommentEmptyLines = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1

"" Tabs. May be overriten by autocmd rules
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab

autocmd BufEnter * EnableStripWhitespaceOnSave
" }}}

" {{{ FZF
set wildmode=list:longest,list:full
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
set grepprg=rg\ --vimgrep

function! s:align_lists(lists)
  let maxes = {}
  for list in a:lists
    let i = 0
    while i < len(list)
      let maxes[i] = max([get(maxes, i, 0), len(list[i])])
      let i += 1
    endwhile
  endfor
  for list in a:lists
    call map(list, "printf('%-'.maxes[v:key].'s', v:val)")
  endfor
  return a:lists
endfunction

function! s:btags_source()
  let lines = map(split(system(printf(
    \ 'ctags -f - --sort=no --excmd=number --language-force=%s %s',
    \ &filetype, expand('%:S'))), "\n"), 'split(v:val, "\t")')
  if v:shell_error
    throw 'failed to extract tags'
  endif
  return map(s:align_lists(lines), 'join(v:val, "\t")')
endfunction

function! s:btags_sink(line)
  execute split(a:line, "\t")[2]
endfunction

function! s:btags()
  try
    call fzf#run({
    \ 'source':  s:btags_source(),
    \ 'options': '+m -d "\t" --with-nth 1,4.. -n 1 --tiebreak=index',
    \ 'down':    '40%',
    \ 'sink':    function('s:btags_sink')})
  catch
    echohl WarningMsg
    echom v:exception
    echohl None
  endtry
endfunction

command! BTags call s:btags()
"}}}

" {{{ Synctastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" }}}

" {{{ Global Bindings
imap fd <Esc>
nmap <Enter> :nohlsearch<cr>
" }}}

" {{{ Leader Bindings
let mapleader = ' '
let maplocalleader = ','

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
nnoremap <silent> <leader>pu :PlugUpdate<cr>

" Jumping Around
nmap <Leader>ji :BTags<CR>
nmap <Leader>jI :TagbarToggle<CR>

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
" }}}

" {{{ Misc Plugins
let g:tagbar_type_rust = {
   \ 'ctagstype' : 'rust',
   \ 'kinds' : [
       \'T:types,type definitions',
       \'f:functions,function definitions',
       \'g:enum,enumeration names',
       \'s:structure names',
       \'m:modules,module names',
       \'c:consts,static constants',
       \'t:traits',
       \'i:impls,trait implementations',
   \]
   \}
" }}}

" {{{ Rust
set hidden
let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }
nnoremap <silent> K :call LanguageClient_textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient_textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient_textDocument_rename()<CR>
let g:LanguageClient_autoStart=1
" }}}

"{{{ Custom Functions
function! CycleThemes()
  let current_background = &background
  if current_background == "dark"
    set background=light
  else
    set background=dark
  endif
endfunction
nnoremap <leader>Tn :call CycleThemes()<cr>
"}}}
