" vundle plugin options {{{

let g:plug_url_format='git@github.com:%s.git'
so ~/.vim/autoload/plug.vim
call plug#begin('~/.vim/bundle')

" <---- plugins in testing ---->
Plug 'mhinz/vim-signify'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'kiteco/vim-plugin'
Plug 'machakann/vim-sandwich'
Plug 'nvim-lua/completion-nvim'
Plug 'lambdalisue/gina.vim'
Plug 'nvim-treesitter/nvim-treesitter-textobjects'
Plug 'dsummersl/vim-diffundo'
Plug 'sainnhe/gruvbox-material'
" Plug 'junegunn/vim-slash' -- for search and * search.
" <---- end plugins in testing ---->
" <---- plugins to probably remove ---->
" <---- plugins to probably remove ---->

" Motions
Plug 'jeetsukumaran/vim-indentwise' " Support indent motions ]ii
Plug 'tpope/vim-unimpaired' " many additional mappings for ]q, etc
Plug 'tpope/vim-repeat' " awesome: makes the surround plugin work with the '.' keys (repeatability!)
Plug 'kreskij/Repeatable.vim'
Plug 'easymotion/vim-easymotion' " mapped to s for two letter searching.
Plug 'wellle/visual-split.vim' " I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
Plug 'kana/vim-operator-user' " Define my own operators for motions.
Plug 'tommcdo/vim-exchange'

" Operators
Plug 'tommcdo/vim-lion' " align with operator gL and gl (ie glip= to align paragraph by =)
Plug 'tommcdo/vim-express' " custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)

" Git & Project
Plug 'stefandtw/quickfix-reflector.vim' " edit the qf list directly with copen
Plug 'dsummersl/vim-projectionist', { 'branch': 'issue-94' } " :E* commands for a project
Plug 'MarcWeber/vim-addon-local-vimrc' " enable project local .vimrc files
Plug 'tpope/vim-fugitive', {} " git
Plug 'tpope/vim-rhubarb' " Gbrowse 
Plug 'tpope/vim-eunuch' " eunuch.vim: cp/move/unlink commands
Plug 'ludovicchabant/vim-gutentags'
Plug 'vinodkri/vim-tmux-runner' " :VtrSendCommandToRunner for tmux
Plug 'tpope/vim-abolish' " fix spelling errors
Plug 'editorconfig/editorconfig-vim' " 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
Plug 'mattn/emmet-vim' " fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
Plug 'tomtom/tcomment_vim' " An extensible & universal comment vim-plugin that also handles embedded filetypes
Plug 'Yggdroot/LeaderF', { 'do': './install.sh'}
Plug 'gregsexton/gitv'
Plug 'mhinz/vim-grepper' " Grepper to search in lots of ways
Plug 'jiangmiao/auto-pairs' " close quotes and such automatically
Plug '~/Documents/classes/vim-utf2ascii' " simple utf2ascii function.
Plug 'AndrewRadev/switch.vim', {} " Easily toggle boolean values:
Plug 'dsummersl/gundo.vim', { 'branch': 'mundo-master' }
Plug 'w0rp/ale'
if has('nvim')
  Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' } " Colors for red/green/#123123
  Plug '~/Documents/classes/nvim-sluice'
  Plug 'SirVer/ultisnips'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'glepnir/lspsaga.nvim'
endif

" Colorschemes & colors
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank' " highlight any text as it is yanked
Plug 'pgdouyon/vim-evanesco' " Highlight search, clear after searching
Plug 'nathanaelkane/vim-indent-guides' " A Vim plugin for visually displaying indent levels in code

" Language specific plugins:
Plug 'prabirshrestha/async.vim'
Plug 'vim-test/vim-test'
Plug 'mattn/webapi-vim'

" Textobj plugins
Plug 'wellle/targets.vim' " many text objects
Plug 'kana/vim-textobj-user' " user defined textobj implementations
Plug 'glts/vim-textobj-comment' " select comment with vic or vac.
Plug 'michaeljsmith/vim-indent-object' " vii and viI (visual inner Indent)
Plug 'saaguero/vim-textobj-pastedtext' " vgb for last pasted text.

" Extra 
Plug 'ryanoasis/vim-devicons'

call plug#end()

set termguicolors
set background=dark
let g:gruvbox_material_palette= 'mix'
let g:gruvbox_material_background = 'hard'
let g:gruvbox_material_enable_italic = 1
let g:gruvbox_material_enable_bold = 1
let g:airline_theme = 'gruvbox_material'
let g:gruvbox_material_current_word = 'grey background'
colorscheme gruvbox-material

set cursorline
" show column markers beyond the 80, and 100
" TODO don't set a colorcolumn if the file is read only (help files and such).
set colorcolumn=+20,+21,+22,+23

" }}}
" basic options {{{

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

set guioptions=egt  " GUI options
syntax on

" use folding by default
set foldmethod=marker
set foldcolumn=auto

" Turn on mouse for a visual and normal mode only:
set mouse=v

if has('nvim')
  set diffopt=filler,iwhiteall,vertical,hiddenoff,algorithm:patience
end
set nohlsearch
set nowrap

" SPACES, and tab size of two characters
set expandtab
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

set updatetime=1000
set timeoutlen=500

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
let g:python3_host_prog='/Users/danesummers/.pyenv/shims/python'

hi Search gui=reverse guifg=#805c0b

"}}}
" Plugin settings, changes."{{{


" for vim-sandwich don't have any s mappings as per docs
nmap s <Nop>
xmap s <Nop>
" Add the space before/after capability that vim-surround had.
autocmd FileType * call sandwich#util#addlocal([
\   {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
\
\   {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
\
\   {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
\    'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
\ ])

let g:kite_supported_languages = ['*']

let g:Hexokinase_virtualText = ' '
let g:Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
" let g:Hexokinase_highlighters = [ 'virtual', 'backgroundfull' ]

call repeatable#Setup()

if has('nvim')
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "maintained",
  highlight = {
    enable = true,              -- false will disable the whole extension
    use_langtree = true,
    disable = { "c", "rust", "markdown"},  -- list of language that will be disabled
  },
  incremental_selection = { enable = true },
  textobjects = { enable = true },
  indent = { enable = false },
  textobjects = {
    select = {
      enable = true,

      -- Automatically jump forward to textobj, similar to targets.vim 
      lookahead = true,

      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
}

local lsp_status = require('lsp-status')
lsp_status.register_progress()

local lspconfig = require('lspconfig')

local saga = require 'lspsaga'
saga.init_lsp_saga{
  hint_sign = '.'
}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = false,
    signs = true,
    update_in_insert = false,
  }
)

local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  lsp_status.on_attach(client)
  require'completion'.on_attach()
  -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', ',dd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', ',dD', '<cmd>lua require("lspsaga.provider").preview_definition()<CR>', opts)
  buf_set_keymap('n', ',dh', '<cmd>lua require("lspsaga.hover").render_hover_doc()<CR>', opts)
  buf_set_keymap('n', ',di', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', ',ds', '<cmd>lua require("lspsaga.signaturehelp").signature_help()<CR>', opts)
  buf_set_keymap('n', ',dr', '<cmd>lua require("lspsaga.rename").rename()<CR>', opts)
  buf_set_keymap('n', ',da', '<cmd>lua require("lspsaga.codeaction").code_action()<CR>', opts)
  buf_set_keymap('v', ',da', '<cmd>lua require("lspsaga.codeaction").range_code_action()<CR>', opts)
  buf_set_keymap('n', ',dl', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', ',dq', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_next()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua require("lspsaga.diagnostic").lsp_jump_diagnostic_prev()<CR>', opts)

  -- Set some keybinds conditional on server capabilities
  if client.resolved_capabilities.document_formatting then
    buf_set_keymap("n", ",df", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  elseif client.resolved_capabilities.document_range_formatting then
    buf_set_keymap("n", ",df", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end
  
  local on_references = vim.lsp.handlers["textDocument/references"]
  vim.lsp.handlers["textDocument/references"] = vim.lsp.with(
    on_references, {
      -- Use location list instead of quickfix list
      loclist = true,
    }
  )

  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.clear_references() ; vim.lsp.buf.document_highlight()
        " autocmd CursorMoved <buffer> 
      augroup END
    ]], false)
  end
end

lspconfig.tsserver.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.yamlls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.jsonls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.html.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.cssls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.vimls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.solargraph.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.rust_analyzer.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.sumneko_lua.setup{
  on_attach=on_attach, capabilities=lsp_status.capabilities,
  cmd = {"Users","danesummers",".cache","nvim","lspconfig","sumneko_lua","lua-language-server","bin","macOS","lua-language-server"}
}
-- lspconfig.pyls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
lspconfig.pyright.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
EOF
endif

nmap ]h <plug>(signify-next-hunk)
nmap [h <plug>(signify-prev-hunk)
let g:signify_sign_add    = '▎'
let g:signify_sign_change = '▎'

let g:completion_enable_snippet = 'UltiSnips'
let g:completion_enable_auto_popup = 1
let g:kite_completions = 0
let g:completion_trigger_keyword_length = 2
set completefunc=kite#completion#complete
imap  <c-j> <Plug>(completion_next_source)
imap  <c-k> <Plug>(completion_prev_source)
let g:completion_chain_complete_list = {
    \'default' : [
    \    {'mode': 'user'},
    \    {'complete_items': ['lsp', 'snippet']},
    \]
    \}

function! LspStatus()
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    let value = luaeval("vim.b.lsp_current_function")
    if value == "null"
      return ""
    else
      return value
    endif
  endif
  return ""
endfunction
function! LightlineMode()
  return lightline#mode()[0:0]
endfunction
function! LightlineFilename()
  let filename = expand('%:t') !=# '' ? expand('%:t') : '[No Name]'
  let modified = &modified ? ' +' : ''
  return filename . modified
endfunction
function! LightlineFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? WebDevIconsGetFileTypeSymbol() . ' ': 'no ft') : ''
endfunction
function! LightlineFileformat()
  return WebDevIconsGetFileFormatSymbol()
endfunction
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'filename' ] ],
      \   'right': [ [ 'lineinfo' ], [ 'percent' ],
      \             [ 'currentfunction', 'indent', 'fileformat', 'filetype' ] ]
      \ },
      \ 'component': {
      \   'indent': '%{&expandtab?"":"t"}%{&tabstop}',
      \ },
      \ 'component_function': {
      \   'mode': 'LightlineMode',
      \   'filename': 'LightlineFilename',
      \   'filetype': 'LightlineFiletype',
      \   'fileformat': 'LightlineFileformat',
      \   'currentfunction': 'LspStatus',
      \ },
      \ }

let g:grepper = {}
let g:grepper.open = 1
let g:grepper.stop = 300
let g:grepper.tools = ['git', 'ag', 'sift']

let g:nrrw_rgn_wdth = 100
map <leader>gn  <Plug>(operator-nrrw)
call operator#user#define_ex_command('nrrw', 'NR')
let g:nrrw_rgn_nomap_nr = 1
let g:nrrw_rgn_nomap_Nr = 1

nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

" Enable writegood linting on various programmer docs:
let g:ale_linter_aliases = {
      \ 'python': ['python'],
      \ 'markdown': ['asciidoc', 'markdown'],
      \ 'ruby': ['asciidoc', 'ruby'],
      \ }
let g:ale_completion_enabled = 0
let g:ale_set_balloons = 0
let g:ale_set_signs = 1
let g:ale_sign_highlight_linenrs = 1
let g:ale_set_highlights = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_save = 0
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_delay = 50
" let g:ale_lint_on_text_changed = 'normal'
Repeatable nmap [g <Plug>(ale_previous)
Repeatable nmap ]g <Plug>(ale_next)
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

" When using gL and gl, squeeze any extra leading whitespace.
let g:lion_squeeze_spaces = 1

let g:highlightedyank_highlight_duration = 250

" Run test commands in tmux - or neoterm, thats my other fav.
let g:test#strategy = 'vtr'

let g:splitjoin_trailing_comma = 1

let g:gutentags_modules = ['ctags']
let g:gutentags_cache_dir = '~/.vim/tags'
let g:gutentags_ctags_exclude = [ '*.json', '*.md', '*/node_modules/*', '*/bower_components/*',
      \ '*/public/assets/*', '*/public/packs/*', '*/public/packs-test/*', '*/vendor/*',
      \ 'tags', '*.sql', '*.html']

let g:mundo_verbose_graph = 0
let g:mundo_mirror_graph = 1
let g:mundo_prefer_python3 = 1
let g:mundo_help = 0
let g:mundo_inline_undo = 1

let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_color_change_percent = 4

" we have very long commit lines - this helps!
let g:Gitv_TruncateCommitSubjects = 1
let g:Gitv_OpenHorizontal = 1
let g:flog_default_arguments={ 'date': 'short' }

" left/right and up/down first/last
let g:switch_custom_definitions =
    \ [
    \ { '\.\([a-zA-Z_-]\+\)\>': "['\\1']" }, { '\[[''"]\([a-zA-Z_-]\+\)[''"]\]': '.\1' },
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
    \ { 'row': 'column' }, { 'column': 'row' },
    \ ]


" pathing for abolish
set runtimepath+=~/.vim/after

let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips']
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
" Find references to the symbol under the cursor (C-S-])
" nnoremap <F14> :GscopeFind c <C-R><C-W><cr>

" save my right pinky some pain:
nnoremap <leader>t zt
nnoremap <leader>b zb
nnoremap <leader>, zz

let g:sluice_default_macromode=1

" show diff with git
nnoremap <F5> :MundoToggle<CR>
nnoremap <F6> :Gvdiff<CR>
nnoremap <F7> :TestLast<CR>
" easily access f-keys -- not easy on a macbookpro with 'touch bar'
map <leader>f5 :MundoToggle<cr>
map <leader>f6 :Gvdiff<cr>
map <leader>f7 :Gvdiffsplit<cr>

" don't search included files by default - it can be fucked up slow:
set complete-=i
set completeopt=menuone,noinsert,noselect
set shortmess+=c

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

vnoremap [6 d:let @"=system('base64 --decode', @") \| norm ""p<cr>
vnoremap ]6 d:let @"=system('base64 --wrap=0', @") \| norm ""p<cr>

let g:AutoPairsFlyMode=1
let g:AutoPairsMultilineClose=0

map <leader>gv  <Plug>(operator-vtr)
call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')

" I want to see all the options when I try to jump to a tag:
nmap <C-]> :GutentagsReset<cr>g<C-]>zt

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

let g:EasyMotion_do_mapping=0
let g:EasyMotion_smartcase=1
nmap <leader>s  <Plug>(easymotion-sn)
nmap <leader>; <Plug>(easymotion-next)
let g:EasyMotion_enter_jump_first = 1
let g:EasyMotion_space_jump_first = 1

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

" instead of using this, I use 'gt'
map <nul> <esc>

" turn off help
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
noremap <leader>/f :exec "Grepper -jump -tool ag -noprompt -query ". expand("%:t:r:r")<CR>
noremap <leader>/g :Grepper -tool ag -jump<cr>
noremap <leader>/a :AA 
" see all the search matches in a separate window
noremap <leader>// :exec "Grepper -jump -tool ag -noprompt -query ". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ." ". expand('%')<CR>

" unimpaired like mapping for diff option for ignoring whitespace.
noremap ]oI :set diffopt-=iwhiteall<cr>
noremap [oI :set diffopt+=iwhiteall<cr>

" undo/redo to the previous write
Repeatable map <leader>uu :DiffEarlier<cr>
Repeatable map <leader>rr :DiffLater<cr>
Repeatable map <leader>uf :DiffEarlier 1f<cr>
Repeatable map <leader>rf :DiffLater 1f<cr>

" When in Gstatus jump to the next file in the list and diff it.
Repeatable map <leader>gj <C-w>l<C-w>kjdv
Repeatable map <leader>gk <C-w>l<C-w>kkdv

" Send a selection to the terminal:
map <leader>ctn :TestNearest<CR>
map <leader>cts :TestSuite<CR>
map <leader>ctf :TestFile<CR>
map <leader>ctl :TestLast<CR>

" Open the current directory (or make new directory)
map - :e %:h/<CR>

" automatically toggle with control-
let g:switch_mapping = ',gs'

vmap <leader>v :VSSplit<cr>
"}}}
" Commands"{{{

" TODO Note that this usually only works if 'syn off' is set - if the text you are
" searching for is on a line with syntax coloring, then it likely will not be
" folded.
map <leader>ch :call ToggleSearchConceal()<CR>

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

function! s:DiffAgainstRegisterA() range
  " Diff the current selection against whatever is in register 'a'
  let lines = getline(a:firstline, a:lastline)
  new
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  silent put =lines
  diffthis
  vnew
  setlocal buftype=nofile
  setlocal bufhidden=delete
  setlocal noswapfile
  exec "silent put a"
  diffthis
  resize 100
endfunction
command! -nargs=0 -range DiffAgainstRegisterA <line1>,<line2>call s:DiffAgainstRegisterA()
vnoremap <leader>-  :'<,'>DiffAgainstRegisterA<CR>

function! s:ResetGutentags()
  if exists('b:gutentags_files')
    unlet b:gutentags_files
  endif
  call gutentags#setup_gutentags()
endfunction

command! -nargs=0 GutentagsReset call s:ResetGutentags()

function! s:ResetLSP()
  lua vim.lsp.stop_client(vim.lsp.get_active_clients())
  edit
endfunction

command! -nargs=0 ResetLSP call s:ResetLSP()

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
    highlight! link String Blue
    highlight! link TSString Blue
    highlight! link TSFunction AquaBold

    " highlight! link LspReferenceRead Search
    " highlight! link LspReferenceText Search
    " highlight! link LspReferenceWrite IncSearch

    highlight! link LspDiagnosticsSignHint Folded
    highlight! link LspDiagnosticsSignError RedSign

    highlight! link SignifySignAdd    GreenSign
    highlight! link SignifySignDelete RedSign
    highlight! link SignifySignChange YellowSign
  endfunction
  
  augroup GruvboxMaterialCustom
    autocmd!
    autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
  augroup END

  call s:gruvbox_material_custom()

  autocmd BufNewFile,BufRead *.j2 setf jinja
  autocmd BufNewFile,BufRead *.md setf markdown
  autocmd BufNewFile,BufRead *.md setlocal spell wrap et
  autocmd BufNewFile,BufRead *.csv setf csv
  autocmd BufNewFile,BufRead *.tsv setf csv
  autocmd BufNewFile,BufRead *.tsv setlocal ts=20 sw=25
  autocmd BufNewFile,BufRead *.tsv Delimiter \t
  autocmd BufNewFile,BufRead Vagrantfile set ft=ruby

  " Some other ruby project is tromping over the gutentags files - manually
  " reload every time we enter:
  autocmd BufRead *.rb  :GutentagsReset
  autocmd BufRead *.slim  :GutentagsReset
  autocmd BufRead *.haml  :GutentagsReset

  " make commit messages formatted to 72 columns for optimal reading/history:
  autocmd BufNewFile,BufRead COMMIT_EDITMSG setlocal tw=72 fo=tc spell

  " get rid of any extra git fugitive buffers
  autocmd BufReadPost fugitive://* set bufhidden=delete

  " close the quickfix window when an item is selected.
  autocmd FileType qf nnoremap <buffer> <CR> <CR>:cclose<CR>
  autocmd FileType qf setlocal colorcolumn=
endif
"}}}
" vim: set ai fdm=marker cms="%s:
