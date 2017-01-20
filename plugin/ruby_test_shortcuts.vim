if exists("ruby_test_shortcuts_loaded")
    finish
endif
let ruby_test_shortcuts_loaded=1

let g:RubyTestTerm=0
command! -nargs=0 RubyTestCurrentWord :call s:Test(g:RubyTestTerm, expand('%:p'), s:GetTestName())
command! -nargs=0 RubyTestCurrentFile :call s:Test(g:RubyTestTerm, expand('%:p'))
command! -nargs=0 RubyTestRepeat      :call s:LastTest(g:RubyTestTerm)
map <leader>Twt :let g:RubyTestTerm=1<bar>RubyTestCurrentWord<CR>
map <leader>Tft :let g:RubyTestTerm=1<bar>RubyTestCurrentFile<CR>
map <leader>tt  :let g:RubyTestTerm=1<bar>RubyTestRepeat<CR>
map <leader>Tw :RubyTestCurrentWord<CR>
map <leader>Tf :RubyTestCurrentFile<CR>
map <leader>t  :RubyTestRepeat<CR>

function s:GetTestName()
    let line = getline(".")
    let spec_it = match(line, "it \"")
    let spec_describe = match(line, "describe \"")
    let def_test = match(line, "def test_")
    if spec_it != -1 || spec_describe != -1
        exec "normal yi\""
        let test_name = getreg()
        if test_name == 0
            exec "normal yi\'"
            let test_name = getreg()
        end

        let test_name = substitute(test_name, "[^a-zA-Z_]", ".", "g")
        let test_name = substitute(test_name, "_\\+", ".", "g")
        return "/" . test_name . "/"
    elseif def_test != -1
        " Assume that we are using test/unit and that the word below the cursor
        " is the test name
        return matchstr(line, "test_[a-zA-Z_]\*")
    endif
endfunction

function s:FindTestName(dir, base, prefix, ext)
    let test = a:base
    if isdirectory(a:dir . test)
      return test
    endif

    if test !~ '\' . a:ext . '$'
      let test = test . a:ext
    endif
    if filereadable(a:dir . test)
      return test
    endif

    let test = a:prefix . test
    if filereadable(a:dir . test)
      return test
    endif

    throw "no such test " . a:base
endfunction
  
" Find the directory containing 'test_file'. test_file
" can be either a file (test_kind == 'file') or a directory
" (test_kind == 'dir')
function s:FindDir(test_file, test_kind)
    let test_with = {'dir': 'isdirectory', 'file': 'filereadable'}
    let test_function = test_with[a:test_kind]

    let curdir = expand("%:p:h")
    let basedir = curdir
    while curdir != "/" && !call(test_function, [curdir . "/" . a:test_file])
	let curdir = fnamemodify(curdir, ':h')
    endwhile

    if curdir == '/'
        echoerr "cannot find the " . a:test_kind . " " . a:test_file . " from " . basedir
    elseif curdir !~ '/$'
        return curdir . '/'
    else
        return curdir
    endif
endfunction

function s:Test(run_in_terminal, ...)
  let g:ruby_last_test = [expand("%")] + copy(a:000)

  if a:run_in_terminal
      let command = "terminal " . &makeprg . " "
  else
      let command = "make "
  endif

  try
    if a:0 > 0
      if a:1[0] != '/'
	let topsrcdir=s:FindDir('test', 'dir')
	let testdir=topsrcdir . '/test/'
	let testfile = testdir . s:FindTestName(testdir, a:1, 'test_', '.rb')
      else
	let testfile = a:1
      endif

      if a:0 == 1
	execute command . testfile
      else
	execute command . testfile . " '--name=" . a:2 . "'"
      endif
    else
      let topsrcdir=s:FindDir('test', 'dir')
      let testdir=topsrcdir . '/test/'
      execute command . testdir
    endif
  catch 
    echoerr v:exception
  endtry
endfunction

function s:LastTest(run_in_terminal)
    let testbuffer=g:ruby_last_test[0]
    let testdef=[a:run_in_terminal] + g:ruby_last_test[1:]
    " using call() is required to pass arguments using the g:ruby_last_test list
    exec ":b " . testbuffer
    call call('s:Test', testdef)
endfunction

