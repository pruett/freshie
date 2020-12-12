" -------------------------------------------
" Plugins
" -------------------------------------------
packadd minpac

call minpac#init()

" Package Manager
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Shortcuts
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-commentary')

" Files/Folder Navigation
call minpac#add('tpope/vim-vinegar')
call minpac#add('junegunn/fzf.vim')
call minpac#add('christoomey/vim-tmux-navigator')

" Visuals
call minpac#add('NLKNguyen/papercolor-theme')
call minpac#add('machakann/vim-highlightedyank')
call minpac#add('Yggdroot/indentLine')
call minpac#add('junegunn/goyo.vim')

" Lang
call minpac#add('editorconfig/editorconfig-vim')
call minpac#add('w0rp/ale')
call minpac#add('elmcast/elm-vim')
call minpac#add('rust-lang/rust.vim')
call minpac#add('pangloss/vim-javascript')
call minpac#add('mxw/vim-jsx')
call minpac#add('elzr/vim-json')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('kchmck/vim-coffee-script')
call minpac#add('mtscout6/vim-cjsx')

command! PackUpdate call minpac#update()
command! PackClean call minpac#clean()

" -------------------------------------------
" General Config
" -------------------------------------------
filetype plugin indent on "Enable plugins and indents by filetype
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set hidden
set history=50
set nobackup
set nofoldenable " Say no to code folding...
set noswapfile " don't create swp files
set nowritebackup

" -------------------------------------------
" Colors & Theme
" -------------------------------------------
set t_Co=256

" -------------------------------------------
" Spaces & Tabs
" -------------------------------------------
set expandtab " tabs are spaces
" set tabstop=4 " number of visual spaces per TAB
" set shiftwidth=4 " number of columns indented (>>) or outdented (<<)
" set softtabstop=4 " number of spaces in tab when editing
set shiftround " When at 3 spaces and I hit >>, go to 4, not 5.
set nojoinspaces " use 1 space after punctuation, not 2

" -------------------------------------------
" UI Config
" -------------------------------------------
syntax enable " enbable syntax highlighting
set laststatus=2 " Always show status line.
set noshowmode "hide mode while using a statusbar plugin
set list " show hidden characters
set listchars=trail:• " define which hidden characters to show
set number " show line numbers
set ruler "show line (row/column) info
set showmatch " highlight matching delimeters
set splitbelow " Always split panes to right
set splitright " Always split panes to bottom
set wildmenu " visual autocomplete for command menu

" -------------------------------------------
" Movement
" -------------------------------------------
" j/k individual lines in paragraph block instead of the entire block
nnoremap k gk
nnoremap j gj
nnoremap 0 g^
nnoremap $ g$

" -------------------------------------------
" Leader/Leader bindings
" -------------------------------------------
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

nnoremap <leader>ev :vsp $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>z :Goyo<CR>

" -------------------------------------------
" Navigation
" -------------------------------------------
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>

" -------------------------------------------
" Tmux
" -------------------------------------------
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

" -------------------------------------------
" Searching
" -------------------------------------------
nnoremap <C-f> :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>a :Ag<CR>
nnoremap K :Ag "\b<C-R><C-W>\b"<CR>:cw<CR>
set hlsearch " highlight matches
set ic " perform case insensitive searches
set incsearch " search as characters are entered
set inccommand=nosplit

" -------------------------------------------
" FZF
" -------------------------------------------
set rtp+=/usr/local/opt/fzf " add fzf (installed via Homebrew) to &runtimepath
let $FZF_DEFAULT_COMMAND = 'ag -g ""' " don't search .gitignore'd files

" -------------------------------------------
" Ale
" -------------------------------------------
" let g:ale_javascript_prettier_options = '--trailing-comma es5 --tab-width 4'
let g:ale_javascript_prettier_use_local_config = 1
let g:ale_fixers = {
\ 'javascript': ['prettier'],
\ 'typescript': ['prettier'],
\ 'json': ['prettier']
\}
let g:ale_linters = {
\ 'javascript': [],
\ 'typescript': []
\}
let g:ale_fix_on_save = 1
let g:ale_sign_error = '✗'
let g:ale_sign_column_always = 1
let g:ale_change_sign_column_color = 1
highlight ALESignColumnWithErrors ctermbg=231
highlight ALESignColumnWithoutErrors ctermbg=231

" -------------------------------------------
" Languages
" -------------------------------------------
" - JS -
let g:jsx_ext_required = 0

" - Elm -
let g:elm_jump_to_error = 1
let g:elm_make_output_file = "/dev/null"
let g:elm_make_show_warnings = 1
let g:elm_detailed_complete = 1
let g:elm_format_autosave = 1
let g:elm_format_fail_silently = 0
let g:elm_setup_keybindings = 0

" - JSON -
let g:vim_json_syntax_conceal = 0
