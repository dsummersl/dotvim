lua require('plugins')

" basic options {{{
set cursorline
" show column markers beyond the 80, and 100
" TODO don't set a colorcolumn if the file is read only (help files and such).
set colorcolumn=+20,+21,+22,+23

set undofile
set undodir=~/.vim/undo

set conceallevel=2 " for ToggleGroupConceal
set autowrite
set nonumber

" I want to know about bad tab/space use:
set nolist

" Let airline show the mode
set noshowmode

" give a little context when at the top/bottom of the file.
set scrolloff=2

" use folding by default
set foldmethod=marker
set foldcolumn=0

" Turn on mouse for a visual and normal mode only:
set mouse=v

set diffopt=filler,iwhiteall,vertical,hiddenoff,algorithm:patience
set nohlsearch
set nowrap

" SPACES, and tab size of two characters
set expandtab
set shiftwidth=2
set tabstop=2
set softtabstop=2

set visualbell
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

" TODO removable
" set shada='50,\"50,h
" set history=100 " keep 100 lines of command line history
set showmatch   " Show matching brackets.

set textwidth=80
set formatoptions=qlronj
" TODO needed in python?
" set breakindent " match indenting when wrapping text
set linebreak " when wrap is turned on, break on words

" let macros go faster
set lazyredraw

set updatetime=1000
set timeoutlen=500

" show replace previews
set inccommand=nosplit
set pumblend=10

" completion for command mode suggestions
set wildoptions=pum
set signcolumn=yes:1

" show or hide that extra space at the bottom of the screen:
set cmdheight=1

set guifont=JetBrainsMono\ Nerd\ Font\ Mono
let g:python3_host_prog='/Users/danesummers/.pyenv/shims/python'
"}}}
" Mappings {{{

noremap <leader>/' /"<cr>

" Revisit the history on the command mode without leaving the home rows.
cnoremap <c-n> <down>
cnoremap <c-p> <up>

nnoremap <leader>o :only<cr>
nnoremap <leader>' :q<cr>
nnoremap <leader>n <c-w>_

map <leader>co :copen<cr>
map <leader>lo :lopen<cr>

" Quickly edit the contents of a register (for macros, say); <leader>m or
" "q<leader>m  to edit register q
" From https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" save my right pinky some pain:
nnoremap <leader>t zt
nnoremap <leader>b zb
nnoremap <leader>, zz
nnoremap <leader>l :silent! %y*<cr>

" I like having zs to jump to the start of the line, but I'd really love a
" zm to jump to the middle - I don't think I'll miss the original folding
" function of zm:
nnoremap zm zs

" Use 'g.' to Repeat the previous change as if it had been made with cgn - lets future
" changes for the same pattern happen with '.'
" Inspired by https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/
nnoremap g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>

" when switching between the alternate window, automatically save.
inoremap <C-^> <C-O>:e #<CR>
" do the same thing in terminal mode (even in insert mode)
tnoremap <C-^> <C-\><C-N><C-O>:e #<CR>
" quick autosave
nnoremap <C-c> :w<CR>
inoremap <C-c> <Esc>

" instead of using this, I use 'gt'
map <nul> <esc>

" turn off help key
map <f1> <nul>
imap <f1> <nul>

" Quickly maximize splits:
map <C-j> <C-w>j<C-w>_
map <C-k> <C-w>k<C-w>_

" jump to the end of the line
" Used iterm2 to map shift-ctrl-e to <f15>
imap <M-e> <C-O>$
" Used iterm2 to map shift-ctrl-a to <f16>
imap <M-a> <Home>

" console copy to buffer
noremap <leader>y "+y
" noremap <leader>a ggVG"+y
" copy the current filename and line number into the clipboard and past register:
noremap <leader>f :let @+=expand("%") .'#'. line(".")<bar>let @"=@+ ."\n"<CR>
noremap <leader>/a :AA 

" unimpaired like mapping for diff option for ignoring whitespace.
noremap ]oI :set diffopt-=iwhiteall<cr>
noremap [oI :set diffopt+=iwhiteall<cr>

vnoremap [6 d:let @"=system('base64 --decode', @") \| norm ""p<cr>
vnoremap ]6 d:let @"=system('base64 --wrap=0', @") \| norm ""p<cr>

noremap ]ol :LspStop<cr>
noremap [ol :LspStart<cr>

" Navigate to the current directory of the file I'm in:
map - :e %:h/<CR>

" VimR apple paste:
map <D-v> :norm "*p<cr>
imap <D-v> <C-r><C-o>*
"}}}
" :bda - delete all buffers {{{
function! DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction
cabbrev bda call DeleteHiddenBuffers()
"}}}
" SynGroup {{{
function! SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)                                       
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
"}}}
" UV()/DV() - Increment/decrement a pattern search functions{{{
"
" Use this like so to change something, incrementing from 392:
"
" NOTE: in neovim you probably want to turn off the inccommand setting - it
" royally fucks all this up
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

" TODO automate this diffsplit two matching regions
" let @m=j?<<<\jV/^===\k"aynjV/^>>>\k"by:sp below\ggdG"bp:vert diffs above\ggdG"apgglgg:diffupdate\=

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
"}}}
" :DiffAgainstRegisterA - Diff the current selection against whatever is in register 'a' {{{
function! s:DiffAgainstRegisterA() range
  let b:nrrw_aucmd_written = ':update'

  diffthis
  vnew
  setlocal buftype=nowrite
  setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nobuflisted
  exec "silent put a"
  let bnr = bufnr('%')
  diffthis
  resize 100
  " jump over to the narrow region section.
  norm l
  " when the narrow region is closed, delete the scratch buffer
  exec "autocmd BufHidden <buffer> :bw ". bnr
endfunction
command! -nargs=0 -range DiffAgainstRegisterA <line1>,<line2>call s:DiffAgainstRegisterA()
vnoremap <leader>-  :'<,'>NR<CR>:DiffAgainstRegisterA<CR>
"}}}
" Automappings"{{{

if has('autocmd') && !exists('g:autocommands_loaded')
  let g:autocommands_loaded = 1

  " ensure that tabstop settings for file browsing is big enough for column
  " alignment:
  autocmd FileType netrw setlocal ts=30

  function! s:gruvbox_material_custom() abort
    highlight! link TSEmphasis Comment
    highlight! link TSComment Comment
    highlight! link String BlueItalic
    highlight! link TSString BlueItalic

    " highlight! link LspReferenceRead Search
    " highlight! link LspReferenceText Search
    " highlight! link LspReferenceWrite IncSearch

    highlight! link DiagnosticSignHint NonText
    highlight! link DiagnosticSignError RedSign

    highlight! link SignifySignAdd    GreenSign
    highlight! link SignifySignDelete RedSign
    highlight! link SignifySignChange YellowSign

    " gruvbox blows away my plugin highlight groups - relink them
    highlight! link SluiceVisibleArea Normal
    highlight! link SluiceCursor Normal
    highlight! link SluiceColumn SignColumn

    highlight! link IndentBlanklineIndent1 Normal
    highlight! link IndentBlanklineIndent2  SignColumn

    " Initialize the color palette.
    " The first parameter is a valid value for `g:gruvbox_material_background`,
    " the second parameter is a valid value for `g:gruvbox_material_foreground`,
    " and the third parameter is a valid value for `g:gruvbox_material_colors_override`.
    let l:palette = gruvbox_material#get_palette('hard', 'mix', {})
    " Define a highlight group.
    " The first parameter is the name of a highlight group,
    " the second parameter is the foreground color,
    " the third parameter is the background color,
    " the fourth parameter is for UI highlighting which is optional,
    " and the last parameter is for `guisp` which is also optional.
    " See `autoload/gruvbox_material.vim` for the format of `l:palette`.
    call gruvbox_material#highlight('CommentCurrentLine', l:palette.bg5, l:palette.bg1)
  endfunction
  
  augroup GruvboxMaterialCustom
    autocmd!
    autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
  augroup END

  call s:gruvbox_material_custom()

  autocmd BufNewFile,BufRead *.j2 setf jinja
  autocmd BufNewFile,BufRead *.md setlocal spell wrap et
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead Tiltfile setf python
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " close the quickfix window when an item is selected.
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
  autocmd FileType qf setlocal colorcolumn=

  " Turn off syntax for large files
  autocmd BufWinEnter * if line2byte(line("$") + 1) > 1000000 | syntax off | endif
endif
"}}}
" vim: set ai fdm=marker cms="%s:
