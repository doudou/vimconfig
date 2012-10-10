"delete the buffer; keep windows 
function Kwbd(kwbdStage) 
    if(a:kwbdStage == 1) 
	let g:kwbdBufNum = bufnr("%") 
	let g:kwbdWinNum = winnr() 
	windo call Kwbd(2) 
	execute "bd " . g:kwbdBufNum 
	execute "normal " . g:kwbdWinNum . "" 
        execute g:kwbdWinNum . "wincmd w"
    else 
	if(bufnr("%") == g:kwbdBufNum) 
	    let prevbufvar = bufnr("#") 
	    if(prevbufvar > 0 && buflisted(prevbufvar) && prevbufvar != g:kwbdBufNum) 
		b # 
	    else 
		bn 
	    endif 
	endif 
    endif 
endfunction 

