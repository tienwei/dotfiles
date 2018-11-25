"Tien's vimrc

" Misc {{{
set modelines=1
set nocompatible 
set number
set relativenumber
set pastetoggle=<F2>
let mapleader = ","
nnoremap ; :
noremap <C-c> <ESC>
" }}}

" Colour {{{
colorscheme gruvbox
" }}}

" Tabs && Space {{{
set tabstop=2 
set softtabstop=2 
set expandtab 
set shiftwidth=2 
set smarttab
set autoindent
set copyindent
map  <F7> mzgg=G`z
" }}}

" File {{{
let g:netrw_banner=0
set path+=**
set hidden
set lazyredraw
set wildmenu
set wildignore=*.swp,*.bak,*.pyc
set nobackup
set noswapfile
"toggle undo tree
nnoremap <leader>u :UndotreeToggle<CR>
nnoremap <leader>ls :Ex<CR>
inoremap <leader>ls <ESC>:Ex<CR>
nnoremap ZZ :w<CR>
inoremap ZZ <ESC>:w<CR>
cnoremap w!! w !sudo tee %>/dev/null
" }}}

" Cursor and Color Column {{{
set textwidth=80
set colorcolumn=+1
highligh colorcolumn guibg=red 
set cursorline
set cursorcolumn
" }}}

" Folding {{{
set foldenable          " enable folding
set foldnestmax=10      " 10 nested fold max
nnoremap <SPACE> za
" }}}

" Search {{{
let g:ag_working_path_mode="r"
set showmatch
set ignorecase
set smartcase
set hlsearch
set incsearch
set list
set inccommand=split
nnoremap <leader><SPACE> :nohlsearch<CR>
nnoremap <leader>f :Ag<CR>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
" }}}

" Motions {{{
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
nnoremap j gj
nnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap $ <nop>
nnoremap ^ <nop>
" }}}

" Windows {{{
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
set splitbelow
set splitright
" }}}

" Copy & Paste {{{
noremap <leader>y "+Y
noremap <leader>d "+d
noremap <leader>p "+p
" }}}

" Configurations {{{
noremap <leader>ev :e ~/dotfiles/.vimrc<CR>
noremap <leader>ez :e ~/dotfiles/.zshrc<CR>
noremap <leader>rv :source ~/.vimrc<CR>
" }}}

" Git Stuff {{{
let g:gitgutter_max_signs = 500
noremap <leader>gst :Gstatus<CR>
noremap <leader>ga :Gwrite<CR>
noremap <leader>gco :Gread<CR>
noremap <leader>gcm :Gcommit<CR>
noremap <leader>gd :Gdiff<CR>
noremap <leader>gp :Gpush<CR>
noremap <leader>gl :Gpull<CR>
noremap <leader>>> :diffget //2 <BAR> diffup<CR>
noremap <leader><< :diffget //3 <BAR> diffup<CR>
" }}}

" Tmux {{{
" allows cursor change in tmux mode
if exists('$TMUX')
    let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif
" }}}

" Plugins {{{
filetype plugin on
call plug#begin('~/.vim/plugged')
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install',
      \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown'] }

Plug 'neomake/neomake'
Plug 'pangloss/vim-javascript'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-unimpaired'
call plug#end()
" }}}

" Prettier configs {{{
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
" }}}


" vim:foldmethod=marker:foldlevel=0
