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
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Highlighting and code completion (do :CocInstall <language>)
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


"	what to do after startup,
function! StartUp()
	" If no file is opened, open NERDTree only
    if 0 == argc()
		NERDTree
		wincmd w
		q
	end
endfunction

autocmd VimEnter * call StartUp()


"	stuff
filetype plugin indent on " required
syntax on
set colorcolumn=80
set background=dark
highlight ColorColumn ctermbg=0 guibg=lightgrey
set number relativenumber
set nowrap
set smartcase
set hlsearch
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
