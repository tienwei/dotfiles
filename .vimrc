set nocompatible 
set number
set relativenumber
set background=dark
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set path+=**
set wildmenu
set colorcolumn=80
set textwidth=80
highlight ColorColumn guibg=red
set cursorline
set cursorcolumn


noremap <leader>y "*y
colorscheme gruvbox

call plug#begin('~/.vim/plugged')
  " post install (yarn install | npm install) then load plugin only for editing supported files
  Plug 'prettier/vim-prettier', {
    \ 'do': 'yarn install',
    \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

  " Plug 'vim-syntastic/syntastic'
  Plug 'pangloss/vim-javascript'
  Plug '/usr/local/opt/fzf'
  Plug 'junegunn/fzf.vim'
  Plug 'airblade/vim-gitgutter'
  Plug 'tpope/vim-fugitive'
  Plug 'junegunn/gv.vim'
call plug#end()

" Prettier configs
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync

let g:ag_working_path_mode="r"
let g:netrw_banner = 0
let g:gitgutter_max_signs = 500
