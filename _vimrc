" vundle plugin options {{{

let g:plug_url_format='git@github.com:%s.git'
so ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/bundle')

" <---- plugins in testing ---->
" Plug 'mg979/vim-visual-multi', { 'tag': '*' } " multiple cursors with 
" Plug 'sheerun/vim-polyglot'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'rhysd/git-messenger.vim'
" Plug 'wellle/context.vim' " automatically show context. Pretty cool, but
" seems to be mucked up with 2-character wells on the left of the screen :(

" TODO jcfaria/Vim-R-plugin
" TODO https://github.com/inkarkat/PatternsOnText - delete/replace non matches (also has some quicklist looking stuff).
" TODO move text blocks easily through )}" : https://github.com/vim-scripts/easy-through-pairing.vim
" TODO use count in front of jk control keys: https://github.com/vim-scripts/rel-jump
" <---- end plugins in testing ---->

" Plug 'rizzatti/dash.vim' " Lookup docs in Dash
Plug 'idanarye/vim-yankitute' " Yankitude for copying into registers
Plug 'jeetsukumaran/vim-indentwise' " Support indent motions ]ii
" Plug 'andymass/vim-matchup' " Match with % plus textobj for match
Plug 'itchyny/lightline.vim'
Plug 'stefandtw/quickfix-reflector.vim' " edit the qf list directly with copen
Plug 'tpope/vim-projectionist' " :E* commands for a project
" Plug 'machakann/vim-highlightedyank' " highlight any text as it is yanked
Plug 'pgdouyon/vim-evanesco' " Highlight search, clear after searching
Plug 'MarcWeber/vim-addon-local-vimrc' " enable project local .vimrc files
Plug 'okcompute/vim-python-motions' " ]] ]C ]M to move between methods
Plug 'tpope/vim-fugitive', { 'tag': '*' } " git
Plug 'tpope/vim-rhubarb' " Gbrowse 
Plug 'tpope/vim-abolish' " fix spelling errors
Plug 'tpope/vim-surround' " surround things with quotes, etc (csw - surround word)
Plug 'tpope/vim-unimpaired' " many additional mappings for ]q, etc
Plug 'tpope/vim-repeat' " awesome: makes the surround plugin work with the '.' keys (repeatability!)
Plug 'kreskij/Repeatable.vim'
Plug 'tpope/vim-eunuch' " eunuch.vim: cp/move/unlink commands
Plug 'ludovicchabant/vim-gutentags'

" Plug 'vim-scripts/repeatable-motions.vim' " Repeat motions with C-[hjkl]
Plug 'AndrewRadev/splitjoin.vim' " Gs to split long lines

" A colorscheme that supports fugitive's [ob and ]ob
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'morhetz/gruvbox' " gruvbox colors
" Plug 'rakr/vim-one'
" Plug 'rakr/vim-two-firewatch'
" Rainbow toggle colorscheme
Plug 'luochen1990/rainbow', { 'frozen': 1 }

" Language specific plugins:
Plug 'slim-template/vim-slim'
Plug 'posva/vim-vue'
Plug 'prabirshrestha/async.vim'

Plug 'janko-m/vim-test' " :TestNearest
Plug 'christoomey/vim-tmux-runner' " :Vtr_endCommandToRunner for tmux
Plug 'benmills/vimux' " Run tests using vimux

Plug 'wellle/visual-split.vim' " I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " vimscript for Gist
Plug 'editorconfig/editorconfig-vim' " 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
Plug 'nathanaelkane/vim-indent-guides' " A Vim plugin for visually displaying indent levels in code
Plug 'mattn/emmet-vim' " fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'dsummersl/vim-utf2ascii' " simple utf2ascii function.
" Plug 'PProvost/vim-ps1' " TODO this? Its a dependency for a number of libs?
" Plug 'eparreno/l9' " TODO this? Its a dependency for a number of libs?
" Plug 'vim-scripts/LargeFile'
" Plug 'vim-scripts/genutils'
Plug 'gregsexton/gitv', { 'tag': '*' }
" Plug 'vim-scripts/visualrepeat'
" Plug 'tpope/vim-sleuth' " automatically detect the indent style of the document
Plug 'jiangmiao/auto-pairs' " close quotes and such automatically
Plug 'justinmk/vim-sneak' " f t s ; . mappings - jump to any location specified by two characters
Plug 'mhinz/vim-grepper' " Grepper to search in lots of ways
Plug 'tommcdo/vim-exchange' " Easy text exchange operator for Vim
Plug 'tommcdo/vim-lion' " align with operator gL and gl (ie glip= to align paragraph by =)

Plug 'wellle/targets.vim' " many text objects
Plug 'kana/vim-textobj-user' " user defined textobj implementations
Plug 'kana/vim-textobj-syntax' " vay viy to select syntax blocks
Plug 'glts/vim-textobj-comment' " select comment with vic or vac.
Plug 'thinca/vim-textobj-between' " vib between any arbitrary object (vibX where X is the obj)
Plug 'kana/vim-textobj-lastpat' " vi/ (last search)
Plug 'michaeljsmith/vim-indent-object' " vii and viI (visual inner Indent)
Plug 'nelstrom/vim-textobj-rubyblock' "vir for ruby blocks

" Easily toggle boolean values:
Plug 'AndrewRadev/switch.vim'
" utility functions
" a hash implementation - make it easy to compute the hash of a string in the
" editor (ie, yank a block, then do :echo _#hash(@") )
Plug 'dsummersl/vus'
Plug 'dsummersl/vimunit' " unit testing for vim.

" Probably going to remove these:
" colorize ansi escaped text (console dumps)
" Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
" Plug 'vim-scripts/cecutil'

Plug 'dsummersl/gundo.vim', { 'branch': 'mundo-master' }
Plug 'honza/vim-snippets'

if has('nvim')
  " language server type completion
  Plug 'w0rp/ale'
  Plug 'neovim/nvim-lsp'
  Plug 'neoclide/coc.nvim'
else
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

set termguicolors
Plug 'SirVer/ultisnips'

call plug#end()

if v:version >= 704
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

  set cursorline
  " show column markers beyond the 80, and 100
  set colorcolumn=+1,+20,+21,+22,+23
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

" Let airline show the mode
set noshowmode

" give a little context when at the top/bottom of the file.
set scrolloff=2

set guioptions=egt  " GUI options
syntax on

" use folding by default
set foldmethod=marker

" Turn on mouse for a visual and normal mode only:
set mouse=v

set diffopt=filler,iwhiteall,vertical,hiddenoff,internal,indent-heuristic,algorithm:patience
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

" complete commands that are uppercase in command mode.
set smartcase

" file expansion in ex mode, caseless:
set wildignorecase
" For file completion in command line mode, complete to the longest common
" string of a file (and show the options), rather than auto picking the first
" completion:
set wildmenu
set wildmode=longest:full,full
set wildcharm=<C-Z>

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

function! LightlineMode()
  return lightline#mode()[0:0]
endfunction
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ],
      \             [ 'indent', 'fileformat', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'indent': '%{&expandtab?"s":"t"}%{&tabstop}',
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

let g:grepper = {}
let g:grepper.open = 1
let g:grepper.stop = 300
let g:grepper.tools = ['git', 'ag', 'sift']

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

let g:ale_lint_delay = 500
let g:ale_lint_on_enter = 0
let g:ale_completion_enabled = 0
let g:ale_set_highlights = 0
let g:ale_lint_on_text_changed = 'normal'
Repeatable nmap [g <Plug>(ale_previous)
Repeatable nmap ]g <Plug>(ale_next)
" nmap <leader>h :ALEHover<cr>
let g:ale_linters = {
      \ 'python': ['black', 'pyls', 'isort', 'trim_whitespace'],
      \ 'javascript': ['eslint'],
      \ 'scss': ['stylelint']
      \ }

" Map indent motions to a more indent-like key
let g:indentwise_suppress_keymaps = 1
map [iI <Plug>(IndentWisePreviousLesserIndent)
map [ii <Plug>(IndentWiseBlockScopeBoundaryBegin)
sunmap [ii
sunmap [iI
map ]iI <Plug>(IndentWiseNextLesserIndent)
map ]ii <Plug>(IndentWiseBlockScopeBoundaryEnd)
sunmap ]ii
sunmap ]iI


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
let g:gutentags_ctags_exclude = [ '*.json', '*.md', '*/node_modules/*', '*/bower_components/*',
      \ 'tags', '*.sql', '*.html', '*/public/assets/*']

" Color brackets and HTML/XML:
let g:rainbow_active = 1

let g:mundo_verbose_graph = 0
let g:mundo_mirror_graph = 1
let g:mundo_prefer_python3 = 1
let g:mundo_help = 0
let g:mundo_inline_undo = 1

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 4
" don't include tabs in 'soft' tabs - I want to see when things are amiss.
" let g:indent_guides_soft_pattern = ' '

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
let g:switch_custom_definitions =
    \ [
    \ { '&&': '||' }, { '||': '&&' },
    \ { '==': '!=' }, { '!=': '==' },
    \ { 'FALSE': 'TRUE' }, { 'TRUE': 'FALSE' },
    \ { 'INFO': 'DEBUG' }, { 'DEBUG': 'INFO' },
    \ { 'align': 'justify' }, { 'justify': 'align' },
    \ { 'and': 'or' }, { 'or': 'and' },
    \ { 'assertContains': 'assertNotContains' }, { 'assertNotContains': 'assertContains' },
    \ { 'assertFalse': 'assertTrue' }, { 'assertTrue': 'assertFalse' },
    \ { 'assertIn': 'assertNotIn' }, { 'assertNotIn': 'assertIn' },
    \ { 'before': 'after' }, { 'after': 'before' },
    \ { 'columns': 'rows' }, { 'rows': 'columns' },
    \ { 'disabled': 'enabled' }, { 'enabled': 'disabled' },
    \ { 'even': 'odd' }, { 'odd': 'even' },
    \ { 'first': 'last' }, { 'last': 'first' },
    \ { 'info': 'debug' }, { 'debug': 'info' },
    \ { 'left': 'right' }, { 'right': 'left' },
    \ { 'max': 'min' }, { 'min': 'max' },
    \ { 'padding': 'margin' }, { 'margin': 'padding' },
    \ { 'present': 'absent' }, { 'absent': 'present' },
    \ { 'public': 'private' }, { 'private': 'protected' }, { 'protected': 'public' },
    \ { 'top': 'bottom' }, { 'bottom': 'top' },
    \ { 'up': 'down' }, { 'down': 'up' },
    \ { 'width': 'height' }, { 'height': 'width' },
    \ { 'yes': 'no' }, { 'no': 'yes' },
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

let g:Lf_WindowHeight = 0.2
let g:Lf_PopupWidth = 0.9
nnoremap <C-p> :Leaderf file --nowrap<CR>
" User iterm2 to map shift-ctrl-p to <f15>
nnoremap <F15> :Leaderf mru --cwd --nowrap<CR>
nnoremap <C-t> :Leaderf tag --nowrap<CR>
" User iterm2 to map shift-ctrl-t to <f16>
nnoremap <F16> :Leaderf bufTag --nowrap<CR>

" save my right pinky some pain:
nnoremap <leader>t zt
nnoremap <leader>b zb
nnoremap <leader>, zz

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
let g:AutoPairsMultilineClose=0

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

" nnoremap <silent> <leader>dc :call lsp#text_document_declaration()<CR>
" nnoremap <silent> <leader>dd :call lsp#text_document_definition()<CR>
" nnoremap <silent> <leader>dh  :call lsp#text_document_hover()<CR>
" nnoremap <silent> <leader>di  :call lsp#text_document_implementation()<CR>
" nnoremap <silent> <leader>ds  :call lsp#text_document_signature_help()<CR>
" nnoremap <silent> <leader>dt :call lsp#text_document_type_definition()<CR>
" nnoremap <silent> <leader>dD <Plug>DashSearch
nnoremap <silent> <leader>dd :call <SID>show_documentation()<CR>
nnoremap <silent> <leader>df <Plug>(coc-definition)<cr>
nnoremap <silent> <leader>dc <Plug>(coc-declaration)<cr>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <leader>o :only<cr>
nnoremap <leader>' :q<cr>
nnoremap <leader>n <c-w>_
nnoremap <leader>gg :G<cr>
nnoremap <leader>. :E
map <leader>co :copen<cr>
map <leader>lo :lopen<cr>

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
" quick jump up to the previous line in insert mode: (this overrides the default
" c-e that repeats the character above...but I don't use it that much)
inoremap <C-e> <C-o>:norm k$<Enter>

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
noremap <leader>/f :exec "Grepper -jump -tool ag -noprompt -query ". expand("%:t:r:r")<CR>
noremap <leader>/g :Grepper -tool ag -jump<cr>
noremap <leader>/a :AA 
" see all the search matches in a separate window
noremap <leader>// :exec "Grepper -jump -tool ag -noprompt -query ". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ." ". expand('%')<CR>

" unimpaired like mapping for diff option for ignoring whitespace.
noremap ]oI :set diffopt-=iwhiteall<cr>
noremap [oI :set diffopt+=iwhiteall<cr>

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
map - :e %:h/<CR>

" Use gp to select the last pasted region.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" toggle Sluice gutters
nnoremap <F3> :SluiceMacroOff <bar> SluiceToggle<CR>
nnoremap <F4> :SluiceMacroOn <bar> SluiceToggle<CR>

" automatically toggle with control-
let g:switch_mapping = ',gs'

" TODO Serach for files with CtrlP for files matching the name of the file under
" the cursor:

vmap <leader>v :VSSplit<cr>

" Django: find the urls.py definition of the 'url name' under the cursor
" let g:django_lookup_url_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:GrepperAg \<c-r>\" -G urls.py\<cr>"
" let g:django_lookup_view_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:GrepperAg \<c-r>\" -G urls.py\<cr>"
" map <leader>ju :let @z=g:django_lookup_url_recording<cr>@z
" map <leader>jv :let @z=g:django_lookup_view_recording<cr>@zF,b<c-]>
"
" " Python: replace a multiline # COMMENT with a """ COMMENT """
" let g:python_replace_pound_comment='gcacgpJ:s/\v^(\s+)(.*)$/\1""" \2 """\gqq'
" map <leader>jc :let @z=g:python_replace_pound_comment<cr>@z

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
" :set inccommand=
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

" Execute something on all files of the same kind:
"
" See GG and AA commands:
function! s:ExecFileType(cmd,search)
  let l:extension = substitute(expand('%'),'\v^.*\.','','')
  " save the last search as this so that */# work:
  let @/ = a:search
  exec printf('silent %s',printf(a:cmd,a:search,l:extension))
endfunction

cnoremap AG GrepperAg
command! -nargs=1 GG call s:ExecFileType("silent GrepperGit %s -- '*.%s'",'<args>')
command! -nargs=1 AA call s:ExecFileType("silent GrepperAg '%s' -G '.*.%s'",'<args>')
" TODO make Ggrep be test for the command...for non git projects, fallback on Ag
" Something like :if exists(':Ggrep')
command! -nargs=1 Gg exec "silent GrepperGit -jump ". '<args>'
command! -nargs=1 Aa exec "silent GrepperAg -jump ". '<args>'

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

function! s:DiffRegisters(register_a, register_b)
  " Diff two registers. Example:
  " DiffRegisters a b
  new
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  exec "silent put ". a:register_a
  diffthis
  vnew
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  exec "silent put ". a:register_b
  diffthis
  resize 100
endfunction
command! -nargs=* DiffRegisters call s:DiffRegisters(<f-args>)

function! s:ResetGutentags()
  if exists('b:gutentags_files')
    unlet b:gutentags_files
  endif
  call gutentags#setup_gutentags()
endfunction

command! -nargs=0 GutentagsReset call s:ResetGutentags()

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

  autocmd FileType htmldjango SS s 4

  " Rainbow tags look crappy in htmldjango -- this autocmd isn't really working :/
  autocmd FileType htmldjango RainbowToggleOff

  " autocmd Filetype javascript setl omnifunc=lsp#omnifunc

  autocmd BufNewFile,BufRead *.scss,*.css lua require'colorizer'.setup()
  autocmd BufNewFile,BufRead *.j2 setf jinja
  autocmd BufNewFile,BufRead *.md setf markdown
  autocmd BufNewFile,BufRead *.md setlocal spell wrap et
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufEnter *.py :SS s 4
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby

  " Some other ruby project is tromping over the gutentags files - manually
  " reload every time we enter:
  autocmd BufRead *.rb  :GutentagsReset
  autocmd BufRead *.slim  :GutentagsReset
  autocmd BufRead *.haml  :GutentagsReset

  " show line numbers for tests:
  autocmd BufNewFile,BufReadPost test*.py,*test.py,*spec.rb :setlocal number

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " close the quickfix window when an item is selected.
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
  autocmd FileType qf setlocal colorcolumn=
  " autocmd FileType qf syntax match ConcealedPath /\v^[^|]*\// conceal
  " autocmd FileType qf syntax match VisiblePath /\v^([^|]+\|){2}/
  " autocmd FileType qf highlight link VisiblePath Folded
endif
"}}}
" vim: set ai fdm=marker cms="%s:
