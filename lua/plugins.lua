vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'mhinz/vim-signify', config = function()
    vim.g.signify_sign_add    = '▎'
    vim.g.signify_sign_change = '▎'
    vim.cmd([[
      nmap ]h <plug>(signify-next-hunk)
      nmap [h <plug>(signify-prev-hunk)
    ]])
  end}
  use {'AndrewRadev/splitjoin.vim', opt = true, keys = { {'n', 'gJ'}, {'n', 'gS'} }, config = function()
    vim.g.splitjoin_trailing_comma = 1
  end}
  use { 'kiteco/vim-plugin', config = function()
    vim.g.kite_supported_languages = {'*'}
    vim.g.kite_completions = 0
  end}
  use { 'ThePrimeagen/refactoring.nvim', requires = {'nvim-lua/plenary.nvim'}, config = function()
    local refactor = require("refactoring")
    refactor.setup()
    vim.api.nvim_set_keymap("v", "<Leader>re", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]], {noremap = true, silent = true, expr = false})
    vim.api.nvim_set_keymap("v", "<Leader>rf", [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]], {noremap = true, silent = true, expr = false})
    vim.api.nvim_set_keymap("v", "<Leader>rt", [[ <Esc><Cmd>lua require('refactoring').refactors()<CR>]], {noremap = true, silent = true, expr = false})
  end}
  use { 'machakann/vim-sandwich', setup = function()
    -- for vim-sandwich don't have any s mappings as per docs
    vim.cmd [[nmap s <Nop>]]
    vim.cmd [[xmap s <Nop>]]
    
    -- Add the space before/after capability that vim-surround had.
    -- TODO can't load this :(
    -- vim.api.nvim_exec([[
    -- autocmd FileType * call sandwich#util#addlocal([
    --    {'buns': ['{ ', ' }'], 'nesting': 1, 'match_syntax': 1,
    --     'kind': ['add', 'replace'], 'action': ['add'], 'input': ['{']},
    --
    --    {'buns': ['[ ', ' ]'], 'nesting': 1, 'match_syntax': 1,
    --     'kind': ['add', 'replace'], 'action': ['add'], 'input': ['[']},
    --
    --    {'buns': ['( ', ' )'], 'nesting': 1, 'match_syntax': 1,
    --     'kind': ['add', 'replace'], 'action': ['add'], 'input': ['(']},
    --  ])
    -- ]])
  end}
  use { 'nvim-lua/completion-nvim', config = function()
    vim.g.completion_enable_snippet = 'UltiSnips'
    vim.g.completion_enable_auto_popup = 1
    vim.g.completion_trigger_keyword_length = 2
    vim.cmd([[
      set completefunc=kite#completion#complete
      imap <c-j> <Plug>(completion_next_source)
      imap <c-k> <Plug>(completion_prev_source)

      " don't search included files by default - it can be fucked up slow:
      set complete-=i
      set completeopt=menuone,noinsert,noselect
      set shortmess+=c
    ]])
    vim.g.completion_chain_complete_list = {
      default = {
        {mode = 'user'},
        {complete_items = {'lsp', 'snippet'}},
      }
    }

  end}
  use {'dsummersl/vim-diffundo', opt = true, keys = { {'n', ',uu'}, {'n', ',rr'}, {'n', ',uf'}, {'n', ',rf'} }, config = function()
    vim.cmd([[
      " undo/redo to the previous write
      Repeatable map <leader>uu :DiffEarlier<cr>
      Repeatable map <leader>rr :DiffLater<cr>
      Repeatable map <leader>uf :DiffEarlier 1f<cr>
      Repeatable map <leader>rf :DiffLater 1f<cr>
    ]])
  end}
  use { 'sainnhe/gruvbox-material', config = function()
    vim.g.gruvbox_material_palette       = 'mix'
    vim.g.gruvbox_material_background    = 'hard'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold   = 1
    vim.g.airline_theme                  = 'gruvbox_material'
    vim.g.gruvbox_material_current_word  = 'grey background'
  end}
  use {'jeetsukumaran/vim-indentwise', opt = true, keys = { {'n', '[iI'}, {'n', ']iI'}, {'n', ']ii'}, {'n', '[ii'} }, config = function()
    vim.cmd([[
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
    ]])
  end} -- Support indent motions ]ii
  use 'tpope/vim-unimpaired' -- many additional mappings for ]q, etc
  use 'tpope/vim-repeat' -- awesome: makes the surround plugin work with the '.' keys (repeatability!)
  use { 'kreskij/Repeatable.vim', requires = { 'tpope/vim-repeat' }, config = function()
    vim.cmd([[
      call repeatable#Setup()

      " When in Gstatus jump to the next file in the list and diff it.
      Repeatable map <leader>gj <C-w>l<C-w>kjdv
      Repeatable map <leader>gk <C-w>l<C-w>kkdv
    ]])
  end}
  use {'easymotion/vim-easymotion', opt = true, keys = { {'n', ',s'} }, config = function()
    vim.cmd([[
      let g:EasyMotion_do_mapping=0
      let g:EasyMotion_smartcase=1
      nmap <leader>s  <Plug>(easymotion-sn)
      nmap <leader>; <Plug>(easymotion-next)
      let g:EasyMotion_enter_jump_first = 1
      let g:EasyMotion_space_jump_first = 1
    ]])
  end} -- mapped to s for two letter searching.
  use {'wellle/visual-split.vim', opt = true, keys = { {'n', ',v'} }, config = function()
    vim.cmd([[
      vmap <leader>v :VSSplit<cr>
    ]])
  end} -- I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
  use 'kana/vim-operator-user' -- Define my own operators for motions.
  use {'tommcdo/vim-exchange', opt = true, keys = { {'n', 'cx'}, }, }
  use {'tommcdo/vim-lion', opt = true, keys = { {'n', 'gl'}, {'n', 'gL'} }, config = function()
    -- When using gL and gl, squeeze any extra leading whitespace.
    vim.g.lion_squeeze_spaces = 1
  end} -- align with operator gL and gl (ie glip= to align paragraph by =)
  use {'tommcdo/vim-express', opt = true, keys = { {'n', 'g='} }} -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)

  use 'stefandtw/quickfix-reflector.vim' -- edit the qf list directly with copen
  use { 'dsummersl/vim-projectionist', branch = 'issue-94', config = function()
    vim.cmd([[
      " Use projectionist mapping when doing a C-7
      nnoremap <leader>6 :A<cr>
      nnoremap <leader>. :E
    ]])
  end} -- :E* commands for a project
  use 'MarcWeber/vim-addon-local-vimrc' -- enable project local .vimrc files
  use {'tpope/vim-fugitive', config = function()
    vim.cmd([[
      " easily access f-keys -- not easy on a macbookpro with 'touch bar'
      nnoremap <F6> :Gvdiff<CR>
      map <leader>f6 :Gvdiff<cr>
      map <leader>f7 :Gvdiffsplit<cr>
      nnoremap <leader>gg :G<cr>

      " get rid of any extra git fugitive buffers
      autocmd BufReadPost fugitive://* set bufhidden=delete
    ]])
  end} -- git
  use {'tpope/vim-rhubarb', opt = true, cmd = 'GBrowse'} -- Gbrowse 
  use {'tpope/vim-eunuch', opt = true, cmd = { 'Copy', 'Remove', 'Delete', 'Move', 'Rename' }} -- eunuch.vim: cp/move/unlink commands
  use {'ludovicchabant/vim-gutentags', config = function()
    vim.g.gutentags_modules = {'ctags'}
    vim.g.gutentags_cache_dir = '~/.vim/tags'
    vim.g.gutentags_ctags_exclude = { '*.json', '*.md', '*/node_modules/*', '*/bower_components/*',
          '*/public/assets/*', '*/public/packs/*', '*/public/packs-test/*', '*/vendor/*',
          'tags', '*.sql', '*.html'}

    vim.cmd([[
      " I want to see all the options when I try to jump to a tag:
      nmap <C-]> :GutentagsReset<cr>g<C-]>zt

      function! ResetGutentags()
        if exists('b:gutentags_files')
          unlet b:gutentags_files
        endif
        call gutentags#setup_gutentags()
      endfunction

      command! -nargs=0 GutentagsReset call ResetGutentags()

      " Some other ruby project is tromping over the gutentags files - manually
      " reload every time we enter:
      autocmd BufRead *.rb  :GutentagsReset
      autocmd BufRead *.slim  :GutentagsReset
      autocmd BufRead *.haml  :GutentagsReset
    ]])
  end}
  use {'vinodkri/vim-tmux-runner', config = function()
    vim.cmd([[
      map <leader>gv  <Plug>(operator-vtr)
      call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')
    ]])
  end} -- :VtrSendCommandToRunner for tmux
  use {'tpope/vim-abolish', config = function()
    vim.cmd([[
      " pathing for abolish
      set runtimepath+=~/.vim/after
    ]])
  end} -- fix spelling errors
  use 'editorconfig/editorconfig-vim' -- 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
  use {'mattn/emmet-vim', opt = true, keys = { 'n', '<c-y>,' }} -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  use {'tomtom/tcomment_vim', opt = true, keys = { 'n', 'gc' }} -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  use { 'Yggdroot/LeaderF', run = './install.sh', config = function()
    vim.cmd([[
      let g:Lf_WindowHeight = 0.2
      let g:Lf_PopupWidth = 0.9
      nnoremap <C-p> :Leaderf file --nowrap<CR>
      " User iterm2 to map shift-ctrl-p to <f15>
      nnoremap <F15> :Leaderf mru --cwd --nowrap<CR>
      nnoremap <C-t> :Leaderf tag --nowrap<CR>
      " User iterm2 to map shift-ctrl-t to <f16>
      nnoremap <F16> :Leaderf bufTag --nowrap<CR>
    ]])
  end}
  use {'gregsexton/gitv', opt = true, cmd = 'Gitv', config = function()
    -- we have very long commit lines - this helps!
    vim.g.Gitv_TruncateCommitSubjects = 1
    vim.g.Gitv_OpenHorizontal = 1
    vim.g.flog_default_arguments={ date = "short" }
    vim.cmd([[
      cabbrev gitv Gitv
    ]])
  end}
  use { 'mhinz/vim-grepper', config = function()
    vim.g.grepper = {
      open = 1,
      stop = 300,
      tools = {'git', 'ag', 'sift'},
    }

    vim.cmd([[
      noremap <leader>/f :exec "Grepper -jump -tool ag -noprompt -query ". expand("%:t:r:r")<CR>
      noremap <leader>/g :Grepper -tool ag -jump<cr>

      " see all the search matches in a separate window
      noremap <leader>// :exec "Grepper -jump -tool ag -noprompt -query ". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ." ". expand('%')<CR>

      " Execute something on all files of the same kind:
      "
      " See GG and AA commands:
      function! ExecFileType(cmd,search)
        let l:extension = substitute(expand('%'),'\v^.*\.','','')
        " save the last search as this so that */# work:
        let @/ = a:search
        exec printf('silent %s',printf(a:cmd,a:search,l:extension))
      endfunction

      cnoremap AG GrepperAg
      command! -nargs=1 GG call ExecFileType("silent GrepperGit %s -- '*.%s'",'<args>')
      command! -nargs=1 AA call ExecFileType("silent GrepperAg '%s' -G '.*.%s'",'<args>')
      " TODO make Ggrep be test for the command...for non git projects, fallback on Ag
      " Something like :if exists(':Ggrep')
      command! -nargs=1 Gg exec "silent GrepperGit -jump ". '<args>'
      command! -nargs=1 Aa exec "silent GrepperAg -jump ". '<args>'

      nmap gs <plug>(GrepperOperator)
      xmap gs <plug>(GrepperOperator)
    ]])
  end} -- Grepper to search in lots of ways
  use {'jiangmiao/auto-pairs', config = function()
    vim.g.AutoPairsFlyMode=1
    vim.g.AutoPairsMultilineClose=0
  end} -- close quotes and such automatically
  use {'~/Documents/classes/vim-utf2ascii', opt = true, cmd = 'UTFToASCII', config = function()
    vim.cmd([[
      " Convert unicode to ASCII
      command! UTFToASCII :call utf2ascii#replaceUTF()<cr>
    ]])
  end} -- simple utf2ascii function.
  use {'AndrewRadev/switch.vim', opt = true, keys = { 'n', ',gs' }, config = function()
    -- automatically toggle with control-
    vim.g.switch_mapping = ',gs'

    -- left/right and up/down first/last
    vim.g.switch_custom_definitions = {
      { ['\\.\\([a-zA-Z_-]\\+\\)\\>'] = "['\\1']" },
      { ['\\[[\'"]\\([a-zA-Z_-]\\+\\)[\'"]\\]'] = '.\\1' },
      { ["&&"] ='||' }, { ["||"] ='&&' },
      { ["=="] ='!=' }, { ["!="] ='==' },
      { FALSE ='TRUE' }, { TRUE ='FALSE' },
      { INFO ='DEBUG' }, { DEBUG ='INFO' },
      { align ='justify' }, { justify ='align' },
      { ["and"] ='or' }, { ["or"] ='and' },
      { assertContains ='assertNotContains' }, { assertNotContains ='assertContains' },
      { assertFalse ='assertTrue' }, { assertTrue ='assertFalse' },
      { assertIn ='assertNotIn' }, { assertNotIn ='assertIn' },
      { before ='after' }, { after ='before' },
      { columns ='rows' }, { rows ='columns' },
      { disabled ='enabled' }, { enabled ='disabled' },
      { even ='odd' }, { odd ='even' },
      { first ='last' }, { last ='first' },
      { info ='debug' }, { debug ='info' },
      { left ='right' }, { right ='left' },
      { max ='min' }, { min ='max' },
      { padding ='margin' }, { margin ='padding' },
      { present ='absent' }, { absent ='present' },
      { public ='private' }, { private ='protected' }, { protected ='public' },
      { top ='bottom' }, { bottom ='top' },
      { up ='down' }, { down ='up' },
      { width ='height' }, { height ='width' },
      { yes ='no' }, { no ='yes' },
      { row ='column' }, { column ='row' },
    }
  end} -- Easily toggle boolean values
  use { 'dsummersl/gundo.vim', opt = true, keys = {{'n', '<f5>'}, {'n', ',f5'}}, config = function()
    vim.g.mundo_verbose_graph = 0
    vim.g.mundo_mirror_graph = 1
    vim.g.mundo_prefer_python3 = 1
    vim.g.mundo_help = 0
    vim.g.mundo_inline_undo = 1
    vim.cmd([[
      nnoremap <F5> :MundoToggle<CR>
      map <leader>f5 :MundoToggle<cr>
    ]])
  end}
  use { 'w0rp/ale', opt = true, cmd = {'ALEEnable', 'ALELint', 'ALEFix'}, requires = {'kreskij/Repeatable.vim'}, setup = function()
    vim.g.ale_linter_aliases = {
      python = {'python'},
      markdown = {'asciidoc', 'markdown'},
      ruby = {'asciidoc', 'ruby'}
    }
    vim.g.ale_linters = {
      python = {'black', 'pyls', 'isort', 'trim_whitespace'},
      javascript = {'eslint'},
      scss = {'stylelint'}
    }
    vim.g.ale_lint_on_enter = 0
    vim.g.ale_lint_on_filetype_changed = 0
    vim.g.ale_lint_on_save = 0
    vim.g.ale_lint_on_text_changed = 0
    vim.g.ale_lint_on_insert_leave = 0
    vim.g.ale_completion_enabled = 0
    vim.g.ale_set_balloons = 0
    vim.g.ale_set_signs = 1
    vim.g.ale_sign_highlight_linenrs = 1
    vim.g.ale_set_highlights = 0
    vim.g.ale_lint_delay = 50
  end,
  config = function()
    vim.cmd([[
      Repeatable nmap [g <Plug>(ale_previous)
      Repeatable nmap ]g <Plug>(ale_next)
    ]])
  end}
  use { 'RRethy/vim-hexokinase', run = 'make hexokinase', config = function()
    vim.g.Hexokinase_virtualText = ' '
    vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
    -- let g:Hexokinase_highlighters = [ 'virtual', 'backgroundfull' ]
  end} -- Colors for red/green/#123123
  use '~/Documents/classes/nvim-sluice'
  use {'SirVer/ultisnips', config = function()
    vim.cmd([[
      let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips']
      let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
      let g:UltiSnipsListSnippets='<C-\>'
      let g:UltiSnipsExpandTrigger='<Tab>'
      let g:UltiSnipsJumpForwardTrigger='<Tab>'                                           
      let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
    ]])
  end}
  use { 'nvim-lua/lsp-status.nvim' }
  use { 'neovim/nvim-lspconfig', requires = {'nvim-lua/lsp-status.nvim', 'nvim-lua/completion-nvim'}, config = function()
    local lspconfig = require('lspconfig')
    local lsp_status = require('lsp-status')
    lsp_status.register_progress()

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
    lspconfig.gopls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
    lspconfig.vimls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
    lspconfig.solargraph.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
    lspconfig.rust_analyzer.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
    lspconfig.sumneko_lua.setup{
      on_attach=on_attach, capabilities=lsp_status.capabilities,
      cmd = {"Users","danesummers",".cache","nvim","lspconfig","sumneko_lua","lua-language-server","bin","macOS","lua-language-server"}
    }
    -- lspconfig.pyls.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }
    lspconfig.pyright.setup{ on_attach=on_attach, capabilities=lsp_status.capabilities }


    vim.cmd([[
      function! ResetLSP()
        lua vim.lsp.stop_client(vim.lsp.get_active_clients())
        edit
      endfunction

      command! -nargs=0 ResetLSP call ResetLSP()
    ]])
  end}
  use { 'nvim-treesitter/nvim-treesitter', requires = {'nvim-treesitter/nvim-treesitter-textobjects'}, run = ':TSUpdate', config = function()
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
            ["ac"] = "@comment.outer",
            ["ic"] = "@comment.outer",
            ["as"] = "@statement.outer",
            ["is"] = "@statement.outer",
          },
        },
        swap = {
          enable = true,
          swap_next = {
            ["]a"] = "@parameter.inner"
          },
          swap_previous = {
            ["[a"] = "@parameter.inner"
          }
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]]"] = "@function.outer",
          },
          goto_previous_start = {
            ["[["] = "@function.outer",
          },
        }
      },
    }
  end}
  use { 'glepnir/lspsaga.nvim', config = function()
    local saga = require 'lspsaga'
    saga.init_lsp_saga{
      hint_sign = '.'
    }
  end}

  use {'itchyny/lightline.vim', config = function()
    vim.cmd([[
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
    ]])

    vim.g.lightline = {
      colorscheme = 'jellybeans',
      active = {
        left = {
          { 'mode', 'paste' },
          { 'readonly', 'filename' } 
        },
        right = {
          { 'lineinfo' },
          { 'percent' },
          { 'currentfunction', 'indent', 'fileformat', 'filetype' }
        }
      },
      component = {
        indent = '%{&expandtab?"":"t"}%{&tabstop}',
      },
      component_function = {
        mode = 'LightlineMode',
        filename = 'LightlineFilename',
        filetype = 'LightlineFiletype',
        fileformat = 'LightlineFileformat',
        currentfunction = 'LspStatus',
      }
    }
  end}
  use {'machakann/vim-highlightedyank', config = function()
    vim.g.highlightedyank_highlight_duration = 250
  end} -- highlight any text as it is yanked
  use 'pgdouyon/vim-evanesco' -- Highlight search, clear after searching
  use {'nathanaelkane/vim-indent-guides', opt = true, cmd = { 'IndentGuidesToggle', 'IndentGuidesEnable' }, config = function()
    vim.g.indent_guides_enable_on_vim_startup = 0
    vim.g.indent_guides_color_change_percent = 4
  end} -- A Vim plugin for visually displaying indent levels in code
  use { 'vim-test/vim-test', opt = true, keys = {{'n', ',ctn'}, {'n', ',ctf'}}, config = function()
    -- E15 when I run this. I think its b/c of function?
    vim.cmd([[
      " Send a selection to the terminal:
      map <leader>ctn :TestNearest<CR>
      map <leader>ctf :TestFile<CR>
      map <leader>ctl :TestLast<CR>

      " Run test commands in tmux - or neoterm, thats my other fav.
      let g:test#strategy = 'vtr'
    ]])
    --
    --   " Transforms for running tests in. {} is replaced. For example:
    --   " let test#sub = 'docker run --rm web python manage.py test {} | pygmentize -l pytb'
    --   " or, just pipe to something
    --   " let test#sub = '{} | pygmentize -l pytb'
    --   let g:test#sub = ''
    --   function! SubstituteTransform(cmd) abort
    --     return substitute(g:test#sub, '{}', a:cmd, 'g')
    --   endfunction
    --
    --   function! LastTransform(cmd) abort
    --     " Keep only the last word, and combine with SubstituteTransform - handy for
    --     " the djangotest type test where I want to take advantage of its figuring out
    --     " the test name (at the end of the cmd) but want to run it differently
    --     return SubstituteTransform(substitute(a:cmd, '^.* \(\S\+\)$', '\1', ''))
    --   endfunction
    --
    --   let g:test#custom_transformations = {
    --          'sub': function('SubstituteTransform'),
    --          'last': function('LastTransform') }
  end}
  use 'prabirshrestha/async.vim' -- TODO who needs this?
  use 'mattn/webapi-vim' -- TODO who needs this?
  use 'wellle/targets.vim' -- many text objects
  use {'michaeljsmith/vim-indent-object', opt = true, keys = {{'v', 'ii'}, {'v', 'iI'}}} -- vii and viI (visual inner Indent)
  use {'saaguero/vim-textobj-pastedtext', opt = true, keys = {{'v', 'gb'}}} -- vgb for last pasted text.
  use 'ryanoasis/vim-devicons'
end)
