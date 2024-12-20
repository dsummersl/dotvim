return {
  {
    "ojroques/vim-oscyank",
    config = function()
      vim.g.oscyank_silent = 1
      vim.keymap.set('n', ',y', '<Plug>OSCYankOperator', { silent = true, desc = 'Yank to clipboard' })
      vim.keymap.set('v', ',y', '<Plug>OSCYankVisual', { silent = true, desc = 'Yank to clipboard (visual)' })
    end,
  },
  {
    "yetone/avante.nvim",
    event = "VeryLazy",
    build = "make", -- This is Optional, only if you want to use tiktoken_core to calculate tokens count
    opts = {
      hints = { enabled = false }
    },
    dependencies = {
      "nvim-tree/nvim-web-devicons", -- or echasnovski/mini.icons
      "stevearc/dressing.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
  },
  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      -- The following are optional:
      { "MeanderingProgrammer/render-markdown.nvim", ft = { "markdown", "codecompanion" } },
    },
    config = function()
      require('codecompanion').setup({
        strategies = {
          chat = {
            keymaps = {
              exitinsert = {
                modes = {
                  i = "<C-c>",
                },
                index = 3,
                callback = function()
                  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Esc>', true, true, true), 'n', true)
                end,
                description = "Exit Insert Mode",
              },
              close = {
                modes = {
                  n = "<C-c>",
                },
                index = 3,
                callback = function()
                  require("codecompanion").toggle()
                end,
                description = "Toggle Chat",
              },
            }
          }
        }
      })
      vim.keymap.set('n', ',cc', function() require("codecompanion").toggle() end, { silent = true, desc = 'Toggle CodeCompanion' })
      vim.keymap.set('v', ',cc', function() require("codecompanion").toggle() end, { silent = true, desc = 'Toggle CodeCompanion (visual)' })
    end,
  },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      heading = { enabled = false },
      latex = { enabled = false },
      sign = { enabled = false },
      bullet = { enabled = false },
      checkbox = { enable = false },
    },
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' },
  },
  {
    'abecodes/tabout.nvim',
    lazy = false,
    config = function()
      require('tabout').setup {
        tabkey = '<Tab>',             -- key to trigger tabout, set to an empty string to disable
        backwards_tabkey = '<S-Tab>', -- key to trigger backwards tabout, set to an empty string to disable
        act_as_tab = true,            -- shift content if tab out is not possible
        act_as_shift_tab = false,     -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
        default_tab = '<C-t>',        -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
        default_shift_tab = '<C-d>',  -- reverse shift default action,
        enable_backwards = true,      -- well ...
        completion = false,           -- if the tabkey is used in a completion pum
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = '`', close = '`' },
          { open = '(', close = ')' },
          { open = '[', close = ']' },
          { open = '{', close = '}' }
        },
        ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
        exclude = {} -- tabout will ignore these filetypes
      }
    end,
    requires = {
      "nvim-treesitter/nvim-treesitter",
      "hrsh7th/nvim-cmp"
    },
    opt = true,              -- Set this to true if the plugin is optional
    event = 'InsertCharPre', -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
  },

  ---------------------
  -- Adopted plugins --
  ---------------------

  require("lazy-lspcontrol").init(),
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
  -- this breaks my 'gn' use in my 'g.' mapping:
  -- {
  --   "folke/which-key.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --     triggers = {}
  --   },
  --   keys = {
  --     {
  --       "<leader>?",
  --       function()
  --         require("which-key").show({ global = false })
  --       end,
  --       desc = "Buffer Local Keymaps (which-key)",
  --     },
  --   }
  -- },
  {
    "tommcdo/vim-express", -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)
  },
  -- "stefandtw/quickfix-reflector.vim", -- edit the qf list directly with copen
  {
    'stevearc/quicker.nvim',
    ---@module "quicker"
    ---@type quicker.SetupOptions
    opts = {
      keys = {
        { ">", "<cmd>lua require('quicker').expand()<CR>",   desc = "Expand quickfix content" },
        { "<", "<cmd>lua require('quicker').collapse()<CR>", desc = "Collapse quickfix content" },
      },
    },
  },
  "michaeljsmith/vim-indent-object", -- vii and viI (visual inner Indent)
  "ryanoasis/vim-devicons",
  "pgdouyon/vim-evanesco",           -- vmap *, Highlight search, clear after searching
  "tommcdo/vim-exchange",
  "tpope/vim-eunuch",                -- eunuch.vim: cp/move/unlink commands
  "mattn/emmet-vim",                 -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  "tomtom/tcomment_vim",             -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    opts = {
      label = {
        after = false,
        before = true
      }
    },
    -- TODO this isn't working - but I want to disable search
    search = {
      enabled = false,
    },
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
    "andymass/vim-matchup",
    init = function() -- matching tags/parens/etc
      vim.g.matchup_matchparen_hi_background = 2
      vim.g.matchup_matchparen_deferred = 1
      vim.g.matchup_matchparen_deferred_show_delay = 50
      vim.g.matchup_matchparen_deferred_hide_delay = 700
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
      nmap <silent> [og :GitBlameDisable<cr>
      nmap <silent> ]og :GitBlameEnable<cr>
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
        "n",
        "<leader>dR",
        "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
        { noremap = true, desc = "Refactor actions" }
      )
    end,
  },
  {
    -- "dsummersl/vim-diffundo",
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
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = 1
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.airline_theme = "gruvbox_material"
      vim.g.gruvbox_material_current_word = "grey background"
      vim.g.gruvbox_material_diagnostic_virtual_text = "colored"

      vim.o.termguicolors = true
      vim.o.background = 'dark'
      vim.cmd.colorscheme('gruvbox-material')
    end,
    config = function()
      vim.cmd([[
        function! s:gruvbox_material_custom() abort
          " highlight! link TSEmphasis Comment
          " highlight! link TSComment Comment
          " highlight! link String BlueItalic
          " highlight! link TSString BlueItalic

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

          " flash.nvim less annoying:
          if &background == 'dark'
              call gruvbox_material#highlight('Search', l:palette.bg0, l:palette.bg_visual_yellow)
              call gruvbox_material#highlight('IncSearch', l:palette.bg0, l:palette.bg_yellow)
              call gruvbox_material#highlight('FlashLabel', l:palette.yellow, l:palette.bg_visual_yellow)
              call gruvbox_material#highlight('FlashCursor', l:palette.bg0, l:palette.bg_visual_yellow)
          else
              call gruvbox_material#highlight('Search', l:palette.bg0, l:palette.bg5)
              call gruvbox_material#highlight('IncSearch', l:palette.bg0, l:palette.bg_yellow)
              call gruvbox_material#highlight('FlashLabel', l:palette.yellow, l:palette.bg5)
              call gruvbox_material#highlight('FlashCursor', l:palette.bg0, l:palette.bg5)
          endif
        endfunction

        augroup GruvboxMaterialCustom
          autocmd!
          autocmd ColorScheme gruvbox-material call s:gruvbox_material_custom()
        augroup END

        call s:gruvbox_material_custom()
      ]])
    end
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
        noremap <silent> [on :set nonumber<cr>
        noremap <silent> ]on :set number<cr>
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
  }, -- align with operator gL and gl (ie glip= to align paragraph by =)
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
  -- {
  --   "embear/vim-localvimrc",
  --   init = function()
  --     vim.g.localvimrc_persistent = 1
  --     vim.g.localvimrc_ask = 0
  --     vim.g.localvimrc_debug = 2
  --     vim.g.localvimrc_sandbox = 0
  --     vim.g.localvimrc_name = ".vimrc"
  --   end,
  -- }, -- enable project local .vimrc files
  {
    "tpope/vim-fugitive",
    config = function()
      vim.cmd([[
      " easily access f-keys -- not easy on a macbookpro with 'touch bar'
      nnoremap <silent> <F6> :Gvdiff<CR>
      map <silent> <leader>f6 :Gvdiff<cr>
      map <silent> <leader>f7 :Gvdiffsplit<cr>
      nnoremap <silent> <leader>gg :silent! G<cr>

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
  }, -- rhubarb seems to be broken for most github repos after commit af12af4
  {
    "tpope/vim-abolish",
    config = function()
      vim.cmd([[
      set runtimepath+=~/.vim/after
    ]])
    end,
  }, -- fix spelling errors, :S command.
  {
    dir = "~/Documents/classes/vim-searchconceal",
    config = function()
      --   vim.cmd([[
      --   map ,cc :SearchConcealClear<CR>
      --   map ,ch :SearchConceal<CR>
      -- ]])
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
    "simnalamburt/vim-mundo",
    -- dir = "~/Documents/classes/vim-mundo",
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
    "dsummersl/nvim-sluice",
    -- branch = "update_config_format",
    dir = "~/Documents/classes/nvim-sluice",
    config = function()
      local gutter = require("sluice.gutter")
      local counters = require('sluice.utils.counters')

      local function notGitHunk(v)
        return not string.match(v, 'Signify.*') and not string.match(v, 'Illuminated.*')
      end

      -- require("sluice").setup {
      --   gutters = {
      --     {
      --       plugins = {
      --         'viewport',
      --         -- { 'extmark', {
      --         --   user_events = { 'Signify' },
      --         --   sign_hl_group = 'Signify.*',
      --         -- } },
      --       }
      --     },
      --   }
      -- }
      require("sluice").setup {
        enabled = true,
        gutters = {
          -- right side (macro mode):
          { -- anything that isn't git (ie, lsp)
            count_method = counters.methods.circle_2,
            enabled = gutter.any_non_viewport_plugin_active,
            plugins = {
              'viewport',
              { 'extmark', {
                sign_hl_group = notGitHunk,
              } },
              'search',
              -- { 'extmark', {
              --   hl_group = 'Illuminated.*',
              --   sign_hl_group = false,
              --   priority = 6,
              -- } },
            }
          },
          { -- git
            -- TODO want to only be enabled if the first extmark plugin has values
            enabled = gutter.any_non_viewport_plugin_active,
            plugins = {
              'viewport',
              { 'extmark', {
                user_events = { 'Signify' },
                sign_hl_group = 'Signify.*',
              } },
              -- { 'extmark', {
              --   hl_group = 'Illuminated.*',
              --   sign_hl_group = false,
              --   priority = 6,
              -- } },
            }
          },

          -- left side (overriding signs column):
          {
            layout = 'left',
            render_method = 'line',
            gutter_hl = 'Normal',
            enabled = true,
            plugins = {}
          },
          {
            layout = 'left',
            render_method = 'line',
            gutter_hl = 'Normal',
            enabled = true,
            count_method = counters.methods.circle_2,
            plugins = {
              { 'extmark', {
                sign_hl_group = notGitHunk,
              } },
            }
          },
          {
            layout = 'left',
            render_method = 'line',
            gutter_hl = 'Normal',
            enabled = true,
            plugins = {
              { 'extmark', {
                sign_hl_group = 'Signify.*',
                user_events = { 'Signify' },
              } },
            }
          },
        }
      }
    end
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = { "rafamadriz/friendly-snippets" },
    version = "v2.*",
    build = "make install_jsregexp",
    config = function()
      vim.cmd("hi link LuasnipInsertNodePassive GruvboxRed")
      vim.cmd("hi link LuasnipSnippetPassive GruvboxBlue")

      local ls = require("luasnip")
      ls.config.setup({
        history = true,
        update_events = { "TextChanged", "TextChangedI" },
        enable_autosnippets = true,
        ext_opts = {},
      })
      vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(1) end, { silent = true })
      vim.keymap.set({ "i", "s" }, "<C-K>", function() ls.jump(-1) end, { silent = true })

      vim.keymap.set({ "i", "s" }, "<C-E>", function()
        if ls.choice_active() then
          ls.change_choice(1)
        end
      end, { silent = true })
      require("luasnip.loaders.from_vscode").load_standalone({ path = "~/.vim/snippets/all.code-snippets.jsonc", lazy = true })
      require("luasnip.loaders.from_vscode").lazy_load()
      require("luasnip.loaders.from_snipmate").lazy_load({ paths = "~/.vim/snippets" })
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
        nmap <silent> [oG :IBLDisable<cr>
        nmap <silent> ]oG :IBLEnable<cr>
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
  {
    "kana/vim-textobj-user",
    config = function()
      -- from https://github.com/christoomey/vim-textobj-codeblock/blob/master/plugin/textobj-codeblock.vim
      vim.cmd([[
      call textobj#user#plugin('codeblock', {
      \   'blocj': {
      \     'pattern': ['^```\s\?\w\+$\n', '^```$'],
      \     'select-a': 'aC',
      \     'select-i': 'iC',
      \   },
      \ })
      ]])
    end
  },
  { "saaguero/vim-textobj-pastedtext", dependencies = { "kana/vim-textobj-user" } }, -- vgb for last pasted text.
  { "glts/vim-textobj-comment",        dependencies = { "kana/vim-textobj-user" } }, -- select comment with vic or vac.
  {
    "sindrets/diffview.nvim",
    config = function()
      vim.keymap.set('n', ',gc', ':DiffviewClose<cr>', { desc = 'Diffview close' })
      vim.keymap.set('n', ',gd', ':DiffviewFileHistory %<cr>', { desc = 'Diffview current file' })
      vim.keymap.set('v', ',gd', ':DiffviewFileHistory %<cr>', { desc = 'Diffview current file' })
      vim.keymap.set('n', ',gm', ':DiffviewOpen mainline..', { desc = 'Diffview against mainline' })
    end
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      vim.cmd([[
        function! TokyonightThemeHighlighting()
          highlight SignifySignAdd    guifg=#399a96
          highlight SignifySignChange guifg=#6382bd
          highlight SignifySignDelete guifg=#c25d64
        endfunction

        augroup TokyonightThemeAutoCommands
          autocmd!
          au ColorScheme tokyonight,tokyonight-storm,tokyonight-night,tokyonight-moon
                       \ call TokyonightThemeHighlighting()
        augroup END
      ]])
    end,
    lazy = false,
    priority = 1000,
    opts = {},
  },
  {
    'stevearc/oil.nvim', -- replacement for netrw file browser
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        columns = {
          "mtime",
          "icon",
        },
        keymaps = {
          ["g?"] = "actions.show_help",
          ["<CR>"] = "actions.select",
          ["<C-c>"] = "actions.close",
          ["<C-l>"] = "actions.refresh",
          ["-"] = "actions.parent",
          ["_"] = "actions.open_cwd",
          ["`"] = "actions.cd",
          ["~"] = { "actions.cd", opts = { scope = "tab" }, desc = ":tcd to the current oil directory" },
          ["gs"] = "actions.change_sort",
          ["gx"] = "actions.open_external",
          ["g."] = "actions.toggle_hidden",
          ["g\\"] = "actions.toggle_trash",
        },
        use_default_keymaps = false,
      })
    end
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
    'echasnovski/mini.nvim',
    version = false,
    config = function()
      require('mini.splitjoin').setup()
    end
  }
}
