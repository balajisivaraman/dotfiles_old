" Enable Truecolor support
set termguicolors
" Do not show mode since we're using Lightline
set noshowmode

colorscheme modus-vivendi
set background=dark
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
