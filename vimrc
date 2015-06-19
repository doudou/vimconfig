filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
Bundle 'vim-ruby/vim-ruby'
"Bundle 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
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
set diffopt=filler,iwhite
if v:version >= 700
    set diffopt+=vertical
endif
set encoding=utf-8
set shellpipe=2>&1\|\ tee\ -i
set wildmenu
set textwidth=80

if &term == ""
    set term=xterm
endif
if &term != "linux"
    " use 256 colors
    set t_Co=256
endif

let xterm16_colormap = "softlight"
let xterm16_brightness = "default"
colorscheme xterm16

" Quits diff mode if one of the diffed files is quit
if v:version >= 700
    au BufWinLeave * if &diff | diffoff! | endif
    au QuickFixCmdPre make silent wall
endif

" Taglist plugin configuration
let g:Tlist_GainFocus_On_ToggleOpen=1 " put cursor in taglist when it is opened
let g:Tlist_Sort_Type='name' " sort by name 
let g:Tlist_Enable_Fold_Column=0 " remove folding markers (useless since taglist is indented)
let g:winManagerWindowLayout = 'FileExplorer|TagList'

" make <F8> toggle the taglist
nnoremap <silent> <F8> :TlistToggle<CR>

" Close buffer without closing window YEAH !
nmap <silent> <leader>bd :call Kwbd(1)<CR>

" I like the NERDCommenter, but it really bothers me with its f... warning
let g:NERDShutUp=1

" Winmanager configuration stuff
map <F8> :WMToggle<cr> 
map <c-Home> :FirstExplorerWindow<cr>
map <c-End> :BottomExplorerWindow<cr>
let g:winManagerWidth = 50

" Override vcscommand default mappings since the <leader>c. mappings are used
" by NERD_commenter
nmap <unique> <Leader>cva <Plug>VCSAdd
nmap <unique> <Leader>cvn <Plug>VCSAnnotate
nmap <unique> <Leader>cvG <Plug>VCSClearAndGotoOriginal
nmap <unique> <Leader>cvc <Plug>VCSCommit
nmap <unique> <Leader>cvD <Plug>VCSDelete
nmap <unique> <Leader>cvd <Plug>VCSDiff
nmap <unique> <Leader>cvg <Plug>VCSGotoOriginal
nmap <unique> <Leader>cvi <Plug>VCSInfo
nmap <unique> <Leader>cvL <Plug>VCSLock
nmap <unique> <Leader>cvl <Plug>VCSLog
nmap <unique> <Leader>cvq <Plug>VCSRevert
nmap <unique> <Leader>cvr <Plug>VCSReview
nmap <unique> <Leader>cvs <Plug>VCSStatus
nmap <unique> <Leader>cvU <Plug>VCSUnlock
nmap <unique> <Leader>cvu <Plug>VCSUpdate
nmap <unique> <Leader>cvv <Plug>VCSVimDiff

" Don't sync in any way when in laptop mode
if filereadable("/proc/sys/vm/laptop_mode")
    let lines = readfile("/proc/sys/vm/laptop_mode")
    if lines[0] != "0"
        set nofsync
        set swapsync=""
    endif
endif

