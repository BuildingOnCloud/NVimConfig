"set the map leader
let mapleader = " "

set encoding=utf-8
set mouse=a "this enable the mouse compatibility
set clipboard=unnamedplus "to set the main clipboard to vim. It needs xclip o xcel. Other value is unnamed
set noerrorbells "this disable the error bells because is very annoying

"to set the tabs
set sw=4 "this set the tabs are 4 spaces
set expandtab
set smartindent "this saves work to you to indent your code

"Shoe line numbers. When you enable the number line it have space at the left.
"I want the less space as possible.
set number
set rnu
set numberwidth=1 

"I don't like the wrapped lines :v
set nowrap

"I don't want the backup files
set noswapfile
set nobackup
set undodir=~/.config/nvim/.undodir/
set undofile

"set incremental search and ignore capital words
set incsearch
set ignorecase

"set the cursorline and a column
set cursorline
set colorcolumn=120
highlight ColoColumn ctermbg=0 guibg=lightgrey

"this sets the directions of the splits
set splitbelow
set splitright

call plug#begin('~/.vim/plugged')

"themes
Plug 'morhetz/gruvbox'
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasr/molokai'
Plug 'kjwon15/vim-transparent'
Plug 'pineapplegiant/spaceduck', { 'branch': 'main' }
Plug 'AlessandroYorba/Despacio'
Plug 'sonph/onehalf', { 'rtp': 'vim' }
Plug 'mhartington/oceanic-next'

"visual
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'lilydjwg/colorizer'
Plug 'leafgarland/typescript-vim'
Plug 'uiiaoo/java-syntax.vim'

"Git integration
Plug 'mhinz/vim-signify'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'junegunn/gv.vim'

"Functionality
Plug 'preservim/tagbar'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'KabbAmine/vCoolor.vim'
Plug 'easymotion/vim-easymotion'
Plug 'rust-lang/rust.vim'
Plug 'cespare/vim-toml'
Plug 'vim-python/python-syntax'
Plug 'mbbill/undotree'
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
Plug 'puremourning/vimspector'

"code modification
Plug 'scrooloose/nerdcommenter'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'honza/vim-snippets'
Plug 'sirver/ultisnips'
Plug 'jiangmiao/auto-pairs'
Plug 'mattn/emmet-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

let g:airline#extensions#tabline#enabled = 1  " show open buffers (like tabs)
let g:airline#extensions#tabline#fnamemod = ':t'  " Show only filename
let g:airline_powerline_fonts = 1 " Change separetors to be triangles
let g:airline_theme='tomorrow'

"configuring clang
let g:clang_format#auto_format = 1

"easymotion
nmap <leader>ss <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

"vim emmet configuration
let g:user_emmet_leader_key='<C-Z>'


"Configuration of FZF
let g:fzf_preview_window = 'right:40%'
nnoremap <c-p> :Files<CR>
nnoremap <c-g> :GitFiles<CR>
" use current git repo/file director with ctrl p
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_use_caching = 0

"indentline
let g:indentLine_char_list = ['│', '┊']

"NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"Keymap of the file browser
let g:NERDTreeChDirMode = 2 "Change the current directory to the current node father
map <leader><tab> :NERDTreeToggle<CR>

let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

let g:prettier#autoformat = 0

"Rust configuration
let g:rustfmt_autosave = 1

"signify
" Change these if you want
let g:signify_sign_add               = '+'
let g:signify_sign_delete            = '_'
let g:signify_sign_delete_first_line = '‾'
let g:signify_sign_change            = '~'

" I find the numbers disctracting
let g:signify_sign_show_count = 0
let g:signify_sign_show_text = 1


" Jump though hunks
nmap <leader>gj <plug>(signify-next-hunk)
nmap <leader>gk <plug>(signify-prev-hunk)
nmap <leader>gJ 9999<leader>gJ
nmap <leader>gK 9999<leader>gk

" If you like colors instead
highlight SignifySignAdd                  ctermbg=green                guibg=#00ff00
highlight SignifySignDelete ctermfg=black ctermbg=red    guifg=#ffffff guibg=#ff0000
highlight SignifySignChange ctermfg=black ctermbg=yellow guifg=#000000 guibg=#ffff00

nmap <BS> :TagbarToggle<CR>


" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

nnoremap <leader>u :UndotreeToggle<CR>

" Vim devicons
if exists("g:loaded_webdevicons")
  call webdevicons#refresh()
endif

"configuring the highlight devicons
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1

nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>dx :call vimspector#Launch()<CR>
nnoremap <S-k> :call vimspector#StepOut()<CR>
nnoremap <S-l> :call vimspector#StepInto()<CR>
nnoremap <S-j> :call vimspector#StepOver()<CR>
nnoremap <leader>d_ call vimspector#Restart()<CR>
nnoremap <leader>dn call vimspector#Continue()<CR>
nnoremap <leader>drc call vimspector#RunToCursor()<CR>
nnoremap <leader>dh call vimspector#ToggleBreakpoint()<CR>
nnoremap <leader>de call vimspector#ToggleConditionalBreakpoint()<CR>
nnoremap <leader>dX call vimspector#ClearBreakpoints()<CR>

set background=dark
let ayucolor="dark"
let g:gruvbox_cotrast_dark="hard"
colorscheme gruvbox

"Use F5 to refresh your editor with the config file that you specify here
nmap <F5> :source ~/.config/nvim/init.vim<CR>
vmap <F5> :source ~/.config/nvim/init.vim<CR>

"disable the arrow keys to navigate. This is very useful when you want to
"adapt to 'hjkl'
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

"With the arrow keys you can resize your splits
nnoremap <silent> <right> :vertical resize +5<CR>
nnoremap <silent> <left> :vertical resize -5<CR>
nnoremap <silent> <up> :resize +5<CR>
nnoremap <silent> <down> :resize -5<CR>

"with leader w you save the file if it have a name set. The second command
"open your config file
nnoremap <leader>w :w<CR>

"you split a terminal with a size of 15
vnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>
nnoremap <c-t> :split<CR>:ter<CR>:resize 15<CR>

" Move to the next buffer
" Move to the prevoius buffer
nnoremap <tab> :bnext<CR>
nnoremap <s-tab> :bprevious<CR>

" Close the current buffer
"create a new tab
nnoremap <leader>q :bdelete<CR>
nnoremap <leader>t :tabe<CR>

"vertical split
"horizontal split
nnoremap <leader>vs :vsp<CR>
nnoremap <leader>sp :sp<CR>

" clear search results
nnoremap <silent> // :noh<CR>
