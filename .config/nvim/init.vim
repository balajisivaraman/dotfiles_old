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
  Plug 'rakr/vim-one'
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
  Plug 'Shougo/neosnippet'
  Plug 'Shougo/neosnippet-snippets'
  Plug 'honza/vim-snippets'

  " Git/VCS
  Plug 'airblade/vim-gitgutter'

  " Languages
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
  Plug 'ledger/vim-ledger'

  " FZF
  if isdirectory('/usr/local/opt/fzf')
    Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
  else
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
    Plug 'junegunn/fzf.vim'
  endif
call plug#end()

" Source custom configuration files
source ~/.config/nvim/config/base.vim
source ~/.config/nvim/config/user-interface.vim
source ~/.config/nvim/config/editing.vim
source ~/.config/nvim/config/fzf.vim
source ~/.config/nvim/config/syntax-checkers.vim
source ~/.config/nvim/config/bindings.vim
source ~/.config/nvim/config/snippets.vim
source ~/.config/nvim/config/functions.vim
source ~/.config/nvim/config/rust.vim

