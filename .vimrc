set number relativenumber
set nocompatible 
set showcmd 
set tabstop=4 
set shiftwidth=4
set ignorecase
set hlsearch
set incsearch
set scrolloff=999
filetype plugin on
syntax on

autocmd Filetype tex setl updatetime=100

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
call plug#end()

" :Man to open man pages
runtime ftplugin/man.vim

" setup gruvbox
colorscheme gruvbox
set background=dark
let g:gruvbox_contrast_dark = 'hard'

" setup airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" set live preview viewer
let g:livepreview_previewer = 'zathura'

" vimtex autocompletion with ycm
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" setup nerdtree
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" color fix
let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal']}

" assign mapleader
let mapleader=" "
" custom keybinds
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>q :quit<CR>
nmap <leader>g :split<CR>
nmap <leader>v :vsplit<CR>
nmap <leader><Up> :res +5<CR>
nmap <leader><Down> :res -5<CR>
nmap <leader><Right> :vertical res +5<CR>
nmap <leader><Left> :vertical res -5<CR>

" map fzf
nmap <leader>p :Files<CR>
nmap <leader>f :BLines<CR>
nmap <leader>F :Lines<CR>
nmap <leader>b :Buffers<CR>
nmap <Leader>H :Helptags!<CR>
nmap <Leader>C :Commands<CR>
nmap <Leader>: :History:<CR>
nmap <Leader>/ :History/<CR>
nmap <Leader>M :Maps<CR>
nmap <Leader>s :Filetypes<CR>

" vimtex mappings
nmap I :LLPStartPreview<CR>
