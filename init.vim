"  __  ____   __  _   ___     _____ __  __ ____   ____
" |  \/  \ \ / / | \ | \ \   / /_ _|  \/  |  _ \ / ___|
" | |\/| |\ V /  |  \| |\ \ / / | || |\/| | |_) | |
" | |  | | | |   | |\  | \ V /  | || |  | |  _ <| |___
" |_|  |_| |_|   |_| \_|  \_/  |___|_|  |_|_| \_\\____|
" 
" Author: zhoutao
" Datetime: 2021.1.22
" Description: My Neovim Configuration
"

" 如果进入nvim，则每次检查vim-plug是否安装，没有则自动安装
if empty(glob('~/.config/nvim/autoload/plug.vim'))
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs 
			    \ https://gitee.com/chenxinliang123/vim-plug/raw/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 显示行号
set nu
" 设置tab键为四个空格, 换行保持缩进
set ts=4
set expandtab
set autoindent
" 设置语法检测
syntax on
" 高亮匹配括号
set showmatch

" 插件列表
call plug#begin('~/.config/nvim/plugged')
    Plug 'crusoexia/vim-monokai'
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
    Plug 'Yggdroot/indentLine'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" ============================= monokai ================================
" 主题文件
colorscheme monokai


" ============================= airline =================================
" airline配置
let g:airline_section_b = '%{strftime("%Y-%m-%d %H:%M:%S")}'
" Top Line开启
let g:airline#extensions#tabline#enabled = 1


let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 0
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme = 'desertink'  " 主题
let g:airline#extensions#keymap#enabled = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1
let g:airline#extensions#tabline#buffer_idx_format = {
       \ '0': '0 ',
       \ '1': '1 ',
       \ '2': '2 ',
       \ '3': '3 ',
       \ '4': '4 ',
       \ '5': '5 ',
       \ '6': '6 ',
       \ '7': '7 ',
       \ '8': '8 ',
       \ '9': '9 '
       \}
" 设置切换tab的快捷键 <\> + <i> 切换到第i个 tab
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap <leader>- <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap <leader>+ <Plug>AirlineSelectNextTab
" 设置切换tab的快捷键 <\> + <q> 退出当前的 tab
nmap <leader>q :bp<cr>:bd #<cr>
" 修改了一些个人不喜欢的字符
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.whitespace = '|'



" ============================= nerdtree ================================
" NerTree配置
" nnoremap <leader>f      :NERDTreeFocus<CR>
" nnoremap <leader>t      :NERDTree<CR>
" nnoremap <leader>t      :NERDTreeToggle<CR>
" nnoremap <C-f>        :NERDTreeFind<CR>
" 开启/关闭nerdtree快捷键
" nnoremap <F3> :NERDTreeToggle<CR>

" 自动开启Nerdtree
autocmd vimenter * NERDTree  

" 设定 NERDTree 视窗大小
let g:NERDTreeWinSize             = 25 

" 开启Nerdtree时自动显示Bookmarks
let NERDTreeShowBookmarks         = 1  

" 打开vim时如果没有文件自动打开NERDTree
" autocmd vimenter * if !argc()|NERDTree|endif

" 当NERDTree为剩下的唯一窗口时自动关闭
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" 设置树的显示图标
let g:NERDTreeDirArrowExpandable  = '+'
let g:NERDTreeDirArrowCollapsible = '-'
" 过滤所有.pyc文件不显示
let NERDTreeIgnore                = ['\.pyc$'] 
" 是否显示行号
let g:NERDTreeShowLineNumbers     = 0 
" 不显示隐藏文件
let g:NERDTreeHidden              = 0     
" Making it prettier
let NERDTreeMinimalUI             = 1
let NERDTreeDirArrows             = 1



" ============================ indentline ===============================
" 指定对齐线的尺寸
let g:indent_guides_guide_size      = 1 
" 从第二层开始可视化显示缩进
let g:indent_guides_start_level     = 2  


" ============================ coc ======================================

let g:coc_global_extensions = [
   \ 'coc-snippets',
   \ 'coc-pyright',
   \ 'coc-highlight',
   \ 'coc-git']

