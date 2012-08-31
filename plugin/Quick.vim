if exists("loaded_quick")
	finish
endif
if (v:progname == "ex")
	finish
endif
let loaded_quick = 1
" ---载入 Python------------------{{{1
if !exists('s:quick_did_init')
	let s:quick_path = expand("<sfile>:p")
	let s:quick_dir  = expand("<sfile>:p:h")
	let s:quick_py   = s:quick_dir.'/quick.py'

python << EOF
import vim
import sys
quick_dir = vim.eval('s:quick_dir')
if not quick_dir in sys.path :
	sys.path.append( quick_dir )
import quick
EOF

endif

" ---转换字符串编码---------------{{{1
func! Quick_Code( strBuf, srcCode, desCode ) "{{{2
	python vim.command('let l:desBuf=\'%s\'' %(quick.quick_2_code(vim.eval('a:strBuf'), vim.eval('a:srcCode'), vim.eval('a:desCode'))))
	return l:desBuf
endfunc

" ---插入字符串-------------------{{{1
function InsString( str_0 )
	let s:lnum	= line(".")
	let s:lcol	= col(".")
	let s:line	= getline(".")
	let s:len	= len(s:line)
	let s:idx	= 0
	if ( s:len > s:lcol+1 )
		let s:idx = s:lcol+1
	else
 		let s:idx = s:lcol
	endif
	let s:line = strpart( s:line, 0, s:lcol ) . a:str_0 . strpart( s:line, s:lcol )
	let s:ret = setline( ".", s:line )
	if (1 == s:ret)
		echo "命令执行失败"
	else
		call cursor( s:lnum, s:lcol + len( a:str_0 ) )
	endif
endfunction

" ---插入目录1--------------------{{{1
function InsCurDir()
	call InsString( getcwd() )
endfunction

" ---插入目录2--------------------{{{1
function InsCurBufDir()
	call InsString( expand("%:p:h") )
endfunction

" ---插入路径---------------------{{{1
function InsCurPath()
	call InsString( expand("%:p") )
endfunction

" ---插入文件名-------------------{{{1
function InsCurFilename()
	call InsString( expand("%:t") )
endfunction

" ---插入日期---------------------{{{1
function InsCurDate()
	call InsString( strftime("%Y-%m-%d") )
endfunction

" modelines {{{1
" vim:fdm=marker:fdl=0:
" vim:foldtext=getline(v\:foldstart).'...'.(v\:foldend-v\:foldstart):

