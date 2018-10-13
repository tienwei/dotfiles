set nocompatible 
set number
set relativenumber
set background=dark
set pastetoggle=<F2>
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set path+=**
set wildmenu
set colorcolumn=80
set textwidth=80
highlight ColorColumn guibg=red
set cursorline
set cursorcolumn

set hidden

set autoindent
set copyindent
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set list

set wildignore=*.swp,*.bak,*.pyc
set nobackup
set noswapfile

" mappings
let mapleader = ","

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map  <F7> mzgg=G`z

noremap <leader>cy "*Y
noremap <leader>cd "*D
noremap <leader>cp "*P
noremap <leader>ev :e ~/.vimrc<CR>
noremap <leader>rv :source ~/.vimrc<CR>
nnoremap ; :
nnoremap ZZ :w<CR>

inoremap ZZ <ESC>:w<CR>

cnoremap w!! w !sudo tee %>/dev/null

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
