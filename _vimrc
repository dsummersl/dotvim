" vundle plugin options {{{

let g:plug_url_format="git@github.com:%s.git"
so ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/bundle')

Plug 'junegunn/goyo.vim' " Writer mode via :Goyu

Plug 'pgdouyon/vim-evanesco' " Highlight search, clear after searching
Plug 'junegunn/goyo.vim' " Writer mode via :Goyu
Plug 'MarcWeber/vim-addon-local-vimrc' " enable project local .vimrc files
Plug 'davidhalter/jedi-vim' " python support <Leader>d to go to definition.
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
Plug 'tpope/vim-eunuch' " eunuch.vim: cp/move/unlink commands
Plug 'szw/vim-tags'
Plug 'tpope/vim-dispatch' " run make in the background. (used by vim-tags)

Plug 'vim-scripts/repeatable-motions.vim' " Repeat motions with C-[hjkl]
Plug 'AndrewRadev/splitjoin.vim'

" A colorscheme that supports fugitive's [ob and ]ob
Plug 'frankier/neovim-colors-solarized-truecolor-only'
Plug 'morhetz/gruvbox' " gruvbox colors
" Rainbow toggle colorscheme
Plug 'luochen1990/rainbow'

Plug 'leafgarland/typescript-vim', { 'for': 'typescript' }

Plug 'rizzatti/dash.vim' " :Dash to look up things
Plug 'janko-m/vim-test' " :TestNearest
Plug 'christoomey/vim-tmux-runner' " :Vtr_endCommandToRunner for tmux
" Lines to quickly resize splits (VSSplit)
Plug 'wellle/visual-split.vim'
Plug 'vim-scripts/highlight.vim'
" Plug 'wincent/ferret' " Enhanced multi-file search for Vim -- doesn't
" support very good editing of the quickfix window.
Plug 'idanarye/vim-yankitute' " Yankitute to copy/paste into a buffer quick
Plug 'benmills/vimux' " Run golang tests using vimux
Plug 'digitaltoad/vim-jade' " Vim Jade template engine syntax highlighting and indention
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim' " 4.9   vimscript for gist
Plug 'editorconfig-vim' " 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
Plug 'nathanaelkane/vim-indent-guides' " A Vim plugin for visually displaying indent levels in code
" fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
Plug 'mattn/emmet-vim'
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-scripts/applescript.vim', { 'for': 'applescript' }
" editing CSV docs, super handily.
" TODO update this repo so that people know to look for chrisba
Plug 'dsummersl/wikia-csv'
" Plug 'chrisba/csv.vim'
" simple utf2ascii function.
Plug 'dsummersl/vim-utf2ascii'
" snippets
Plug 'derekwyatt/vim-scala', { 'for': 'scala' }
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
" Plug 'kchmck/vim-coffee-script'
" TODO this? Its a dependency for a number of libs?
Plug 'PProvost/vim-ps1'
" TODO this? Its a dependency for a number of libs?
Plug 'L9'
Plug 'vim-scripts/LargeFile'
Plug 'vim-scripts/genutils'
Plug 'gregsexton/gitv'
Plug 'vim-scripts/visualrepeat'
" quick find method definitions:
Plug 'Shougo/unite.vim'
Plug 'osyo-manga/unite-quickfix'
Plug 'majutsushi/tagbar'
" allow the quicklist to be edited :cw, 'i'. :QFLoad and :LocSave
Plug 'jceb/vim-editqf'
" JSX support
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
" javascript omni integration
Plug 'marijnh/tern_for_vim', { 'do': 'npm install' }
Plug 'Shougo/vimproc'
" syntax hilighting for actionscript
Plug 'jeroenbourgois/vim-actionscript'
" automatically detect the indent style of the document
" TODO try https://github.com/roryokane/detectindent
Plug 'raymond-w-ko/detectindent'
Plug 'Raimondi/delimitMate' " close quotes and such automatically
Plug 'junegunn/vim-easy-align' " A simple Vim alignment plugin
Plug 'justinmk/vim-sneak' " Sneak is a minimalist, versatile Vim motion plugin that jumps to any location specified by two characters
Plug 'ervandew/ag' " vim plugin to search using the silver searcher (ag)
Plug 'tommcdo/vim-exchange' " Easy text exchange operator for Vim
" Plug 'nelstrom/vim-visual-star-search' " use #/* in visual mode for searching
Plug 'bigfish/vim-js-context-coloring', { 'do': 'npm install --update' }

" vaf/vif for functions
Plug 'kana/vim-textobj-function'
" via (visual inner arg)
Plug 'vim-scripts/argtextobj.vim'
" viI (visual inner Indent)
Plug 'michaeljsmith/vim-indent-object'
" user defined textobj implementations
Plug 'kana/vim-textobj-user'
" vay viy to select syntax blocks
Plug 'kana/vim-textobj-syntax'
Plug 'landock/vim-expand-region'
" select comment with vic or vac.
Plug 'glts/vim-textobj-comment'
" vib between any arbitrary object (vibX where X is the obj)
Plug 'thinca/vim-textobj-between'

" Easily toggle boolean values:
Plug 'AndrewRadev/switch.vim'
" utility functions
" a hash implementation - make it easy to compute the hash of a string in the
" editor (ie, yank a block, then do :echo _#hash(@") )
Plug 'dsummersl/vus'
" unit testing for vim.
Plug 'dsummersl/vimunit'

" TODO jcfaria/Vim-R-plugin
" TODO https://github.com/vim-scripts/PatternsOnText - delete/replace non
" matches (also has some quicklist looking stuff).
" TODO move text blocks easily through )}" : https://github.com/vim-scripts/easy-through-pairing.vim
" TODO use count in front of jk control keys: https://github.com/vim-scripts/rel-jump

" Probably going to remove these:
" colorize ansi escaped text (console dumps)
Plug 'vim-scripts/AnsiEsc.vim', { 'on': 'AnsiEsc' }
Plug 'vim-scripts/cecutil'

" GUI & version specific settings (7+) "{{{

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'zchee/deoplete-jedi'
  Plug 'kassio/neoterm'
  Plug 'benekastah/neomake'
endif

" for the latest version I am both gui/console enabled!
if v:version >= 704
  set termguicolors
  set t_Co=256
  let g:solarized_termcolors=256
  " vi/ (last search)
  Plug 'kana/vim-textobj-lastpat'
  " A better powerline plugin:
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Plug 'ryanoasis/vim-devicons'
  " Plug 'Valloric/YouCompleteMe', { 'do': './install.py' }
  Plug 'SirVer/ultisnips'
endif

if v:version >= 703
  set undofile
  set undodir=~/.vim/undo
  " This f's with neovim
  " Plug 'https://github.com/godlygeek/csapprox'
  Plug 'dsummersl/gundo.vim', { 'branch': 'mundomaster' }
  Plug 'honza/vim-snippets'
  " sluice side screen control
  Plug 'dsummersl/vim-sluice'
  Plug 'ap/vim-css-color'
endif
"}}}

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

  let macvim_skip_colorscheme = 1
  set background=light
  let g:gruvbox_italic = 0
  let g:gruvbox_contrast_light = 'soft'
  colorscheme gruvbox
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

    " unicode symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
  else
    " unicode symbols
    let g:airline_left_sep = '⮀'
    let g:airline_left_alt_sep = '⮁'
    let g:airline_right_sep = '⮂'
    let g:airline_right_alt_sep = '⮃'
  endif

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif
  let g:airline_symbols.linenr = '␊'
  let g:airline_symbols.linenr = '␤'
  let g:airline_symbols.linenr = '¶'
  let g:airline_symbols.branch = '⎇'
  let g:airline_symbols.paste = 'ρ'
  let g:airline_symbols.paste = 'Þ'
  let g:airline_symbols.paste = '∥'
  let g:airline_symbols.whitespace = 'Ξ'

  set cursorline
  " show column markers beyond the 80, 100, 120
  set colorcolumn=+0,-1,-2,+20
endif
" }}}
" basic options {{{

set conceallevel=1 " for ToggleGroupConceal
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

" Turn on mouse for a normal mode only:
set mouse=n

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

" show replace previews
if has('nvim')
  set inccommand=split
endif

"}}}
" Plugin settings, changes."{{{

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

let g:splitjoin_python_brackets_on_separate_lines = 1

let g:vim_tags_use_vim_dispatch = 1
let g:vim_tags_ignore_files = ['.gitignore', '.svnignore', '.cvsignore', '.hgignore']

let g:rainbow_active = 1

let delimitMate_expand_cr = 2
let delimitMate_jump_expansion = 1
let delimitMate_expand_space = 1

" call unite#filters#matcher_default#use(['matcher_fuzzy'])
" call unite#filters#sorter_default#use(['sorter_rank'])
" call unite#custom#profile('files', 'filters', ['sorter_rank'])
" call unite#custom#profile('default', 'source/outline', { 'ignorecase': 1 })

let g:neomake_airline = 1
let g:neomake_python_enabled_makers = [ 'flake8' ]
" let g:neomake_javascript_enabled_makers = [ 'jshint' ]

let g:mundo_verbose_graph = 0
let g:mundo_mirror_graph = 1
let g:mundo_prefer_python3 = 1
let g:mundo_help = 1

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 4
" don't include tabs in 'soft' tabs - I want to see when things are amiss.
" let g:indent_guides_soft_pattern = ' '

let g:js_context_colors = [ 22, 28, 34, 106, 178, 166, 124 ]
let g:js_context_colors_enabled = 0

vmap <Enter> <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(LiveEasyAlign)

" quit multicursor mode!
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<C-c>'

" let the narrow region plugin NR functions automatically update the window
" location on change:
let g:narrow_rgn_update_orig_win = 1
let g:nrrw_rgn_update_orig_win = 1

let g:fugitive_git_executable = '/usr/local/bin/git'

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
    \ { '\([^=]\)===\([^=]\)': '\1==\2' },
    \ { '\([^=]\)==\([^=]\)': '\1===\2' },
    \ { 'FALSE': 'TRUE' },
    \ { 'TRUE': 'FALSE' },
    \ { 'left': 'right' },
    \ { 'right': 'left' },
    \ { 'up': 'down' },
    \ { 'down': 'up' },
    \ { 'top': 'bottom' },
    \ { 'bottom': 'top' },
    \ { 'first': 'last' },
    \ { 'last': 'first' },
    \ { 'public': 'private' },
    \ { 'private': 'protected' },
    \ { 'protected': 'public' },
    \ { 'INFO': 'DEBUG' },
    \ { 'DEBUG': 'INFO' },
    \ { 'info': 'debug' },
    \ { 'debug': 'info' },
    \ { 'assertFalse': 'assertTrue' },
    \ { 'assertTrue': 'assertFalse' },
    \ { 'assertIn': 'assertNotIn' },
    \ { 'assertNotIn': 'assertIn' },
    \ { 'assertContains': 'assertNotContains' },
    \ { 'assertNotContains': 'assertContains' }
    \ ]

" don't use vif (thats a function, duh!)
let g:textobj_between_no_default_key_mappings=0
" use vib and vab instead
xmap ab  <Plug>(textobj-between-a)
omap ab  <Plug>(textobj-between-a)
xmap ib  <Plug>(textobj-between-i)
omap ib  <Plug>(textobj-between-i)

" enable yanks!
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
" I like the unite thing on the left side all get it going:
let g:unite_enable_split_vertically=1
let g:unite_winwidth=60

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
      \ --ignore "**/*.pyc"
      \ -g ""'

" Map <C-p> to most recent files
let g:ctrlp_cmd = 'CtrlPMRUFiles'
" Map <C-S-p> to all files (iTerm mapping of that combo to <F15>): 
map <F15> :CtrlP<cr>

" only show MRU files in the working directory
let g:ctrlp_mruf_relative = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 1
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" just use the pwd when finding files.
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn|$'
" by default ignore subversion things and swap file
set wildignore+=*/*.sw?,*/*.pyc,*/*.class
" enable the quickfix plugin source:
let g:ctrlp_extensions=['changes']


let g:tagbar_autofocus = 1
let g:tagbar_autoclose = 1

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

" Unite outline mode
nnoremap <C-t> :TagbarToggle<cr>
map <M-t> :CtrlPBufTag<cr>
" User iterm2 to map shift-ctrl-t to <f16>
map <F16> :CtrlPTag<cr>

" save my right pinky some pain:
nnoremap <Leader>t zt
nnoremap <Leader>b zb
nnoremap <Leader>, zz

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

" I want to see all the options when I try to jump to a tag:
nmap <C-]> g<C-]>

" map <Leader>dd :TernDef<cr>
nmap <silent> <leader>D <Plug>DashSearch

" I like using sort in netrw
let g:sneak#map_netrw = 0
" and I like not having to do uppercases:
let g:sneak#use_ic_scs = 1

"replace 'f' with 1-char Sneak
nmap f <Plug>Sneak_f
nmap F <Plug>Sneak_F
xmap f <Plug>Sneak_f
xmap F <Plug>Sneak_F
omap f <Plug>Sneak_f
omap F <Plug>Sneak_F

"replace 't' with 1-char Sneak
nmap t <Plug>Sneak_t
nmap T <Plug>Sneak_T
xmap t <Plug>Sneak_t
xmap T <Plug>Sneak_T
omap t <Plug>Sneak_t
omap T <Plug>Sneak_T

cabbrev bda call DeleteHiddenBuffers()
cabbrev gitv Gitv
cabbrev ag Ag
cabbrev gg GG
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
noremap <Leader>y "*y
" copy the current filename and line number into the clipboard
noremap <Leader>f :let @+=expand("%") .'#'. line(".")<CR>

" see all the search matches in a separate window (narrow region)
noremap <Leader>/ :exec "Unite -direction=dynamicbottom -horizontal -input=". escape(@/,' ') ." -no-start-insert line"<cr>
" unimpaired like mapping for diff option for ignoring whitespace.
noremap ]oI :set diffopt-=iwhite<cr>
noremap [oI :set diffopt+=iwhite<cr>

" For function arguments, move the current argument (parameter) to the left or to the
" right.
map <silent> <Plug>MoveTermLeft cxiaF,hcxia:call repeat#set("\<Plug>MoveTermLeft")<CR>
map <Leader>ah <Plug>MoveTermLeft 
map <silent> <Plug>MoveTermRight cxiaf,cxia:call repeat#set("\<Plug>MoveTermRight")<CR>
map <Leader>al <Plug>MoveTermRight 

" When in Gstatus jump to the next file in the list and diff it.
map <silent> <Plug>MoveDownGstatusAndDiff <C-w>l<C-w>kjdv:call repeat#set("\<Plug>MoveDownGstatusAndDiff")<CR>
map <Leader>gj <Plug>MoveDownGstatusAndDiff 
map <silent> <Plug>MoveUpGstatusAndDiff <C-w>l<C-w>kkdv:call repeat#set("\<Plug>MoveUpGstatusAndDiff")<CR>
map <Leader>gk <Plug>MoveUpGstatusAndDiff 

" yank a block by the whole line.
map <Leader>ya} va}Vy
map <Leader>yi} vi}Vy

" Setup a delete out block function that supports repeatability.
nnoremap <silent> <Plug>DeleteCurlyBlock va}Vd:call repeat#set("\<Plug>DeleteCurlyBlock")<CR>
map <Leader>da} <Plug>DeleteCurlyBlock 

" Send a selection to the terminal:
map <Leader>cls :TREPLSendSelection<CR>
map <Leader>cll :TREPLSendLine<CR>
map <Leader>cc :Ttoggle<CR>
map <Leader>ctn :TestNearest<CR>
map <Leader>cts :TestSuite<CR>
map <Leader>ctf :TestFile<CR>
map <Leader>ctl :TestLast<CR>

" Open the current directory (or make new directory)
map <Leader>ep :e %:h/<C-d>

" Use gp to select the last pasted region.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

" Undo highlighting.
nnoremap <Leader>s :nohls<Enter>

" toggle Sluice gutters
nnoremap <F3> :SluiceMacroOff <bar> SluiceToggle<CR>
nnoremap <F4> :SluiceMacroOn <bar> SluiceToggle<CR>

" in insert mode, move up/down two line and stay in insert mode.
inoremap <C-D> <esc>o
inoremap <C-U> <esc>O

" automatically toggle with control-
nnoremap <Leader>. :Switch<cr>

" Search for occurrences of the word under the cursor:
map <Leader>sw yiw:let @/=@"<cr>:Ag <C-r>"<cr>:GCL<cr>

nnoremap <Leader>gl :GCL<cr>
nnoremap <Leader>ll :GLL<cr>

vmap <Leader>v :VSSplit<cr>

" Django: find the urls.py definition of the 'url name' under the cursor
let g:django_lookup_url_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:Ag \<c-r>\" -G urls.py\<cr>"
let g:django_lookup_view_recording=":let b:isk_back=&isk\<cr>:set isk+=-\<cr>viwy:exe \"set isk=\". b:isk_back\<cr>:Ag \<c-r>\" -G urls.py\<cr>"
map <Leader>du :let @z=g:django_lookup_url_recording<cr>@z
map <Leader>dv :let @z=g:django_lookup_view_recording<cr>@zF,b<c-]>

"}}}
" Commands"{{{

map <leader>ch :call ToggleSearchConceal()<CR>

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
  Unite quickfix -smartcase -no-start-insert -immediately -horizontal -direction=dynamicbottom
endfunction
function! s:UniteLocationList()
  Unite location_list -smartcase -direction=dynamicbottom -no-start-insert -immediately -horizontal
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

  " autocmd BufNewFile,BufRead * hi Search ctermfg=black ctermbg=gray guifg=#697b7d guibg=#93a4a6
  autocmd BufNewFile,BufRead *.rabl setf eruby
  autocmd BufNewFile,BufRead *.eco setf eruby
  autocmd BufNewFile,BufRead *.md setf markdown
  autocmd BufNewFile,BufRead *.md setlocal spell fo-=tn wrap et
  autocmd BufNewFile,BufRead *.pp setf ruby
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufEnter *.py :SS s 4
  autocmd BufNewFile,BufRead *.gradle set ft=groovy
  autocmd BufNewFile,BufRead *.rst set ft=markdown
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby
  autocmd BufNewFile,BufRead *.tss set ft=javascript
  autocmd BufNewFile,BufRead *.coffee set ft=coffee
  autocmd BufNewFile,BufRead Cakefile set ft=coffee
  if has('nvim')
    autocmd BufReadPost,BufWritePost * Neomake
  endif

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd FileType groovy setlocal ai
endif
"}}}
" vim: set ai fdm=marker cms="%s:
