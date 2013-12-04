" vundle plugin options {{{
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" TODO look into:
" pomodoro reminder plugin: https://github.com/vim-scripts/vim-airline-tomato

" debug xdebug
Bundle 'joonty/vdebug.git'
Bundle 'kien/ctrlp.vim.git'
Bundle 'scrooloose/nerdcommenter.git'
Bundle 'sukima/xmledit'
Bundle 'vim-scripts/applescript.vim'
" editing CSV docs, super handily.
" TODO update this repo so that people know to look for chrisba
Bundle 'dsummersl/wikia-csv.git'
" Bundle 'chrisba/csv.vim.git'
" simple utf2ascii function.
Bundle 'dsummersl/vim-utf2ascii'
Bundle 'tpope/vim-fugitive.git'
" snippets
Bundle 'guns/ultisnips.git'
Bundle 'derekwyatt/vim-scala.git'
Bundle 'kchmck/vim-coffee-script'
" surround things with quotes, etc (csw - surround word)
Bundle 'tpope/vim-surround.git'
Bundle 'nathanaelkane/vim-indent-guides'
" TODO this? Its a dependency for a number of libs?
Bundle 'PProvost/vim-ps1'
" TODO this? Its a dependency for a number of libs?
Bundle 'L9'
Bundle 'vim-scripts/Align.git'
Bundle 'vim-scripts/LargeFile.git'
Bundle 'vim-scripts/genutils.git'
" TODO do I need both matchit and xmledit?
Bundle 'vim-scripts/matchit.zip.git'
" many additional mappings for ]q, etc
Bundle 'tpope/vim-unimpaired.git'
Bundle 'gregsexton/gitv'
" awesome: makes the surround plugin work with the '.' keys (repeatability!)
Bundle 'tpope/vim-repeat'
" via (visual inner arg)
Bundle 'vim-scripts/argtextobj.vim'
" color css colors auto magically
Bundle 'skammer/vim-css-color'
" fix spelling errors
Bundle 'tpope/vim-abolish'
" quick find method definitions:
Bundle 'Shougo/unite.vim'
" Nice outline of a file's methods within Unite.
Bundle 'h1mesuke/unite-outline'
" viI (visual inner Indent)
Bundle 'michaeljsmith/vim-indent-object'
" allow the quicklist to be edited :cw, 'i'. :QFLoad and :LocSave
Bundle 'jceb/vim-editqf'
" javascript omni integration
Bundle 'marijnh/tern_for_vim'
Bundle 'Shougo/vimproc'
" syntax hilighting for actionscript
Bundle 'jeroenbourgois/vim-actionscript'
" use Cdo to quicklist argument modifications
Bundle 'dsummersl/vim-cdo'
" Go language autocompletion
Bundle 'Blackrush/vim-gocode'

" user defined textobj implementations
Bundle 'kana/vim-textobj-user'
" vib between any arbitrary object
Bundle 'thinca/vim-textobj-between'
" vic and vac (comments)
Bundle 'glts/vim-textobj-comment'
" provide focus of a selected block into its own buffer via 'NR' 
Bundle 'chrisbra/NrrwRgn'
" Easily toggle boolean values:
Bundle 'AndrewRadev/switch.vim'
" TODO automatic ctags generation doesn't seem to work, but I love the idea...
"Bundle 'szw/vim-tags'
" run make in the background. (used by vim-tags)
Bundle 'tpope/vim-dispatch'
" utility functions
" a hash implementation - make it easy to compute the hash of a string in the
" editor (ie, yank a block, then do :echo _#hash(@") )
Bundle 'dsummersl/vus'
" sluice side screen control
Bundle 'dsummersl/vim-sluice'
" unit testing for vim.
Bundle 'dsummersl/vimunit'

" TODO grow/shrink the visual selection with J/K: https://github.com/terryma/vim-expand-region
" TODO https://github.com/vim-scripts/PatternsOnText - delete/replace non
" matches (also has some quicklist looking stuff).
" TODO move text blocks easily through )}" : https://github.com/vim-scripts/easy-through-pairing.vim
" TODO use count in front of jk control keys: https://github.com/vim-scripts/rel-jump

" python omni completion
" Its annoying b/c it automatically appears when I only want it when I
" explicitly ask for it. Maybe there is a way to configure it that way:
"Bundle 'davidhalter/jedi-vim'

" Probably going to remove these:
" colorize ansi escaped text (console dumps)
Bundle 'vim-scripts/AnsiEsc.vim'
Bundle 'techlivezheng/tagbar-phpctags.git'
Bundle 'majutsushi/tagbar.git'
Bundle 'vim-scripts/cecutil.git'
Bundle 'vim-scripts/Vimball.git'
" TODO something like yankstack sounds nice but this breaks the vS feature of
" the surround plugin.
"Bundle 'maxbrunsfeld/vim-yankstack'
" use multiple cursors (ala sublime text editor) - cool but very buggy
"Bundle 'terryma/vim-multiple-cursors'

" TODO plugins to think about
" https://github.com/vim-scripts/YankRing.vim
" https://github.com/chrisbra/color_highlight

" version specific settings (7+) "{{{

set nospell spelllang=en_us

if v:version >= 703
  set undofile
  set undodir=~/.vim/undo
  set cryptmethod=blowfish
  Bundle 'https://github.com/godlygeek/csapprox.git'
  Bundle 'dsummers/gundo.vim.git'
  if has("gui_running")
    " base16 color schemes
    Bundle 'altercation/vim-colors-solarized'
    " A better powerline plugin:
    Bundle 'bling/vim-airline'
    " vi/ (last search)
    Bundle 'kana/vim-textobj-lastpat'

    " I don't really care about trailing spaces so much as the indenting:
    let g:airline#extensions#whitespace#checks = [ 'indent' ]
    let g:airline_theme='base16'
    set laststatus=2
    set background=light
    colorscheme solarized
    set macmeta
    set anti
    set cursorline
    " show 5 column markers beyond the 80 char line.
    set colorcolumn=+1,+2,+3
    " TODO make the fold highlight non-underlined.
    " a powerline friendly font might look like
    " set gfn=Menlo\ Regular\ for\ Powerline:h15
    set gfn=Monaco:h15

    " show undo history
    nnoremap <F5> :GundoToggle<CR>
  endif
endif

"}}}

"  my own lame SVN mappings:
" Bundle "git://github.com/dsummersl/svntools"
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

" no tabs, and tab size of two characters
set et
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

" toggle Sluice gutters
nnoremap <F3> :SluiceMacroOff <bar> SluiceToggle<CR>
nnoremap <F4> :SluiceMacroOn <bar> SluiceToggle<CR>

" automatically toggle with control-
nnoremap <Leader>. :Switch<cr>
autocmd FileType php let b:switch_custom_definitions =
    \ [
    \ { '\([^=]\)===\([^=]\)': '\1==\2' },
    \ { '\([^=]\)==\([^=]\)': '\1===\2' }
    \ ]
autocmd FileType javascript let b:switch_custom_definitions =
    \ [
    \ { '\([^=]\)===\([^=]\)': '\1==\2' },
    \ { '\([^=]\)==\([^=]\)': '\1===\2' }
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

let g:tagbar_phpctags_bin='~/.vim/phpctags/phpctags'
let g:tagbar_foldlevel = 1
let g:tagbar_iconchars = ['▾', '▸']

" Make sure my plugins override the default ones:
let g:UltiSnipsDontReverseSearchPath="1"

" this will work on both GUI and console:
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
nnoremap <C-t> :Unite outline<CR>

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
"}}}
" Mappings"{{{

cabbrev bda call DeleteHiddenBuffers()
cabbrev gitv Gitv

" quickly clear out search results
nnoremap [n :nohlsearch

" instead of using this, I use 'gt'
map <nul> <esc>

" turn off help
map <f1> <nul>
imap <f1> <nul>

" This interfere's with: line completion.
" imap <C-e> <End>
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

"}}}
" Commands"{{{

" Do a git grep on every file that is the same kind as the one I'm currently
" in:
function! s:GitGrepFile(search)
  let extension = substitute(expand('%'),'\v^.*\.',"","")
  exec printf("Ggrep %s -- '*.%s'",a:search,extension)
endfunction

command! -nargs=1 GG call s:GitGrepFile('<args>')

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
  endif

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
