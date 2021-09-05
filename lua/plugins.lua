vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'mhinz/vim-signify'
  use 'AndrewRadev/splitjoin.vim'
  use 'kiteco/vim-plugin'
  use { 'machakann/vim-sandwich', config = function()
    -- for vim-sandwich don't have any s mappings as per docs
    vim.cmd [[nmap s <Nop>]]
    vim.cmd [[xmap s <Nop>]]
    
    -- Add the space before/after capability that vim-surround had.
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
  use 'nvim-lua/completion-nvim'
  -- use 'phaazon/hop.nvim'
  -- use 'lambdalisue/gina.vim'
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'dsummersl/vim-diffundo'
  use { 'sainnhe/gruvbox-material', config = function()
    vim.g.gruvbox_material_palette       = 'mix'
    vim.g.gruvbox_material_background    = 'hard'
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_enable_bold   = 1
    vim.g.airline_theme                  = 'gruvbox_material'
    vim.g.gruvbox_material_current_word  = 'grey background'
  end}

  use 'jeetsukumaran/vim-indentwise' -- Support indent motions ]ii
  use 'tpope/vim-unimpaired' -- many additional mappings for ]q, etc
  use 'tpope/vim-repeat' -- awesome: makes the surround plugin work with the '.' keys (repeatability!)
  use { 'kreskij/Repeatable.vim', requires = { 'tpope/vim-repeat' }, config = function()
    vim.cmd([[
      call repeatable#Setup()

      " undo/redo to the previous write
      Repeatable map <leader>uu :DiffEarlier<cr>
      Repeatable map <leader>rr :DiffLater<cr>
      Repeatable map <leader>uf :DiffEarlier 1f<cr>
      Repeatable map <leader>rf :DiffLater 1f<cr>

      " When in Gstatus jump to the next file in the list and diff it.
      Repeatable map <leader>gj <C-w>l<C-w>kjdv
      Repeatable map <leader>gk <C-w>l<C-w>kkdv
    ]])
  end}
  use 'easymotion/vim-easymotion' -- mapped to s for two letter searching.
  use 'wellle/visual-split.vim' -- I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
  use 'kana/vim-operator-user' -- Define my own operators for motions.
  use 'tommcdo/vim-exchange'

  use 'tommcdo/vim-lion' -- align with operator gL and gl (ie glip= to align paragraph by =)
  use 'tommcdo/vim-express' -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)

  use 'stefandtw/quickfix-reflector.vim' -- edit the qf list directly with copen
  use { 'dsummersl/vim-projectionist', branch = 'issue-94' } -- :E* commands for a project
  use 'MarcWeber/vim-addon-local-vimrc' -- enable project local .vimrc files
  use 'tpope/vim-fugitive' -- git
  use 'tpope/vim-rhubarb' -- Gbrowse 
  use 'tpope/vim-eunuch' -- eunuch.vim: cp/move/unlink commands
  use 'ludovicchabant/vim-gutentags'
  use 'vinodkri/vim-tmux-runner' -- :VtrSendCommandToRunner for tmux
  use 'tpope/vim-abolish' -- fix spelling errors
  use 'editorconfig/editorconfig-vim' -- 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
  use 'mattn/emmet-vim' -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  use 'tomtom/tcomment_vim' -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  use { 'Yggdroot/LeaderF', run = './install.sh' }
  use 'gregsexton/gitv'
  use { 'mhinz/vim-grepper', config = function()
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
    ]])
  end} -- Grepper to search in lots of ways
  use 'jiangmiao/auto-pairs' -- close quotes and such automatically
  use '~/Documents/classes/vim-utf2ascii' -- simple utf2ascii function.
  use 'AndrewRadev/switch.vim' -- Easily toggle boolean values:
  use { 'dsummersl/gundo.vim' }
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
    -- TODO this isn't working out -- lost my nmap
    vim.g.aoeu = 5
    vim.cmd([[
      Repeatable nmap [g <Plug>(ale_previous)
      Repeatable nmap ]g <Plug>(ale_next)
    ]])
  end}
  use { 'RRethy/vim-hexokinase', run = 'make hexokinase' } -- Colors for red/green/#123123
  use '~/Documents/classes/nvim-sluice'
  use 'SirVer/ultisnips'
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
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate', config = function()
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
  end}
  use { 'glepnir/lspsaga.nvim', config = function()
    local saga = require 'lspsaga'
    saga.init_lsp_saga{
      hint_sign = '.'
    }
  end}

  use 'itchyny/lightline.vim'
  use 'machakann/vim-highlightedyank' -- highlight any text as it is yanked
  use 'pgdouyon/vim-evanesco' -- Highlight search, clear after searching
  use 'nathanaelkane/vim-indent-guides' -- A Vim plugin for visually displaying indent levels in code

  use 'prabirshrestha/async.vim'
  use { 'vim-test/vim-test', config = function()
    -- E15 when I run this. I think its b/c of function?
    -- vim.cmd([[
    --   " Send a selection to the terminal:
    --   map <leader>ctn :TestNearest<CR>
    --   map <leader>cts :TestSuite<CR>
    --   map <leader>ctf :TestFile<CR>
    --   map <leader>ctl :TestLast<CR>
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
    -- ]])
  end}
  use 'mattn/webapi-vim'

  use 'wellle/targets.vim' -- many text objects
  use 'kana/vim-textobj-user' -- user defined textobj implementations
  use 'glts/vim-textobj-comment' -- select comment with vic or vac.
  use 'michaeljsmith/vim-indent-object' -- vii and viI (visual inner Indent)
  use 'saaguero/vim-textobj-pastedtext' -- vgb for last pasted text.

  use 'ryanoasis/vim-devicons'
end)
