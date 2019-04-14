" vundle plugin options {{{

let g:plug_url_format='git@github.com:%s.git'
so ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/bundle')

" <---- plugins in testing ---->
Plug 'mattboehm/vim-unstack'
Plug 'chrisbra/vim-diff-enhanced' " PatiencDiff and EnhanceDiff
Plug 'idanarye/vim-yankitute' " Yankitude for copying into registers
Plug 'junegunn/goyo.vim' " Writer mode via :Goyu
" Plug 'blueyed/vim-diminactive' " dim inactive windows. 
Plug 'rizzatti/dash.vim' " Dash osx integration :DashSearch
" Plug 'terryma/vim-multiple-cursors' " C-n to start multiple cursors -- caused problems in git diff!
Plug 'andymass/vim-matchup' " Match with % plus textobj for match
Plug 'jeetsukumaran/vim-indentwise' " Support indent motions ]ii

" TODO jcfaria/Vim-R-plugin
" TODO https://github.com/vim-scripts/PatternsOnText - delete/replace non
" matches (also has some quicklist looking stuff).
" TODO move text blocks easily through )}" : https://github.com/vim-scripts/easy-through-pairing.vim
" TODO use count in front of jk control keys: https://github.com/vim-scripts/rel-jump
" <---- end plugins in testing ---->

Plug 'tpope/vim-projectionist'
Plug 'machakann/vim-highlightedyank' " highlight any text as it is yanked
Plug 'pgdouyon/vim-evanesco' " Highlight search, clear after searching
Plug 'MarcWeber/vim-addon-local-vimrc' " enable project local .vimrc files
Plug 'okcompute/vim-python-motions' " ]] ]C ]M to move between methods
Plug 'tpope/vim-fugitive', { 'tag': 'v2.5' } " git
Plug 'tpope/vim-rhubarb' " Gbrowse 
Plug 'godlygeek/csapprox' " neovim coloring for gblame
Plug 'ludovicchabant/vim-lawrencium' " mercurial (hg)
Plug 'tpope/vim-abolish' " fix spelling errors
" surround things with quotes, etc (csw - surround word)
Plug 'tpope/vim-surround'
" many additional mappings for ]q, etc
Plug 'tpope/vim-unimpaired', { 'tag': 'v2.0' }
" awesome: makes the surround plugin work with the '.' keys (repeatability!)
Plug 'tpope/vim-repeat'
Plug 'kreskij/Repeatable.vim'
Plug 'tpope/vim-eunuch' " eunuch.vim: cp/move/unlink commands
Plug 'ludovicchabant/vim-gutentags'

Plug 'vim-scripts/repeatable-motions.vim' " Repeat motions with C-[hjkl]
Plug 'AndrewRadev/splitjoin.vim' " Gs to split long lines

" A colorscheme that supports fugitive's [ob and ]ob
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'morhetz/gruvbox' " gruvbox colors
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
" Rainbow toggle colorscheme
Plug 'luochen1990/rainbow', { 'frozen': 1 }

" Language specific plugins:
" Plug 'vim-ruby/vim-ruby'
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }
Plug 'sirtaj/vim-openscad'
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'davidhalter/jedi-vim' " python support <leader>d to go to definition.
" TODO update this repo so that people know to look for chrisba
Plug 'dsummersl/wikia-csv' " editing CSV docs, super handily.
Plug 'prabirshrestha/async.vim'
Plug 'dsummersl/vim-sluice'
" Plug 'pangloss/vim-javascript'
Plug 'marshallward/vim-restructuredtext'  " syntax for rst files
" Plug 'mxw/vim-jsx'
Plug 'digitaltoad/vim-jade' " Vim Jade template engine syntax highlighting and indention
" Plug 'jeroenbourgois/vim-actionscript'
" Plug 'wavded/vim-stylus' " syntax hilighting for stylus files
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

Plug 'janko-m/vim-test' " :TestNearest
Plug 'christoomey/vim-tmux-runner' " :Vtr_endCommandToRunner for tmux
Plug 'benmills/vimux' " Run golang tests using vimux

Plug 'wellle/visual-split.vim' " I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " 4.9   vimscript for gist
Plug 'editorconfig/editorconfig-vim' " 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
Plug 'nathanaelkane/vim-indent-guides' " A Vim plugin for visually displaying indent levels in code
Plug 'mattn/emmet-vim' " fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'chrisba/csv.vim'
" simple utf2ascii function.
Plug 'dsummersl/vim-utf2ascii'
" Plug 'kchmck/vim-coffee-script'
" TODO this? Its a dependency for a number of libs?
Plug 'PProvost/vim-ps1'
" TODO this? Its a dependency for a number of libs?
Plug 'eparreno/l9'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/genutils'
Plug 'gregsexton/gitv', { 'tag': 'v1.4-rc1' }
Plug 'vim-scripts/visualrepeat'
" quick find method definitions:
Plug 'Shougo/denite.nvim'
Plug 'neoclide/denite-extra'
Plug 'majutsushi/tagbar'
" javascript omni integration
Plug 'Shougo/vimproc'
Plug 'tpope/vim-sleuth' " automatically detect the indent style of the document
Plug 'jiangmiao/auto-pairs' " close quotes and such automatically
Plug 'justinmk/vim-sneak' " f t s ; . mappings - jump to any location specified by two characters
Plug 'ervandew/ag' " vim plugin to search using the silver searcher (ag)
Plug 'mhinz/vim-grepper' " Grepper to search in lots of ways
Plug 'tommcdo/vim-exchange' " Easy text exchange operator for Vim
Plug 'tommcdo/vim-lion' " align with operator gL and gl (ie glip= to align paragraph by =)
" Plug 'nelstrom/vim-visual-star-search' " use #/* in visual mode for searching
" Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install --update' }

Plug 'wellle/targets.vim' " many text objects
Plug 'kana/vim-textobj-user' " user defined textobj implementations
Plug 'kana/vim-textobj-syntax' " vay viy to select syntax blocks
Plug 'glts/vim-textobj-comment' " select comment with vic or vac.
Plug 'thinca/vim-textobj-between' " vib between any arbitrary object (vibX where X is the obj)
Plug 'kana/vim-textobj-lastpat' " vi/ (last search)
Plug 'michaeljsmith/vim-indent-object' " vii and viI (visual inner Indent)

" Easily toggle boolean values:
Plug 'AndrewRadev/switch.vim'
" utility functions
" a hash implementation - make it easy to compute the hash of a string in the
" editor (ie, yank a block, then do :echo _#hash(@") )
Plug 'dsummersl/vus'
" unit testing for vim.
Plug 'dsummersl/vimunit'

" Probably going to remove these:
" colorize ansi escaped text (console dumps)
Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
Plug 'vim-scripts/cecutil'

Plug 'dsummersl/gundo.vim', { 'branch': 'mundo-master' }
Plug 'honza/vim-snippets'
Plug 'ap/vim-css-color'

if has('nvim')
  " language server type completion
  " Plug 'neoclide/coc.nvim', {'tag': 'v0.0.60', 'do': { -> coc#util#install()}}
  Plug 'kassio/neoterm'
  Plug 'w0rp/ale', { 'tag': 'v2.4.0' }
else
  " Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

set termguicolors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'

call plug#end()

if v:version >= 704
  " I don't really care about trailing spaces so much as the indenting:
  let g:airline#extensions#whitespace#checks = [ 'indent' ]
  " remove git branch - they can be long.
  let g:airline_section_a = ''
  let g:airline_section_b = ''
  let g:airline_skip_empty_sections = 1
  let g:airline_section_y = airline#util#wrap(' %#__accent_bold_red#%{&expandtab?"_":""}%#__restore__#%{&expandtab?"":"t"}%{&tabstop}',0)
  let g:airline#extensions#tagbar#enabled = 1
  let g:airline#extensions#tagbar#flags = 'f'
  let g:airline_powerline_fonts = 1
  set laststatus=2

  " show undo history
  nnoremap <F5> :MundoToggle<CR>

  set background=dark
  colorscheme gruvbox

  " colorscheme solarized8_dark_high

  " colors for the :terminal
  if has('nvim')
    " dark0 + gray
    let g:terminal_color_0 = "#282828"
    let g:terminal_color_8 = "#928374"

    " neurtral_red + bright_red
    let g:terminal_color_1 = "#cc241d"
    let g:terminal_color_9 = "#fb4934"

    " neutral_green + bright_green
    let g:terminal_color_2 = "#98971a"
    let g:terminal_color_10 = "#b8bb26"

    " neutral_yellow + bright_yellow
    let g:terminal_color_3 = "#d79921"
    let g:terminal_color_11 = "#fabd2f"

    " neutral_blue + bright_blue
    let g:terminal_color_4 = "#458588"
    let g:terminal_color_12 = "#83a598"

    " neutral_purple + bright_purple
    let g:terminal_color_5 = "#b16286"
    let g:terminal_color_13 = "#d3869b"

    " neutral_aqua + faded_aqua
    let g:terminal_color_6 = "#689d6a"
    let g:terminal_color_14 = "#8ec07c"

    " light4 + light1
    let g:terminal_color_7 = "#a89984"
    let g:terminal_color_15 = "#ebdbb2"
  endif
endif

if v:version >= 703
  let g:airline_theme = 'base16'

  if has("gui_running")
    set macmeta
    set anti
    " TODO make the fold highlight non-underlined.
    " a powerline friendly font might look like
    " set gfn=Source\ Code\ Pro\ for\ Powerline:h17
    " set gfn=Liberation\ Mono\ for\ Powerline:h15
    set gfn=Monaco\ for\ Powerline:h13
    "set gfn=Monaco:h15
  endif

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

  set cursorline
  " show column markers beyond the 80, and 100
  set colorcolumn=+0,+19,+20
endif
" }}}
" basic options {{{

set undofile
set undodir=~/.vim/undo

set conceallevel=2 " for ToggleGroupConceal
set autowrite
set nonumber
" set relativenumber
" I want to know about bad tab/space use:
set nolist

" give a little context
set scrolloff=2

set guioptions=egt  " GUI options
syntax on

" use folding by default
set foldmethod=marker

" Turn on mouse for a visual and normal mode only:
set mouse=v

" improve syntax highlighting speed in general
syntax sync minlines=64
syntax sync maxlines=128
set synmaxcol=150

set diffopt=filler,iwhite
set nohlsearch
set nowrap

" TABS, and tab size of two characters
set noexpandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set visualbell
" allow backspacing over everything in insert mode
set backspace=2
set nobackup
set incsearch

" file expansion in ex mode, caseless:
set wildignorecase

let g:mapleader=','

set viminfo='50,\"50,h
set history=100 " keep 100 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set encoding=utf-8

set textwidth=80
set formatoptions=croq
set breakindent " match indenting when wrapping text
set linebreak " when wrap is turned on, break on words

" let macros go faster
set lazyredraw

" For file completion in command line mode, complete to the longest common
" string of a file (and show the options), rather than auto picking the first
" completion:
set wildmenu
set wildmode=longest:full,full


" Revisit the history on the command mode without leaving the home rows.
cnoremap <c-n> <down>
cnoremap <c-p> <up>

" show replace previews
if has('nvim')
  set inccommand=split
  set pumblend=15
  " completion for command mode suggestions
  set wildoptions=pum
  set signcolumn=yes:1
endif


let g:python_host_prog='/usr/local/bin/python2'
let g:python3_host_prog='/usr/local/bin/python3'

"}}}
" Plugin settings, changes."{{{

call repeatable#Setup()

let g:grepper = {}
let g:grepper.open = 0
let g:grepper.stop = 700
let g:grepper.operator = {}
let g:grepper.operator.prompt = 1

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

let g:airline#extensions#ale#enabled=0
let g:ale_completion_enabled = 0
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
Repeatable nmap [g <Plug>(ale_previous)
Repeatable nmap ]g <Plug>(ale_next)
nmap <leader>h :ALEHover<cr>
let g:ale_linters = {
      \ 'python': ['black', 'pyls', 'isort', 'trim_whitespace'],
      \ 'javascript': ['eslint']
      \ }

" Map indent motions to a more indent-like key
let g:indentwise_suppress_keymaps = 1
map [ii <Plug>(IndentWiseBlockScopeBoundaryBegin)
sunmap [ii
map ]ii <Plug>(IndentWiseBlockScopeBoundaryEnd)
sunmap ]ii


" started In Diff-Mode set diffexpr (plugin not loaded yet)
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'

let g:gruvbox_italic = 1
let g:gruvbox_bold = 1
let g:gruvbox_underline = 1
let g:gruvbox_undercurl = 1
let g:gruvbox_contrast_dark = 'soft'
let g:gruvbox_contrast_light = 'soft'

let g:riv_disable_folding = 1

" When using gL and gl, squeeze any extra leading whitespace.
let g:lion_squeeze_spaces = 1

let g:highlightedyank_highlight_duration = 250

function! Render_Only_File(...)
  let l:builder = a:1
  let l:context = a:2

  call l:builder.add_section('file', '%F')

  " return 0   " the default: draw the rest of the statusline
  " return -1  " do not modify the statusline
  return 1   " modify the statusline with the current contents of the builder
endfunction
call airline#add_inactive_statusline_func('Render_Only_File')

let g:expand_region_text_objects = {
      \ 'iw'  :0,
      \ 'iW'  :0,
      \ 'i"'  :0,
      \ 'i''' :0,
      \ 'iB'  :1,
      \ 'ip'  :0,
      \ 'ii'  :0,
      \ 'it'  :0,
      \ 'at'  :1,
      \ }

" Run test commands in tmux - or neoterm, thats my other fav.
let g:test#strategy = 'vtr'
" let g:test#transformation = 'last'
" let g:test#sub = 'docker-compose run --rm python manage.py test {} | pygmentize -l pytb'
" let g:test#python#runner = 'djangotest'

let g:neoterm_automap_keys = 'cic'

" let g:jedi#completions_enabled = 0
" let g:jedi#show_call_signatures = '2'

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_list = 10
let g:deoplete#auto_complete_delay = 150

let g:splitjoin_trailing_comma = 1

let g:gutentags_cache_dir = '~/.vim/tags'
let g:gutentags_ctags_exclude = [ '*.json', '*/node_modules/*', '*/bower_components/*',
      \ 'tags', '*.sql', '*.html', '*/public/assets/*']

" Color brackets and HTML/XML:
let g:rainbow_active = 1

let g:delimitMate_expand_cr = 2
let g:delimitMate_jump_expansion = 1
let g:delimitMate_expand_space = 1

let g:mundo_verbose_graph = 0
let g:mundo_mirror_graph = 1
let g:mundo_prefer_python3 = 1
let g:mundo_help = 0
let g:mundo_inline_undo = 1

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 4
" don't include tabs in 'soft' tabs - I want to see when things are amiss.
" let g:indent_guides_soft_pattern = ' '

" let the narrow region plugin NR functions automatically update the window
" location on change:
let g:narrow_rgn_update_orig_win = 1
let g:nrrw_rgn_update_orig_win = 1

" let g:fugitive_git_executable = '/usr/local/bin/git'

" we have very long commit lines - this helps!
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_OpenHorizontal = 1

" Toggle a setting on or off.
function! Toggle(setting)
  exec "let b=". a:setting
  if b == '0'
    echom a:setting ."=1"
    exec "let ". a:setting ."=1"
  else
    echom a:setting ."=0"
    exec "let ". a:setting ."=0"
  endif
endfunction

" left/right and up/down first/last
autocmd FileType * let b:switch_custom_definitions =
    \ [
    \ { '==': '!=' }, { '!=': '==' },
    \ { '&&': '||' }, { '||': '&&' },
    \ { 'and': 'or' }, { 'or': 'and' },
    \ { 'FALSE': 'TRUE' }, { 'TRUE': 'FALSE' },
    \ { 'left': 'right' }, { 'right': 'left' },
    \ { 'yes': 'no' }, { 'no': 'yes' },
    \ { 'disabled': 'enabled' }, { 'enabled': 'disabled' },
    \ { 'present': 'absent' }, { 'absent': 'present' },
    \ { 'up': 'down' }, { 'down': 'up' },
    \ { 'top': 'bottom' }, { 'bottom': 'top' },
    \ { 'first': 'last' }, { 'last': 'first' },
    \ { 'public': 'private' }, { 'private': 'protected' }, { 'protected': 'public' },
    \ { 'INFO': 'DEBUG' }, { 'DEBUG': 'INFO' },
    \ { 'info': 'debug' }, { 'debug': 'info' },
    \ { 'assertFalse': 'assertTrue' }, { 'assertTrue': 'assertFalse' },
    \ { 'assertIn': 'assertNotIn' }, { 'assertNotIn': 'assertIn' },
    \ { 'assertContains': 'assertNotContains' }, { 'assertNotContains': 'assertContains' },
    \ { '\.\([a-zA-Z_-]\+\)\>': "['\\1']" }, { '\[[''"]\([a-zA-Z_-]\+\)[''"]\]': '.\1' },
    \ ]

" don't use vif (thats a function, duh!)
let g:textobj_between_no_default_key_mappings=0
" use vib and vab instead
xmap ab  <Plug>(textobj-between-a)
omap ab  <Plug>(textobj-between-a)
xmap ib  <Plug>(textobj-between-i)
omap ib  <Plug>(textobj-between-i)

" pathing for abolish
set runtimepath+=~/.vim/after

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips']
" let g:UltiSnipsPythonPath="/usr/local/bin/python"
let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
let g:UltiSnipsListSnippets='<C-\>'
let g:UltiSnipsExpandTrigger='<Tab>'
let g:UltiSnipsJumpForwardTrigger='<Tab>'                                           
let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'

let g:ycm_key_list_select_completion=['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion=['<C-p>', '<Up>']
let g:ycm_autoclose_preview_window_after_insertion=1

" CtrlP plugin
let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
      \ --ignore .git
      \ --ignore .svn
      \ --ignore .hg
      \ --ignore .DS_Store
      \ --ignore node_modules
      \ --ignore htmlcov
      \ --ignore "**/*.pyc"
      \ -g ""'

" Map <C-p> to most recent files
let g:ctrlp_cmd = 'CtrlPMRUFiles'
" Map <C-S-p> to all files (iTerm mapping of that combo to <F15>): 
map <F15> :CtrlP<cr>
map <M-p> :CtrlP<cr>
" Let C-S-P happen in terminals (C-P already does helpful things in a terminal)
tnoremap <F15> <C-\><C-N><C-O>:CtrlP<CR>

" only show MRU files in the working directory
let g:ctrlp_mruf_relative = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" just use the pwd when finding files.
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn|$'
" by default ignore binary things and swap files
set wildignore+=*/*.sw?,*/*.pyc,*/*.class
" enable the quickfix plugin source:
let g:ctrlp_extensions=['changes']

let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1
let g:tagbar_foldlevel = 0

let g:tagbar_type_markdown = {
    \ 'ctagstype': 'markdown',
    \ 'ctagsbin' : '~/.vim/markdown2ctags/markdown2ctags.py',
    \ 'ctagsargs' : '-f - --sort=yes',
    \ 'kinds' : [
        \ 's:sections',
        \ 'i:images'
    \ ],
    \ 'sro' : '|',
    \ 'kind2scope' : {
        \ 's' : 'section',
    \ },
    \ 'sort': 0,
    \ }
let g:tagbar_type_typescript = {
  \ 'ctagsbin' : 'tstags',                                                        
  \ 'ctagsargs' : '-f-',                                                           
  \ 'kinds': [                                                                     
    \ 'e:enums:0:1',                                                               
    \ 'f:function:0:1',                                                            
    \ 't:typealias:0:1',                                                           
    \ 'M:Module:0:1',                                                              
    \ 'I:import:0:1',                                                              
    \ 'i:interface:0:1',                                                           
    \ 'C:class:0:1',                                                               
    \ 'm:method:0:1',                                                              
    \ 'p:property:0:1',                                                            
    \ 'v:variable:0:1',                                                            
    \ 'c:const:0:1',                                                              
  \ ],                                                                            
  \ 'sort' : 0                                                                    
\ }  

" Unite outline mode
nnoremap <C-t> :TagbarToggle<cr>
map <M-t> :CtrlPBufTag<cr>
" User iterm2 to map shift-ctrl-t to <f16>
map <F16> :CtrlPTag<cr>

" save my right pinky some pain:
nnoremap <leader>t zt
nnoremap <leader>b zb
nnoremap <leader>, zz
nnoremap <leader><space>  <space><space>

let g:sluice_default_macromode=1

" show diff with git
nnoremap <F6> :Gvdiff<CR>
nnoremap <F7> :TestLast<CR>

" don't search included files by default - it can be fucked up slow:
set complete-=i
set completeopt-=preview

" delete all buffers function
function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
"}}}
  " Setup how in 'list' mode characters for white space and tabs appear"{{{
  " display tags and trailing white spaces in list mode.
function! ShowMixedIndents()
  set fillchars+=stl:\ ,stlnc:\ 
  set lcs=tab:\ \ 
  syntax match MixedIndentation /^\v +(\t+)|\t+( +)/
  hi MixedIndentation guibg=Red guifg=White ctermbg=Red ctermfg=White
endfunction
"}}}
" Mappings"{{{

let g:AutoPairsFlyMode=1

" TODO VtrAttachToPane 1

" " In Iterm2 I mapped C-S-' to <f14>
" imap <F14> <C-O>:let g:AutoPairsFlyMode=1<CR>"<C-O>:let g:AutoPairsFlyMode=0<CR>
" " Can't do anything about this - its ^M
" " imap <C-'> <C-O>:let g:AutoPairsFlyMode=1<CR>'<C-O>:let g:AutoPairsFlyMode=0<CR>
" imap <C-]> <C-O>:let g:AutoPairsFlyMode=1<CR>]<C-O>:let g:AutoPairsFlyMode=0<CR>
" " imap <C-0> <C-O>:let g:AutoPairsFlyMode=1<CR>)<C-O>:let g:AutoPairsFlyMode=0<CR>
" " In Iterm2 I mapped C-S-] to <f13>
" imap <F13> <C-O>:let g:AutoPairsFlyMode=1<CR>}<C-O>:let g:AutoPairsFlyMode=0<CR>

" I want to see all the options when I try to jump to a tag:
nmap <C-]> g<C-]>zt
" TODO Create mappings to find tags that match this filetype.

map <leader>dd :ALEGoToDefinition<cr>
nmap <silent> <leader>D <Plug>DashSearch

" Quickly edit the contents of a register (for macros, say); <leader>m or
" "q<leader>m  to edit register q
" From https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" I like using sort in netrw
let g:sneak#map_netrw = 0
" and I like not having to do uppercases:
let g:sneak#use_ic_scs = 1
let g:sneak#t_reset = 1
let g:sneak#f_reset = 1
" repeat previous search with clever sneak
let g:sneak#s_next = 1
" label mode
let g:sneak#label = 1

cabbrev bda call DeleteHiddenBuffers()
cabbrev gitv Gitv
cabbrev ag Grepper -tool ag<cr>
cabbrev aa AA
cabbrev gg GG
cabbrev man Man

" I like having zs to jump to the start of the line, but I'd really love a
" zm to jump to the middle - I don't think I'll miss the original folding
" function of zm:
nnoremap zm zs

" Use projectionist mapping when doing a C-7
nnoremap <leader>6 :A<cr>

" when switching between the alternate window, automatically save.
inoremap <C-^> <C-O>:e #<CR>
" do the same thing in terminal mode (even in insert mode)
tnoremap <C-^> <C-\><C-N><C-O>:e #<CR>
" quick autosave
nnoremap <C-c> :w<CR>
inoremap <C-c> <Esc>
" quick jump up to the previous line in insert mode:
" inoremap <C-e> <C-o>:norm k$\<Enter>

" instead of using this, I use 'gt'
map <nul> <esc>

" turn off help
map <f1> <nul>
imap <f1> <nul>

" quickly get rid of other windows
map <F12> :only<CR>

" Make Control up/down scroll up/down in the window...even in insert mode.
imap <C-j> <C-x><C-e>
imap <C-k> <C-x><C-y>
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_

" jump to the end of the line
" Used iterm2 to map shift-ctrl-e to <f15>
imap <M-e> <C-O>$
" Used iterm2 to map shift-ctrl-a to <f16>
imap <M-a> <Home>

" console copy to buffer
noremap <leader>y "+y
noremap <leader>a ggVG"+y
" copy the current filename and line number into the clipboard and past register:
noremap <leader>f :let @+=expand("%") .'#'. line(".")<bar>let @"=@+ ."\n"<CR>
noremap <leader>gf :exec "Grepper -tool ag -noprompt -query ". expand("%:t:r")<cr>

" see all the search matches in a separate window (narrow region)
noremap <leader>/ :exec "Denite -auto-resize -input=". substitute(escape(@/,' '),'\\[<>]\{1}','\\b','g') ." -mode=normal -matchers=\"matcher_regexp\" line"<cr>

" unimpaired like mapping for diff option for ignoring whitespace.
noremap ]oI :set diffopt-=iwhite<cr>
noremap [oI :set diffopt+=iwhite<cr>

" undo/redo to the previous write
Repeatable map <leader>u :earlier 1f<cr>
Repeatable map <leader>r :later 1f<cr>

" When in Gstatus jump to the next file in the list and diff it.
Repeatable map <leader>gj <C-w>l<C-w>kjdv
Repeatable map <leader>gk <C-w>l<C-w>kkdv

" yank a block by the whole line.
map <leader>ya} va}Vy
map <leader>yi} vi}Vy
map <leader>ya) va)Vy
map <leader>yi) vi)Vy
map <leader>ya] va]Vy
map <leader>yi] vi]Vy

" delete out block function that supports repeatability.
Repeatable nnoremap <leader>da} va}Vd
Repeatable nnoremap <leader>di} vi}Vd
Repeatable nnoremap <leader>da) va)Vd
Repeatable nnoremap <leader>di) vi)Vd
Repeatable nnoremap <leader>da] va]Vd
Repeatable nnoremap <leader>di] vi]Vd

" Send a selection to the terminal:
map <leader>cls :TREPLSendSelection<CR>
map <leader>cll :TREPLSendLine<CR>
map <leader>cc :Ttoggle<CR>
map <leader>ctn :TestNearest<CR>
map <leader>cts :TestSuite<CR>
map <leader>ctf :TestFile<CR>
map <leader>ctl :TestLast<CR>

" Open the current directory (or make new directory)
map <leader>ep :e %:h/<C-d>

" Use gp to select the last pasted region.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" toggle Sluice gutters
nnoremap <F3> :SluiceMacroOff <bar> SluiceToggle<CR>
nnoremap <F4> :SluiceMacroOn <bar> SluiceToggle<CR>

" automatically toggle with control-
let g:switch_mapping = ',.'

" TODO Serach for files with CtrlP for files matching the name of the file under
" the cursor:

nnoremap <leader>gl :GCL<cr>
nnoremap <leader>gd :Denite -resume<cr>
nnoremap <leader>ll :GLL<cr>

vmap <leader>v :VSSplit<cr>

" Django: find the urls.py definition of the 'url name' under the cursor
let g:django_lookup_url_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:GrepperAg \<c-r>\" -G urls.py\<cr>"
let g:django_lookup_view_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:GrepperAg \<c-r>\" -G urls.py\<cr>"
map <leader>du :let @z=g:django_lookup_url_recording<cr>@z
map <leader>dv :let @z=g:django_lookup_view_recording<cr>@zF,b<c-]>

" Python: replace a multiline # COMMENT with a """ COMMENT """
let g:python_replace_pound_comment='gcacgpJ:s/\v^(\s+)(.*)$/\1""" \2 """gqq'
map <leader>dc :let @z=g:python_replace_pound_comment<cr>@z

" Git: from a 'changes view', go to next diff
" TODO support this from the main gitv screen (it works in diff at the moment.)
let g:git_next_diff='tdvl'
let g:git_previous_diff='tdvl'
Repeatable map <leader>g] :let @z=g:git_next_diff<cr>@z
Repeatable map <leader>g[ :let @z=g:git_previous_diff<cr>@z

"}}}
" Commands"{{{

" TODO Note that this usually only works if 'syn off' is set - if the text you are
" searching for is on a line with syntax coloring, then it likely will not be
" folded.
map <leader>ch :call ToggleSearchConceal()<CR>

" Sort python imports:
command! -range=% Isort :<line1>,<line2>! isort -

" Convert unicode to ASCII
command! UTFToASCII :call utf2ascii#replaceUTF()<cr>

function! ToggleSearchConceal()
  if !exists('b:searchtext')
    let b:searchtext = @/
  endif
  if b:searchtext != @/
    silent syntax clear searchtext
    let b:searchtext = @/
  endif
  exe 'syntax match searchtext "'. @/ .'"'
  call ToggleGroupConceal('searchtext', '*')
endfunction

function! ToggleGroupConceal(group, cchar)
  " Get the existing syntax definition
  redir => syntax_def
  exe 'silent syn list' a:group
  redir END
  " Split into multiple lines
  let lines = split(syntax_def, "\n")
  " Clear the existing syntax definitions
  exe 'syn clear' a:group
  for line in lines
    " Only parse the lines that mention the desired group
    " (so don't try to parse the "--- Syntax items ---" line)
    if line =~ a:group
      echom line
      " Get the required bits (the syntax type and the full definition)
      let matcher = a:group . '\s\+xxx\s\+\(\k\+\)\s\+\(.*\)'
      let type = substitute(line, matcher, '\1', '')
      let definition = substitute(line, matcher, '\2', '')
      " Either add or remove 'conceal' from the definition
      if definition =~ 'conceal'
        let definition = substitute(definition, ' conceal\>', '', '')
        exe 'syn' type a:group definition
      else
        exe 'syn' type a:group definition 'conceal cchar='. a:cchar
      endif
    endif
  endfor
endfunction

" Transforms for running tests in. {} is replaced. For example:
" let test#sub = 'docker run --rm web python manage.py test {} | pygmentize -l pytb'
" or, just pipe to something
" let test#sub = '{} | pygmentize -l pytb'
let g:test#sub = ''
function! SubstituteTransform(cmd) abort
  return substitute(g:test#sub, '{}', a:cmd, 'g')
endfunction

function! LastTransform(cmd) abort
  " Keep only the last word, and combine with SubstituteTransform - handy for
  " the djangotest type test where I want to take advantage of its figuring out
  " the test name (at the end of the cmd) but want to run it differently
  return SubstituteTransform(substitute(a:cmd, '^.* \(\S\+\)$', '\1', ''))
endfunction

let g:test#custom_transformations = {
      \ 'sub': function('SubstituteTransform'),
      \ 'last': function('LastTransform') }
" let test#sub = 'command to run tests'
" let test#transformation = 'last'
" let test#strategy = 'neoterm'

" Set an arbitrary value to a number.
"
" Use this like so to change something, incrementing from 392:
"
" :call SV(392)
" :%s/\v(something:)(\d+)/\=submatch(1) . UV()/

" Similar command to decrement by one for each value:
"
" :call SV(392)
" :%s/\v(something:)(\d+)/\=submatch(1) . DV()/
"
function! SV(v)
  let b:set_value = a:v
endfunction

" Get the next value of the value, and increment by two
function! UV()
  if !exists('b:set_value')
    let b:set_value = 1
  endif
  let l:old_value = b:set_value
  let b:set_value += 1
  return l:old_value
endfunction

" Get the next value, and decrement by two:
function! DV()
  if !exists('b:set_value')
    let b:set_value = 1
  endif
  let l:old_value = b:set_value
  let b:set_value -= 1
  return l:old_value
endfunction

function! s:UniteQuickFix()
  Denite quickfix -mode=normal -auto-resize -matchers="matcher_regexp" -immediately-1
endfunction
function! s:UniteLocationList()
  Denite location_list -mode=normal -auto-resize -matchers="matcher_regexp" -immediately-1
endfunction

" Execute something on all files of the same kind:
"
" See GG and AA commands:
function! s:ExecFileType(cmd,search)
  let l:extension = substitute(expand('%'),'\v^.*\.','','')
  " save the last search as this so that */# work:
  let @/ = a:search
  exec printf('silent %s',printf(a:cmd,a:search,l:extension))
  call s:UniteQuickFix()
endfunction

command! -nargs=0 GCL call s:UniteQuickFix()
command! -nargs=0 GLL call s:UniteLocationList()
command! -nargs=1 GG call s:ExecFileType("silent Ggrep %s -- '*.%s'",'<args>')
command! -nargs=1 AA call s:ExecFileType("silent GrepperAg %s **/*.%s",'<args>')
" TODO make Ggrep be test for the command...for non git projects, fallback on Ag
" Something like :if exists(':Ggrep')
command! -nargs=1 Gg exec "silent Ggrep ". '<args>' | GCL
command! -nargs=1 Aa exec "silent GrepperAg ". '<args>' | GCL

" TODO automate this diffsplit two matching regions
" let @m=j?<<<jV/^===k"aynjV/^>>>k"by:sp belowggdG"bp:vert diffs aboveggdG"apgglgg:diffupdate=

function! s:SetStop(type,count)
  if a:type ==# 't'
    set noexpandtab
  else
    set expandtab
  end
  exec 'set sw='. a:count
  exec 'set ts='. a:count
  exec 'set sts='. a:count
endfunction

command! -nargs=* SS call s:SetStop(<f-args>)

function! ConcealSearch(repl)
  exe 'syn keyword concealSearch "'. @/ .'" conceal cchar='. a:repl
  set conceallevel=2
endfunction

" Let an command execute once:
function! Once(cmd)
  let varName = 'b:'. a:cmd .'_once'
  if exists(varName)
    return
  endif
  exe 'let '. varName .'=1'
  exe a:cmd
endfunction

"}}}
" Automappings"{{{

if has('autocmd') && !exists('g:autocommands_loaded')
  let g:autocommands_loaded = 1

  autocmd WinLeave * setlocal nocursorline
  autocmd WinEnter * setlocal cursorline

  " Set a buffer variable and then only call this two time.
  autocmd BufNewFile,BufReadPost * :call AutoPairsInit()

  " ensure that tabstop settings for file browsing is big enough for column
  " alignment:
  autocmd FileType netrw setlocal ts=30

  autocmd FileType sh  setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete

  autocmd FileType htmldjango SS s 4

  " Rainbow tags look crappy in htmldjango -- this autocmd isn't really working :/
  autocmd FileType htmldjango RainbowToggleOff

  autocmd BufNewFile,BufRead *.j2 setf jinja
  autocmd BufNewFile,BufRead *.md setf markdown
  autocmd BufNewFile,BufRead *.md setlocal spell wrap et
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufEnter *.py :SS s 4
  autocmd BufNewFile,BufRead *.gradle set ft=groovy
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby
  autocmd BufNewFile,BufRead *.tss set ft=javascript
  autocmd BufNewFile,BufRead *.html.ts set ft=html
  autocmd BufNewFile,BufRead *.coffee set ft=coffee
  autocmd BufNewFile,BufRead Cakefile set ft=coffee

  " Some other ruby project is tromping over the gutentags files - manually
  " reload every time we enter:
  autocmd BufRead *.rb  if exists('b:gutentags_files') | unlet b:gutentags_files | endif | call gutentags#setup_gutentags()
  autocmd BufRead *.slim  if exists('b:gutentags_files') | unlet b:gutentags_files | endif | call gutentags#setup_gutentags()
  autocmd BufRead *.haml  if exists('b:gutentags_files') | unlet b:gutentags_files | endif | call gutentags#setup_gutentags()

  " show line numbers for tests:
  autocmd BufNewFile,BufEnter test*.py,*test.py,*spec.rb :setlocal number

  " Real broken for carstickers project:
  autocmd BufNewFile,BufReadPost *.html.ts let b:tagbar_ignore = 1

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd User Grepper :GCL
endif
"}}}
" vim: set ai fdm=marker cms="%s:
