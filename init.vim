    " Hotkeys
let mapleader=" "
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>
nnoremap <silent> <Tab> :NERDTreeToggle<CR>

map <C-_> <plug>NERDCommenterInvert
map <Leader>g :GitGutterToggle<CR>

    " Plugins
"
" added vim-plug (plug.vim) into the 'autoload' dir with
" curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim

set nocompatible	" be iMproved, required
filetype off		" required

call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'				            " color scheme
    Plug 'tpope/vim-fugitive'			            " nvim git integration
    Plug 'preservim/nerdtree'			            " side panel file explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'		        " NERDTree git integration
    Plug 'PhilRunninger/nerdtree-visual-selection' 	" NERDTree to open,delete,move,copy multiple files at once
    Plug 'kien/ctrlp.vim'				            " fuzzy search on files through vim. ctrl+p to activate
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Highlighting and code completion (do :CocInstall <language>)
    Plug 'jiangmiao/auto-pairs'                     " insert brackets, quotation marks
    Plug 'tpope/vim-surround'                       " edit brackets, quotation marks; both ends at once!
    Plug 'prettier/vim-prettier'                    " code formatter for html/css/js etc
    Plug 'mattn/emmet-vim'                          " HTML and CSS code completion
    Plug 'preservim/nerdcommenter'                  " commenting out lines
    Plug 'airblade/vim-gitgutter'                   " uses git to show edited lines; see hotkeys
    Plug 'christoomey/vim-tmux-navigator'           " vim pane/split navigator
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
    \} " default Modified: '✹'

let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-clangd',
    \]


    " what to do after startup,
function! StartUp()
	" If no file is opened, open NERDTree only
    if 0 == argc()
		NERDTree
		wincmd w
		q
	end

    GitGutterDisable
endfunction

autocmd VimEnter * call StartUp()


    " stuff
filetype plugin indent on
syntax on
set colorcolumn=81
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
set updatetime=100 " default: 4000 (4 secdonds)

let g:gitgutter_max_signs = -1  " default: 500 to avoid slowing the UI

" NERDCommenter
filetype plugin on
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

runtime coc.vim     " call the coc.vim file

