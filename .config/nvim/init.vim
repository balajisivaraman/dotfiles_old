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

" Vim Plug
let g:vim_bootstrap_editor = "nvim"

" Required:
call plug#begin('~/.config/nvim/plugged')
  " User Interface
  Plug 'dracula/vim'
  Plug 'itchyny/lightline.vim'

  "Editing
  Plug 'scrooloose/nerdcommenter'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'ervandew/supertab'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'jiangmiao/auto-pairs'
  Plug 'justinmk/vim-sneak'
  Plug 'easymotion/vim-easymotion'
  Plug 'thinca/vim-visualstar'
  Plug 'honza/vim-snippets'

  " Git/VCS
  Plug 'airblade/vim-gitgutter'

  " Languages
  Plug 'rust-lang/rust.vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'cespare/vim-toml'
  Plug 'dag/vim-fish'

  " Skim
  Plug 'lotabout/skim', { 'dir': '~/.skim', 'do': './install' }
  Plug 'lotabout/skim.vim'
call plug#end()

" Source custom configuration files
source ~/.config/nvim/config/base.vim
source ~/.config/nvim/config/user-interface.vim
source ~/.config/nvim/config/editing.vim
source ~/.config/nvim/config/skim.vim
source ~/.config/nvim/config/bindings.vim

