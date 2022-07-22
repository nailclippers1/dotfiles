" init.vim

" ======================================
" OS specific settings

if has('unix') " for unix
endif

if system('uname -r') =~ ".*WSL2\n" " for wsl2
endif

if has('mac') " for mac
endif

if has('win64') " for Windows 64bit
    let $PATH = "C:\\Program Files\\Git\\usr\\bin;" .$PATH
endif

" only for vscode-neovim
if exists('g:vscode') " for vscode-neovim extension
    " close file
    nmap <Leader>d <Cmd>call VSCodeNotify('workbench.action.closeActiveEditor')<CR>
endif

" ======================================
" general
set ruler
set noswapfile
set mouse=a
set clipboard+=unnamed
set sessionoptions=blank,buffers,curdir,folds,help,tabpages,winsize,terminal
set viminfo='10

" commandline mode
set wildmenu wildmode=list:longest,full
set history=1000

" enable filetype plugins
filetype plugin on
filetype indent on

" search
set ignorecase
set smartcase
set incsearch
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" reset augroup
augroup MyAutoCmd
    autocmd!
augroup END

" encoding
set encoding=utf-8
scriptencoding utf-8

" Language
language message C
set formatoptions+=mMj
set ambiwidth=double
set display+=lastline

" colors
set t_Co=256
set termguicolors

autocmd VimEnter * nested set bg=dark guifont=PlemolJP\ Console\ NF:h10
autocmd BufEnter *.md nested set bg=light guifont=PlemolJP\ Console\ NF:h12

" -------------------------------------
" text, tab and indent

set expandtab
set smarttab
set tabstop=4
set shiftwidth=4
"auto indent
set ai
"wrap lines
set wrap

" visualize tabs, speces, etc
set list
set listchars=tab:»-,trail:.,eol:↲,extends:»,precedes:«,nbsp:%

" ======================================
" key mappings↲

" set escape
inoremap <silent> jj <ESC>

" set leader 
let mapleader = "\<Space>"
noremap <Leader>h :bro ol<CR>

"
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap gj j
nnoremap gk k

" open init.vim and reload init.vim
nnoremap <Leader>.  :<C-u>edit $MYVIMRC<CR>
nnoremap <Leader>,  :<C-u>source $MYVIMRC<CR>

" enable visual block mode with <Ctrl>q
nnoremap <C-q> <C-v>

" enable/disable spell checker with <F9>
nnoremap <F9> :call SpellToggle()<CR>
function! SpellToggle()
    setlocal spell!
    if exists("g:syntax_on")
        syntax off
    else
        syntax on
    endif
endfunction

" -------------------------------------
" terminal mode controls

tnoremap <Esc> <C-\><C-n>
command! -nargs=* T split | wincmd j | resize 20 | terminal<args>
autocmd TermOpen * startinsert

" -------------------------------------
" submode controls

" <Ctrl>x submode
inoremap <C-Space> <C-x><C-o>
inoremap <C-@> <C-Space>

" inoremap <expr><Tab> pumvisible() ? "\<C-n>" : MyInsCompl()
function! MyInsCompl()
  let c = nr2char(getchar())
  if c == "l"
    return "\<C-x>\<C-l>"
  elseif c == "n"
    return "\<C-x>\<C-n>"
  elseif c == "p"
    return "\<C-x>\<C-p>"
  elseif c == "k"
    return "\<C-x>\<C-k>"
  elseif c == "t"
    return "\<C-x>\<C-t>"
  elseif c == "i"
    return "\<C-x>\<C-i>"
  elseif c == "]"
    return "\<C-x>\<C-]>"
  elseif c == "f"
    return "\<C-x>\<C-f>"
  elseif c == "d"
    return "\<C-x>\<C-d>"
  elseif c == "v"
    return "\<C-x>\<C-v>"
  elseif c == "u"
    return "\<C-x>\<C-u>"
  elseif c == "o"
    return "\<C-x>\<C-o>"
  elseif c == "s"
    return "\<C-x>s"
  endif
  return "\<Tab>"
endfunction

" -------------------------------------
" buffer controls

" buffer previous, next, delete
nnoremap <silent><Leader>b  :bprevious<CR>
nnoremap <silent><Leader>n  :bnext<CR>
nnoremap <silent><Leader>k  :bdelete<CR>

" -------------------------------------
" window conrtol

" split window
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w

" change window size
nnoremap <M-+> <C-w>-
nnoremap <M--> <C-w>+
nnoremap <M->> <C-w>>
nnoremap <M-<> <C-w><
" move cursor to other windows
nnoremap <M-h> <C-w>h
nnoremap <M-j> <C-w>j
nnoremap <M-k> <C-w>k
nnoremap <M-l> <C-w>l
" switch windows 
nnoremap <M-H> <C-w>H
nnoremap <M-J> <C-w>J
nnoremap <M-K> <C-w>K
nnoremap <M-L> <C-w>L
" rotate windows
nnoremap <M-r> <C-w>r
nnoremap <M-R> <C-w>R
nnoremap <M-x> <C-w>x

" reset window size with <Alt>=
nnoremap <M-=> <C-w>=
" maximize window size with <Alt>a
nnoremap <M-a> <C-w>_<C-w><Bar>
" make the current window the only one on the screen 
nnoremap <M-o> <C-W>o

" -------------------------------------
" tab controls

" switch tab
nmap <S-Tab> :tabprev<Return>
nmap <Tab> :tabnext<Return>

" ======================================
" plugin manager

source $XDG_CONFIG_HOME/nvim/dein.vim

" ======================================
" filer 

" suppress the banner
let g:netrw_banner=0
" set the tree listing style
let g:netrw_liststyle=3
" show preview window in a vertically split window
let g:netrw_preview=1
" display file size with human-readable style 1024 base
let g:netrw_sizestyle="H"
" specify initial size of new windows
let g:netrw_winsize=30
" when browsing, <cr> will open the file in new tab
let g:netrw_browse_split=3

" open filer
"nnoremap <silent><Leader>j  :Explore<CR>

" ======================================
" store gcp api credentials (Oauth2.0 clientids)

"source ~/.cache/calendar.vim/credentials.vim


