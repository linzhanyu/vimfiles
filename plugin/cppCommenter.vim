" Script Name: cppCommenter.vim
" Version:     1.0.0
" Last Change: Nov 6, 2008
" Author:      XSQ <xsq0304@qq.com>
"
" Description: Toggles the Comment state of the current line (with "//").
" Usage:       Press '<Esc>cc' to toggle the comment state of the current 
"              line, '<Esc>ncc' to toggle n straight lines.
" File Type:   .c, .cpp, .cs, .cxx, .h, .hpp, .java, .js, .pas, etc.
" Install:     Just drop this script file into vim's plugin directory.

nmap <silent>cc :call Commenter()<Esc>

function IsFileTypeMatch()
    let s:fTypeList = ['c', 'cpp', 'cs', 'cxx', 'h', 'hpp', 'java', 'js', 'pas']
    for fType in s:fTypeList
        if fType == &ft
            return 1
        endif
    endfor
    return 0
endfunction

function Commenter()
    if !IsFileTypeMatch()
        echo ".".&ft." file does not support '//' commenter"
        return
    endif
    let s:line = getline(".")
    if strlen(s:line) < 2
        let s:newline = "//".s:line
    else
        let s:words = split(s:line, "\ ")
        let s:firstword = s:words[0]
        if s:firstword[0].s:firstword[1] == "//"
            let s:newline = substitute(s:line, "//", "", "")
        else
            let s:newline = "//".s:line
        endif
    endif
    call setline(".", s:newline)
endfunction
