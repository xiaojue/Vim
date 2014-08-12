"@author fuqiang[designsor@gmail.com]
"@version 20120214
"@description for my linux vimrc


"行号,行号栏目宽度
set noesckeys
set nu
set numberwidth=2
set encoding=utf-8 fileencodings=ucs-bom,utf-8,cp936
autocmd BufNewFile,BufRead *.node set filetype=javascript
"tab长度
set noexpandtab
"%retab!
set list
set lcs=tab:\|\ ,nbsp:%,trail:-
highlight LeaderTab guifg=#666666
match LeaderTab /^\t/
"缩进
set autoindent
set smartindent
set smarttab
set linespace=2
set shiftwidth=2
set softtabstop=2
set tabstop=2
set expandtab
"显示指令
set showcmd
"语法高亮
"syntax enable
"set background=dark
"colorscheme solarized
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd BufwritePre,FileWritePre * retab

syntax on
"禁止自动换行
set nowrap
"在输入命令时列出匹配项目
set wildmenu
"分割窗口保持相等宽高
set equalalways
"js语法高亮脚本
let g:javascript_enable_domhtmlcss=1
"自动修改
set autoread

"不明字体宽度，按照double的来
set ambiwidth=double

" 获取当前目录
func! GetPWD()
    return substitute(getcwd(), "", "", "g")
endf

"Markdown to HTML
"map md :!perl "D:\Program Files\Vim\vim73\Markdown\Markdown.pl" --html4tags % > %:r.html<cr>

"命令行于状态行
set ch=1
set stl=\ [File]\ %F%m%r%h%y[%{&fileformat},%{&fileencoding}]\ %w\ \ [PWD]\ %r%{GetPWD()}%h\ %=\ [Line]%l/%L\ %=\[%P]
set ls=2 " 始终显示状态行
set wildmenu "命令行补全以增强模式运行

"格式化js
let mapleader=","
nmap <silent> <leader>format :call g:Jsbeautify()<CR>
"格式化html混合js的
filetype plugin indent on
"快速打开目录树
nmap <silent> <leader>tree :NERDTree<CR>

let Tlist_JS_Settings = 'javascript;s:string;a:array;o:object;f:function'
"let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
autocmd FileType javascript set dictionary=~/.vim/dict/javascript.dict
