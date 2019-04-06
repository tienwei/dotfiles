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
let g:netrw_localrmdir='rm -r'
set path+=**
set hidden
set lazyredraw
set wildmenu
set wildignore=*.swp,*.bak,*.pyc
set nobackup
set noswapfile
"typescript
autocmd BufNewFile,BufRead *.ts setlocal filetype=typescript
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
set scrolloff=5
set ignorecase
set smartcase
set hlsearch
set incsearch
set list
nnoremap <leader><SPACE> :nohlsearch<CR>
" nnoremap <leader>f :Rg<CR>
nnoremap <leader>f :Rp<SPACE>
nnoremap <leader>g :GFiles<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap n nzz
nnoremap N Nzz
nnoremap * *zz
nnoremap # #zz
nnoremap g* g*zz
nnoremap g# g#zz
" }}}

" Terminal {{{
tnoremap <Esc> <C-\><C-n>
tnoremap <M-[> <Esc>
tnoremap <M-h> <C-\><C-n><C-w>h
tnoremap <M-j> <C-\><C-n><C-w>j
tnoremap <M-k> <C-\><C-n><C-w>k
tnoremap <M-l> <C-\><C-n><C-w>l
" }}}

" Status Bar {{{
set statusline=%f         " Path to the file
set statusline+=%=        " Switch to the right side
set statusline+=%l        " Current line
set statusline+=/         " Separator
set statusline+=%L        " Total lines
set statusline+=%{gutentags#statusline()}
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
let g:ale_fix_on_save = 1
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
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'w0rp/ale'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'fatih/vim-go'
Plug 'ludovicchabant/vim-gutentags'
Plug 'JamshedVesuna/vim-markdown-preview'
Plug 'morhetz/gruvbox'
Plug 'leafgarland/typescript-vim'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" for neovim
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
" for vim 8 with python
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
  " the path to python3 is obtained through executing `:echo exepath('python3')` in vim
  let g:python3_host_prog = "/Users/tien-weilin/.pyenv/versions/neovim3/bin/python3"
endif
Plug 'neovimhaskell/haskell-vim'
call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'reason': ['~/reason-Language-server/reason-language-server.exe'],
    \ }
" enable autocomplete
let g:deoplete#enable_at_startup = 1

call yankstack#setup()
nmap Y y$
let g:yankstack_yank_keys = ['y', 'd']
let g:gutentags_ctags_exclude = ['./node_modules', '.*']
let vim_markdown_preview_hotkey='<C-m>'

" fzf
command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
command! -bang -nargs=* Ag
  \ call fzf#vim#ag(<q-args>,
  \                 <bang>0 ? fzf#vim#with_preview('up:60%')
  \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
  \                 <bang>0)
command! -nargs=+ -complete=file Rp call tien#custom#rg_raw(<q-args>)
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
" }}}

" Colour {{{
colorscheme gruvbox
" }}}

" Prettier configs {{{
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md PrettierAsync
" }}}


" vim:foldmethod=marker:foldlevel=0
