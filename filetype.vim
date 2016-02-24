if exists("filetype_loaded") 
    finish
endif
let filetype_loaded=1

augroup filetypedetect 
    au BufNewFile,BufRead *.ttcn  setf ttcn 
    au BufNewFile,BufRead *.antlr setf antlr 
    au BufNewFile,BufRead *.g     setf antlr 
    au BufNewFile,BufRead .mutt/*.rc setf muttrc

    au BufNewFile,BufRead *.orogen setf ruby
    au BufNewFile,BufRead *.autobuild setf ruby

    au BufNewFile,BufRead *.gen     setf c

    au BufNewFile,BufRead *.rdoc  setf plain
    au BufNewFile,BufRead *.txt   setf plain
    au BufNewFile,BufRead README  setf plain
    au BufNewFile,BufRead COMMIT_EDITMSG  setf plain
    au BufNewFile,BufRead *.page  setf plain


    au BufNewFile,BufRead SConscript setf python
    au BufNewFile,BufRead SConstruct setf python
augroup END 

function RubyAddRootdirToPath()
    let current = expand("%:h")
    let rake = findfile("Rakefile", ".;")
    if rake != ""
        let base_dir=fnamemodify(rake, ":h")
	exe "set path+=" . base_dir
        if isdirectory(base_dir . '/lib')
            exe "set path+=" . base_dir . '/lib'
        endif
        if isdirectory(base_dir . '/test')
            exe "set path+=" . base_dir . '/test'
        endif
    endif
endfunction

" Some specific settings related to Vim/Ruby
augroup RubySpecificSettings
    au BufNewFile,BufRead *.rb    runtime ftplugin/ruby-xmpfilter.vim
    au BufNewFile,BufRead *.rb    runtime ftplugin/ruby-rcodetools.vim

    au FileType ruby :call RubyAddRootdirToPath()
    au FileType rubyunit :set makeprg=ruby\ -Ilib
augroup END

