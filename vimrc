call plug#begin()
	Plug 'ycm-core/YouCompleteMe'			" 
	"Plug 'vim-syntastic/syntastic'			" Syntax checking hacks for vim
	Plug 'dense-analysis/ale'				" 动态检查
	Plug 'ludovicchabant/vim-gutentags'		" 自动索引
	Plug 'universal-ctags/ctags'			" tags
	Plug 'skywind3000/asyncrun.vim'			" 编译运行
	Plug 'mhinz/vim-signify'				" 修改比较
	Plug 'Yggdroot/LeaderF'					" 函数列表/文件切换
	Plug 'mbbill/undotree'					" undotree
	Plug 'tpope/vim-fugitive'				" git wrapper 
	Plug 'easymotion/vim-easymotion'		" Vim motions on speed
	
	Plug 'preservim/nerdcommenter'			" 
	Plug 'tpope/vim-surround'				" 
	
	
	" 延迟按需加载，使用到命令的时候再加载或者打开对应文件类型才加载
	Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
	Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
	
	" 文本对象 textobj-user 全家桶：
	Plug 'kana/vim-textobj-user'
	Plug 'kana/vim-textobj-indent'
	Plug 'kana/vim-textobj-syntax'
	Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim', 'java'] }
	Plug 'sgur/vim-textobj-parameter'

	
	" 编辑辅助 
	Plug 'tpope/vim-unimpaired'				" 跳转快捷键
	
	" 外观
	Plug 'morhetz/gruvbox'
	"Plug 'flazz/vim-colorschemes'			" 
	Plug 'vim-airline/vim-airline'			" 
	Plug 'vim-airline/vim-airline-themes'
call plug#end()

let mapleader = "\<space>"
"{

	nnoremap <leader>w :w<CR>
	nnoremap <leader>q :q<CR>
	nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
	nnoremap <leader>ev :tabe $MYVIMRC<CR>                  " Quickly edit/reload the vimrc file
	nnoremap <leader>sv :source $MYVIMRC<CR>
	
	"nnoremap <leader>sl :set list!<CR>	" quick config to see or not see special character 
	nnoremap <leader>ll :set conceallevel=0<CR>             " quick change conceal mode
	
	" 映射切换buffer的键位
	nnoremap <leader>B :bp<CR>
	nnoremap <leader>b :bn<CR>
	nnoremap <leader>1 :1b<CR>
	nnoremap <leader>2 :2b<CR>
	nnoremap <leader>3 :3b<CR>
	nnoremap <leader>4 :4b<CR>
	nnoremap <leader>5 :5b<CR>
	
	nnoremap <leader>h :wincmd h<CR>
	nnoremap <leader>j :wincmd j<CR>
	nnoremap <leader>k :wincmd k<CR>
	nnoremap <leader>l :wincmd l<CR>

	nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
	nnoremap <leader>ps :Rg<space>
	nnoremap <silent> <leader>+ :vertical resize +5<CR>
	nnoremap <silent> <leader>- :vertical resize -5<CR>
	
	nnoremap <Leader>eg :e ++enc=gbk<CR>
	nnoremap <Leader>eu :e ++enc=utf8<CR>
"}


" YCM config ycm-core/YouCompleteMe{
	nnoremap <silent> <leader>go :YcmCompleter GoTo<CR>
	nnoremap <silent> <leader>fi :YcmCompleter FixIt<CR>


	let g:EclimFileTypeValidate = 0						" Diagnostic display - Eclim
	let g:ycm_server_log_level = 'info'
	let g:ycm_min_num_identifier_candidate_chars = 2	" 触发字数
	let g:ycm_collect_identifiers_from_comments_and_strings = 1
	let g:ycm_complete_in_strings=1



	let g:ycm_key_invoke_completion = '<c-z>'		" 触发语意补全	
	" 追加补全自动弹出
	let g:ycm_semantic_triggers =  {
				\ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
				\ 'cs,lua,javascript': ['re!\w{2}'],
				\ }

	" 修改补全列表配色
	"highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
	"highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
	
	" 关闭函数原型预览窗口
	set completeopt=menu,menuone				" ':set completeopt?' 查看当前设置
	let g:ycm_add_preview_to_completeopt = 0	" Default: '0' 为1时会在completeopt选项后增加preview， 当其本身就有preview属性时，此设置会无效
	
	" 关闭YCM自带诊断
	let g:ycm_show_diagnostics_ui = 0
	
	let g:ycm_filetype_whitelist = { 
			\ "c":1,
			\ "cpp":1, 
			\ "objc":1,
            \ "java":1,
			\ "sh":1,
			\ "zsh":1,
			\ "zimbu":1,
			\ }
" }

" vim-syntastic/syntastic {
	" Diagnostic display - Syntastic
	"let g:syntastic_java_checkers = []
	" eq.
	"let g:syntastic_<filetype>_checkers = ['<checker-name>']
	
	"set statusline+=%#warningmsg#
	"set statusline+=%{SyntasticStatuslineFlag()}
	"set statusline+=%*
	"
	"let g:syntastic_always_populate_loc_list = 1
	"let g:syntastic_auto_loc_list = 1
	"let g:syntastic_check_on_open = 1
	"let g:syntastic_check_on_wq = 0
" }


" vim-gutentags{
	" gutentags 搜索工程目录的标志，碰到这些文件/目录名就停止向上一级目录递归
	let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']
	
	" 所生成的数据文件的名称
	let g:gutentags_ctags_tagfile = '.tags'
	
	" 将自动生成的 tags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
	let s:vim_tags = expand('~/.cache/tags')
	let g:gutentags_cache_dir = s:vim_tags
	
	" 配置 ctags 的参数
	let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
	let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
	let g:gutentags_ctags_extra_args += ['--c-kinds=+px']
	
	set tags=./.tags;,.tags
	
"}

" asyncrun.vim {

	" 自动打开 quickfix window ，高度为 6
	let g:asyncrun_open = 6
	
	" 任务结束时候响铃提醒
	let g:asyncrun_bell = 1
	
	" 设置 F10 打开/关闭 Quickfix 窗口
	nnoremap <leader>a :call asyncrun#quickfix_toggle(6)<cr>
	" 编译单个文件
	nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
	" 运行单个文件
	nnoremap <silent> <F5> :AsyncRun -raw -cwd=$(VIM_FILEDIR) "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
	" 参数 -raw 表示输出不用匹配错误检测模板 (errorformat) ，直接原始内容输出到 quickfix 窗口。
	" 项目
	let g:asyncrun_rootmarks = ['.svn', '.git', '.root', '_darcs', 'build.xml'] 
	nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>
	nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>
	nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>
	nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>
	
	" 由于 C/C++ 标准库的实现方式是发现在后台运行时会缓存标准输出直到程序退出，你想实时看到 printf 输出的话需要 fflush(stdout) 一下，或者程序开头关闭缓存：setbuf(stdout, NULL); 即可。

	" 同时，如果你开发 C++ 程序使用 std::cout 的话，后面直接加一个 std::endl 就强制刷新缓存了，不需要弄其他。而如果你在 Windows 下使用 GVim 的话，可以弹出新的 cmd.exe 窗口来运行刚才的程序：
	nnoremap <silent> <F5> :AsyncRun -cwd=$(VIM_FILEDIR) -mode=4 "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
	nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
	
	" F4：使用 cmake 生成 Makefile
	" F5：单文件：运行
	" F6：项目：测试
	" F7：项目：编译
	" F8：项目：运行
	" F9：单文件：编译
	" F10：打开/关闭底部的 quickfix 窗口
	
"}

" dense-analysis/ale {
	let g:ale_linters_explicit = 1
	let g:ale_completion_delay = 500
	let g:ale_echo_delay = 20
	let g:ale_lint_delay = 500
	let g:ale_echo_msg_format = '[%linter%] %code: %%s'
	let g:ale_lint_on_text_changed = 'normal'
	let g:ale_lint_on_insert_leave = 1
	let g:airline#extensions#ale#enabled = 1
	let g:ale_linters = {
		\   'csh': ['shell'],
		\   'zsh': ['shell'],
		"\   'go': ['gofmt', 'golint'],
		"\   'python': ['flake8', 'mypy', 'pylint'],
		\   'c': ['gcc', 'cppcheck'],
		\   'cpp': ['gcc', 'cppcheck'],
		\   'text': [],
		\}
	
	
	" gcc
	let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
	let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
	" cppcheck
	let g:ale_c_cppcheck_options = ''
	let g:ale_cpp_cppcheck_options = ''
	
	"  GVim警告和错误的样式
	let g:ale_sign_error = "\ue009\ue009"
	hi! clear SpellBad
	hi! clear SpellCap
	hi! clear SpellRare
	hi! SpellBad gui=undercurl guisp=red
	hi! SpellCap gui=undercurl guisp=blue
	hi! SpellRare gui=undercurl guisp=magenta
"}


" mhinz/vim-signify {
	set signcolumn=yes			" signify和ALE相关。侧边栏自动隐藏
" }
	
" LeaderF {
	"let g:Lf_ShortcutF = '<leader>lp'			" 函数列表
	let g:Lf_ShortcutB = '<leader>ln'			" 文件检索
	noremap <leader>lf :LeaderfMru<cr>			" 文件检索（大范围）
	noremap <leader>lp :LeaderfFunction!<cr>	" 函数列表
	noremap <leader>lb :LeaderfBuffer<cr>		" Buffer检索/列表
	noremap <leader>lt :LeaderfTag<cr>			" Tag检索
	let g:Lf_CacheDirectory = expand('~/.cache')
	
	let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
	let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
	let g:Lf_WorkingDirectoryMode = 'Ac'
	let g:Lf_WindowHeight = 0.30
	let g:Lf_ShowRelativePath = 0
	let g:Lf_HideHelp = 1
	let g:Lf_StlColorscheme = 'powerline'
	let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}
"}

" undotree {
	nnoremap <leader>ut :UndotreeToggle<cr>	" 
	nnoremap <leader>uu :UndotreeShow<CR>
	
	if has("persistent_undo")
		set undodir=$HOME."/.undodir"
		set undofile
	endif
	
	set undofile								" enable undo after close the file
	set undodir=$HOME/.vim/undo
	set undolevels=1000
	set undoreload=10000
" }

" tpope/vim-fugitive {							" The crown jewel of Fugitive is :Git (or just :G)
	
	" Additional commands are provided for higher level operations:
	nnoremap <leader>Gd :Gdiffsplit
	nnoremap <leader>Gr :Gread
	nnoremap <leader>Gw :Gwrite
	nnoremap <leader>Gm :GMove
	nnoremap <leader>Gd :GDelete
	nnoremap <leader>Gb :GBrowse
	" For more information, see :help fugitive.
	nnoremap <leader>gs :Gstatus
	nnoremap <leader>gd :Gdiff
	nnoremap <leader>gc :Gcommit
	nnoremap <leader>gb :Gblame
	nnoremap <leader>gl :Glog
	nnoremap <leader>gp :Git push
"}

" easymotion/vim-easymotion {
	"map <Leader> <Plug>(easymotion-prefix)		" 默认为<Leader><Leader>，通过手动设置可以变回<Leader>
    
	" Default Mapping      | Details
    " ---------------------|----------------------------------------------
    " <Leader>f{char}      | Find {char} to the right. See |f|.
    " <Leader>F{char}      | Find {char} to the left. See |F|.
    " <Leader>t{char}      | Till before the {char} to the right. See |t|.
    " <Leader>T{char}      | Till after the {char} to the left. See |T|.
    " <Leader>w            | Beginning of word forward. See |w|.
    " <Leader>W            | Beginning of WORD forward. See |W|.
    " <Leader>b            | Beginning of word backward. See |b|.
    " <Leader>B            | Beginning of WORD backward. See |B|.
    " <Leader>e            | End of word forward. See |e|.
    " <Leader>E            | End of WORD forward. See |E|.
    " <Leader>ge           | End of word backward. See |ge|.
    " <Leader>gE           | End of WORD backward. See |gE|.
    " <Leader>j            | Line downward. See |j|.
    " <Leader>k            | Line upward. See |k|.
    " <Leader>n            | Jump to latest "/" or "?" forward. See |n|.
    " <Leader>N            | Jump to latest "/" or "?" backward. See |N|.
    " <Leader>s            | Find(Search) {char} forward and backward.
    "                      | See |f| and |F|.
" }

" scrooloose/nerdtree {
	nnoremap <leader>ff :NERDTreeToggle<cr>

" }

" vim-airline {
	" 设置 laststatus = 0 ，不显式状态行
	" 设置 laststatus = 1 ，仅当窗口多于一个时，显示状态行
	" 设置 laststatus = 2 ，总是显式状态行
	set laststatus=2
	set showtabline=2							" always show tabline


	
	let g:airline_theme='hybrid'
	let g:airline_powerline_fonts = 1
	
	if !exists('g:airline_symbols')
		let g:airline_symbols = {}
	endif
	
	" statusline {
		"let g:airline_left_sep = ''
		"let g:airline_left_alt_sep = ''
		"let g:airline_right_sep = ''
		"let g:airline_right_alt_sep = ''
		"let g:airline_symbols.branch = ''
		"let g:airline_symbols.readonly = ''
		"let g:airline_symbols.linenr = ''
		
		"let g:airline_section_z = '%l/%L %c'
		" 显示文件路径	show absolute file path in status line
		let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

		
		
		" %(...%)	定义一个项目组。
		" %{n}*	%对其余的行使用高亮显示组Usern，直到另一个%n*。数字n必须从1到9。用%*或%0*可以恢复正常的高亮显示。
		" %<	如果状态行过长，在何处换行。缺省是在开头。
		" %=	左对齐和右对齐项目之间的分割点。
		" %	字符%
		" %B	光标下字符的十六进制形式
		" %F	缓冲区的文件完整路径
		" %H	如果为帮助缓冲区则显示为HLP
		" %L	缓冲区中的行数
		" %M	如果缓冲区修改过则显示为+
		" %N	打印机页号
		" %O	以十六进制方式显示文件中的字符偏移
		" %P	文件中光标前的%
		" %R	如果缓冲区只读则为RO
		" %V	列数。如果与%c相同则为空字符串
		" %W	如果窗口为预览窗口则为PRV
		" %Y	缓冲区的文件类型，如vim
		" %a	如果编辑多行文本，这个字行串就是({current} of {arguments})，例如：(5 of 18)。如果在命令行中只有一行，这个字符串为空
		" %b	光标下的字符的十进制表示形式
		" %c	列号
		" %f	缓冲区的文件路径
		" %h	如果为帮助缓冲区显示为[Help]
		" %l	行号
		" %m	如果缓冲区已修改则表示为[+]
		" %n	缓冲区号
		" %o	在光标前的字符数（包括光标下的字符）
		" %p	文件中所在行的百分比
		" %r	如果缓冲区为只读则表示为[RO]
		" %t	文件名(无路径)
		" %v	虚列号
		" %w	如果为预览窗口则显示为[Preview]
		" %y	缓冲区的文件类型，如[vim]
		" %{expr}	表达式的结果
		
		"set statusline=%F%m%r%h%w
		"set statusline+=[FORMAT=%{&ff}]
		"set statusline+=[TYPE=%Y]
		"set statusline+=[ASCII=%03.3b]
		"set statusline+=[HEX=%02.2B]
		"set statusline+=[POS=%04l,%04v][%p%%]
		"set statusline+=[LEN=%L]
		
	"}

	
	" 开启tabline {
		let g:airline#extensions#tabline#enabled = 1
		" tabline中当前buffer两端的分隔字符
		let g:airline#extensions#tabline#left_sep = ''
		" tabline中未激活buffer两端的分隔字符
		let g:airline#extensions#tabline#left_alt_sep = '|'
		" default/jsformatter/unique_tail/unique_tail_improved/...
		let g:airline#extensions#tabline#formatter = 'default'
		" tabline中buffer显示编号
		let g:airline#extensions#tabline#buffer_nr_show = 1
		"let g:airline_statusline_ontop=1
		"let g:airline_powerline_fonts = 1 
		" show tab number in tab line
		let g:airline#extensions#tabline#tab_nr_type = 1
	"}
 
	

	

	"" ale <https://github.com/dense-analysis/ale> {
		
		let g:airline#extensions#ale#enabled = 1				"* enable/disable ale integration >
		let airline#extensions#ale#error_symbol = 'E:'			"* ale error_symbol >
		let airline#extensions#ale#warning_symbol = 'W:'		"* ale warning >
		let airline#extensions#ale#show_line_numbers = 1		"* ale show_line_numbers >	
		let airline#extensions#ale#open_lnum_symbol = '(L'		"* ale open_lnum_symbol >
		let airline#extensions#ale#close_lnum_symbol = ')'		"* ale close_lnum_symbol >
	" }

"}

" morhetz/gruvbox {
	colorscheme gruvbox
	set guioptions-=T  								" no toolbar
	"set columns=78 lines=50 linespace=0			" 设置gui默认界面大小
	set background=dark
"}


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


set noerrorbells novisualbell t_vb=			" cancel the annoying bell
set tabstop=2  softtabstop=2				
set shiftwidth=2
set expandtab
set smartindent
set nu										" show number 
set nowrap									" Do not wrap long lines
set smartcase
set nobackup
set noswapfile
set incsearch								" Shows the match while typing

language messages zh_CN.utf-8				" 设置中文提示
set helplang=cn								" 设置中文帮助
set ambiwidth=double						" 设置为双字宽显示，否则无法完整显示如:☆

" Vim 在与屏幕/键盘交互时使用的编码(取决于实际的终端的设定)        
set encoding=utf-8
set langmenu=zh_CN.UTF-8
" 设置打开文件的编码格式  
set fileencodings=utf-8,utf-16le,gbk,cp936,gb18030,big5,euc-jp,euc-kr,latin1,cp1252,iso-8859-15,ucs-bom
set termencoding=utf-8						" it will choose the first right configure to use

set guifont=仿宋:h14:cANSI:qDRAFT

filetype on
filetype plugin indent on


set colorcolumn=80
" let &colorcolumn=join(range(81,999),',')
" let &colorcolumn='80,'.join(range(120,999),',')
" 颜色修改
highlight ColorColumn ctermbg=0 guibg=lightgrey

if executable('rg')
	let g:rg_derive_root='true'
endif

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 24

let g:ctrlp_use_caching = 0


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                Basic Settings                                "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nolist									" show the special character
set nocompatible							" not compatible for vi
set nospell									" close spell examine
set belloff=all
set relativenumber							" show relative line number
set hlsearch								" Highlight the matching part
set ignorecase					
set showmatch								" Show matching brackets/parenthesis
set fileformats=unix,dos,mac
set linespace=0								" No extra spaces between rows
set confirm									" Confirm before vim exit
set lazyredraw								" don't update the display while executing macros
set backspace=eol,start,indent				" use backspace for delete space line
set ruler                     				" show the cursor's position
set nomodeline                				" disable mode lines (security measure)
set noshowmode                				" do not show Insert, We already have it in lightline
set mouse=a                   				" allow mouse select and etc operation
set autoindent                				" config the indent
set smarttab				
set copyindent				
set history=1000              				" save 1000 cmd
set timeoutlen=500            				" give u 500 time to react for cmd
set guioptions=e              				" only show guitablabel
set autoread				
set autowrite				
set autowriteall              				" Auto-write all file changes
set iskeyword-=_,.,=,-,:,
set switchbuf=useopen         " reveal already opened files from the
" quickfix window instead of opening new buffers
set wildmenu
" set cursorcolumn            " highlight column
" set cursorline              " highlight row
if has('nvim')                " Use floating windows to complete the commond, only neovim support
  set wildoptions=pum
  set termguicolors           " With out this settings, transparable float-win will not work normally
  set pumblend=30             " Let floatingwindow to be transparable
else
  set wildmode=list:longest,full                " Set list to show completeopt, however it will lead to disfunc for floating windows
endif
set whichwrap=b,s,h,l,<,>,>h,[,]                " Backspace and cursor keys wrap too
set t_Co=256                                    " number of colors
"set autochdir                                  " disable for leadf
set hidden
set display+=lastline

set showcmd                                     " Show partial commands in status line and
" Selected characters/lines in visual mode
set viewoptions=folds,options,cursor,unix,slash " Better Unix / Windows compatibility
set virtualedit=onemore                         " used with caution of breaking plugins
"set completeopt=menuone,menu,preview,longest
set dictionary+=/usr/share/dict/words           " autocompletion with dictionary help
set dictionary+=$HOME/.vim/dict/
set statusline+=%*
set statusline+=%#warningmsg#
set shortmess+=filmnrxoOtT                      " Abbrev. of messages (avoids 'hit enter')


if has('syntax')
    syntax enable
endif

if has('clipboard')
    if has('unnamedplus')                                               " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else                                                                " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif


set wildignore=*.o,*~,*.pyc,*.swp,*.bak,*.class,*.DS_Store              " vim will ignore them
if has('win16') || has('win32')
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

if !&scrolloff                                                          " Minimum lines to keep above and below cursor
    set scrolloff=1
endif

if !&sidescrolloff
    set scrolloff=5
endif



" fold config
" foldmethod [diff, expr, indent, manual, marker, syntax]
" diff show the diff between unfold and fold
" expr use `foldexpr` to config fold logic
" indent fold base on indent
" manual use zf zF or :Fold to fold, zfa(,
"                     :mkview to save 
"                     :loadview to reload
" mark ....
" syntax
set foldmethod=manual
set foldlevel=99
set foldlevelstart=99

let gitroot = substitute(system('git rev-parse --show-toplevel'),'[\n\r]', '', 'g')                          " Make tags placed in .git/tags file available in all levels of a repository
if gitroot != ''
    let &tags = &tags . ',' . gitroot . '/.git/tags'
endif


" wrap config (not recommend
" formation options
" default is tcq 
" t: 根据 textwidth 自动折行
" c: 在（程序源代码中的）注释中自动折行，插入合适的注释起始字符
" r: 插入模式下在注释中键入回车时，插入合适的注释起始字符
" q: 允许使用"gq"命令对注释进行格式化；
" n: 识别编号列表，编号行的下一行的缩进由数字后的空白决定（与“2”冲突，需要“autoindent”）；
" 2: 使用一段的第二行的缩进来格式化文本；
" l: 在当前行长度超过 textwidth 时，不自动重新格式化；
" m: 在多字节字符处可以折行，对中文特别有效（否则只在空白字符处折行）；
" M: 在拼接两行时（重新格式化，或者是手工使用“J”命令），如果前一行的结尾或后一行的开头是多字节字符，则不插入空格，非常适合中文
" 
" set textwidth=80 "最大字符长度
" set formatoptions+=t
set formatoptions-=t 			" disable wrap
" set formatoptions-=l 			" wrap long lines
" if v:version > 703 || v:version == 703 && has('patch541')
"     set formatoptions+=j " Delete comment chars when join comment lines
" endif
" set wrapmargin=2 " 2 chars wrap margin from the right window border, hard wrap


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                                 Functions                                  "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"let W Wq wQ not be error
command! -bar -nargs=* -complete=file -range=% -bang W         <line1>,<line2>write<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang Wq        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang WQ        <line1>,<line2>wq<bang> <args>
command! -bar -nargs=* -complete=file -range=% -bang We        <line1>,<line2>w<bang> | e <args>
command! -bar -nargs=* -complete=file          -bang E         edit<bang> <args>
command! -bar                                  -bang Q         quit<bang>
