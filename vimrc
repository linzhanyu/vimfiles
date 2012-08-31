" ~/.vimrc (configuration file for vim only)
" skeletons
function! SKEL_spec()
	0r /usr/share/vim/current/skeletons/skeleton.spec
	language time en_US
	if $USER != ''
	    let login = $USER
	elseif $LOGNAME != ''
	    let login = $LOGNAME
	else
	    let login = 'unknown'
	endif
	let newline = stridx(login, "\n")
	if newline != -1
	    let login = strpart(login, 0, newline)
	endif
	if $HOSTNAME != ''
	    let hostname = $HOSTNAME
	else
	    let hostname = system('hostname -f')
	    if v:shell_error
		let hostname = 'localhost'
	    endif
	endif
	let newline = stridx(hostname, "\n")
	if newline != -1
	    let hostname = strpart(hostname, 0, newline)
	endif
	exe "%s/specRPM_CREATION_DATE/" . strftime("%a\ %b\ %d\ %Y") . "/ge"
	exe "%s/specRPM_CREATION_AUTHOR_MAIL/" . login . "@" . hostname . "/ge"
	exe "%s/specRPM_CREATION_NAME/" . expand("%:t:r") . "/ge"
	setf spec
endfunction
autocmd BufNewFile	*.spec	call SKEL_spec()
" enc
set encoding=utf-8
" 文件编码支持
set fileencodings=ucs-bom,utf-8,gb18030,gbk,gb2312,latin-1
" set fileencodings=utf-8
set fileencoding=utf-8
set langmenu=zh_CN.utf-8

source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决 consle 输出乱码
language message zh_CN.utf-8

" 字体 
" set gfw=新宋体:h9:cGB2312 
" set guifont=YaHei_Mono:h10:w5.6:cANSI 
" set gfw=方正准圆简体:h10:cGB2312 
" set guifont=Envy_Code_R_VS:h10:cANSI 
" set guifont=Arial_monospaced_for_SAP:h9:cANSI 
set linespace=2

" Quickfix 窗口消息转换
function QfMakeConv()
        let qflist = getqflist()
        for i in qflist
                let i.text = iconv(i.text, "cp936", "utf-8")
        endfor
        call setqflist(qflist)
endfunction
au QuickfixCmdPost make call QfMakeConv()
au QuickfixCmdPost grep call QfMakeConv()


" filetypes
filetype plugin on
filetype indent on
" ~/.vimrc ends here
syntax on
set tabstop=4
set softtabstop=4
set shiftwidth=4
set cindent
set autoindent
set nu
set helplang=cn,en
set fileformat=unix
set nobackup
set nowritebackup

set hlsearch
set incsearch
set noshowmatch

set autowrite
set updatecount=50
set updatetime=4000

set guioptions-=m
set guioptions-=T
colors torte

set listchars=tab:\|\ ,trail:-,nbsp:_
set modeline

nmap <M-h> :wincmd h<CR>
nmap <M-j> :wincmd j<CR>
nmap <M-k> :wincmd k<CR>
nmap <M-l> :wincmd l<CR>
nmap <M-H> :wincmd H<CR>
nmap <M-J> :wincmd J<CR>
nmap <M-K> :wincmd K<CR>
nmap <M-L> :wincmd L<CR>

nmap <M-n> :tabnext<CR>
nmap <M-N> :tabNext<CR>

function! UsePythonSetting()
	setlocal expandtab
	" setlocal textwidth=79
	setlocal softtabstop=4
	setlocal shiftwidth=4
	setlocal autoindent
	setlocal foldmethod=indent
	setlocal foldlevel=99
	setlocal omnifunc=pythoncomplete#Complete
	let g:SuperTabDefaultCompletionType="context"
	setlocal completeopt=menuone,longest,preview
endfunction

au FileType python call UsePythonSetting()

map <leader>n :NERDTreeToggle<CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
map <leader>td <Plug>TaskList

map <F8> :cnext<CR>
map <S-F8> :cNext<CR>
map <F10> :A<CR>

nmap <leader>td :call TemplateH()<CR>
