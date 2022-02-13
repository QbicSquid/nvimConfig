"fodicn["two"])________________________________________________________________________Hotkeys

let mapleader=" "
map <C-a> 1GV0G
map <C-_> <plug>NERDCommenterInvert
map <leader>g :GitGutterToggle<CR>
nmap <leader>rn <plug>lsp-rename
nmap <esc><esc> :noh<return>
nnoremap <silent> <Tab> :NERDTreeToggle<CR>
tnoremap <esc> <C-\><C-n>
nnoremap <C-p> :Telescope<CR>

" see documentation and completion. C-f and C-b to scroll
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <F1> :call CocAction('doHover')<CR>
inoremap <silent> <F1> <C-r>=CocActionAsync('showSignatureHelp')<CR>

" switching tabs
tnoremap <C-PageUp> <C-\><C-n>:tabprevious<CR>
tnoremap <C-PageDown> <C-\><C-n>:tabnext<CR>

" moving blocks of code up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

" (compile and) run
let runcmd = '!echo "command not set"'
nnoremap <leader>qr :execute runcmd<CR>

" vimspector debugging
nnoremap <leader>vr :VimspectorReset<CR>

"________________________________________________________________________Plugins

" added vim-plug (plug.vim) into the 'autoload' dir with
" curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim

set nocompatible	" be iMproved, required
filetype off		" required

call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'				            " color scheme
    Plug 'arcticicestudio/nord-vim'                 " color scheme

    Plug 'tpope/vim-fugitive'			            " nvim git integration
    Plug 'preservim/nerdtree'			            " side panel file explorer
    Plug 'Xuyuanp/nerdtree-git-plugin'		        " NERDTree git integration
    Plug 'PhilRunninger/nerdtree-visual-selection' 	" NERDTree to open,delete,move,copy multiple files at once
    "Plug 'kien/ctrlp.vim'				            " fuzzy search on files through vim. ctrl+p to activate
    Plug 'neoclide/coc.nvim', {'branch': 'release'} " Highlighting and code completion (do :CocInstall <language>)
    Plug 'jiangmiao/auto-pairs'                     " insert brackets, quotation marks
    Plug 'tpope/vim-surround'                       " edit brackets, quotation marks; both ends at once!
    Plug 'prettier/vim-prettier'                    " code formatter for html/css/js etc
    Plug 'mattn/emmet-vim'                          " HTML and CSS code completion
    Plug 'preservim/nerdcommenter'                  " commenting out lines
    Plug 'airblade/vim-gitgutter'                   " uses git to show edited lines; see hotkeys
    Plug 'christoomey/vim-tmux-navigator'           " Intergrate tmux navigation with vim pane navigation
    Plug 'octol/vim-cpp-enhanced-highlight'         " better sytax highlighitng for c/c++
    "Plug 'junegunn/fzf'
    "Plug 'junegunn/fzf.vim'                         " fuzzy search within files :Rg [keyword] to use
    "Plug 'gcmt/taboo.vim'                           " tab labeler. commands start with :Taboo
    Plug 'puremourning/vimspector'                  " visual debugger (multi language)
    Plug 'nvim-lualine/lualine.nvim'                " prettier status line
    Plug 'kdheepak/tabline.nvim'                    " prettier tab line
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'            " fuzzy finder with many features
    Plug 'psliwka/vim-smoothie'                     " smooth scrolling
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

let g:gitgutter_max_signs = -1  " default: 500 to avoid slowing the UI

" NERDCommenter
filetype plugin on
let g:NERDCreateDefaultMappings = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

" Vimspector
let g:vimspector_enable_mappings = 'HUMAN'


"______________________________________________________________________functions

function! StartUp()
    " If no file is opened, open NERDTree only
    if 0 == argc()
        NERDTree
    	wincmd w
        q
    end

    lua require('lualine').setup()
    GitGutterDisable
endfunction

function! TablineStartUp()
    lua require('tabline').setup()
    " changed the function M._new_tab_data(tabnr, data) function
    " to set show_all_buffers to false
    " in tabline.lua line 115
endfunction


"________________________________________________________________________autocmd
autocmd VimEnter * call StartUp()
autocmd BufReadPre * ++once call TablineStartUp()


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
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro " stop commenting new lines
set autochdir " always set the current working dir to the dir of the editing file
set foldmethod=indent
set foldlevel=99 " stops folds with depth less than 99 from folding
set foldcolumn=0 " increase to see fold column
" type :%foldc to close the all the top level folds only
set mouse=a
" highlighting the current line number (next 3 lines)
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNR cterm=NONE ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yello
set cursorline
set noshowmode

runtime coc.vim     " call the coc.vim file
lua require('mini.indentscope').setup()
