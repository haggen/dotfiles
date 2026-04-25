" Don't bother with vi compatibility.
set nocompatible

" Enable syntax highlighting.
syntax enable

" Without this, vim emits a non-zero exit status when filetype is turned off below.
filetype on
filetype off

" Ensure ftdetect et al work by including this after the Vundle stuff.
filetype plugin indent on

" Copy indent from the current line when starting a new line.
set autoindent

" Reload files when changed on disk, e.g. via `git checkout`.
set autoread

" Make backspace eat through everything in insert mode.
set backspace=indent,eol,start

" Use a safe file-write strategy; required for crontab and similar tools that replace files.
set backupcopy=yes

" Yank and paste with the system clipboard.
set clipboard=unnamed

" Don't store swapfiles in the current directory.
set directory-=.

" Set default file encoding to UTF-8.
set encoding=utf-8

" Expand tabs to spaces.
set expandtab

" Case-insensitive search.
set ignorecase

" Search as you type.
set incsearch

" Always show the statusline.
set laststatus=2

" Show trailing whitespace.
set list

" Characters used to display tabs and trailing spaces.
set listchars=tab:▸\ ,trail:▫

" Show line numbers.
set number

" Show cursor position in the statusline.
set ruler

" Keep 3 lines of context above and below the cursor.
set scrolloff=3

" Use 2 spaces for indentation commands in normal mode.
set shiftwidth=2

" Show incomplete commands in the bottom bar.
set showcmd

" Use case-sensitive search when the query contains uppercase letters.
set smartcase

" Use 2 spaces for tab and backspace in insert mode.
set softtabstop=2

" Display actual tab characters as 8 spaces wide.
set tabstop=8

" Display the last line of the screen and truncate long lines.
set display+=lastline,truncate

" Saving options in session and view files causes more problems than it solves, so disable it.
set sessionoptions-=options
set viewoptions-=options

" Ignore these patterns in wildcard expansions.
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc

" Show a navigable menu for tab completion.
set wildmenu

" Complete to longest common string, then list all matches, then cycle through them.
set wildmode=longest,list,full

" Support mouse resizing inside tmux.
if exists('$TMUX')
  set ttymouse=xterm2
endif

" Make escape key more responsive by decreasing the wait time for the sequence.
set ttimeout
set ttimeoutlen=100

" Keyboard shortcuts.
let mapleader = ' '

" Navigate between splits.
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" Reload vimrc.
noremap <silent> <leader>V :source ~/.vimrc<CR>:filetype detect<CR>:exe ":echo 'vimrc reloaded'"<CR>

" In case you forgot to sudo.
cnoremap w!! %!sudo tee > /dev/null %

" Strip trailing whitespace on write.
autocmd BufWritePre * let v = winsaveview() | keeppatterns %s/\s\+$//e | call winrestview(v)

" Treat .fdoc files as YAML.
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml

" Treat .md files as Markdown and enable spell checking.
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell

" Automatically rebalance windows on vim resize.
autocmd VimResized * :wincmd =

" Change cursor shape to a vertical bar in insert mode and a block in normal mode.
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" Paste over a selection without overwriting the default register.
vnoremap p "_dP
