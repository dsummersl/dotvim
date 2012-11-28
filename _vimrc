" pathogen setup {{{
" Needed on some linux distros.
" see http://www.adamlowe.me/2009/12/vim-destroys-all-other-rails-editors.html
filetype off 
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

filetype on 
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
" }}}
" basic options {{{
syntax on
set t_Co=256
set guioptions=egrLt  " GUI options

set background=light
let g:solarized_termcolors=256
colorscheme solarized

"colorscheme morning
"colorscheme slate
"colorscheme zellner

set enc=utf-8
set gfn=Monaco:h13
set updatetime=500
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
set history=150       " keep 150 lines of command line history
set ruler             " show the cursor position all the time
set showcmd   " Show (partial) command in status line.
set showmatch   " Show matching brackets.
"}}}
" Plugin settings, changes."{{{

let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1

let g:UltiSnipsSnippetsDir="~/.vim/bundle/ultisnips/UltiSnips"
let g:UltiSnipsListSnippets='<c-\>'

" CtrlP plugin
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
" by default ignore subversion things and swap file
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/*.sw?,*/*.pyc

" indenthl syntax:
let g:indenthlshowerrors = 1
let g:indenthlinfertabmode = 1

hi DiffAdd term=reverse guifg=Black guibg=LightBlue
" hilighted colors should be nice.
hi IncSearch term=reverse guifg=Black guibg=#bbdbff
hi Search term=reverse guifg=Black guibg=#bbdbff
" show marks colors
hi default ShowMarksHLl guifg=#e5f1ff guibg=#bebebe
hi default ShowMarksHLu guifg=#e5f1ff guibg=#bebebe
hi default ShowMarksHLo guifg=#acd3ff guibg=#bebebe
hi default ShowMarksHLm guifg=white guibg=#bebebe

" disable the showmarks & minibuffer plugin to start.
let g:showmarks_enable = 0
let loaded_minibufexplorer = 0
let loaded_ZoomWin = 0
let g:LookupFileGrep_IgnoreCase = 1
let g:LookupFile_DisableDefaultMap = 1

let NERDMapleader = ','

let g:tagbar_left = 1

" show undo history
nnoremap <F5> :GundoToggle<CR>
" show diff with git
nnoremap <F6> :Gvdiff<CR>
" show tags in current file
nnoremap <F7> :TagbarToggle<CR>

let g:mvom_bg_showinline = 1
" TODO disable the plugin for now - it is very slow via the console.
let g:mvom_enabled = 0 
" Fix any hilighting so that it works in cterm:
" exec ":CSApprox!"
"let g:mvom_loaded = 1
"call MVOM_Setup('Search','Slash')
"call MVOM_Setup('Window','BG')

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
" Setup how in 'list' mode characters for white space and tabs appear"{{{
" set lcs=tab:]_,trail:+
" hi SpecialKey term=underline guifg=LightBlue guibg=bg
set lcs=tab:\ \ ,trail:+
hi SpecialKey term=underline guifg=Red guibg=LightGrey
"}}}
" for version 7"{{{
if v:version / 100 == 7
  set anti
  set cursorline
  highlight CursorLine guibg=#fcc975
	set nospell spelllang=en_us
	set cryptmethod=blowfish
endif
"}}}
" Mappings"{{{
" Mappings to allow moving around the line when in insert mode
imap <c-f> <esc>lwi
imap <c-b> <esc>lbi
" c-4 is like $ for eol:
imap <c-4> <esc>$a
imap <c-a> <esc>^i

" instead of using this, I use 'gt'
map <nul> <esc>
" turn off help
map <f1> <nul>

" save with Ctrl-S
map <C-s> :w
" Make Control up/down scroll up/down in the window...even in insert mode.
map <C-Down> <C-e>
map <C-Up> <C-y>
imap <C-Down> <C-x><C-e>
imap <C-Up> <C-x><C-y>

" Mappings that I have been using
" for moving between windows with ease:
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_

" vimux mappings
map <Leader>vc :call VimuxClosePanes()<cr>
map <Leader>vi :call VimuxInspectRunner()<cr>

" console copy to buffer
noremap <Leader>y "*y
noremap <Leader>yy "*Y
noremap <Leader>p :set paste<cr>:put *<cr>:set nopaste<cr>


"}}}
" Automappings"{{{

if has("autocmd")
	autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
	autocmd FileType python     set omnifunc=pythoncomplete#Complete
	autocmd FileType sh  set omnifunc=syntaxcomplete#Complete
	autocmd FileType vim set omnifunc=syntaxcomplete#Complete
	autocmd BufNewFile,BufRead *.pp setf ruby
	autocmd BufNewFile,BufRead *.csv setf csv
	autocmd BufNewFile,BufRead *.tsv setf csv
	autocmd BufNewFile,BufRead *.tsv Delimiter \t
	autocmd BufNewFile,BufRead *.tsv set ts=20
	autocmd BufNewFile,BufRead *.tsv set sw=20
	autocmd BufNewFile,BufRead *.gradle set ft=groovy
	autocmd BufNewFile,BufRead Vagrantfile set ft=ruby

	autocmd FileType groovy set ai
endif
"}}}
" vim: set ai fdm=marker cms="%s:
