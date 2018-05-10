set nocompatible
syntax enable                " 打开语法高亮
syntax on                    " 开启文件类型侦测
"filetype indent on          " 针对不同的文件类型采用不同的缩进格式;indent on就是按indent目录下脚本自动缩进
"filetype plugin off         " 针对不同的文件类型加载对应的插件;plugin on就是允许执行 ftplugin目录下的文件类型特定的脚本。
filetype plugin indent on   "合并写法
set tabstop=4                " 设置tab键的宽度
set shiftwidth=4             " 换行时行间交错使用4个空格
set autoindent               " 自动对齐
set backspace=2              " 设置退格键可用
set cindent shiftwidth=4     " 自动缩进4空格
set smartindent              " 智能自动缩进
set ai!                      " 设置自动缩进
set nu                      " 显示行号
set showmatch                " 显示括号配对情况
set matchtime=5              " 匹配括号高亮的时间（单位是十分之一秒）
set mouse=a                  " 启用鼠标
set ruler                    " 右下角显示光标位置的状态行
set incsearch                " 查找book时，当输入/b时会自动找到
set hlsearch                 " 开启高亮显示结果
set incsearch                " 开启实时搜索功能
set nowrapscan               " 搜索到文件两端时不重新搜索
map nh :noh<cr>
set nocompatible             " 关闭兼容模式
set vb t_vb=                 " 关闭提示音
set cursorline               " 突出显示当前行
set hidden                   " 允许在有未保存的修改时切换缓冲区
"set list
"set lcs=tab:\|\
hi SpecialKey guifg=#0087AF
set shm+=I					"去掉启动画面

set history=1000       " 历史记录数
set ignorecase         "搜索忽略大小写

"set nowrap               " 设置不自动换行
set wrap                  " 设置自动换行
map nw :set nowrap<CR>

set writebackup              " 设置无备份文件
set nobackup
set directory=.,$TEMP        "解决“无法打开未命名交换文件,恢复将不可能”错误
set autochdir                " 设定文件浏览器目录为当前目录

set laststatus=2                          " 开启状态栏信息
set cmdheight=1                           " 命令行的高度，默认为1，这里可以重设
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%y/%m/%d\ -\ %H:%M\")}	" 状态行显示的内容 [包括系统平台、文件类型、坐标、所占比例、时间等

map JJ <Esc>
imap jj <Esc>
map zz :q<CR>


autocmd BufEnter * cd %:p:h	"自动将 Vim 工作目录迁移到所打开文本文件的目录下
"标签页快捷键映射
map tt :tabnew<CR>		"按“tt”新建标签;
map <S-T> :tabnew<CR>
map tn :tabn<CR>		"下一标签页
map tp :tabp<CR>		"上一标签页
map <S-Left> :tabp<CR>		"切换标签页;使用“Shift+←”切换
map <S-Right> :tabn<CR>		"切换标签页;使用“Shift+→”切换
map cc :tabc<CR>		"按cc关闭当前标签
map <S-C> :tabc<CR>		"按Shift+c关闭当前标签
map co :tabo<CR>		"(close the other tab)关闭其他标签
map <S-O> :tabo<CR>		"关闭其他标签

set showtabline=1		"设置标签栏的显示，0永远不显示 1两个以上显示 2 永远显示
map ft :set ft=html<CR>

nmap <S-L> dd       "提高用dd命令删除行的性能
nmap kil :g/^\s*$/d<CR>

"filetype off                  " required

"标签页栏中去除当前所编辑文件的路径信息，只保留文件名
function ShortTabLabel ()
	let bufnrlist = tabpagebuflist (v:lnum)
	let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
	let filename = fnamemodify (label, ':t')
	return filename
endfunction
set guitablabel=%{ShortTabLabel()}

" 设置Vundle环境
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
Plugin 'ascenator/L9', {'name': 'newL9'}

"保留会话
Bundle 'xolox/vim-session'
Bundle 'xolox/vim-misc'
let g:session_autosave = 'yes'
let g:session_autoload = 'no'

"自动保存
Bundle '907th/vim-auto-save'
"let g:auto_save = 0  " enable AutoSave on Vim startup

"打开最近打开文件
Bundle 'yegappan/mru'
nmap mr :MRU<CR>

"配色方案更多在http://www.vim.org/scripts/script.php?script_id=625
"Bundle 'tomasr/molokai'
"colorscheme molokai
"let g:rehash256 = 1
"let g:molokai_original = 1

"自动补全
Bundle 'ervandew/supertab'

"javascrip语法提示
Bundle 'pangloss/vim-javascript'
let g:javascript_plugin_jsdoc = 1

"NERDTree:浏览文件系统
Bundle 'scrooloose/nerdtree'
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
let NERDTreeWinPos ="left"                      "将NERDTree的窗口设置在gvim窗口的左边
let NERDTreeShowBookmarks=1                     "当打开NERDTree窗口时，自动显示Bookmarks
"let NERDTreeMinimalUI=1                        "不显示帮助面板
let NERDTreeChDirMode=2                         "选中root即设置为当前目录
let NERDTreeCaseSensitiveSort=0                 "不分大小写排序
let NERDTreeQuitOnOpen=0                        "打开文件后, 关闭NERDTrre窗口
let NERDTreeHighlightCursorline=1               "高亮NERDTrre窗口的当前行
let NERDTreeIgnore=['\.zip$','\~$','\.png$','\.gif$','\.jpg$','\.bak$','\.html$','\.rar$','\.swp$']                "不显示指定的类型的文件
"let NERDTreeIgnore += ['\(\.txt\)\@<!$[[file]]']  "只显示txt文件
map ` :NERDTreeToggle<CR>						"按 `(即~) 打开侧边文件浏览器
"open a NERDTree automatically when vim starts up
"autocmd vimenter * NERDTree
"" open a NERDTree automatically when vim starts up if no files were specified
"autocmd vimenter * if !argc() | NERDTree | endif
"close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"Winresizer:重新调整窗口
Bundle 'simeji/winresizer'
map <S-E> :WinResizerStartResize<CR>
map rs :WinResizerStartResize<CR>
let g:winresizer_keycode_cancel = 122   "按z退出

"定制ZenCoding,用Ctrl+e替换ctrl+y+展开表达式
Bundle 'mattn/emmet-vim'
let g:user_emmet_install_global = 0
autocmd FileType html,css,vue EmmetInstall
let g:user_emmet_expandabbr_key = '<c-e>'
let g:user_zen_settings = {
			\ 'vue' : {
			\ 'extends' : 'html',
			\ 'filters' : 'c',
			\ },
			\ 'xml' : {
			\ 'extends' : 'html',
			\ },
			\ 'html' : {
			\ 'extends' : 'html',
			\ },
			\}
let g:use_zen_complete_tag = 1

"快速查找文件
Bundle 'vim-scripts/FuzzyFinder'
map <C-S-P> :FufFileWithCurrentBufferDir<CR>

"快速查找文件，vim编译时需要ruby模块支持
"Bundle 'wincent/command-t'
"map <C-p> :CommandT<CR>
"yum install -y ruby  ruby-devel
"安装方法：cd ~/.vim/bundle/command-t/ruby/command-t/ext/command-t && ruby extconf.rb && make

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required