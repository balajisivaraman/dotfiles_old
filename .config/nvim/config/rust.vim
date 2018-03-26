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

set hidden
let g:racer_cmd="~/.cargo/bin/racer"
let g:racer_experimental_completer=1
let g:LanguageClient_serverCommands = {
    \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
    \ }

augroup myRustLang
    au!
    au FileType rust
    \  nmap <silent> gd :call LanguageClient_textDocument_definition()<CR>
    \| nnoremap <silent> <localleader>ht :call LanguageClient_textDocument_hover()<CR>
    \| nnoremap <silent> <localleader>r :call LanguageClient_textDocument_rename()<CR>
    \| nmap <silent> <localleader>js :call LanguageClient_textDocument_documentSymbol()<CR>
    \| nmap <silent> gs <Plug>(rust-def-split)
    \| nmap <silent> gx <Plug>(rust-def-vertical)
    \| nmap <silent> <localleader>hd <Plug>(rust-doc)
augroup END
