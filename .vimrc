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
set scrolloff=4
set showtabline=2
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
set listchars=tab:▸·,trail:·,nbsp:●
autocmd InsertEnter * set nolist
autocmd InsertLeave * set list

autocmd BufRead,BufNewFile *.ejs setfiletype html
autocmd FileType puppet set commentstring=#\ %s

autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

let delimitMate_excluded_ft = "clojure"
let delimitMate_expand_cr = 1
let g:ctrlp_dotfiles = 1
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:paredit_electric_return = 1
let NERDTreeIgnore = ['^\.git$', '^\.svn$', '\.swp$']
let NERDTreeShowHidden = 1

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

map <leader>a#  :Tabularize /=><cr>
map <leader>a,  :Tabularize /,\zs /l0<cr>
map <leader>a:  :Tabularize /:\zs /l0<cr>
map <leader>a=  :Tabularize /=<cr>
map <leader>a\| :Tabularize /\|<cr>

map <leader>f :Ack<space>
map <leader>m :CtrlPMRU<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>r :RainbowParenthesesToggle<cr>
map <leader>s :set spell!<cr>
map <leader>t :call Preserve("%s/\\s\\+$//e")<cr>
map <leader>p :set paste!<cr>

map j gj
map k gk

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <c-h> <space>=><space>

function! PostVimEnter()
  nnoremap <d-up>    :resize +5<cr>
  nnoremap <d-down>  :resize -5<cr>
  nnoremap <d-left>  :vertical resize -5<cr>
  nnoremap <d-right> :vertical resize +5<cr>
endfunction
autocmd VimEnter * call PostVimEnter()

map <d-1> 1gt
map <d-2> 2gt
map <d-3> 3gt
map <d-4> 4gt
map <d-5> 5gt
map <d-6> 6gt
map <d-7> 7gt
map <d-8> 8gt
map <d-9> 9gt

nnoremap <esc><esc> :nohlsearch<cr>
