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
			    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" 显示行号
set nu
" 设置tab键为四个空格, 换行保持缩进
set ts=4
set expandtab
set autoindent


call plug#begin('~/.config/nvim/plugged')
    Plug 'vim-airline/vim-airline'
    Plug 'preservim/nerdtree'
        
call plug#end()

" airline配置
let g:airline_section_b = '%{strftime("%Y-%m-%d %H:%M:%S")}'
" Top Line开启
let g:airline#extensions#tabline#enabled = 1


" NerTree配置
nnoremap <leader>n      :NERDTreeFocus<CR>
nnoremap <C-n>          :NERDTree<CR>
nnoremap <C-t>          :NERDTreeToggle<CR>
nnoremap <C-f>          :NERDTreeFind<CR>
