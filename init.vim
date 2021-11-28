"________________________________________________________________________Hotkeys

let mapleader=" "
map <C-a> 0GVG
map <C-_> <plug>NERDCommenterInvert
map <leader>g :GitGutterToggle<CR>
nmap <leader>rn <plug>lsp-rename
nnoremap <esc><esc> :noh<return>
nnoremap <silent> <Tab> :NERDTreeToggle<CR>
tnoremap <esc> <C-\><C-n>

" see documentation and completion. C-f and C-b to scroll
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <F1> :call CocAction('doHover')<CR>
inoremap <silent> <F1> <C-r>=CocActionAsync('showSignatureHelp')<CR>

" switching tabs
nnoremap <C-Up> :tabprevious<CR>
nnoremap <C-Down> :tabnext<CR>
tnoremap <C-Up> <C-\><C-n>:tabprevious<CR>
tnoremap <C-Down> <C-\><C-n>:tabnext<CR>

" moving blocks of code up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv


"________________________________________________________________________Plugins

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
    Plug 'octol/vim-cpp-enhanced-highlight'         " better sytax highlighitng for c/c++
    Plug 'junegunn/fzf'
    Plug 'junegunn/fzf.vim'                         " fuzzy search within files :Rg [keyword] to use
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

" language servers in coc
let g:coc_global_extensions = [
    \ 'coc-tsserver',
    \ 'coc-prettier',
    \ 'coc-json',
    \ 'coc-clangd',
    \]

let g:gitgutter_max_signs = -1  " default: 500 to avoid slowing the UI

" NERDCommenter
filetype plugin on
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1


"_______________________________________________________what to do after startup

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


"__________________________________________________________________________stuff

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
set updatetime=100 " default: 4000 (4 seconds)
" set clipboard+=unnamedplus " always yank/pull to system clipboard
set splitbelow " open new horizontal splits, below
set splitright " open new   vertical splits, to the right

runtime coc.vim     " call the coc.vim file

