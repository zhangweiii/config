"==============================================================================
" vim 内置配置 
"==============================================================================

" 设置 vimrc 修改保存后立刻生效，不用在重新打开
" 建议配置完成后将这个关闭，否则配置多了之后会很卡
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
set relativenumber                  " 显示相对行号
set number                          " 显示行号，当前行不显示0而显示当前行号
set smarttab                        " 根据文件中其它地方缩进空格数决定空格数多少
set cindent                         " C语言缩进风格
set tabstop=4                       " 设置tab为4个空格
set shiftwidth=4                    " 缩进空格数为4
set ignorecase                      " 搜索忽略大小写
set expandtab                       " 使用空格代替tab
set scrolloff=5                     " 设置屏幕下方空余5行
let g:airline_powerline_fonts = 1   " 设置下方箭头三角等字体支持

" 关闭其它buffer
nnoremap <leader>ca :w <bar> %bd <bar> e# <bar> bd# <CR>
" 自动补全大括号并换行缩进
" imap { {}<ESC>i<CR><ESC>V<O          




"==============================================================================
" 插件配置 
"==============================================================================

" 插件开始的位置
call plug#begin('~/.vim/plugged')

" golang 支持
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" 代码结构
Plug 'majutsushi/tagbar'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" typescript 支持
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax

" 目录
Plug 'scrooloose/nerdtree'
Plug 'tsony-tsonev/nerdtree-git-plugin'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
"Plug 'ctrlpvim/ctrlp.vim' " fuzzy find files
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' },
Plug 'junegunn/fzf.vim',
"Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'scrooloose/nerdcommenter'
Plug 'rking/ag.vim'
Plug 'christoomey/vim-tmux-navigator'

" 主题相关
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'mhinz/vim-startify'

Plug 'skanehira/preview-markdown.vim'
Plug 'vim-scripts/TaskList.vim'           "快速跳转到TODO列表
Plug 'Raimondi/delimitMate'               "自动括号补全

Plug 'posva/vim-vue'                      "vue

Plug 'pangloss/vim-javascript'            "javascript
Plug 'mxw/vim-jsx'                        "jsx

" Initialize plugin system
call plug#end()




"==============================================================================
" 快捷键配置 
"==============================================================================
" 设定leader键
let mapleader = "\<space>"
" jk连按替代esc
inoremap jk <ESC>
" 搜索整个项目todo
nnoremap <leader>td :Ag todo<CR>
" 打开vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR>
" 重新加载vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>
" 下一个buffer
nnoremap <leader>bn :bn<CR>
" 上一个buffer
nnoremap <leader>bp :bp<CR>
" 关闭当前buffer
nnoremap <leader>bd :bd<CR>
" tab下一个buffer
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
" shift tab 上一个buffer
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>
" 显示按键菜单
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>



"==============================================================================
" NERDTree 配置 
"==============================================================================
" 激活/隐藏文件树插件 space + tt
nnoremap <leader>tt :NERDTreeToggle<CR>
" 自动打开文件树插件
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
"let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         

let g:NERDTreeIgnore = ['^node_modules$']
" 用文件树插件异步打开文件
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction




"==============================================================================
" TagBar 配置 
"==============================================================================
" 显示隐藏大纲
nnoremap <leader>tb :TagbarToggle<CR>


let g:tagbar_width = 30
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }




"==============================================================================
" 主题配置 
"==============================================================================
" colorscheme gruvbox
colorscheme nord




"==============================================================================
" COC配置 
"==============================================================================
" coc 插件
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-go', 
  \ 'coc-python', 
  \ 'coc-tabnine', 
  \ ]

" 一下大部分都是默认配置,英语不好看不懂...
" if hidden is not set, TextEdit might fail.
set hidden 
set updatetime=300

" 不显示 |ins-completion-menu| 信息
set shortmess+=c

" 一直显示 signcolumns
set signcolumn=yes

" 使用tab补全
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <c-space> 激活补全
inoremap <silent><expr> <c-space> coc#refresh()

" 使用 <cr> 确认补全
" Coc只在确认时执行代码片段和附加编辑
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" 使用 `[g` 和 `]g` 定位诊断
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" 定位到源码
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" 使用 K 在预览窗口展示文档
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 突出显示光标下的符号
autocmd CursorHold * silent call CocActionAsync('highlight')

" 映射重命名当前词键位
nmap <F2> <Plug>(coc-rename)

" 格式化选择的代码
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " 设置格式化文件类型
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " 更新 signature 帮助信息在跳转占位符
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" 映射 codeAction 选择区域
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" 映射 codeAction 对于当前行
nmap <leader>ac  <Plug>(coc-codeaction)
" 映射修复当前行
nmap <leader>qf  <Plug>(coc-fix-current)

" 为函数文本对象创建映射，需要languageserver的文档符号功能
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" 使用 <C-d> 选择迭代?, 需要服务支持, 比如: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" 使用 `:Format` 来格式化当前 buffer
command! -nargs=0 Format :call CocAction('format')

" 使用 `:Fold` 来折叠当前 buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" 使用 `:OR` 来组织当前缓冲区的导入
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" 添加状态行支持，用于与其他插件集成，请查看`:h coc status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" 使用 CocList
" 展示所有检查
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" 管理插件
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" 展示命令
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" 查找内容
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" 查找工作空间内容
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" 对下一个对象执行默认动作
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" 对上一个对象执行默认动作
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" 对最后coc list 摘要
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>




"==============================================================================
" fzf 配置 
"==============================================================================
" ctrl p 搜索所有文件
nmap <C-p> :Files<CR>
" ctrl e 搜索所有buffer
nmap <C-e> :Buffers<CR>
let g:fzf_action = { 'ctrl-e': 'edit' }
" 让输入上方，搜索列表在下方
let $FZF_DEFAULT_OPTS = '--layout=reverse'
" 打开 fzf 的方式选择 floating window
let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }
function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction




"==============================================================================
" airline 配置 
"==============================================================================
" 状态栏设置
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1




"==============================================================================
" preview-markdown 配置 
"==============================================================================
" 设置Markdown预览
let g:preview_markdown_vertical = 1
let g:preview_markdown_parser = 'glow'
" 预览markdown
nnoremap <leader>pw :PreviewMarkdown<CR>




"==============================================================================
" Go语言配置 
"==============================================================================
let g:go_fmt_command = "goimports"
let g:go_metalinter_autosave = 1
" let g:go_metalinter_deadline = '20s'
nnoremap <leader>gl :GoMetaLinter<CR>
