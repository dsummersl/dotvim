require("lazy").setup({
  {
    {
      "folke/flash.nvim",
      event = "VeryLazy",
      ---@type Flash.Config
      opts = {},
      -- stylua: ignore
      keys = {
        { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,   desc = "Flash" },
        {
          "S",
          mode = { "n", "x", "o" },
          function() require("flash").treesitter() end,
          desc =
          "Flash Treesitter"
        },
        { "r", mode = "o",               function() require("flash").remote() end, desc = "Remote Flash" },
        {
          "R",
          mode = { "o", "x" },
          function() require("flash").treesitter_search() end,
          desc =
          "Treesitter Search"
        },
        {
          "<c-s>",
          mode = { "c" },
          function() require("flash").toggle() end,
          desc =
          "Toggle Flash Search"
        },
      },
    },
    {
      "robitx/gp.nvim",
      config = function()
        require("gp").setup()
        -- shortcuts might be setup here (see Usage > Shortcuts in Readme)
      end,
    },
    {
      "jackMort/ChatGPT.nvim",
      config = function()
        require("chatgpt").setup()
      end,
      dependencies = {
        "MunifTanjim/nui.nvim",
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim"
      },
    },
    {
      "simrat39/symbols-outline.nvim",
      config = function()
        require('symbols-outline').setup {}
      end
    },
    "sindrets/diffview.nvim",
    {
      "Bryley/neoai.nvim",
      dependencies = {
        "MunifTanjim/nui.nvim",
      },
      cmd = {
        "NeoAI",
        "NeoAIOpen",
        "NeoAIClose",
        "NeoAIToggle",
        "NeoAIContext",
        "NeoAIContextOpen",
        "NeoAIContextClose",
        "NeoAIInject",
        "NeoAIInjectCode",
        "NeoAIInjectContext",
        "NeoAIInjectContextCode",
      },
      keys = {
        { "<leader>as", desc = "summarize text" },
        { "<leader>ag", desc = "generate git message" },
      },
      config = function()
        require("neoai").setup({
          -- Options go here
        })
      end,
    },
    "RRethy/nvim-treesitter-textsubjects",
    config = function() -- matching tags/parens/etc
      require('nvim-treesitter.configs').setup {
        textsubjects = {
          enable = true,
          prev_selection = ',', -- (Optional) keymap to select the previous selection
          keymaps = {
            ['.'] = 'textsubjects-smart',
            [';'] = 'textsubjects-container-outer',
            ['i;'] = 'textsubjects-container-inner',
          },
        },
      }
    end,
  },

  ---------------------
  -- Adopted plugins --
  ---------------------

  require("lazy-lspcontrol")(),
  require("lazy-treesitter")(),
  require("lazy-dial")(),
  require("lazy-vimtest")(),
  require("lazy-lightline")(),
  require("lazy-autopairs")(),
  require("lazy-telescope")(),
  require("lazy-gutentags")(),
  require("lazy-cmp")(),
  require("lazy-sandwhich")(),
  "chrisbra/unicode.vim", -- :Unicode* commands to search for them.
  "aklt/plantuml-syntax",
  "folke/which-key.nvim",
  "tommcdo/vim-express",              -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)
  "stefandtw/quickfix-reflector.vim", -- edit the qf list directly with copen
  "michaeljsmith/vim-indent-object",                                                 -- vii and viI (visual inner Indent)
  "ryanoasis/vim-devicons",
  "pgdouyon/vim-evanesco", -- vmap *, Highlight search, clear after searching
  "tommcdo/vim-exchange",
  "tpope/vim-eunuch", -- eunuch.vim: cp/move/unlink commands
  "mattn/emmet-vim",     -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  "tomtom/tcomment_vim", -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  {
    "andymass/vim-matchup",
    init = function() -- matching tags/parens/etc
      vim.g.matchup_matchparen_hi_background = 2
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  {
    "chrisbra/csv.vim",
    config = function()
      vim.g.csv_nomap_space = 1
    end,
  },
  {
    "f-person/git-blame.nvim",
    init = function() -- show git blame in the editor.
      vim.g.gitblame_enabled = 0
      vim.g.gitblame_date_format = "%x"
      vim.g.gitblame_message_template = "<date> <author>: <sha> <summary>"
      vim.g.gitblame_highlight_group = "StatusLineNC"
      vim.g.gitblame_message_when_not_committed = ''
      vim.cmd([[
      nmap [og :GitBlameEnable<cr>
      nmap ]og :GitBlameDisable<cr>
    ]])
    end,
  },
  {
    "chrisbra/NrrwRgn",
    config = function()
      vim.g.nrrw_rgn_nomap_nr = 1
      vim.g.nrrw_rgn_nomap_Nr = 1

      vim.cmd([[
      " get rid of any extra git fugitive buffers
      autocmd BufReadPost NrrwRgn_* set bufhidden=wipe
    ]])
    end,
  },
  {
    "github/copilot.vim",
    config = function()
      vim.g.copilot_no_tab_map = true
      vim.g.copilot_assume_mapped = true
      vim.g.copilot_tab_fallback = ""
    end,
  },
  {
    "plasticboy/vim-markdown",
    config = function()
      vim.g.vim_markdown_folding_disabled = 1
    end,
  },
  {
    "mhinz/vim-signify",
    config = function()
      vim.g.signify_priority = 5
      vim.g.signify_sign_show_count = 0
      vim.g.signify_sign_add = "│"
      vim.g.signify_sign_change = "┊"
      vim.keymap.set('n', ']h', '<plug>(signify-next-hunk)', { desc = 'Next hunk' })
      vim.keymap.set('n', '[h', '<plug>(signify-prev-hunk)', { desc = 'Previous hunk' })
      vim.keymap.set('o', 'ih', '<plug>(signify-motion-inner-pending)', { desc = 'Inner hunk' })
      vim.keymap.set('x', 'ih', '<plug>(signify-motion-inner-visual)', { desc = 'Inner hunk' })
      vim.keymap.set('o', 'ah', '<plug>(signify-motion-outer-pending)', { desc = 'Outer hunk' })
      vim.keymap.set('x', 'ah', '<plug>(signify-motion-outer-visual)', { desc = 'Outer hunk' })
    end,
  },
  {
    "AndrewRadev/splitjoin.vim",
    config = function()
      vim.g.splitjoin_trailing_comma = 1
    end,
  },
  {
    "ThePrimeagen/refactoring.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
      { "nvim-treesitter/nvim-treesitter" }
    },
    config = function()
      -- load refactoring Telescope extension
      require("telescope").load_extension("refactoring")

      -- remap to open the Telescope refactoring menu in visual mode
      vim.api.nvim_set_keymap(
        "v",
        "<leader>dA",
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        { noremap = true, desc = "Refactor actions" }
      )
    end,
  },
  {
    dir = "~/Documents/classes/vim-diffundo",
    dependencies = { "kreskij/Repeatable.vim" },
    config = function()
      vim.cmd([[
      " undo/redo to the previous write
      Repeatable map <leader>uu :DiffEarlier<cr>
      " Repeatable map <leader>rr :DiffLater<cr>
      Repeatable map <leader>uf :DiffEarlier 1f<cr>
      Repeatable map <leader>rf :DiffLater 1f<cr>
    ]])
    end,
  },
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    init = function()
      vim.g.gruvbox_material_palette = "material"
      vim.g.gruvbox_material_background = "hard"
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.airline_theme = "gruvbox_material"
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"
      vim.o.termguicolors = true
      vim.o.background = 'dark'
      vim.cmd.colorscheme('gruvbox-material')
    end,
  },
  {
    "jeetsukumaran/vim-indentwise",
    config = function()
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
    end,
  }, -- Support indent motions ]ii
  {
    "tpope/vim-unimpaired",
    config = function()
      vim.cmd([[
        noremap ]on :set number<cr>
        noremap [on :set nonumber<cr>
      ]])
    end,
  },
  {
    "kreskij/Repeatable.vim",
    dependencies = { "tpope/vim-repeat" },
    config = function()
      vim.cmd([[
      call repeatable#Setup()

      " When in Gstatus jump to the next file in the list and diff it.
      Repeatable map <leader>gj <C-w>l<C-w>kjdv
      Repeatable map <leader>gk <C-w>l<C-w>kkdv
    ]])
    end,
  },
  {
    "wellle/visual-split.vim",
    config = function()
      vim.cmd([[
      vmap <leader>v :VSSplit<cr>
    ]])
    end,
  }, -- I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
  {
    "kana/vim-operator-user",
    config = function()
      vim.cmd([[
      call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')
      " call operator#user#define_ex_command('g/', 'VtrSendLinesToRunner')
      " "call operator#user#define_ex_command('live-grep', 'Op_TelescopeVisualLiveGrep')
      " "function! Op_TelescopeVisualLiveGrep(motion_wise)
      " "  let v = operator#user#visual_command_from_wise_name(a:motion_wise)
      " "  execute "lua require('telescope.builtin').grep_string()"
      " "endfunction
      " "map gs  <Plug>(operator-live-grep)
    ]])
    end,
  }, -- Define my own operators for motions.
  {
    "junegunn/vim-easy-align",
    config = function()
      vim.api.nvim_set_keymap("x", "ga", "<Plug>(EasyAlign)", { noremap = true })
      vim.api.nvim_set_keymap("n", "ga", "<Plug>(EasyAlign)", { noremap = true })
    end,
  },                                  -- align with operator gL and gl (ie glip= to align paragraph by =)
  {
    "tpope/vim-projectionist",
    config = function()
      vim.cmd([[
      " Use projectionist mapping when doing a C-7
      nnoremap <leader>6 :A<cr>
      nnoremap <leader>. :E
    ]])
    end,
  }, -- :E* commands for a project
  {
    "embear/vim-localvimrc",
    init = function()
      vim.g.localvimrc_persistent = 1
      vim.g.localvimrc_ask = 0
      vim.g.localvimrc_debug = 2
      vim.g.localvimrc_sandbox = 0
      vim.g.localvimrc_name = ".vimrc"
    end,
  }, -- enable project local .vimrc files
  {
    "tpope/vim-fugitive",
    config = function()
      vim.cmd([[
      " easily access f-keys -- not easy on a macbookpro with 'touch bar'
      nnoremap <F6> :Gvdiff<CR>
      map <leader>f6 :Gvdiff<cr>
      map <leader>f7 :Gvdiffsplit<cr>
      nnoremap <leader>gg :silent! G<cr>

      " get rid of any extra git fugitive buffers
      autocmd BufReadPost fugitive://* set bufhidden=wipe
      command! -nargs=0 Gone G log --pretty=format:"%ad %Cred%h%Creset: %<(15)%aN %Cred--%Creset %s" --date=short
    ]])
    end,
  }, -- git
  {
    "tpope/vim-rhubarb",
    commit = "af12af4",
    dependencies = { "tpope/vim-fugitive" },
  },                  -- rhubarb seems to be broken for most github repos after commit af12af4
  {
    "tpope/vim-abolish",
    config = function()
      vim.cmd([[
      " pathing for abolish
      set runtimepath+=~/.vim/after
    ]])
    end,
  },                     -- fix spelling errors
  {
    dir = "~/Documents/classes/vim-searchconceal",
    config = function()
      vim.cmd([[
      map ,cc :SearchConcealClear<CR>
      map ,ch :SearchConceal<CR>
    ]])
    end,
  },
  {
    dir = "~/Documents/classes/vim-utf2ascii",
    config = function()
      vim.cmd([[
      " Convert unicode to ASCII
      command! UTFToASCII :call utf2ascii#replaceUTF()<cr>
    ]])
    end,
  }, -- simple utf2ascii function.
  {
    dir = "~/Documents/classes/vim-mundo",
    config = function()
      vim.g.mundo_verbose_graph = 0
      vim.g.mundo_mirror_graph = 1
      vim.g.mundo_prefer_python3 = 1
      vim.g.mundo_help = 0
      vim.g.mundo_inline_undo = 1
      vim.cmd([[
      nnoremap <F5> :MundoToggle<CR>
      map <leader>f5 :MundoToggle<cr>
    ]])
    end,
  },
  {
    "w0rp/ale",
    lazy = true,
    cmd = { "ALEEnable", "ALELint", "ALEFix" },
    dependencies = { "kreskij/Repeatable.vim" },
    init = function()
      vim.g.ale_linter_aliases = {
        python = { "python" },
        markdown = { "asciidoc", "markdown" },
        ruby = { "asciidoc", "ruby" },
      }
      vim.g.ale_linters = {
        python = { "black", "pyls", "isort", "trim_whitespace" },
        javascript = { "eslint" },
        scss = { "stylelint" },
      }
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
    end,
  },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "typescriptreact",
      })
    end,
  },
  {
    dir = "~/Documents/classes/nvim-sluice",
    config = function()
    end
  },
  {
    "SirVer/ultisnips",
    config = function()
      vim.cmd([[
      let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips']
      let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
      let g:UltiSnipsListSnippets='<C-\>'
      let g:UltiSnipsExpandTrigger='<Tab>'
      let g:UltiSnipsJumpForwardTrigger='<Tab>'
      let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
    ]])
    end,
  },
  {
    "RRethy/vim-illuminate",
    config = function()
      require("illuminate").configure()
    end,
  },
  {
    "folke/trouble.nvim",
    dependencies = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        mode = "document_diagnostics",
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
      vim.cmd([[
        nmap [oG :IBLEnable<cr>
        nmap ]oG :IBLDisable<cr>
      ]])
      require("ibl").setup({
        enabled = false,
        -- space_char_blankline = " ",
        -- show_current_context = true,
        -- show_current_context_start = false,
        -- char_list_blankline = { "|", "¦", "┆", "┊" },
      })
    end,
  },
  {
    "vinodkri/vim-tmux-runner",
    config = function()
      vim.cmd([[
      map <leader>gv  <Plug>(operator-vtr)
    ]])
    end,
  }, -- :VtrSendCommandToRunner for tmux
  { "saaguero/vim-textobj-pastedtext", dependencies = { "kana/vim-textobj-user" } }, -- vgb for last pasted text.
  { "glts/vim-textobj-comment",        dependencies = { "kana/vim-textobj-user" } }, -- select comment with vic or vac.
})
