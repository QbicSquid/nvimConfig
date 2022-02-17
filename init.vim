"________________________________________________________________________Hotkeys

let mapleader=" "
map <C-a> 1GV0G
map <C-_> :CommentToggle<CR>
map <leader>g :GitGutterToggle<CR>
nmap <leader>rn <plug>lsp-rename
nnoremap <silent> <C-n> :NERDTreeToggle<CR>
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprev<CR>
tnoremap <esc> <C-\><C-n>
nnoremap <C-p> :Telescope<CR>
nnoremap <leader>cg :call gruvbox#invert_signs_toggle()<CR>:<CR>

"_see documentation and completion. C-f and C-b to scroll
inoremap <silent><expr> <c-space> coc#refresh()
nnoremap <silent> <F1> :call CocAction('doHover')<CR>
inoremap <silent> <F1> <C-r>=CocActionAsync('showSignatureHelp')<CR>

"_switching tabs
tnoremap <C-PageUp> <C-\><C-n>:tabprevious<CR>
tnoremap <C-PageDown> <C-\><C-n>:tabnext<CR>

"_moving blocks of code up or down
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

"_(compile and) run
let runcmd = '!echo "command not set"'
nnoremap <leader>qr :execute runcmd<CR>

"_vimspector debugging
nnoremap <leader>vr :VimspectorReset<CR>

"_Dashboard
nmap <Leader>ss :<C-u>SessionSave<CR>
nmap <Leader>sl :<C-u>SessionLoad<CR>
nnoremap <silent> <Leader>fh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>ff :DashboardFindFile<CR>
nnoremap <silent> <Leader>tc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>fa :DashboardFindWord<CR>
nnoremap <silent> <Leader>fb :DashboardJumpMark<CR>
nnoremap <silent> <Leader>cn :DashboardNewFile<CR>


"________________________________________________________________________Plugins

" added vim-plug (plug.vim) into the 'autoload' dir with
" curl https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim -o plug.vim

set nocompatible	" be iMproved, required
filetype off		" required

call plug#begin('~/.config/nvim/plugged')
    Plug 'morhetz/gruvbox'				            " color scheme
    Plug 'arcticicestudio/nord-vim'                 " color scheme
    Plug 'sainnhe/edge'                             " color scheme
    Plug 'sainnhe/sonokai'                          " color scheme
    Plug 'sainnhe/gruvbox-material'                 " color scheme

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
    "Plug 'preservim/nerdcommenter'                  " commenting out lines
    Plug 'airblade/vim-gitgutter'                   " uses git to show edited lines; see hotkeys
    Plug 'christoomey/vim-tmux-navigator'           " Intergrate tmux navigation with vim pane navigation
    "Plug 'octol/vim-cpp-enhanced-highlight'         " better sytax highlighitng for c/c++
    "Plug 'junegunn/fzf'
    "Plug 'junegunn/fzf.vim'                        " fuzzy search within files :Rg [keyword] to use
    "Plug 'gcmt/taboo.vim'                          " tab labeler. commands start with :Taboo
    Plug 'puremourning/vimspector'                  " visual debugger (multi language)
    Plug 'nvim-lualine/lualine.nvim'                " prettier status line
    Plug 'kdheepak/tabline.nvim'                    " prettier tab line
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'            " fuzzy finder with many features
    Plug 'psliwka/vim-smoothie'                     " smooth scrolling
    Plug 'glepnir/dashboard-nvim'                   " Startup page
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} " Language parser (better syntax highlighting)
    Plug 'terrortylor/nvim-comment'                 " commenter plugin
call plug#end()

"_Theme configs
"if has('termguicolors')
  "set termguicolors
"endif
set background=dark

let g:gruvbox_material_background = 'medium'
" Available values:  'hard', 'medium', 'soft'
let g:gruvbox_material_palette = 'material'
" Available values:  'material', 'mix', 'original'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_disable_italic_comment = 1

let g:edge_style = 'aura'
" Available styles:  'default', 'aura', 'neon'
let g:edge_enable_italic = 1
let g:edge_disable_italic_comment = 1

let g:sonokai_style = 'andromeda'
" Available styles:  'default', 'atlantis', 'andromeda', 'shusia', 'maia', 'espresso'
let g:sonokai_enable_italic = 1
let g:sonokai_disable_italic_comment = 1
let g:gruvbox_invert_selection = 0

let g:gruvbox_bold = 0
let g:gruvbox_termcolors = 256
let g:gruvbox_underline = 0
let g:gruvbox_invert_signs = 1
let g:gruvbox_vert_split = "blue"

colorscheme gruvbox

"_NerdTree
let g:NERDTreeGitStatusConcealBrackets = 1 " default: 0
let g:NERDTreeGitStatusAlignIfConceal = 0 " default: 1
let NERDTreeQuitOnOpen = 3 " default: 0
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

"_Gitgutter
let g:gitgutter_max_signs = -1  " default: 500 to avoid slowing the UI

"_NERDCommenter
let g:NERDCreateDefaultMappings = 0
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1

"_Vimspector
let g:vimspector_enable_mappings = 'HUMAN'

"_Dashboard
let g:dashboard_default_executive = 'telescope'
let g:dashboard_custom_header = [
\ ' ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗',
\ ' ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║',
\ ' ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║',
\ ' ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║',
\ ' ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║',
\ ' ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝',
\]


"______________________________________________________________________functions

function! StartUp()
    " If no file is opened, open NERDTree only
    "if 0 == argc()
        "NERDTree
        "wincmd w
        "q
    "end

    GitGutterDisable
    mod " redraw screen, Fixes the tabline at startup
endfunction


"________________________________________________________________________autocmd
autocmd VimEnter * call StartUp()


"__________________________________________________________________________stuff

filetype plugin indent on
syntax on
set colorcolumn=81
"highlight ColorColumn ctermbg=grey guibg=grey
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
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set foldlevel=99 " stops folds with depth less than 99 from folding
set foldcolumn=0 " increase to see fold column
" type :%foldc to close the all the top level folds only
set mouse=a
" highlighting the current line number (next 3 lines)
highlight CursorLine cterm=NONE ctermbg=NONE ctermfg=NONE guibg=NONE guifg=NONE
highlight CursorLineNR cterm=NONE ctermbg=NONE ctermfg=yellow guibg=NONE guifg=yellow
set cursorline
set noshowmode

runtime coc.vim     " call the coc.vim file
lua require('lualine').setup()
lua require('mini.indentscope').setup()
lua require('tabline').setup()
lua require('configs.treesitter-config')
lua require('configs.nvim_comment-config')
