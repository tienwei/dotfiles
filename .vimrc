set nocompatible 
set number
set relativenumber
set background=dark
set pastetoggle=<F2>
set tabstop=2 softtabstop=2 expandtab shiftwidth=2 smarttab
set path+=**
set wildmenu
set cc=+1
set textwidth=80
hi ColorColumn ctermbg=LightBlue guibg=red
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

noremap <leader>y "+Y
noremap <leader>d "+d
noremap <leader>p "+p
noremap <leader>ev :e ~/.vimrc<CR>
noremap <leader>rv :source ~/.vimrc<CR>
nnoremap ; :
nnoremap ZZ :w<CR>
nnoremap <F5> :buffers<CR>:buffer <SPACE>
nnoremap <leader>f :Ag<CR>
nnoremap <C-p>  :GFile<CR>
nnoremap <leader>ls :Ex<CR>
nnoremap <leader>gst Gstatus
nnoremap <leader>ga Gwrite
nnoremap <leader>gc Gread
nnoremap <leader>gcm Gcommit
nnoremap <leader>gd Gdiff
nnoremap <leader>gp Gpush
nnoremap <leader>gl Gpull
inoremap ZZ <ESC>:w<CR>
inoremap <leader>ls <ESC>:Ex<CR>

cnoremap w!! w !sudo tee %>/dev/null


autocmd BufEnter * silent! lcd %:p:h

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
