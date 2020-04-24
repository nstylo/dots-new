set nocompatible

set number relativenumber
set showcmd
set tabstop=2
set shiftwidth=2
set expandtab
set ignorecase
set smarttab
set smartindent
set autoindent
set smartcase
set hlsearch
set incsearch
set scrolloff=10
set hidden
set autoread
" show trailing whitespaces
set listchars=tab:>·,trail:$,extends:>,precedes:<
 " Shows invisible characters
set list
filetype plugin on
syntax on

" enable scroll
set mouse=a

call plug#begin('~/.vim/plugged')
" aesthetics
Plug 'morhetz/gruvbox'
Plug 'markonm/traces.vim'
" status and bufferline
Plug 'mengelbrecht/lightline-bufferline'
Plug 'moll/vim-bbye'
Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
" fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" latex
Plug 'lervag/vimtex', { 'for': 'tex' }
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
" snippets
Plug 'honza/vim-snippets'
" git
Plug 'airblade/vim-gitgutter'
" formatting
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
" linting, syntax highlighting, lsp ...
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
call plug#end()

" :Man to open man pages
runtime ftplugin/man.vim

" setup color scheme
set termguicolors "sets to true colors
let &t_ut=''
colorscheme gruvbox

" configure lightline
let g:lightline = {
    \ 'colorscheme': 'gruvbox',
    \ 'component': {
    \ 'lineinfo': "%{line('.') . '/' . line('$')}",
    \ },
    \ 'component_function': {
    \ 'modified': 'LightlineModified',
    \ 'readonly': 'LightlineReadonly',
    \ }
\ }
let g:lightline.active = {
    \ 'left': [ [ 'mode', 'paste' ],
    \           ['filename', 'readonly', 'modified' ] ],
    \ 'right': [ [ 'lineinfo' ],
    \            [ 'percent' ],
    \            [ 'fileformat', 'fileencoding', 'filetype' ] ] }

function! LightlineModified()
    return &modifiable && &modified ? '[+]' : ''
endfunction
function! LightlineReadonly()
    return &readonly ? '[]' : ''
endfunction

let g:lightline.tabline          = {'left': [['buffers']], 'right': [['']]}
let g:lightline.component_expand = {'buffers': 'lightline#bufferline#buffers'}
let g:lightline.component_type   = {'buffers': 'tabsel'}
let g:lightline#bufferline#filename_modifier = ':t'
let g:lightline#bufferline#modified = ' [+]'
let g:lightline#bufferline#read_only = ' []'
let g:lightline#bufferline#enable_devicons = 1
set showtabline=2

" disable markdown folding
let g:vim_markdown_folding_disabled = 1

" vimtex options
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
let g:vimex_compiler_progname = 'nvr'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 0
"spell check for latex
autocmd FileType plaintex,tex,latex setlocal spell
"spell check language
set spelllang=en_gb

" set to 1, nvim will auto close current preview window
" when change from markdown buffer to another buffer
" default: 1
let g:mkdp_auto_close = 0

" set editor update time to 100ms
set updatetime=200

" buffers jump to existing window
let g:fzf_buffers_jump = 1

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" CocCommand and CocList abrv
command! -nargs=0 CC :CocCommand
command! -nargs=0 CL :CocList
command! -nargs=0 CA :CocAction

" autocomplete
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<C-l>'
let g:coc_snippet_prev = '<C-h>'

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

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" disable ex mode
nnoremap Q <Nop>

" copy to clipboard
vnoremap Y "+y

" paste from yank register
nnoremap p "0p
vnoremap p "0p

" easy buffer movement
map <silent> <C-h> :wincmd h<CR>
map <silent> <C-j> :wincmd j<CR>
map <silent> <C-l> :wincmd l<CR>
map <silent> <C-k> :wincmd k<CR>
map <M-l> :bn<CR>
map <M-h> :bp<CR>
map <M-d> :Bdelete<CR>
map <M-n> :enew<CR>
map <Up> :res +5<CR>
map <Down> :res -5<CR>
map <Right> :vertical res +5<CR>
map <Left> :vertical res -5<CR>

" substitute makro
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" double esc to disable hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" map fzf
map <M-p> :FZF<CR>
map <leader>f :Lines<CR>

" vimtex mappings
autocmd FileType tex map <C-i> :LLPStartPreview<CR>

" nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" remap nerdcomment
nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <C-_> :call NERDComment(0, "toggle")<CR>
