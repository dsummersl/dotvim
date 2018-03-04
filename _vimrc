" vundle plugin options {{{

let g:plug_url_format="git@github.com:%s.git"
so ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/bundle')

" <---- plugins in testing ---->
Plug 'joereynolds/gtags-scope'
Plug 'jsfaint/gen_tags.vim'
Plug 'mattboehm/vim-unstack'
Plug 'chrisbra/vim-diff-enhanced' " PatiencDiff and EnhanceDiff
Plug 'idanarye/vim-yankitute' " Yankitude for copying into registers
Plug 'junegunn/goyo.vim' " Writer mode via :Goyu
Plug 'brooth/far.vim' " :Far for easy search replace
" TODO jcfaria/Vim-R-plugin
" TODO https://github.com/vim-scripts/PatternsOnText - delete/replace non
" matches (also has some quicklist looking stuff).
" TODO move text blocks easily through )}" : https://github.com/vim-scripts/easy-through-pairing.vim
" TODO use count in front of jk control keys: https://github.com/vim-scripts/rel-jump
" <---- end plugins in testing ---->

Plug 'machakann/vim-highlightedyank' " highlight any text as it is yanked
Plug 'pgdouyon/vim-evanesco' " Highlight search, clear after searching
Plug 'MarcWeber/vim-addon-local-vimrc' " enable project local .vimrc files
Plug 'okcompute/vim-python-motions' " ]] ]C ]M to move between methods
Plug 'tpope/vim-fugitive' " git
Plug 'tpope/vim-rhubarb' " Gbrowse 
Plug 'godlygeek/csapprox' " neovim coloring for gblame
Plug 'ludovicchabant/vim-lawrencium' " mercurial (hg)
Plug 'tpope/vim-abolish' " fix spelling errors
" surround things with quotes, etc (csw - surround word)
Plug 'tpope/vim-surround'
" many additional mappings for ]q, etc
Plug 'tpope/vim-unimpaired'
" awesome: makes the surround plugin work with the '.' keys (repeatability!)
Plug 'tpope/vim-repeat'
Plug 'kreskij/Repeatable.vim'
Plug 'tpope/vim-eunuch' " eunuch.vim: cp/move/unlink commands

Plug 'vim-scripts/repeatable-motions.vim' " Repeat motions with C-[hjkl]
Plug 'AndrewRadev/splitjoin.vim' " Gs to split long lines

" A colorscheme that supports fugitive's [ob and ]ob
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'morhetz/gruvbox' " gruvbox colors
Plug 'romainl/Apprentice'
Plug 'rakr/vim-one'
Plug 'rakr/vim-two-firewatch'
Plug 'luochen1990/rainbow' " Rainbow toggle colorscheme

" Language specific plugins:
Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }
Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'davidhalter/jedi-vim' " python support <leader>d to go to definition.
" TODO update this repo so that people know to look for chrisba
Plug 'dsummersl/wikia-csv' " editing CSV docs, super handily.
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'jeroenbourgois/vim-actionscript'
Plug 'wavded/vim-stylus' " syntax hilighting for stylus files
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }

Plug 'janko-m/vim-test' " :TestNearest
Plug 'christoomey/vim-tmux-runner' " :Vtr_endCommandToRunner for tmux
Plug 'benmills/vimux' " Run golang tests using vimux

Plug 'wellle/visual-split.vim' " I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
Plug 'digitaltoad/vim-jade' " Vim Jade template engine syntax highlighting and indention
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " 4.9   vimscript for gist
Plug 'editorconfig/editorconfig-vim' " 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
Plug 'nathanaelkane/vim-indent-guides' " A Vim plugin for visually displaying indent levels in code
Plug 'mattn/emmet-vim' " fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nixprime/cpsm'
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
Plug 'gregsexton/gitv'
Plug 'vim-scripts/visualrepeat'
" quick find method definitions:
Plug 'Shougo/denite.nvim'
Plug 'dsummersl/denite-extra', { 'branch': 'store-quickfix-location' }
Plug 'majutsushi/tagbar'
" javascript omni integration
Plug 'Shougo/vimproc'
" automatically detect the indent style of the document
" TODO try https://github.com/roryokane/detectindent
Plug 'vim-scripts/detectindent'
Plug 'jiangmiao/auto-pairs' " close quotes and such automatically
Plug 'junegunn/vim-easy-align' " A simple Vim alignment plugin
Plug 'justinmk/vim-sneak' " f t s ; . mappings - jump to any location specified by two characters
Plug 'ervandew/ag' " vim plugin to search using the silver searcher (ag)
Plug 'tommcdo/vim-exchange' " Easy text exchange operator for Vim
" Plug 'nelstrom/vim-visual-star-search' " use #/* in visual mode for searching
" Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install --update' }

Plug 'wellle/targets.vim' " many text objects
Plug 'kana/vim-textobj-function' " vaf/vif for functions
Plug 'michaeljsmith/vim-indent-object' " viI (visual inner Indent)
Plug 'kana/vim-textobj-user' " user defined textobj implementations
Plug 'kana/vim-textobj-syntax' " vay viy to select syntax blocks
Plug 'landock/vim-expand-region' " use + and _ to expand the visual selection
Plug 'glts/vim-textobj-comment' " select comment with vic or vac.
Plug 'thinca/vim-textobj-between' " vib between any arbitrary object (vibX where X is the obj)
Plug 'kana/vim-textobj-lastpat' " vi/ (last search)

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

Plug 'dsummersl/gundo.vim'
Plug 'honza/vim-snippets'
Plug 'dsummersl/vim-sluice'
Plug 'ap/vim-css-color'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'kassio/neoterm'
  Plug 'benekastah/neomake'
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

  colorscheme one

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
  " show column markers beyond the 80, 100, 120
  set colorcolumn=+0,-1,-2,+20
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
set scrolloff=1

set guioptions=egt  " GUI options
syntax on

" use folding by default
set fdm=marker

" Turn on mouse for a visual and normal mode only:
set mouse=vn

" improve syntax highlighting speed in general
syntax sync minlines=64
syntax sync maxlines=128
set synmaxcol=256

set diffopt=filler,iwhite
set nohls
set nowrap

" TABS, and tab size of two characters
set noet
set sw=2
set ts=2
set sts=2

set visualbell
" allow backspacing over everything in insert mode
set backspace=2
set nobackup
set incsearch

" file expansion in ex mode, caseless:
set wildignorecase

let mapleader=","

set viminfo='50,\"50,h
set history=100 " keep 100 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.
set encoding=utf-8

" Setup a vertical higlight for the 80+ column positions:
set textwidth=80
set fo=croq

" when wrap is turned on, break on words
set linebreak

" let macros go faster
set lazyredraw

" For file completion in command line mode, complete to the longest common
" string of a file (and show the options), rather than auto picking the first
" completion:
set wildmenu
set wildmode=longest:full,full

" show replace previews
if has('nvim')
  set inccommand=split
endif

"}}}
" Plugin settings, changes."{{{

call repeatable#Setup()

" started In Diff-Mode set diffexpr (plugin not loaded yet)
let &diffexpr='EnhancedDiff#Diff("git diff", "--diff-algorithm=patience")'

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
let test#strategy = 'vtr'
let test#transformation = 'last'
let g:test#sub = 'docker-compose run --rm python manage.py test {} | pygmentize -l pytb'
let test#python#runner = 'djangotest'

let g:neoterm_automap_keys = 'cic'
let g:jedi#completions_enabled = 0

let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#max_list = 10
let g:deoplete#auto_complete_delay = 150

let g:splitjoin_trailing_comma = 1

let g:gen_tags#gtags_auto_gen = 1
" let g:gen_tags#blacklist = ['$HOME']

" Color brackets and HTML/XML:
let g:rainbow_active = 1

let delimitMate_expand_cr = 2
let delimitMate_jump_expansion = 1
let delimitMate_expand_space = 1

let g:neomake_airline = 1
let g:neomake_python_enabled_makers = [ 'flake8' ]
" let g:neomake_javascript_enabled_makers = [ 'jshint' ]

let g:mundo_verbose_graph = 0
let g:mundo_mirror_graph = 1
let g:mundo_prefer_python3 = 1
let g:mundo_help = 1
let g:mundo_auto_preview_delay = 1000
let g:mundo_inline_undo_delay = 1000

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 4
" don't include tabs in 'soft' tabs - I want to see when things are amiss.
" let g:indent_guides_soft_pattern = ' '

vmap <Enter> <Plug>(LiveEasyAlign)
nmap <leader>a <Plug>(LiveEasyAlign)

" let the narrow region plugin NR functions automatically update the window
" location on change:
let g:narrow_rgn_update_orig_win = 1
let g:nrrw_rgn_update_orig_win = 1

" let g:fugitive_git_executable = '/usr/local/bin/git'

let g:detectindent_preferred_indent = 2
let g:detectindent_preferred_expandtab = 2
let g:detectindent_max_lines_to_analyse = 64
let g:detectindent_min_indent = 2

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
    \ { '\([^=]\)===\([^=]\)': '\1==\2' }, { '\([^=]\)==\([^=]\)': '\1===\2' },
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
    \ { 'assertContains': 'assertNotContains' }, { 'assertNotContains': 'assertContains' }
    \ ]

" don't use vif (thats a function, duh!)
let g:textobj_between_no_default_key_mappings=0
" use vib and vab instead
xmap ab  <Plug>(textobj-between-a)
omap ab  <Plug>(textobj-between-a)
xmap ib  <Plug>(textobj-between-i)
omap ib  <Plug>(textobj-between-i)

" pathing for abolish
set rtp+=~/.vim/after

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips']
let g:UltiSnipsPythonPath="/usr/local/bin/python"
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"
let g:UltiSnipsListSnippets='<C-\>'
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<Tab>"                                           
let g:UltiSnipsJumpBackwardTrigger="<S-Tab>"

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

let g:sluice_default_macromode=1
" SluiceEnablePlugin undercursor

" show diff with git
nnoremap <F6> :Gvdiff<CR>
nnoremap <F7> :TestLast<CR>

" don't search included files by default - it can be fucked up slow:
set complete-=i
set completeopt-=preview

" project loading functions"{{{

function! LoadProject(type,directory)
  " type      = the type of project.
  " directory = Directory of the project to set up for.
  "
  " Load a project. This is a generic function that loads a script for a type
  " of project. Each type of project keeps its functions in a directory
  " named after the project (~/.vim/Project/{type}). When this function is
  " called, the script ~/.vim/Project/{type}/in.vim is executed, with
  " b:proj_cd set to the directory of the project that in.vim should setup
  " for.
  "
  let b:proj_cd=getcwd()
  if (a:directory != '')
    let b:proj_cd=a:directory
  endif
  exec "source ~/.vim/bundle/lookupfile-grep/project/". a:type .".vim"
endfunction
command! -nargs=? -bang -complete=dir ProjectMaven  :call LoadProject("maven",<q-args>)
command! -nargs=? -bang -complete=dir ProjectRails  :call LoadProject("rails",<q-args>)
command! -nargs=? -bang -complete=dir ProjectJava   :call LoadProject("java",<q-args>)
command! -nargs=? -bang -complete=dir ProjectScript :call LoadProject("script",<q-args>)
command! -nargs=? -bang -complete=dir ProjectGrails :call LoadProject("grails",<q-args>)
command! -nargs=? -bang -complete=dir ProjectScala  :call LoadProject("grails",<q-args>)
command! -nargs=? -bang -complete=dir ProjectPython :call LoadProject("grails",<q-args>)
"}}}

" delete all buffers function
function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
"
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

" " In Iterm2 I mapped C-S-' to <f14>
" imap <F14> <C-O>:let g:AutoPairsFlyMode=1<CR>"<C-O>:let g:AutoPairsFlyMode=0<CR>
" " Can't do anything about this - its ^M
" " imap <C-'> <C-O>:let g:AutoPairsFlyMode=1<CR>'<C-O>:let g:AutoPairsFlyMode=0<CR>
" imap <C-]> <C-O>:let g:AutoPairsFlyMode=1<CR>]<C-O>:let g:AutoPairsFlyMode=0<CR>
" " imap <C-0> <C-O>:let g:AutoPairsFlyMode=1<CR>)<C-O>:let g:AutoPairsFlyMode=0<CR>
" " In Iterm2 I mapped C-S-] to <f13>
" imap <F13> <C-O>:let g:AutoPairsFlyMode=1<CR>}<C-O>:let g:AutoPairsFlyMode=0<CR>

" map <leader>dd :TernDef<cr>
" nmap <silent> <leader>D <Plug>DashSearch

" Quickly edit the contents of a register (for macros, say); <leader>m or
" "q<leader>m  to edit register q
" From https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" I like using sort in netrw
let g:sneak#map_netrw = 0
" and I like not having to do uppercases:
let g:sneak#use_ic_scs = 1
let g:sneak#t_reset = 1
" label mode
let g:sneak#label = 1

cabbrev bda call DeleteHiddenBuffers()
cabbrev gitv Gitv
cabbrev ag Ag
cabbrev aa AA
cabbrev gg GG
cabbrev man Man
cabbrev dash Dash

" when switching between the alternate window, automatically save.
inoremap <C-^> <C-O>:e #<CR>
" quick autosave
nnoremap <C-c> :w<CR>
inoremap <C-c> <Esc>

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
" copy the current filename and line number into the clipboard and past register:
noremap <leader>f :let @+=expand("%") .'#'. line(".")<bar>let @"=@+ ."\n"<CR>

" see all the search matches in a separate window (narrow region)
noremap <leader>/ :exec "Denite -auto-resize -input=". substitute(escape(@/,' '),'\\[<>]\{1}','\\b','g') ." -mode=normal line"<cr>
" unimpaired like mapping for diff option for ignoring whitespace.
noremap ]oI :set diffopt-=iwhite<cr>
noremap [oI :set diffopt+=iwhite<cr>

" Swap function arguments, move the argument under the cursor to the left or to
" the right.
Repeatable map <leader>al cxiaf,cxia
Repeatable map <leader>ah cxiaF,hcxia

" When in Gstatus jump to the next file in the list and diff it.
Repeatable map <leader>gj <C-w>l<C-w>kjdv
Repeatable map <leader>gk <C-w>l<C-w>kkdv

" yank a block by the whole line.
map <leader>ya} va}Vy
map <leader>yi} vi}Vy

" Setup a delete out block function that supports repeatability.
Repeatable nnoremap <leader>da} va}Vd
Repeatable nnoremap <leader>da) va)Vd

" Send a selection to the terminal:
map <leader>cls :TREPLSendSelection<CR>
map <leader>cll :TREPLSendLine<CR>
Repeatable map <leader>cc :Ttoggle<CR>
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
Repeatable nnoremap <leader>. :Switch<cr>

" Search for occurrences of the word under the cursor:
map <leader>sw yiw:let @/=@"<cr>:Ag <C-r>"<cr>:GCL<cr>

nnoremap <leader>gl :GCL<cr>
nnoremap <leader>gd :Denite -resume<cr>
nnoremap <leader>ll :GLL<cr>

vmap <leader>v :VSSplit<cr>

" Django: find the urls.py definition of the 'url name' under the cursor
let g:django_lookup_url_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:Ag \<c-r>\" -G urls.py\<cr>"
let g:django_lookup_view_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:Ag \<c-r>\" -G urls.py\<cr>"
map <leader>du :let @z=g:django_lookup_url_recording<cr>@z
map <leader>dv :let @z=g:django_lookup_view_recording<cr>@zF,b<c-]>

" From a 'diff view' in gitv, got back to the list of files one got there from.
let g:gitv_revert_to_overview=""
map <leader>gv <C-^><C-w>h:q<cr>

"}}}
" Commands"{{{

" TODO Note that this usually only works if 'syn off' is set - if the text you are
" searching for is on a line with syntax coloring, then it likely will not be
" folded.
map <leader>ch :call ToggleSearchConceal()<CR>

" Sort python imports:
command! -range=% Isort :<line1>,<line2>! isort -

function! ToggleSearchConceal()
  if !exists("b:searchtext")
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
	if !exists("b:set_value")
		let b:set_value = 1
	endif
  let old_value = b:set_value
  let b:set_value += 1
  return old_value
endfunction

" Get the next value, and decrement by two:
function! DV()
	if !exists("b:set_value")
		let b:set_value = 1
	endif
  let old_value = b:set_value
  let b:set_value -= 1
  return old_value
endfunction

function! s:UniteQuickFix()
  Denite quickfix -mode=normal -auto-resize
endfunction
function! s:UniteLocationList()
  Denite location_list -mode=normal -auto-resize
endfunction
" Execute something on all files of the same kind:
"
" See GG and AA commands:
function! s:ExecFileType(cmd,search)
  let extension = substitute(expand('%'),'\v^.*\.',"","")
  exec printf("silent %s",printf(a:cmd,a:search,extension))
  call s:UniteQuickFix()
endfunction

command! -nargs=0 GCL call s:UniteQuickFix()
command! -nargs=0 GLL call s:UniteLocationList()
command! -nargs=1 GG call s:ExecFileType("Ggrep %s -- '*.%s'",'<args>')
command! -nargs=1 AA call s:ExecFileType("Ag %s **/*.%s",'<args>')
command! -nargs=1 Gg exec "Ggrep ". '<args>' | GCL
command! -nargs=1 Aa exec "Ag ". '<args>' | GCL

" TODO automate this diffsplit two matching regions
" let @m=j?<<<jV/^===k"aynjV/^>>>k"by:sp belowggdG"bp:vert diffs aboveggdG"apgglgg:diffupdate=

function! s:SetStop(type,count)
  if a:type == "t"
    set noexpandtab
  else
    set expandtab
  end
  exec "set sw=". a:count
  exec "set ts=". a:count
  exec "set sts=". a:count
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

if has("autocmd") && !exists("autocommands_loaded")
  let autocommands_loaded = 1

  au WinLeave * setlocal nocursorline
  au WinEnter * setlocal cursorline

  " Set a buffer variable and then only call this two time.
  autocmd BufReadPost * :DetectIndent
  autocmd BufNewFile,BufReadPost * :call AutoPairsInit()

  "function! s:SynOffInDiffMode()
  "  if &diff
  "    syntax off
  "  else
  "    syntax on
  "  endif
  "endfunction
  "autocmd BufReadPost * call s:SynOffInDiffMode()

  " ensure that tabstop settings for file browsing is big enough for column
  " alignment:
  autocmd FileType netrw setlocal ts=30

  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby setlocal fdm&
  autocmd FileType sh  setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete

  " use the same comment formatting in groovy/PHP that is used for java:
  autocmd FileType php setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  autocmd FileType php setlocal fo=croq
  autocmd FileType php compiler php
  autocmd FileType groovy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  autocmd FileType groovy setlocal fo=croq
  autocmd FileType htmldjango SS s 4
  " Rainbow tags look crappy in htmldjango
  autocmd FileType htmldjango RainbowToggleOff

  " autocmd BufNewFile,BufRead * hi Search ctermfg=black ctermbg=gray guifg=#697b7d guibg=#93a4a6
  autocmd BufNewFile,BufRead *.j2 setf jinja
  autocmd BufNewFile,BufRead *.md setf markdown
  autocmd BufNewFile,BufRead *.md setlocal spell fo-=tn wrap et
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufEnter *.py :SS s 4
  autocmd BufNewFile,BufRead *.gradle set ft=groovy
  autocmd BufNewFile,BufRead *.rst set ft=markdown
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby
  autocmd BufNewFile,BufRead *.tss set ft=javascript
  autocmd BufNewFile,BufRead *.html.ts set ft=html
  autocmd BufNewFile,BufRead *.coffee set ft=coffee
  autocmd BufNewFile,BufRead Cakefile set ft=coffee
  if has('nvim')
    autocmd BufReadPost,BufWritePost * Neomake
  endif

  " Real broken for carstickers project:
  autocmd BufNewFile,BufReadPost *.html.ts let b:tagbar_ignore = 1

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd FileType groovy setlocal ai
endif
"}}}
" vim: set ai fdm=marker cms="%s:
