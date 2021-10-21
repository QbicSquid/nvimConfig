"	Hotkeys
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>
map <silent> <Tab> :NERDTreeToggle<CR>


"	Plugins
"
" added vim-plug (plug.vim) into the 'autoload' dir with
" curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim

set nocompatible	" be iMproved, required
filetype off		" required

call plug#begin('~/.config/nvim/plugged')
Plug 'morhetz/gruvbox'				" color scheme
Plug 'tpope/vim-fugitive'			" nvim git integration
Plug 'preservim/nerdtree'			" side panel file explorer
Plug 'Xuyuanp/nerdtree-git-plugin'		" NERDTree git integration
Plug 'PhilRunninger/nerdtree-visual-selection' 	" NERDTree to open,delete,move,copy multiple files at once
Plug 'kien/ctrlp.vim'				" fuzzy search on files through vim. ctrl+p to activate
call plug#end()

colorscheme gruvbox

let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:NERDTreeGitStatusAlignIfConceal = 0 " default: 1
let g:NERDTreeGitStatusIndicatorMapCustom = {
                \ 'Modified'  :'!',
                \ 'Staged'    :'✚',
                \ 'Untracked' :'✭',
                \ 'Renamed'   :'➜',
                \ 'Unmerged'  :'═',
                \ 'Deleted'   :'✖',
                \ 'Dirty'     :'✗',
                \ 'Ignored'   :'☒',
                \ 'Clean'     :'✔︎',
                \ 'Unknown'   :'?',
                \ } " default Modified: '✹'


