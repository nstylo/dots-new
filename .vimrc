set nocompatible 
set number relativenumber
set showcmd 
set expandtab
set tabstop=4 
set shiftwidth=4
set ignorecase
set smarttab
set smartindent
set autoindent
set smartcase
set hlsearch
set incsearch
set scrolloff=999
filetype plugin on
syntax on

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'ryanoasis/vim-devicons'
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

" set gitgutter update time to 100ms
set updatetime=100

" vimtex autocompletion with ycm
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" color fix
let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal']}

" assign mapleader
let mapleader=" "

" easy buffer movement 
nmap <silent> <C-h> :wincmd h<CR>
nmap <silent> <C-j> :wincmd j<CR>
nmap <silent> <C-l> :wincmd l<CR>
nmap <silent> <C-k> :wincmd k<CR>
nmap <leader>l :bn<CR>
nmap <leader>h :bp<CR>
nmap <leader>q :quit<CR>
nmap <leader>g :split<CR>
nmap <leader>v :vsplit<CR>
nmap <leader><Up> :res +5<CR>
nmap <leader><Down> :res -5<CR>
nmap <leader><Right> :vertical res +5<CR>
nmap <leader><Left> :vertical res -5<CR>

" move line up or down
nnoremap <Leader>j ddp
nnoremap <Leader>k ddkP

" substitute makro 
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" auto expand braces
inoremap ( ()<Esc>:call BC_AddChar(")")<CR>i
inoremap { {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap [ []<Esc>:call BC_AddChar("]")<CR>i
" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a

function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction

function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction

" Double esc to disable hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

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
autocmd FileType tex nmap I :LLPStartPreview<CR>
