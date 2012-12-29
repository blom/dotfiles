runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

set nocompatible

filetype plugin indent on
syntax on

if has("gui_running")
  colorscheme solarized
else
  colorscheme desert
endif

set colorcolumn=80
set encoding=utf-8
set laststatus=2
set number
set viminfo='100,<1000,s10,h

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set cursorline
set guicursor+=a:blinkon0
highlight Cursor guifg=black guibg=white
highlight CursorLine term=none cterm=none
highlight MatchParen guifg=black

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
set listchars=tab:▸·,trail:·
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

autocmd FileType puppet set commentstring=#\ %s

let delimitMate_excluded_ft = "clojure"
let delimitMate_expand_cr = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:paredit_electric_return = 1
let MRU_Add_Menu = 0
let NERDTreeIgnore = ['^\.git$', '^\.svn$', '\.swp$']
let NERDTreeShowHidden = 1
let vimclojure#FuzzyIndent = 1
let vimclojure#ParenRainbow = 1

" See last-position-jump
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

" See http://vimcasts.org/episodes/tidying-whitespace/
function! Preserve(command)
  let _s=@/
  let l = line(".")
  let c = col(".")
  execute a:command
  let @/=_s
  call cursor(l, c)
endfunction

let mapleader = ","
map <Leader>f :Ack<space>
map <Leader>m :MRU<CR>
map <Leader>n :NERDTreeToggle<CR>
map <Leader>t :call Preserve("%s/\\s\\+$//e")<CR>

map j gj
map k gk

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

function! PostVimEnter()
  nnoremap <d-up>    :resize +5<cr>
  nnoremap <d-down>  :resize -5<cr>
  nnoremap <d-left>  :vertical resize -5<cr>
  nnoremap <d-right> :vertical resize +5<cr>
endfunction
autocmd VimEnter * call PostVimEnter()

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
