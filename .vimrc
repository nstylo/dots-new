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
" snippets
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
" git
Plug 'airblade/vim-gitgutter'
" formatting
Plug 'scrooloose/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'
Plug 'jiangmiao/auto-pairs'
" nerdtree
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
" web development
" Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
call plug#end()

" :Man to open man pages
runtime ftplugin/man.vim

" setup gruvbox
set termguicolors "sets to true colors
let &t_ut=''
let g:gruvbox_italic=1
let g:gruvbox_contrast_dark = 'medium'
set background=dark
colorscheme gruvbox

" setup airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_theme='gruvbox'
let g:airline_powerline_fonts = 1

" vimtex options
let g:vimtex_view_method = 'zathura'
let g:livepreview_previewer = 'zathura'
let g:vimex_compiler_progname = 'nvr'
let g:tex_flavor = "latex"
let g:vimtex_quickfix_mode = 0
" set conceallevel=1
" let g:tex_conceal = 'abdmg'
"spell check for latex
autocmd FileType plaintex,tex,latex setlocal spell
"spell check language
set spelllang=en_gb

" set gitgutter update time to 100ms
set updatetime=100

" buffers jump to existing window
let g:fzf_buffers_jump = 1

" vimtex autocompletion with ycm
if !exists('g:ycm_semantic_triggers')
	let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers.tex = g:vimtex#re#youcompleteme

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-j>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-j>'

" snippet bindings
let g:UltiSnipsSnippetDirectories = ['~/.vim/plugged/vim-snippets/snippets']
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
" add html snippets to js
autocmd FileType javascript UltiSnipsAddFiletypes html

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

" run prettier before save
let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" ALE settings for js
let g:ale_fixers = {
\ 'javascript': ['eslint']
\ }
let g:ale_linters = {
\ 'javascript': ['eslint']
\ }
let g:javascript_plugin_jsdoc = 1

" disable toggling auto-pairs
let g:AutoPairsShortcutToggle = ''
let g:AutoPairsShortcutJump = ''
let g:AutoPairsShortcutFastWrap = ''
let g:AutoPairsFlyMode = 0
au FileType html let b:AutoPairs = AutoPairsDefine({'<!--' : '-->'}, ['{'])

" assign mapleader
let mapleader=" "

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
" tagbar toggle
map <leader>t :TagbarToggle<CR>

" remap nerdcomment
nnoremap <C-_> :call NERDComment(0, "toggle")<CR>
vnoremap <C-_> :call NERDComment(0, "toggle")<CR>

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
