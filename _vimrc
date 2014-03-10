" vundle plugin options {{{
if has('vim_starting')
  " vim mode!
  set nocompatible
  filetype off

  set rtp+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#rc(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'

" TODO look into:
" pomodoro reminder plugin: https://github.com/vim-scripts/vim-airline-tomato

" fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
NeoBundle 'mattn/emmet-vim.git'
" debug xdebug
NeoBundle 'joonty/vdebug.git'
NeoBundle 'kien/ctrlp.vim.git'
NeoBundle 'scrooloose/nerdcommenter.git'
NeoBundle 'sukima/xmledit'
NeoBundle 'vim-scripts/applescript.vim'
" editing CSV docs, super handily.
" TODO update this repo so that people know to look for chrisba
NeoBundle 'dsummersl/wikia-csv.git'
" NeoBundle 'chrisba/csv.vim.git'
" simple utf2ascii function.
NeoBundle 'dsummersl/vim-utf2ascii'
NeoBundle 'tpope/vim-fugitive.git'
" snippets
NeoBundle 'guns/ultisnips.git'
NeoBundle 'derekwyatt/vim-scala.git'
NeoBundle 'kchmck/vim-coffee-script'
" surround things with quotes, etc (csw - surround word)
NeoBundle 'tpope/vim-surround.git'
NeoBundle 'nathanaelkane/vim-indent-guides'
" TODO this? Its a dependency for a number of libs?
NeoBundle 'PProvost/vim-ps1'
" TODO this? Its a dependency for a number of libs?
NeoBundle 'L9'
NeoBundle 'vim-scripts/LargeFile.git'
NeoBundle 'vim-scripts/genutils.git'
" TODO do I need both matchit and xmledit?
NeoBundle 'vim-scripts/matchit.zip.git'
" many additional mappings for ]q, etc
NeoBundle 'tpope/vim-unimpaired.git'
NeoBundle 'gregsexton/gitv'
" awesome: makes the surround plugin work with the '.' keys (repeatability!)
NeoBundle 'tpope/vim-repeat'
" via (visual inner arg)
NeoBundle 'vim-scripts/argtextobj.vim'
" fix spelling errors
NeoBundle 'tpope/vim-abolish'
" quick find method definitions:
NeoBundle 'Shougo/unite.vim'
" Nice outline of a file's methods within Unite.
NeoBundle 'Shougo/unite-outline'
" viI (visual inner Indent)
NeoBundle 'michaeljsmith/vim-indent-object'
" allow the quicklist to be edited :cw, 'i'. :QFLoad and :LocSave
NeoBundle 'jceb/vim-editqf'
" javascript omni integration
NeoBundle 'marijnh/tern_for_vim'
NeoBundle 'Shougo/vimproc'
" syntax hilighting for actionscript
NeoBundle 'jeroenbourgois/vim-actionscript'
" use Cdo to quicklist argument modifications
NeoBundle 'dsummersl/vim-cdo'
" Go language autocompletion
NeoBundle 'jnwhiteh/vim-golang'
" automatically detect the indent style of the document
NeoBundle 'raymond-w-ko/detectindent'
" close quotes and such automatically
NeoBundle 'jiangmiao/auto-pairs'
NeoBundle 'tpope/vim-rails'
NeoBundle 'junegunn/vim-easy-align' " A simple Vim alignment plugin
NeoBundle 'danro/rename.vim' " Rename the current file in the vim buffer + retain relative path.
NeoBundle 'tpope/vim-eunuch' " eunuch.vim: cp/move/unlink commands
" TODO try out this seek plugin (sounds better than the original):
"   https://github.com/justinmk/vim-sneak
NeoBundle 'AndrewRadev/splitjoin.vim' " A vim plugin that simplifies the transition between multiline and single-line code
NeoBundle 'ervandew/ag' " vim plugin to search using the silver searcher (ag)
NeoBundle 'tommcdo/vim-exchange' " Easy text exchange operator for Vim
NeoBundle 'bigfish/vim-js-context-coloring', {
  \ 'build' : {
  \     'mac' : 'npm install --update',
  \     'unix' : 'npm install --update',
  \    },
  \ }

" user defined textobj implementations
NeoBundle 'kana/vim-textobj-user'
" vib between any arbitrary object
NeoBundle 'thinca/vim-textobj-between'
" provide focus of a selected block into its own buffer via 'NR' 
NeoBundle 'chrisbra/NrrwRgn'
" Easily toggle boolean values:
NeoBundle 'AndrewRadev/switch.vim'
" TODO automatic ctags generation doesn't seem to work, but I love the idea...
"NeoBundle 'szw/vim-tags'
" run make in the background. (used by vim-tags)
NeoBundle 'tpope/vim-dispatch'
" utility functions
" a hash implementation - make it easy to compute the hash of a string in the
" editor (ie, yank a block, then do :echo _#hash(@") )
NeoBundle 'dsummersl/vus'
" sluice side screen control
NeoBundle 'dsummersl/vim-sluice'
" unit testing for vim.
NeoBundle 'dsummersl/vimunit'

" TODO jcfaria/Vim-R-plugin
" TODO https://github.com/vim-scripts/PatternsOnText - delete/replace non
" matches (also has some quicklist looking stuff).
" TODO move text blocks easily through )}" : https://github.com/vim-scripts/easy-through-pairing.vim
" TODO use count in front of jk control keys: https://github.com/vim-scripts/rel-jump

" python omni completion
" Its annoying b/c it automatically appears when I only want it when I
" explicitly ask for it. Maybe there is a way to configure it that way:
"NeoBundle 'davidhalter/jedi-vim'

" Probably going to remove these:
" colorize ansi escaped text (console dumps)
NeoBundle 'vim-scripts/AnsiEsc.vim'
NeoBundle 'vim-scripts/cecutil.git'
NeoBundle 'vim-scripts/Vimball.git'
" TODO something like yankstack sounds nice but this breaks the vS feature of
" the surround plugin.
"NeoBundle 'maxbrunsfeld/vim-yankstack'

" TODO plugins to think about
" https://github.com/vim-scripts/YankRing.vim
" https://github.com/chrisbra/color_highlight

" GUI & version specific settings (7+) "{{{

set nospell spelllang=en_us

" for the latest version I am both gui/console enabled!
if v:version >= 704
  " base16 color schemes
  NeoBundle 'altercation/vim-colors-solarized'
  " A better powerline plugin:
  NeoBundle 'bling/vim-airline'
  " vi/ (last search)
  NeoBundle 'kana/vim-textobj-lastpat'

  " I don't really care about trailing spaces so much as the indenting:
  let g:airline#extensions#whitespace#checks = [ 'indent' ]
  let g:airline_theme='base16'
  set laststatus=2

  " show undo history
  nnoremap <F5> :GundoToggle<CR>

  let macvim_skip_colorscheme = 1
  colorscheme default
  if !has("gui_running")
    autocmd BufWinEnter * :colorscheme default
  endif
endif

if v:version >= 703
  set undofile
  set undodir=~/.vim/undo
  set cryptmethod=blowfish
  NeoBundle 'https://github.com/godlygeek/csapprox.git'
  NeoBundle 'dsummers/gundo.vim.git'
  if has("gui_running")
    " color css colors auto magically - VERY slow on the console.
    NeoBundle 'skammer/vim-css-color'

    set background=light
    colorscheme solarized
    set macmeta
    set anti
    " TODO make the fold highlight non-underlined.
    " a powerline friendly font might look like
    " set gfn=Menlo\ Regular\ for\ Powerline:h15
    set gfn=Monaco:h15
    set cursorline
    " show column markers beyond the 80 char line.
    set colorcolumn=+1,+2,+3
  endif
endif

"}}}

"  my own lame SVN mappings:
" NeoBundle "git://github.com/dsummersl/svntools"
"  this is no longer maintained by me:
" "git://github.com/motemen/git-vim"
" "git://github.com/dsummersl/lookupfile-grep"
"  don't like how the tags are displayed. Its kinda annoying.
" "git://github.com/kshenoy/vim-signature.git"

filetype on
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
" }}}
" basic options {{{

set autowrite
set number
" I want to know about bad tab/space use:
set list

syntax on
set t_Co=256
set guioptions=egt  " GUI options

" use folding by default
set fdm=marker

" improve syntax highlighting when we have long lines by not highlighting lines
" over 360 columns:
set synmaxcol=360

" improve syntax highlighting speed in general
syntax sync minlines=64
syntax sync maxlines=128

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

let mapleader='m'
let maplocalleader='='

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

"}}}
" Plugin settings, changes."{{{

let g:js_context_colors = [ 22, 28, 34, 106, 178, 166, 124 ]
let g:js_context_colors_enabled = 0

" the emmet mappings really f this up:
"let g:user_emmet_leader_key = 'm'

vmap <Enter> <Plug>(LiveEasyAlign)
nmap <Leader>a <Plug>(LiveEasyAlign)

" let the narrow region plugin NR functions automatically update the window
" location on change:
let g:narrow_rgn_update_orig_win = 1
let g:nrrw_rgn_update_orig_win = 1

" automatically jump to the next )] or what have you
let g:AutoPairsFlyMode = 0

let g:fugitive_git_executable = '/usr/local/bin/git'

let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_color_change_percent = 2
" don't include tabs in 'soft' tabs - I want to see when things are amiss.
let g:indent_guides_soft_pattern = ' '

let g:detectindent_preferred_indent = 2
let g:detectindent_max_lines_to_analyse = 256
let g:detectindent_min_indent = 2

" we have very long commit lines - this helps!
let g:Gitv_TruncateCommitSubjects = 1

" Setup the VDebug options. Start and stop with f11/12.
let g:vdebug_keymap = {
\    "run" : "<F8>",
\    "run_to_cursor" : "<F1>",
\    "step_over" : "<F2>",
\    "step_into" : "<F3>",
\    "step_out" : "<F4>",
\    "close" : "<F6>",
\    "detach" : "<F7>",
\    "set_breakpoint" : "<F10>",
\    "get_context" : "<F11>",
\    "eval_under_cursor" : "<F12>",
\    "eval_visual" : "<Leader>e",
\}

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

" automatically
"imap <C-'> <C-O>:let g:AutoPairsFlyMode=1<CR>"<C-O>:let g:AutoPairsFlyMode=0<CR>
"imap <C-;> <C-O>:let g:AutoPairsFlyMode=1<CR>'<C-O>:let g:AutoPairsFlyMode=0<CR>
"imap <C-[> <C-O>:let g:AutoPairsFlyMode=1<CR>]<C-O>:let g:AutoPairsFlyMode=0<CR>
"imap <C-0> <C-O>:let g:AutoPairsFlyMode=1<CR>)<C-O>:let g:AutoPairsFlyMode=0<CR>
"imap <C-]> <C-O>:let g:AutoPairsFlyMode=1<CR>}<C-O>:let g:AutoPairsFlyMode=0<CR>

" toggle Sluice gutters
nnoremap <F3> :SluiceMacroOff <bar> SluiceToggle<CR>
nnoremap <F4> :SluiceMacroOn <bar> SluiceToggle<CR>

" in insert mode, move up/down one line and stay in insert mode.
inoremap <C-D> <esc>o
inoremap <C-U> <esc>O

" automatically toggle with control-
nnoremap <Leader>. :Switch<cr>
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
    \ { 'protected': 'public' }
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
call unite#set_profile('source/outline', 'ignorecase', 1)

let g:UltiSnipsListSnippets='<C-\>'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" CtrlP plugin
nnoremap <C-p> :CtrlP<CR>
cnoremap <C-p> :CtrlP<CR>
nnoremap <C-b> :CtrlPMRU<CR>
cnoremap <C-b> :CtrlPMRU<CR>

let g:ctrlp_by_filename = 1
" use 'r'
let g:ctrlp_regexp = 1
" use 'd'
let g:ctrlp_mruf_relative = 1
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" just use the pwd when finding files.
let g:ctrlp_working_path_mode = 'w'
" by default ignore subversion things and swap file
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*.sw?,*/*.pyc,*/*.class
" enable the quickfix plugin source:
let g:ctrlp_extensions=['changes']

" Unite outline mode
nnoremap <C-T> :Unite outline<CR>
" look into the current directory
nnoremap <Leader><C-T> :UniteWithBufferDir directory<CR>

let NERDMapleader = ','

let g:tagbar_left = 1

let g:sluice_default_macromode=1
" set the sluice updatetime to fast for quick gutter updates.
set updatetime=200

" show diff with git
nnoremap <F6> :Gvdiff<CR>

" don't search included files by default - it can be fucked up slow:
set complete-=i

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
" tagbar groovy/markdown/scala/php"{{{

let g:tagbar_type_groovy = {
    \ 'ctagstype' : 'groovy',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'c:class',
        \ 'i:interface',
        \ 'f:function',
        \ 'v:variables',
    \ ]
\ }

let g:tagbar_type_markdown = {
  \ 'ctagstype' : 'markdown',
  \ 'kinds' : [
    \ 'h:Heading_L1',
    \ 'i:Heading_L2',
    \ 'k:Heading_L3'
  \ ]
\ }

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'Scala',
    \ 'kinds'     : [
        \ 'p:packages:1',
        \ 'V:values',
        \ 'v:variables',
        \ 'T:types',
        \ 't:traits',
        \ 'o:objects',
        \ 'a:aclasses',
        \ 'c:classes',
        \ 'r:cclasses',
        \ 'm:methods'
    \ ]
\ }
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
set fillchars+=stl:\ ,stlnc:\ 
set lcs=tab:\ \ ,trail:+
highlight SpecialKey term=underline guifg=Red guibg=LightGrey
" syntax match MixedIndentation /^\v +(\t+)|\t+( +)/
" hi MixedIndentation guibg=Red guifg=White ctermbg=Red ctermfg=White
"}}}
" Mappings"{{{

cabbrev bda call DeleteHiddenBuffers()
cabbrev gitv Gitv

" quickly clear out search results
nnoremap [n :nohlsearch<CR>

" when switching between the alternate window, automatically save.
inoremap <C-^> <C-O>:e #<CR>

" instead of using this, I use 'gt'
map <nul> <esc>

" turn off help
map <f1> <nul>
imap <f1> <nul>

imap <C-a> <Home>

" Make Control up/down scroll up/down in the window...even in insert mode.
imap <C-j> <C-x><C-e>
imap <C-k> <C-x><C-y>

" Mappings that I have been using
" for moving between windows with ease:
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_

" console copy to buffer
noremap <Leader>y "*y
noremap <Leader>yy "*Y
noremap <Leader>p :set paste<cr>:put *<cr>:set nopaste<cr>

" see all the search matches in a separate window (narrow region)
noremap <Leader>/ :exec "g//NRP" \| NRM<cr>

" For a two parameter function, swap the two paramters - ideally I'd change this so that the cursor was in a position to swap the next terms:
" (a,b,c)  ... swap this and the next, or swap this and the previous (and leave
" me at the previous)
map <Leader>ss F( dia viaPF(p

" Open the current directory (or make new directory)
map <Leader>ep :e %:h

" Use gp to select the last pasted region.
nnoremap <expr> gp '`[' . strpart(getregtype(), 0, 1) . '`]'

"}}}
" Commands"{{{

" Execute something on all files of the same kind:
"
" See GG and AA commands:
function! s:ExecFileType(cmd,search)
  let extension = substitute(expand('%'),'\v^.*\.',"","")
  exec printf("silent %s",printf(a:cmd,a:search,extension))
endfunction

command! -nargs=1 GG call s:ExecFileType("Ggrep %s -- '*.%s'",'<args>')
command! -nargs=1 AA call s:ExecFileType("Ag %s **/*.%s",'<args>')

function! ConcealSearch(repl)
  exe 'syn keyword concealSearch "'. @/ .'" conceal cchar='. a:repl
  set conceallevel=2
endfunction

"}}}
" Automappings"{{{

if has("autocmd") && !exists("autocommands_loaded")
  let autocommands_loaded = 1

  if has("gui_running")
    au WinLeave * setlocal nocursorline
    au WinEnter * setlocal cursorline
    au BufNewFile,BufReadPost * :call AutoPairsInit()
  endif

  " Set the indenting to what it looks like the file is using:
  autocmd BufReadPost * :DetectIndent

  " ensure that tabstop settings for file browsing is big enough for column
  " alignment:
  autocmd FileType netrw setlocal ts=30

  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType ruby,eruby setlocal fdm&
  autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType sh  setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete

  " use the same comment formatting in groovy/PHP that is used for java:
  autocmd FileType php setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  autocmd FileType php setlocal fo=croq
  autocmd FileType php compiler php
  autocmd FileType groovy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  autocmd FileType groovy setlocal fo=croq

  autocmd BufNewFile,BufRead *.rabl setf eruby
  autocmd BufNewFile,BufRead *.eco setf eruby
  autocmd BufNewFile,BufRead *.md setf markdown
  autocmd BufNewFile,BufRead *.md setlocal spell fo-=tn wrap
  autocmd BufNewFile,BufRead *.pp setf ruby
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.gradle set ft=groovy
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby
  autocmd BufNewFile,BufRead *.tss set ft=javascript
  autocmd BufNewFile,BufRead *.coffee set ft=coffee
  autocmd BufNewFile,BufRead Cakefile set ft=coffee

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  autocmd FileType groovy setlocal ai
endif
"}}}
" vim: set ai fdm=marker cms="%s:
