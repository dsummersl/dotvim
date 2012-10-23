" basic options {{{
set guioptions=egrLt  " GUI options
colorscheme zellner
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

" indenthl syntax:
let g:indenthlshowerrors = 1
let g:indenthlinfertabmode = 1

hi DiffAdd term=reverse ctermfg=0 ctermbg=5* guifg=Black guibg=LightBlue
" hilighted colors should be nice.
hi IncSearch term=reverse ctermfg=0 ctermbg=5* guifg=Black guibg=#bbdbff
hi Search term=reverse ctermfg=0 ctermbg=5* guifg=Black guibg=#bbdbff
" show marks colors
hi default ShowMarksHLl ctermfg=darkblue ctermbg=blue guifg=#e5f1ff guibg=#bebebe
hi default ShowMarksHLu ctermfg=darkblue ctermbg=blue guifg=#e5f1ff guibg=#bebebe
hi default ShowMarksHLo ctermfg=darkblue ctermbg=blue guifg=#acd3ff guibg=#bebebe
hi default ShowMarksHLm ctermfg=darkblue ctermbg=blue guifg=white guibg=#bebebe

" disable the showmarks & minibuffer plugin to start.
let g:showmarks_enable = 0
let loaded_minibufexplorer = 0
let loaded_ZoomWin = 0
let g:LookupFileGrep_IgnoreCase = 1
let g:LookupFile_DisableDefaultMap = 1

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse latex-suite. Set your grep
" program to alway generate a file-name.
set grepprg=grep\ -nH\ $*

" brew install ctags
let Tlist_Ctags_Cmd = '/usr/local/bin/ctags'
let Tlist_File_Fold_Auto_Close = 1

let NERDMapleader = ','

nnoremap <F5> :GundoToggle<CR>
nnoremap <S-F5> :Tlist<CR>
nnoremap <S-F6> :Gvdiff<CR>
nnoremap <F6> :FufFile<CR>

let g:mvom_bg_showinline = 1
"let g:mvom_loaded = 1
"call MVOM_Setup('Search','Slash')
"call MVOM_Setup('Window','BG')

" fuzzy finder
let g:fuf_ignoreCase = 1

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
command! -nargs=? -bang -complete=dir MR :call LoadProject("maven",<q-args>)
command! -nargs=? -bang -complete=dir RR :call LoadProject("rails",<q-args>)
command! -nargs=? -bang -complete=dir JR :call LoadProject("java",<q-args>)
command! -nargs=? -bang -complete=dir SR :call LoadProject("script",<q-args>)
command! -nargs=? -bang -complete=dir GR :call LoadProject("grails",<q-args>)

"}}}
" Setup how in 'list' mode characters for white space and tabs appear"{{{
" set lcs=tab:]_,trail:+
" hi SpecialKey term=underline ctermfg=0 ctermbg=5* guifg=LightBlue guibg=bg
set lcs=tab:\ \ ,trail:+
hi SpecialKey term=underline ctermfg=1 ctermbg=7 guifg=Red guibg=LightGrey
"}}}
" for version 7"{{{
if v:version / 100 == 7
	if has("gui_running")
		set anti
		set cursorline
		highlight CursorLine guibg=#fcc975
	endif
	set nospell spelllang=en_us
	set cryptmethod=blowfish
endif
"}}}
" Mappings"{{{
" map the taglist function menu.
" TODO how do you map an uppercase letter?
" Mappings to allow moving around the line when in insert mode
imap <c-f> <esc>lwi
imap <c-b> <esc>lbi
" TODO this one clashes, don't use it
"imap <c-e> <esc>$a
imap <c-a> <esc>^i

" instead of using this, I use 'gt'
"map <C-h> :tabnext
"map <C-l> :tabp
map <nul> <esc>

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
	autocmd BufNewFile,BufRead Vagrantfile set ft=ruby

	autocmd FileType groovy set ai
endif
"}}}
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
" vim: set ai fdm=marker cms="%s:
