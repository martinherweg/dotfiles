set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'mattn/emmet-vim'
Plugin 'othree/html5.vim'
Plugin 'trusktr/seti.vim'     
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax on
syntax enable

set t_Co=256

set background=dark
colorscheme seti

" Set relevant filetypes
au BufRead,BufNewFile *.md set filetype=markdown
au BufRead,BufNewFile *.lens set filetype=html


" Tabs, indentation and lines
filetype plugin indent on
" 4 spaces please
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
" Round indent to nearest multiple of 4
set shiftround

set wrap " Word wrapping
" set textwidth=90
" set formatoptions=cqt
" set formatoptions=qrn1 " Make line wrap create new vim line
set smartindent
set breakindent " Make word wrapping behave like it does in every other sane text editor
set autoindent
set wrap linebreak nolist
set linespace=4

" Interactions
" Start scrolling slightly before the cursor reaches an edge
set scrolloff=3
set sidescrolloff=5
" Scroll sideways a character at a time, rather than a screen at a time
set sidescroll=1
" Allow motions and back-spacing over line-endings etc
set backspace=indent,eol,start
set whichwrap=h,l,b,<,>,~,[,]
" Underscores denote words
set iskeyword-=_
set autoread " Make Vim automatically open changed files (e.g. changed after a Git commit)



" Visual decorations

" Show status line
set laststatus=2
" Show what mode you’re currently in
set showmode
" Show what commands you’re typing
set showcmd
" Allow modelines
set modeline
" Show current line and column position in file
set ruler
" Show file title in terminal tab
set title
" Set relative line numbers if we can...
"if exists("+relativenumber")
    " Due to a problem with relative line numbers not persisting across new
    " tabs and splits, set no line numbers at all...
  "  set nonumber
    " ..then set relative ones.
 "   set relativenumber
" ...otherwise let’s just have regular ones.
"else
"    set number
"endif
set number
" Limit line-length to 80 columns by highlighting col 81
if exists("+colorcolumn")
    set colorcolumn=81
endif
" Highlight current line
set cursorline
" Don’t keep results highlighted after searching...
set nohlsearch
" ...just highlight as we type
set incsearch
" Ignore case when searching...
set ignorecase
" ...except if we input a capital letter
set smartcase



" Key mappings

" Set , as the leader key
let mapleader = ","
"  makes j and k work the way you expect instead of working in some archaic
"  “movement by file line instead of screen line” fashion.
nnoremap j gj
nnoremap k gk
" jj to throw you into normal mode from insert mode
inoremap jj <esc>
" jk to throw you into normal mode from insert mode
inoremap jk <esc>
" Open new tab with ,n
nmap <leader>n :tabnew<Enter>
" New line below, staying in current line with Enter when in normal mode
nmap <CR> o<ESC>k
" Disable arrow keys (hardcore)
"map  <up>    <nop>
"imap <up>    <nop>
"map  <down>  <nop>
"imap <down>  <nop>
"map  <left>  <nop>
"imap <left>  <nop>
"map  <right> <nop>
"imap <right> <nop>
" Allow CTRL+O to create a blank line above in Command mode
" map <C-o> m`O<ESC>
" Easier split navigations, use ctrl+j instead of ctrl+w j, etc.
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Open new split panes to right and bottom
set splitbelow
set splitright


" Emmet Settings
let g:user_emmet_install_global = 0
autocmd FileType html,css,scss,php EmmetInstall
let g:user_emmet_leader_key=','


" Vim-Airline Settings
let g:airline_theme='powerlineish'
" Automatically displays all buffers when there's only one tab open.
let g:airline#extensions#tabline#enabled = 1

" Remove powerline separator symbols
let g:airline_powerline_fonts = 0
let g:airline_left_sep = ''
let g:airline_right_sep = ''


" ctrl+p Settings
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*

" Setup some default ignores
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.(git|hg|svn)|\dist)$',
  \ 'file': '\v\.(exe|so|dll|class|png|jpg|jpeg)$',
\}

" Use the nearest .git directory as the cwd
" This makes a lot of sense if you are working on a project that is in version
" control. It also supports works with .svn, .hg, .bzr.
let g:ctrlp_working_path_mode = 'r'

" Use a leader instead of the actual named binding
nmap <leader>p :CtrlP<cr>

" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" Clear File Cache
nmap <leader>cc :CtrlPClearCache<cr>

" Open CTRL+P to search MRU (most recently used), files and buffers
" let g:ctrlp_cmd = 'CtrlPMixed'
" let g:ctrlp_working_path_mode = ''
" Make CTRL+P only look for filenames by default
" let g:ctrlp_by_filename = '1'


" Buffergator Settings
" Use the right side of the screen
let g:buffergator_viewport_split_policy = 'R'

" I want my own keymappings...
let g:buffergator_suppress_keymaps = 1

" Looper buffers
let g:buffergator_mru_cycle_loop = 1

" Go to the previous buffer open
nmap <leader>kk :BuffergatorMruCyclePrev<cr>

" Go to the next buffer open
nmap <leader>jj :BuffergatorMruCycleNext<cr>

" View the entire list of buffers open
nmap <leader>bl :BuffergatorOpen<cr>

" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>

" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<cr>


" Highlight redundant whitespaces and tabs. Only shows trailing whitespace :)
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$/

" This function trims trailing whitespace on save
function! TrimWhiteSpace()
    %s/\s\+$//e
endfunction

"autocmd BufWritePre *.vimrc *.html *.scss *.js :call TrimWhiteSpace()
autocmd FileType html,php,vimrc,scss,css,js autocmd BufWritePre <buffer> :call TrimWhiteSpace()
