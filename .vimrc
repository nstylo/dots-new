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
Plug 'chrisbra/Colorizer'
Plug 'markonm/traces.vim'
" status and bufferline
Plug 'ap/vim-buftabline'
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
Plug 'jiangmiao/auto-pairs'
" nerdtree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
" markdown
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install', 'for': 'markdown' }
" linting, syntax highlighting, lsp ...
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'mxw/vim-jsx'
call plug#end()

" :Man to open man pages
runtime ftplugin/man.vim

" setup color scheme
set termguicolors "sets to true colors
let &t_ut=''
colorscheme gruvbox

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

" coc
let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-eslint', 'coc-prettier', 'coc-snippets', 'coc-html', 'coc-css', 'coc-markdownlint', 'coc-texlab', 'coc-python']

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

" disable toggling auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsFlyMode = 0

" assign mapleader
let mapleader=" "

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

" copy to clipboard
vnoremap Y "+y

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
" see .vim/plugin/Bclose.vim
map <M-d> :Bclose<CR>
map <M-n> :enew<CR>
map <M-Up> :res +5<CR>
map <M-Down> :res -5<CR>
map <M-Right> :vertical res +5<CR>
map <M-Left> :vertical res -5<CR>

" substitute makro
nnoremap <Leader>r :%s/\<<C-r><C-w>\>/

" double esc to disable hlsearch
nnoremap <silent> <Esc><Esc> <Esc>:nohlsearch<CR><Esc>

" map fzf
map <M-p> :FZF<CR>
map <leader>f :Lines<CR>
map <Leader>h :Helptags!<CR>

" vimtex mappings
autocmd FileType tex map <C-i> :LLPStartPreview<CR>

" nerdtree toggle
map <C-n> :NERDTreeToggle<CR>

" remap nerdcomment
nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <C-_> :call NERDComment(0, "toggle")<CR>
