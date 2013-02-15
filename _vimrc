" vundle plugin options {{{
set nocompatible
filetype off 

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

Bundle 'git://github.com/tpope/vim-unimpaired.git'
Bundle 'git://github.com/sjl/gundo.vim.git'
Bundle 'git://github.com/scrooloose/nerdcommenter.git'
Bundle 'git://github.com/sukima/xmledit'
Bundle 'git://github.com/vim-scripts/applescript.vim'
Bundle 'dsummersl/vim-sluice'
Bundle 'git://github.com/dsummersl/wikia-csv.git'
Bundle 'dsummersl/vimunit'
Bundle 'git://github.com/tpope/vim-fugitive.git'
Bundle 'git://github.com/kien/ctrlp.vim.git'
Bundle 'git://github.com/guns/ultisnips.git'
Bundle 'git://github.com/derekwyatt/vim-scala.git'
Bundle 'git://github.com/kchmck/vim-coffee-script'
Bundle 'git://github.com/tpope/vim-surround.git'
Bundle 'git://github.com/mattn/gist-vim.git'
" gist depends on this:
Bundle 'git://github.com/mattn/webapi-vim.git'
Bundle 'nathanaelkane/vim-indent-guides'
" TODO this?
Bundle 'git://github.com/PProvost/vim-ps1'
Bundle 'git://github.com/altercation/vim-colors-solarized'
" TODO this?
Bundle 'L9'
Bundle 'git://github.com/vim-scripts/Align.git'
Bundle 'git://github.com/vim-scripts/LargeFile.git'
Bundle 'git://github.com/vim-scripts/genutils.git'
Bundle 'git://github.com/vim-scripts/matchit.zip.git'
Bundle 'git://github.com/tpope/vim-unimpaired.git'
Bundle 'dsummersl/vus'
Bundle 'gregsexton/gitv'
Bundle 'scrooloose/nerdtree'
" Use localleader twice and then a w/b etc: ,,w
Bundle 'Lokaltog/vim-easymotion.git'
" awesome: makes the surround plugin work with the '.' keys (repeatability!)
Bundle 'tpope/vim-repeat'
" via (visual inner arg)
Bundle 'vim-scripts/argtextobj.vim'
" color css colors auto magically
Bundle 'skammer/vim-css-color'
" fix spelling errors
Bundle 'tpope/vim-abolish'
Bundle 'Shougo/unite.vim'
Bundle 'h1mesuke/unite-outline'

" Probably going to remove this:
"  this one requires phpctags:
Bundle 'git://github.com/techlivezheng/tagbar-phpctags.git'
Bundle 'git://github.com/majutsushi/tagbar.git'
Bundle 'git://github.com/sjl/threesome.vim.git'
Bundle 'git://github.com/vim-scripts/cecutil.git'
Bundle 'git://github.com/vim-scripts/Vimball.git'
Bundle 'git://github.com/alourie/Conque-Shell.git'

" TODO plugins to think about
" https://github.com/vim-scripts/YankRing.vim
" https://github.com/chrisbra/color_highlight
" kana/vim-textobj-function
"
" this one seems super cool except that it totally doesn't work with 'vii' or
" viI??
"Bundle 'michaeljsmith/vim-indent-object'

if (v:version / 100 == 7 && has('gui')) || v:version >= 703
  Bundle 'https://github.com/godlygeek/csapprox.git'
endif

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

set background=light
let g:solarized_termcolors=256
colorscheme solarized

set enc=utf-8
set gfn=Monaco:h13
set diffopt=filler,iwhite
set hls
set nowrap
set et
set sw=2
set ts=2
set visualbell
set backspace=2 " allow backspacing over everything in insert mode
set nobackup
set incsearch
let mapleader=','
let maplocalleader='='

set viminfo='50,\"50,h
set history=100 " keep 100 lines of command line history
set ruler       " show the cursor position all the time
set showcmd     " Show (partial) command in status line.
set showmatch   " Show matching brackets.

"}}}
" Plugin settings, changes."{{{

" enable yanks!
let g:unite_source_history_yank_enable = 1
let g:unite_enable_start_insert = 1
" I like the unite thing on the left side all get it going:
let g:unite_enable_split_vertically=1
let g:unite_winwidth=40
call unite#set_profile('source/outline', 'ignorecase', 1)

let g:tagbar_phpctags_bin='~/.vim/phpctags/phpctags'
let g:tagbar_foldlevel = 1
let g:tagbar_iconchars = ['▾', '▸']

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

" Make sure my plugins override the default ones:
let g:UltiSnipsDontReverseSearchPath="1"

" this will work on both GUI and console:
let g:UltiSnipsListSnippets='<c-\>'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" CtrlP plugin
nnoremap <C-p> :CtrlPBuffer<CR>
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" just use the pwd when finding files.
let g:ctrlp_working_path_mode = 'w'
" by default ignore subversion things and swap file
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*.sw?,*/*.pyc,*/*.class
" enable the quickfix plugin source:
let g:ctrlp_extensions=['quickfix']

" Unite outline mode
nnoremap <C-t> :Unite outline<CR>

let NERDMapleader = ','

let g:tagbar_left = 1

let g:sluice_default_macromode=1

" toggle Sluice gutters
nnoremap <F3> :SluiceMacroOff <bar> SluiceToggle<CR>
nnoremap <F4> :SluiceMacroOn <bar> SluiceToggle<CR>
" show undo history
nnoremap <F5> :GundoToggle<CR>
" show diff with git
nnoremap <F6> :Gvdiff<CR>
" show tags in current file
nnoremap <F7> :TagbarToggle<CR>
" Setup toggling the background colors from dark to light:
call togglebg#map("<F8>")

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
"}}}
" Setup how in 'list' mode characters for white space and tabs appear"{{{
" set lcs=tab:]_,trail:+
" hi SpecialKey term=underline guifg=LightBlue guibg=bg
set lcs=tab:\ \ ,trail:+
highlight SpecialKey term=underline guifg=Red guibg=LightGrey
"}}}
" version specific settings (7+) "{{{

let g:sluice_enabled=0

if v:version / 100 == 7
  set anti
  set cursorline
  " TODO make the fold highlight non-underlined.
  set nospell spelllang=en_us
endif
if v:version >= 703
  " sluice needs vim 7.3
  let g:sluice_enabled=1
  set undofile
  set cryptmethod=blowfish
endif
"}}}
" Mappings"{{{

cabbrev gitv Gitv

" instead of using this, I use 'gt'
map <nul> <esc>

" turn off help
map <f1> <nul>
imap <f1> <nul>

imap <C-e> <End>
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
  exec printf("Ggrep '%s' -- '*.%s'",a:search,extension)
endfunction

command! -nargs=1 GG call s:GitGrepFile('<args>')

"}}}
" Automappings"{{{

if has("autocmd") && !exists("autocommands_loaded")
	let autocommands_loaded = 1

  " ensure that tabstop settings for file browsing is big enough for column
  " alignment:
  autocmd FileType netrw setlocal ts=30

  autocmd FileType ruby,eruby setlocal omnifunc=rubycomplete#Complete
  autocmd FileType python     setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType sh  setlocal omnifunc=syntaxcomplete#Complete
  autocmd FileType vim setlocal omnifunc=syntaxcomplete#Complete

  " use the same comment formatting in groovy/PHP that is used for java:
  autocmd FileType php setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  autocmd FileType php setlocal fo=croq
  autocmd FileType groovy setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
  autocmd FileType groovy setlocal fo=croq

  autocmd BufNewFile,BufRead *.pp setf ruby
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufRead *.tsv set ts=20
  autocmd BufNewFile,BufRead *.tsv set sw=20
  autocmd BufNewFile,BufRead *.gradle set ft=groovy
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby
  autocmd BufNewFile,BufRead *.tss set ft=javascript

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

	autocmd FileType groovy set ai
endif
"}}}
" vim: set ai fdm=marker cms="%s:
