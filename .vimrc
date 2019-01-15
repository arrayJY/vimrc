"--------------------------------------------------
"界面设置
"--------------------------------------------------
syntax on
set t_Co=256
set nocompatible                "关闭兼容模式
set shortmess=atI               "不帮助乌干达儿童
set number                      "显示行号
syntax on                       "打开语法高亮
set ruler                       "显示标尺
set showmode
set novisualbell                "不要闪烁
colorscheme space-vim-dark      "主题配色
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
set nofoldenable                "不允许折叠
set scrolloff=3                 "光标移动距离底/顶部3行距离
set helplang=cn                 "显示中文帮助
autocmd InsertEnter * se cul    "高亮当前行
set nowrap
"--------------------------------------------------
"输入设置
"--------------------------------------------------
if &filetype == "cpp" || &filetype == "c"
    set cindent                 "设置C语言缩进
else
    set autoindent              "设置自动缩进
endif
set tabstop=4                   "设置Tab宽度
set shiftwidth=4
set expandtab                   "替换Tab为空格
"--------------------------------------------------
"编码设置
"--------------------------------------------------
set encoding=utf-8
set fileencoding=utf-8
 set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
"--------------------------------------------------
"映射
"--------------------------------------------------
let mapleader=","   "设置leader
"****************************
"输入模式
"******************************
"用jk代替ESC作为退出模式
inoremap jk <esc>
"输入模式禁用方向键
"if has('unix')
"    inoremap OA <Nop>
"    inoremap OB <Nop>
"    inoremap OC <Nop>
"    inoremap OD <Nop>
"else
"    inoremap <left> <Nop>
"    inoremap <right> <Nop>
"    inoremap <up> <Nop>
"    inoremap <down> <Nop>
"endif
"括号补全
"******************************
"VIMRC快捷通道
"******************************
"保存vimrc——Save vimrc
noremap <leader>sv :w<cr>:source $MYVIMRC<cr>
"编辑vimrc——Edit vimrc
noremap <leader>ev :vsplit $MYVIMRC<cr>
"******************************
"******************************
""切换文件——After File
"******************************
noremap <C-a> :w<cr>:bn<cr>
"******************************
"插件
"******************************
"NERDTree
noremap <C-e> :NERDTree<cr>
"******************************

"--------------------------------------------------
"插件设置
"--------------------------------------------------
"******************************
"Vim-plug
"******************************
call plug#begin('~/.vim/vim-plugs')

Plug 'kien/ctrlp.vim'
Plug 'bling/vim-airline'
"Plug 'Valloric/YouCompleteMe'
Plug 'skywind3000/asyncrun.vim'
Plug 'w0rp/ale'
Plug 'Shougo/echodoc'
Plug 'tpope/vim-surround'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-indent'
Plug 'kana/vim-textobj-syntax'
Plug 'kana/vim-textobj-function', { 'for':['c', 'cpp', 'vim'] }
Plug 'sgur/vim-textobj-parameter'
Plug 'hotoo/pangu.vim'
Plug 'liuchengxu/space-vim-dark'

call plug#end()

filetype on
"******************************
"Vim-airline
"******************************
let g:airline_powerline_fonts = 1                   "使用Powerline字体
let g:airline#extensions#whitespace#enabled = 0     "不计算空白符数量
let g:airline#extensions#whitespace#symbol = '!'
"******************************
"******************************
" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6
"任务结束时候响铃提醒
let g:asyncrun_bell = 1
"设置 F10 打开/关闭 Quickfix 窗口
nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>
nnoremap <silent> <F9> :AsyncRun g++ -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>
"--------------------------------------------------
let g:ale_linters_explicit = 1
let g:ale_completion_delay = 500
let g:ale_echo_delay = 20
let g:ale_lint_delay = 500
let g:ale_echo_msg_format = '[%linter%] %code: %%s'
let g:ale_lint_on_text_changed = 'normal'
let g:ale_lint_on_insert_leave = 1
let g:airline#extensions#ale#enabled = 1

let g:ale_c_gcc_options = '-Wall -O2 -std=c99'
let g:ale_cpp_gcc_options = '-Wall -O2 -std=c++14'
let g:ale_c_cppcheck_options = ''
let g:ale_cpp_cppcheck_options = ''
let g:ale_sign_error = "\ue009\ue009"

hi! clear SpellBad
hi! clear SpellCap
hi! clear SpellRare
hi! SpellBad gui=undercurl guisp=red
hi! SpellCap gui=undercurl guisp=blue
hi! SpellRare gui=undercurl guisp=magenta
