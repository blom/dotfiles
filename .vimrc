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

set backspace=indent,eol,start
set colorcolumn=80
set encoding=utf-8
set laststatus=2
set mouse=a
set number
set relativenumber
set scrolloff=4
set showtabline=2
set viminfo='100,<1000,s10,h
set wildignore=.keep,coverage,node_modules,tmp
set wildmenu

set autoindent
set expandtab
set shiftwidth=2
set softtabstop=2

set cursorline
set guicursor+=a:blinkon0
highlight Cursor guifg=black guibg=white
highlight CursorLine term=none cterm=none
highlight MatchParen guifg=black

set guifont=Bitstream\ Vera\ Sans\ Mono:h13
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
autocmd BufRead,BufNewFile *.es6 setfiletype javascript
autocmd FileType puppet set commentstring=#\ %s

autocmd Syntax * RainbowParenthesesLoadRound
autocmd Syntax * RainbowParenthesesLoadSquare
autocmd Syntax * RainbowParenthesesLoadBraces

command! FormatJSON %!python -m json.tool

let delimitMate_excluded_ft = "clojure"
let delimitMate_expand_cr = 1
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:ctrlp_dotfiles = 1
let g:ctrlp_max_height = 20
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 'ra'
let g:investigate_use_dash = 1
let g:investigate_use_url_for_ruby = 1
let g:investigate_syntax_for_haml = 'ruby'
let g:investigate_syntax_for_eruby = 'ruby'
let g:paredit_electric_return = 1
let g:projectionist_heuristics = json_decode(join(readfile(expand('~/.projections.json'))))
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

map <leader>E :Eval<cr>
map <leader>e :%Eval<cr>
map <leader>R :so ~/.vimrc<cr>
map <leader>b :TagbarToggle<cr>
map <leader>i :call Preserve("normal gg=G")<cr>
map <leader>n :NERDTreeToggle<cr>
map <leader>r :RainbowParenthesesToggle<cr>
map <leader>s :set spell!<cr>
map <leader>t :call Preserve("%s/\\s\\+$//e")<cr>
map <leader>p :set paste<cr>o<esc>"*]p:set nopaste<cr>

let g:ctrlp_map = '<leader>F'

map <leader>c  :CtrlPTag<cr>
map <leader>m  :CtrlPMRU<cr>
map <leader>f  :CtrlPClearCache<cr>\|:CtrlP<cr>
map <leader>ga :CtrlPClearCache<cr>\|:CtrlP app/assets<cr>
map <leader>gc :CtrlPClearCache<cr>\|:CtrlP app/controllers<cr>
map <leader>gh :CtrlPClearCache<cr>\|:CtrlP app/helpers<cr>
map <leader>gm :CtrlPClearCache<cr>\|:CtrlP app/models<cr>
map <leader>gv :CtrlPClearCache<cr>\|:CtrlP app/views<cr>
map <leader>gf :CtrlPClearCache<cr>\|:CtrlP features<cr>
map <leader>gl :CtrlPClearCache<cr>\|:CtrlP lib<cr>
map <leader>gp :CtrlPClearCache<cr>\|:CtrlP public<cr>
map <leader>gs :CtrlPClearCache<cr>\|:CtrlP spec<cr>
map <leader>gt :CtrlPClearCache<cr>\|:CtrlP test<cr>

map j gj
map k gk

map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

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
