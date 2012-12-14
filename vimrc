"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible

"activate pathogen
call pathogen#infect()
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

let mapleader = ","

set background=dark

set backspace=indent,eol,start "allow backspacing over everything in insert mode

set history=1000 "store lots of :cmdline history

set showcmd     "show incomplete cmds down the bottom
set showmode    "show current mode down the bottom

filetype plugin indent on

set number      "show line numbers
set list        "display tabs and trailing spaces
set listchars=tab:▸\ ,eol:¬ "set listchars=tab:▷⋅,trail:⋅,nbsp:⋅

set incsearch   "find the next match as we type the search
set hlsearch    "hilight searches by default

set wrap        "dont wrap lines
set linebreak   "wrap lines at convenient points

if v:version >= 703
  "undo settings
  set undodir=~/.vim/undofiles
  set undofile
  set colorcolumn=+1 "mark the ideal max text width
endif

syntax enable
colorscheme base16-default

set laststatus=2

set formatoptions-=o "dont continue comments when pushing o/O
"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

set wildmode=list:longest   "make cmdline tab completion similar to bash
set wildmenu                "enable ctrl-n and ctrl-p to scroll thru matches
set wildignore=*.o,*.obj,*~ "stuff to ignore when tab completing

set t_Co=256

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

if has("autocmd")
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
  "
  " coffee optimizations
  au BufWritePost *.coffee silent CoffeeMake!
  au BufNewFile,BufReadPost *.coffee
        \ setl shiftwidth=2 expandtab foldmethod=indent nofoldenable
endif
set hidden

set foldmethod=syntax
set nofoldenable
set foldcolumn=1

let g:dbext_default_PGSQL_bin='/usr/local/bin/psql'

nnoremap <silent> <F5> :call <SID>StripTrailingWhitespaces()<CR>
nnoremap <F6> :GundoToggle<CR>

function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business
  %s/\s\+$//e
  " Cleanup: restore previous search history and cursor position.
  let @/=_s
  call cursor(l, c)
endfunction

set clipboard=unnamed

" Show syntax highlighting groups for word under cursor
nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

set formatprg=par

" Edit or view files in same directory as current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%


" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Open files with <leader>f
map <leader>f :CommandTFlush<cr>\|:CommandT<cr>
" Open files, limited to the directory of the current file, with <leader>gf
" This requires the %% mapping found below.
map <leader>gf :CommandTFlush<cr>\|:CommandT %%<cr>

set winwidth=84
" We have to have a winheight bigger than we want to set winminheight. But if
" we set winheight to be huge before winminheight, the winminheight set 
" will " fail.
set winheight=5
set winminheight=5
set winheight=999

function! ShowRoutes()
  " Requires 'scratch' plugin
  :topleft 100 :split __Routes__
  " Make sure Vim doesn't write __Routes__ as a file
  :set buftype=nofile
  " Delete everything
  :normal 1GdG
  " Put routes output in buffer
  :0r! rake -s routes
  " Size window to number of lines (1 plus rake output length)
  :exec ":normal " . line("$") . "_ "
  " Move cursor to bottom
  :normal 1GG
  " Delete empty trailing line
  :normal dd
endfunction
map <leader>gR :call ShowRoutes()<cr>
