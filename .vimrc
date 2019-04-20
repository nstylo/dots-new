set nocompatible 
set number relativenumber
set showcmd 
set tabstop=4 
set expandtab
set shiftwidth=4
set ignorecase
set smarttab
set smartindent
set autoindent
set smartcase
set hlsearch
set incsearch
set scrolloff=999
let g:gruvbox_italic=1
filetype plugin on
syntax on
set t_Co=256

" enable scroll
set mouse=a

call plug#begin('~/.vim/plugged')
" aesthetics
Plug 'morhetz/gruvbox'
Plug 'chrisbra/Colorizer'
Plug 'markonm/traces.vim'
" airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
" fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" latex
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" linting and autocomplete
Plug 'w0rp/ale'
Plug 'Valloric/YouCompleteMe'
" git
Plug 'airblade/vim-gitgutter'
" formatting
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
" nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" vim-repeat for vim-surround
Plug 'tpope/vim-repeat'
call plug#end()

" :Man to open man pages
runtime ftplugin/man.vim

" setup gruvbox
let g:gruvbox_contrast_dark = 'medium'
let g:gruvbox_termcolors = 256
set background=dark
colorscheme gruvbox

" setup airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" vimtex options
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
let g:vimtex_compiler_progname = 'nvr'

" set gitgutter update time to 100ms
set updatetime=100

" buffers jump to existing window
let g:fzf_buffers_jump = 1

" vimtex autocompletion with ycm
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
" let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1

" assign mapleader
let mapleader=" "

" copy to clipboard
vmap <Leader>y "+y

" paste from yank register
nnoremap p "0p
vnoremap p "0p
" paste from default register
nnoremap P ""p
vnoremap P ""p

" easy buffer movement 
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-l> :wincmd l<CR>
map <silent> <C-k> :wincmd k<CR>
map <leader>q :quit<CR>
map <leader>g :new<CR>
map <leader>v :vnew<CR>
map <M-l> :bn<CR>
map <M-h> :bp<CR>
map <M-d> :bd<CR>
map <M-n> :enew<CR>
map <M-Up> :res +5<CR>
map <M-Down> :res -5<CR>
map <M-Right> :vertical res +5<CR>
map <M-Left> :vertical res -5<CR>

" move line up or down
nnoremap <Leader>j ddp
nnoremap <Leader>k ddkP

" indent lines
map <leader>l >>
map <leader>h <<

" substitute makro 
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" double esc to disable hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" map fzf
map <M-p> :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND, 0)<CR>
map <M-P> :call Fzf_files_with_dev_icons($FZF_DEFAULT_COMMAND, 1)<CR>
map <leader>f :BLines<CR>
map <leader>F :Lines<CR>
map <leader>b :Buffers<CR>
map <Leader>H :Helptags!<CR>
map <Leader>: :History:<CR>
map <Leader>/ :History/<CR>

" vimtex mappings
autocmd FileType tex map <C-i> :LLPStartPreview<CR>

" nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" auto expand brackets
inoremap (<CR> ()<Esc>:call BC_AddChar(")")<CR>i
inoremap {<CR> {}<Esc>:call BC_AddChar("}")<CR>i
inoremap "<CR> ""<Esc>:call BC_AddChar("\"}")<CR>i
inoremap '<CR> ''<Esc>:call BC_AddChar("\'}")<CR>i
" inoremap {<CR> {<CR>}<Esc>:call BC_AddChar("}")<CR><Esc>kA<CR>
inoremap [<CR> []<Esc>:call BC_AddChar("]")<CR>i
" jump out of parenthesis
inoremap <C-j> <Esc>:call search(BC_GetChar(), "W")<CR>a
" storing brackets
function! BC_AddChar(schar)
 if exists("b:robstack")
 let b:robstack = b:robstack . a:schar
 else
 let b:robstack = a:schar
 endif
endfunction
" retrieving brackets
function! BC_GetChar()
 let l:char = b:robstack[strlen(b:robstack)-1]
 let b:robstack = strpart(b:robstack, 0, strlen(b:robstack)-1)
 return l:char
endfunction

" Files + devicons -> https://coreyja.com/blog/2018/11/17/vim-fzf-with-devicons.html
function! Fzf_files_with_dev_icons(command, root)
  let l:fzf_files_options = '--preview "bat --color always --style numbers {2..} | head -'.&lines.'"'
   function! s:edit_devicon_prepended_file(item)
    let l:file_path = a:item[4:-1]
    execute 'silent e' l:file_path
  endfunction
  if a:root == 0
   call fzf#run({
        \ 'source': a:command.' | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'dir': "~"})
   else
    call fzf#run({
        \ 'source': a:command.' | devicon-lookup',
        \ 'sink':   function('s:edit_devicon_prepended_file'),
        \ 'options': '-m ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'dir': "/"})
    endif
endfunction
