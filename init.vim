filetype off

" Bundle management 
set rtp+=~/.config/nvim/bundle/vundle/
call vundle#rc()
let vundle#bundle_dir = expand('$HOME/.config/nvim/bundle', 1)
Bundle 'gmarik/vundle'

" Colorscheme
Bundle 'freeo/vim-kalisi'

" Git wrapper
Bundle "tpope/vim-fugitive"

" Asynchronous run of :make using :Make
Bundle "tpope/vim-dispatch"
Bundle "radenling/vim-dispatch-neovim"

" Close buffer without closing window 
Bundle "moll/vim-bbye"
nmap <silent> <leader>bd :Bdelete<CR>

" vim-ruby
Bundle 'vim-ruby/vim-ruby'

"Bundle "Shougo/deoplete.nvim"
"Bundle "zchee/deoplete-clang"
"Bundle 'Valloric/YouCompleteMe'
"let g:ycm_confirm_extra_conf = 0
"Bundle 'scrooloose/syntastic'

" Misc
set hidden		" Make buffer hidden (instead of unloaded) when changing buffers. AT LAST
                        " undo history is not lost on :edit or :bnext
set modeline
set showmatch		" Show matching brackets.
set wrap                " Enable dynamic wrapping
set linebreak           " Display dynamic wrapping linebreaks 
set display=uhex   
map <F12> :b #<CR>      " Jump to alternate buffer
set pastetoggle=<F11>   " Go in paste mode (no more autoindent, very useful when pasting with mouse)
set encoding=utf-8      " default to UTF-8 for editing
filetype on
filetype plugin indent on
syntax on

set formatoptions-=o

let mapleader = ','

function MouseSwitchMode()
    if &mouse == ''
	if has('clipboard')
	    set mouse=a
	else
	    set mouse=nvc
	endif
    else
	set mouse=
    endif
endfunction
map <F2> :call MouseSwitchMode()<CR>
call MouseSwitchMode()

" Make backspace delete anything
set backspace=indent,start,eol

" Search
set ignorecase		" Do case insensitive matching
set smartcase           " Fall back to case sensitive if search pattern has a upper case character
set incsearch		" Incremental search
set hlsearch            " Highlight search 
map <F10> :nohlsearch<CR>   " Temporarily disable highlighting, reenabled for the next search

" Tab and indent handling
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=8
set expandtab

" Status line
set showcmd		" Show (partial) command in status line.
set showmode            " Display current mode (insert, replace, ...)
set laststatus=2        " Always display status line
set statusline=%f\ %h%r\ %=%l/%L,%c%10.n%5.P
set statusline=%-40.40f%<\ [%.20{getcwd()}]%h%r\ %=%l/%L,%c%10.n%14.PM

" Save and restore last position in buffer
:au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g'\"" | endif

" Ignore whitespace changes by default in diff
set diffopt=filler,iwhite,vertical
set encoding=utf-8
set shellpipe=2>&1\|\ tee\ -i
set wildmenu
set textwidth=80

set background=dark
colorscheme kalisi

" Quits diff mode if one of the diffed files is quit
au BufWinLeave * if &diff | diffoff! | endif
au QuickFixCmdPre make silent wall

let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#clang#clang_header = "/usr/include/clang"
let g:deoplete#sources#clang#libclang_path = "/usr/lib/x86_64-linux-gnu/libclang-3.8.so.1"
let g:deoplete#sources#clang#sort_algo = 'priority'
