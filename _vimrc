" basic options {{{
set termguicolors

set exrc

set cursorline
" show column markers beyond the 80, and 100
" TODO don't set a colorcolumn if the file is read only (help files and such).
set colorcolumn=+20,+21,+22,+23

set undofile
set undodir=~/.vim/undo

set conceallevel=2 " for ToggleGroupConceal
set autowrite

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

set diffopt=filler,iwhiteall,vertical,hiddenoff,algorithm:patience,linematch:60
set nohlsearch
set nowrap

set expandtab

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

set showmatch   " Show matching brackets.

set textwidth=80
set formatoptions=qlronj
" TODO needed in python?
" set breakindent " match indenting when wrapping text
set linebreak " when wrap is turned on, break on words

" let macros go faster
" set lazyredraw

set updatetime=1000
set timeoutlen=500

" show replace previews
set inccommand=nosplit
set pumblend=10

" completion for command mode suggestions
set wildoptions=pum
set signcolumn=yes:2

set guifont=JetBrainsMono\ Nerd\ Font
let g:python3_host_prog='~/.pyenv/versions/neovim/bin/python'
"}}}
" Plugins{{{
lua << EOF
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- if there is a local vimrc, then load it, and it must setup lazy-loader itself.
if not vim.loop.fs_stat(".nvimrc") then
  require('lazy-loader')()
end
-- in your .nvimrc put this file, or pass additional configs.
-- require('lazy-loader')({ "extra-plugin" })

EOF
"}}}
" Mappings {{{

" search the whats yanked
noremap <leader>/' /"<cr>

" Revisit the history on the command mode without leaving the home rows.
cnoremap <c-n> <down>
cnoremap <c-p> <up>

nnoremap <silent> <leader>o :only<cr>
nnoremap <silent> <leader>' :q<cr>
nnoremap <silent> <leader>n <c-w>_

map <silent> <leader>co :copen<cr>
map <silent> <leader>lo :lopen<cr>

" Quickly edit the contents of a register (for macros, say); <leader>m or
" "q<leader>m  to edit register q
" From https://github.com/mhinz/vim-galore#quickly-edit-your-macros
nnoremap <silent> <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" save my right pinky some pain:
nnoremap <silent> <leader>t zt
nnoremap <silent> <leader>b zb
nnoremap <silent> <leader>, zz
nnoremap <silent> <leader>l :silent! %y*<cr>

" I like having zs to jump to the start of the line, but I'd really love a
" zm to jump to the middle - I don't think I'll miss the original folding
" function of zm:
nnoremap <silent> zm zs

" Repeat the previous change as if it had been made with cgn
" - lets future changes for the same pattern happen with '.'
" Inspired by https://www.reddit.com/r/neovim/comments/sf0hmc/im_really_proud_of_this_mapping_i_came_up_with/
nnoremap <silent> g. :call setreg('/',substitute(@", '\%x00', '\\n', 'g'))<cr>:exec printf("norm %sgn%s", v:operator, v:operator != 'd' ? '<c-a>':'')<cr>

" when switching between the alternate window, automatically save.
inoremap <silent> <C-^> <C-O>:e #<CR>
" do the same thing in terminal mode (even in insert mode)
tnoremap <silent> <C-^> <C-\><C-N><C-O>:e #<CR>
" quick autosave
nnoremap <silent> <silent> <C-c> :w<CR>
inoremap <silent> <C-c> <Esc>

" instead of using this, I use 'gt'
map <silent> <nul> <esc>

" turn off help key
map <silent> <f1> <nul>
imap <silent> <f1> <nul>

" Quickly maximize splits:
map <silent> <C-j> <C-w>j<C-w>_
map <silent> <C-k> <C-w>k<C-w>_

" jump to the end of the line
" Used iterm2 to map shift-ctrl-e to <f15>
imap <silent> <M-e> <C-O>$
" Used iterm2 to map shift-ctrl-a to <f16>
imap <silent> <M-a> <Home>

" noremap <leader>a ggVG"+y
" copy the current filename and line number into the clipboard and past register:
noremap <silent> <leader>f :let @+=expand("%") .'#'. line(".")<bar>let @"=@+ ."\n"<CR>

" unimpaired like mapping for diff option for ignoring whitespace.
noremap <silent> ]oI :set diffopt-=iwhiteall<cr>
noremap <silent> [oI :set diffopt+=iwhiteall<cr>

vnoremap <silent> ]6 d:let @"=system('base64 --decode', @") \| norm ""p<cr>
vnoremap <silent> [6 d:let @"=system('base64 --wrap=0', @") \| norm ""p<cr>

function! s:Lspstop()
  LspStop
  lua require('null-ls').disable{}
endfunction
noremap <silent> [ol :LspStart<cr>
noremap <silent> ]ol :call <sid>Lspstop()<cr>

" Navigate to the current directory of the file I'm in:
map <silent> - :e %:h/<CR>

" VimR apple paste:
map <silent> <D-v> :norm "*p<cr>
imap <silent> <D-v> <C-r><C-o>*

" Reverse the <C-r>/<C-r><C-o> meanings - make <C-r>" default to a repeatable behavior for text changes:
" inoremap <C-r> <C-r><C-o>
" inoremap <C-r><C-o> <C-r>

" I used the " register a lot in changes, so make it easy to insert it:
inoremap <silent> <C-t> <C-r><C-o>"
cnoremap <silent> <C-t> <C-r><C-o>"

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
function! s:SynGroup()                                                            
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun

function! s:SynStack()
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc
nmap <leader>z :call <SID>SynStack()<CR>
nmap <leader>v :call <SID>SynGroup()<CR>
"}}}
" UV()/DV() - Increment/decrement a pattern search functions{{{
function! CopyMatches(reg)
  let hits = []
  %s//\=len(add(hits, submatch(0))) ? submatch(0) : ''/gne
  let reg = empty(a:reg) ? '+' : a:reg
  execute 'let @'.reg.' = join(hits, "\n") . "\n"'
endfunction
command! -register CopyMatches call CopyMatches(<q-reg>)

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

function! s:SetStop(count, type='s')
  if a:type ==# 's'
    set expandtab
  else
    set noexpandtab
  end
  exec 'set sw='. a:count
  exec 'set ts='. a:count
  exec 'set sts='. a:count
endfunction

command! -nargs=* SS call s:SetStop(<f-args>)
"}}}
" :DiffAgainstRegister - Diff the current selection against whatever is in register {{{
" TODO DiffAgainstRegister X Y (three way diff)
function! s:DiffAgainstRegister(register) range
  exec a:firstline .",". a:lastline ."NR"

  let b:nrrw_aucmd_written = ':update'

  diffthis
  vnew
  setlocal buftype=nowrite
  setlocal bufhidden=delete
  setlocal noswapfile
  setlocal nobuflisted
  exec "silent put ". a:register
  let bnr = bufnr('%')
  diffthis
  resize 100
  " jump over to the narrow region section.
  norm l
  " when the narrow region is closed, delete the scratch buffer
  exec "autocmd BufHidden <buffer> :bw ". bnr
endfunction
command! -nargs=1 -range DiffAgainstRegister <line1>,<line2>call s:DiffAgainstRegister(<f-args>)
vnoremap <leader>va  :DiffAgainstRegister a<CR>
"}}}
" Automappings"{{{

if has('autocmd') && !exists('g:autocommands_loaded')
  autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup='Visual', timeout=300}

  let g:autocommands_loaded = 1

  " ensure that tabstop settings for file browsing is big enough for column
  " alignment:
  autocmd FileType netrw setlocal ts=30

  augroup Python
    autocmd!
    autocmd BufNew,BufNewFile,BufRead *.py SS 4
    autocmd FileType python SS 4
  augroup END

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
  autocmd BufWinEnter * if line2byte(line("$") + 1) > 100000 | syntax off | endif
endif
"}}}
" vim: set ai fdm=marker cms="%s:
