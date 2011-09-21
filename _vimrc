set nocompatible
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction

"配色
colorscheme slate
"字体
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
"行号,行号栏目宽度
set nu
set numberwidth=2
"tab长度
set tabstop=2
"自动对齐
set autoindent
"语法高亮
syntax on
"设置gbk字符会有编码问题，设置字符集
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
"行间距
set linespace=2
"<>调整缩进时的长度
set shiftwidth=2
"初始化窗口宽度高度
set columns=150
set lines=30
"初始化窗口位置
winpos 52 42

"禁止自动换行
set nowrap
"在输入命令时列出匹配项目
set wildmenu
"显示光标位置
set ruler
"分割窗口保持相等宽高
set equalalways

"匹配括号规则，增加html的<>
set matchpairs=(:),{:},[:],<:>
"让退格，空格，上下箭头遇到行首位自动移到下一行(包括insert模式)
set whichwrap=b,s,<,>,[,]
"取消自动备份
set nobackup
"关闭文件之前保留一个备份
set writebackup

"js语法高亮脚本
let g:javascript_enable_domhtmlcss=1

"光标准星
set cursorline
hi cursorline guibg=NONE gui=underline
set cursorcolumn
hi cursorcolum gui=underline

"自动修改
set autoread

"不明字体宽度，按照double的来
set ambiwidth=double
"打开javascript折叠
"
setlocal foldlevel=1
let g:tlist_javascript_settings = 'javascript;s:string;a:array;o:object;f:function;m:member'
let b:javascript_fold=1  "开启折叠
"自动补齐括号等
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
:inoremap { {<CR>}<ESC>O
:inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i


function ClosePair(char)
  if getline('.')[col('.') - 1] == a:char
      return "/<Right>"
  else
      return a:char
  endif
endfunction

"自动补齐html"
function! InsertHtmlTag()
        let pat = '\c<\w\+\s*\(\s\+\w\+\s*=\s*[''#$;,()."a-z0-9]\+\)*\s*>'
        normal! a>
        let save_cursor = getpos('.')
        let result = matchstr(getline(save_cursor[1]), pat)
        "if (search(pat, 'b', save_cursor[1]) && searchpair('<','','>','bn',0,  getline('.')) > 0)
        if (search(pat, 'b', save_cursor[1]))
           normal! lyiwf>
           normal! a</
           normal! p
           normal! a>
        endif
        :call cursor(save_cursor[1], save_cursor[2], save_cursor[3])
endfunction
inoremap > <ESC>:call InsertHtmlTag()<CR>a

"半透明设置"
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 234)
"git 配置"
set laststatus=2
set statusline=%{GitBranch()}

command Gogm cd E:\apache\htdocs\gm\ 
command Golithe cd E:\apache\htdocs\lithe\ 
command GoTanKe cd E:\apache\htdocs\TanKe\

:map gd :GitDiff
:map gD :GitDiff –cached
:map gs :GitStatus
:map gl :GitLog
:map ga :GitAdd
:map gA :GitAdd <cfile>
:map gc :GitCommit

