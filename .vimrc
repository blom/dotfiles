runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:paredit_electric_return = 1
let mapleader = ","
let MRU_Add_Menu = 0
let NERDTreeIgnore = ['^\.git$', '^\.svn$', '\.swp$']
let NERDTreeShowHidden = 1
let vimclojure#ParenRainbow = 1

set nocompatible

set colorcolumn=80
set encoding=utf-8
set laststatus=2
set number
set ruler
set viminfo='100,<1000,s10,h

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set guicursor+=a:blinkon500
set guicursor+=a:blinkoff500
set guifont=Bitstream\ Vera\ Sans\ Mono:h14
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
set guioptions-=T

set hlsearch
set ignorecase
set incsearch
set smartcase

set backupdir=~/.vim/tmp
set directory=~/.vim/tmp

set list
set listchars=trail:·
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

filetype plugin indent on
syntax on

if has("gui_running")
  colorscheme solarized
else
  colorscheme desert
endif

map <Leader>f :Ack<space>
map <Leader>m :MRU<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :%s/\s\+$//e<CR>

map j gj
map k gk

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

map <D-1> 1gt
map <D-2> 2gt
map <D-3> 3gt
map <D-4> 4gt
map <D-5> 5gt
map <D-6> 6gt
map <D-7> 7gt
map <D-8> 8gt
map <D-9> 9gt

nnoremap <esc><esc> :nohlsearch<cr>
