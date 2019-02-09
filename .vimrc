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

autocmd Filetype tex setl updatetime=500

call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'lervag/vimtex'
Plug 'xuhdev/vim-latex-live-preview'
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
call plug#end()

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

" setup nerdtree
" autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" fzf & ripgrep + colorfix 
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

set grepprg=rg\ --vimgrep

" color fix
let g:fzf_colors =
\ { 'fg': ['fg', 'Normal'],
\ 'bg': ['bg', 'Normal']}

" custom keybinds
nnoremap <C-h> :bp<CR>
nnoremap <C-l> :bn<CR>
nnoremap <C-w><C-g> :split<CR>
nnoremap <C-w><C-v> :vsplit<CR>

" map fzf
nnoremap <C-p> :FZF<CR>
" toggle nerd tree
nmap <C-n> :NERDTreeToggle<CR>

" vimtex mappings
nmap I :LLPStartPreview<CR>
