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
  Plug 'joshdick/onedark.vim'
  Plug 'itchyny/lightline.vim'

  "Editing
  Plug 'tpope/vim-commentary'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-unimpaired'
  Plug 'ntpeters/vim-better-whitespace'
  Plug 'jiangmiao/auto-pairs'
  Plug 'easymotion/vim-easymotion'
  Plug 'thinca/vim-visualstar'
  Plug 'Shougo/neosnippet.vim'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'editorconfig/editorconfig-vim'
  Plug 'sjl/gundo.vim'
  Plug 'junegunn/vim-easy-align'
  Plug 'unblevable/quick-scope'
  Plug 'terryma/vim-multiple-cursors'

  " Git/VCS
  Plug 'airblade/vim-gitgutter'

  " General Purpose
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Languages
  Plug 'rust-lang/rust.vim'
  Plug 'Shougo/echodoc.vim'
  Plug 'cespare/vim-toml'
  Plug 'dag/vim-fish'
  Plug 'fatih/vim-go'
  Plug 'mboughaba/i3config.vim'
  Plug 'martinda/Jenkinsfile-vim-syntax'
  Plug 'stephpy/vim-yaml'
  Plug 'ekalinin/Dockerfile.vim'

  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  " File Management
  Plug 'ryanoasis/vim-devicons'
  Plug 'qpkorr/vim-renamer'
call plug#end()

" Source custom configuration files
source ~/.config/nvim/config/base.vim
source ~/.config/nvim/config/user-interface.vim
source ~/.config/nvim/config/editing.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/bindings.vim
source ~/.config/nvim/config/coc.vim
source ~/.config/nvim/config/rust.vim
source ~/.config/nvim/config/go.vim

