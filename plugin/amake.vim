if &cp || exists("g:loaded_amake")
    finish
endif
let g:loaded_amake=1

command! -nargs=* Amake call Amake(<f-args>)
command! -nargs=* Acd call Acd(<f-args>)
command! -nargs=* Aedit call Aedit(<f-args>)

function Amake(...)
    let current=expand('%:p')
    if len(current) == 0
        let current=getcwd()
    elseif !isdirectory(current)
        let current=expand('%:p:h')
    endif
    let builddir=systemlist("autoproj locate -b " . current)[0]
    if v:shell_error != 0
        throw "autoproj locate -b " . current . " failed"
    endif
    exec "make" "-C" builddir join(a:000)
endfunction

function Aedit(package_name,...)
    let dir=systemlist("autoproj locate " . a:package_name)[0]
    if v:shell_error != 0
        throw "autoproj locate " . join(a:000) . " failed"
    endif
    exec "e " . dir . "/" . join(a:000)
endfunction

function Acd(...)
    let dir=systemlist("autoproj locate " . join(a:000))[0]
    if v:shell_error != 0
        throw "autoproj locate " . join(a:000) . " failed"
    endif
    exec "cd " . dir
endfunction
