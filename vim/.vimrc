" General
let mapleader=" "
nnoremap ; :
set noswapfile
set number

" Whitespace
set tabstop=4
set shiftwidth=4
set expandtab
set smartindent
set smarttab " insert tabs on the start of a line according to
             " shiftwidth, not tabstop

" Search
set ignorecase " case insensitive searching
set smartcase " search insensitive unless there is a captial in the pattern
set incsearch " Search as you type
set hlsearch " Highlight search terms
set cursorline " Highlight current line
" clear the search buffer with ,/
nmap <silent> ,/ :nohlsearch<CR>

" Easy window navigation
map <C-n> :vnew<CR>
map <C-b> :new<CR>
map == :vertical resize +5<CR>
map -- :vertical resize -5<CR>
map ++ :resize +5<CR>
map __ :resize -5<CR>
map <C-q> <C-w>q
map <silent> <C-h> :call functions#WinMove('h')<CR>
map <silent> <C-j> :call functions#WinMove('j')<CR>
map <silent> <C-k> :call functions#WinMove('k')<CR>
map <silent> <C-l> :call functions#WinMove('l')<CR>

" Tabbing
nnoremap th :tabfirst<CR>
nnoremap tk :tabnext<CR>
nnoremap tj :tabprev<CR>
nnoremap tl :tablast<CR>
nnoremap tt :tabedit<Space>
nnoremap tn :tabnew<CR>
nnoremap td :tabclose<CR>

" Automatically install Plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Automatically install functions
if empty(glob('~/.vim/autoload/functions.vim'))
    silent !curl -fLo ~/.vim/autoload/functions.vim --create-dirs
      \ https://raw.githubusercontent.com/Soubkia/.dotfiles/master/.vim/autoload/functions.vim
endif

" ==========================
" VIM-PLUG (PLUG-IN MANAGER)
" ==========================

call plug#begin('~/.vim/bundle')

Plug 'tomasr/molokai'
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vivien/vim-linux-coding-style'
Plug 'tpope/vim-fugitive'
Plug 'tikhomirov/vim-glsl'

call plug#end()

" Colorscheme
let g:molokai_original = 1
colorscheme molokai

" NERDTree
nnoremap <leader>f :NERDTreeToggle<CR>
let NERDTreeShowHidden = 1

" NERDCommenter
let NERDSpaceDelims = 1
let NERDDefaultAlign = 'left'

" FZF
nmap <leader>s :Rg<cr>
nnoremap ff :Files<cr>
autocmd WinEnter,WinLeave * silent !echo -ne "\e[6 q"

" GitGutter
highlight GitGutterAdd ctermfg=green guifg=darkgreen
highlight GitGutterChange ctermfg=yellow guifg=darkyellow
highlight GitGutterDelete ctermfg=red guifg=darkred
highlight GitGutterChangeDelete ctermfg=yellow guifg=darkyellow

" GLSL
autocmd! BufNewFile,BufRead *.vs,*.fs set ft=glsl

" PICO-8
autocmd! BufNewFile,BufRead *.p8 set ft=lua ts=4 sw=4 expandtab
