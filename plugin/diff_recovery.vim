" diff_recovery.vim: (global plugin) Diffs the current file with a recovered
" swap file and asks whether the swapfile or the current file should be
" saved.
"  Maintainer:  sylvain.joyeux@m4x.org
"  Version:     0.1 for vim 7.0+
"  URL:		http://www.vim.org/scripts/script.php?script_id=1688
"
" Documentation:
"
" If the current buffer has a stale swap file, you can call DiffRecovery. It
" will open a diffsplit with the recovered file and the current version of the
" file. Whenever one of the two buffers are deleted, the scripts asks if you
" want to recover the swap file. If Yes is answered, the file is recovered and
" saved, and the swapfile is deleted. If No is answered, the file is keps
" as-is and the swapfile is deleted. If Cancel is chosen, it does nothing (the
" swapfile and the file are kept as-is)
"
" Note that it is NOT a good idea to put that in the SwapExists autocommand
" since their can be a recovery file because of another vim. DiffRecovery is
" only useful when the recovery file is there because of a crash.

command DiffRecovery :exe "call DiffRecovery(\"" . expand("%:p") . "\")"

if exists('diff_recovery')
    finish
endif
let diff_recovery=1

function DoRecover(recovered_file, recovery_file, swapfile)
    au! DiffRecovery *
    diffoff!

    let mode = confirm("Do recover the file ?", "&Yes\n&No\n&Cancel")

    if mode == 1
	exe "b " . a:recovery_file
	exe "w " . a:recovered_file
	call delete(a:swapfile)
    elseif mode == 2
	call delete(a:swapfile)
    else
	return
    endif

    exe "bd! " . a:recovery_file
    call delete(a:recovery_file)
endfunction

function DiffRecovery(recovered_file)
    let recovered_file = expand(a:recovered_file, ":p")

    " first load the recovery file and save it into a temporary file
    recover
    let recovery_file = tempname()
    exe "w " . recovery_file

    " reload the buffer without having vim complain about the recovery file
    augroup DiffRecovery
	exe "au! SwapExists " . recovered_file
	exe "au SwapExists " . recovered_file . " let b:swapfile_name = v:swapname | let v:swapchoice='o'"
    augroup END
    edit

    " set up the master buffer
    let cmd = "call DoRecover(\"" . recovered_file . "\", \"" . recovery_file . "\", \"" . b:swapfile_name . "\")"
    exe "au DiffRecovery BufWinLeave <buffer> " . cmd

    " diffsplit it with the recovered version. The recovered buffer is a
    " temporary buffer
    exec "diffsplit " . recovery_file
    setlocal buftype=nowrite
    setlocal bufhidden=delete
    setlocal nomodifiable
    setlocal noswapfile
    exe "au DiffRecovery BufWinLeave <buffer> " . cmd
endfunction

