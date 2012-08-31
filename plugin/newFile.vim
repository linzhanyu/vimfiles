if exists("loaded_newFile")
	finish
endif
if (v:progname == "ex")
	finish
endif
let loaded_newFile = 1

function AddNoteLine( lineNum, str_1, str_2 )
	let s:line	= ' ' . '*' . '    ' . a:str_1
	" let s:line_n= strlen(s:line)
	let s:line_n= strwidth(s:line)
	if (s:line_n < 16)
		let s:line	= s:line . repeat(' ', 16 - s:line_n)
	endif
	let s:line	= s:line . ':    ' . a:str_2
	" let s:line_n= strlen(s:line)
	let s:line_n= strwidth(s:line)
	if s:line_n < 78
		let s:line	= s:line . repeat(' ', 78 - s:line_n)
	endif
	let s:line	= s:line . '*'
	let s:failed	= append( a:lineNum, s:line )
endfunction

function TemplateH()
	let s:path_name = expand("%:t")
	if strlen( s:path_name )
		" 取得当前文件名,不带路径的.
		let s:line_num	= 0
		" 写入一个空行
		let s:failed	= append( s:line_num, "" )
		let s:line_num	= s:line_num + 1
		" 写入一个/和78个*
		let s:begin_line= '/'.repeat('*', 78)
		let s:failed	= append( s:line_num, s:begin_line )
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "File name", s:path_name)
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Author", "林占宇")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "E-Mail", "pesoft@126.com")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Copyright", strftime("%Y"))
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Parameter", "none")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Version", "0.0.0.1")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Use Libary", "")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Function", "")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Date", strftime("%Y-%m-%d"))
		let s:line_num	= s:line_num + 1

		let s:begin_line= ' '.repeat('*', 78)
		let s:failed	= append( s:line_num, s:begin_line )
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "OS", "Win32")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Compiler", "MinGW(GCC 3.4.5)")
		let s:line_num	= s:line_num + 1

		let s:begin_line= ' '.repeat('*', 78)
		let s:failed	= append( s:line_num, s:begin_line )
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Amend Ver", "")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Amend", "")
		let s:line_num	= s:line_num + 1

		call AddNoteLine( s:line_num, "Amender", "")
		let s:line_num	= s:line_num + 1

		" 写入78个*和一个/
		let s:end_line	= ' '.repeat('*', 78).'/'
		let s:failed	= append( s:line_num, s:end_line )
		let s:line_num	= s:line_num + 1

		let s:fname_m	= fnamemodify(s:path_name, ":r")
		let s:fname_e	= fnamemodify(s:path_name, ":e")
		let s:macro		= "_".toupper(s:fname_m)."_".toupper(s:fname_e)."_"
		let s:line_str	= "#ifndef ".s:macro
		let s:failed	= append( s:line_num, s:line_str )
		let s:line_num	= s:line_num + 1

		let s:line_str	= "#define ".s:macro
		let s:failed	= append( s:line_num, s:line_str )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "" )
		let s:line_num	= s:line_num + 1

		" 正文
		let	s:line_str	= repeat('/', 2).repeat('-', 68)
		let s:failed	= append( s:line_num, s:line_str."头文件" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, s:line_str."宏" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, s:line_str."自定义类型" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, s:line_str."常量" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, s:line_str."变量" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, s:line_str."函数" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, s:line_str."类" )
		let s:line_num	= s:line_num + 1

		" 类
		let s:line_str	= "class C".toupper(strpart(s:fname_m, 0, 1)).tolower(strpart(s:fname_m, 1, strlen(s:fname_m)-1))
		let s:failed	= append( s:line_num, s:line_str )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "{" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "public:" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "\t".repeat('/',2).repeat('_', 20)."类型定义" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "public:" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "\t".repeat('/',2).repeat('_', 20)."构造析构" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "public:" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "\t".repeat('/',2).repeat('_', 20)."操作" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "protected:" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "\t".repeat('/',2).repeat('_', 20)."属性" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "private:" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "\t".repeat('/',2).repeat('_', 20)."声明但不予实现" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "};" )
		let s:line_num	= s:line_num + 1

		let s:failed	= append( s:line_num, "" )
		let s:line_num	= s:line_num + 1

		" 正文 END
		let s:failed	= append( s:line_num, "#endif" )
		let s:line_num	= s:line_num + 1

		set fileencoding=cp936
		update
	endif
endfunction

