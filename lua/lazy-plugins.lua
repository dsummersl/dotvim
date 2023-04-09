require("lazy").setup({
  {
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

  { "madox2/vim-ai",                   build = "./install.sh" },

  -- https://github.com/windwp/nvim-projectconfig maybe for loading local lua setup.
  "otavioschwanck/telescope-alternate",
  "folke/which-key.nvim",
  {
    "andymass/vim-matchup",
    init = function() -- matching tags/parens/etc
      vim.g.matchup_matchparen_hi_background = 2
      vim.g.matchup_matchparen_offscreen = { method = "popup" }
    end,
  },
  "chrisbra/unicode.vim", -- :Unicode* commands to search for them.
  {
    "chrisbra/csv.vim",
    config = function()
      vim.g.csv_nomap_space = 1
    end,
  },

  -- syntax:
  "towolf/vim-helm",
  "aklt/plantuml-syntax",

  {
    "f-person/git-blame.nvim",
    init = function() -- show git blame in the editor.
      vim.g.gitblame_enabled = 1
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
      vim.cmd([[
      nmap ]h <plug>(signify-next-hunk)
      nmap [h <plug>(signify-prev-hunk)
      omap ih <plug>(signify-motion-inner-pending)
      xmap ih <plug>(signify-motion-inner-visual)
      omap ah <plug>(signify-motion-outer-pending)
      xmap ah <plug>(signify-motion-outer-visual)
    ]])
    end,
  },
  {
    "AndrewRadev/splitjoin.vim",
    config = function()
      vim.g.splitjoin_trailing_comma = 1
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-lua/popup.nvim",
      "nvim-telescope/telescope-media-files.nvim",
      "zolrath/telescope-projectionist.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    },
    build = "pip install ueberzug",
    config = function()
      local actions = require("telescope.actions")
      require("telescope").load_extension("media_files")
      require("telescope").load_extension("projectionist")
      require("telescope").load_extension("live_grep_args")
      require("telescope").setup({
        defaults = {
          sorting_strategy = "descending",
          color_devicons = true,
          layout_config = {
            center = {
              height = 0.4,
            },
            cursor = {
              height = 0.4,
            },
            horizontal = {
              height = 0.4,
            },
            vertical = {
              height = 0.4,
            },
          },
          mappings = {
            i = {
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
              ["<C-p>"] = actions.close,
              ["<Esc>"] = actions.close,
              ["<C-c>"] = function()
                vim.cmd([[stopinsert]])
              end,
            },
            n = {
              ["<C-c>"] = require("telescope.actions").close,
            },
          },
        },
        pickers = {
          find_files = {
            previewer = false,
          },
          oldfiles = {
            previewer = false,
            only_cwd = true,
            -- mappings = {
            --   i = {
            --     ["<C-p>"] = require('telescope.actions').find_files,
            --   },
            -- },
          },
        },
      })

      vim.cmd([[
        nnoremap <leader>/r :Telescope resume<CR>
        nnoremap <C-p> :Telescope find_files<CR>
        " User iterm2 to map shift-ctrl-p to <f15>
        nnoremap <F11> :Telescope oldfiles<CR>
        nnoremap <F15> :Telescope oldfiles<CR>
        nnoremap <C-t> :Telescope tags<CR>
        " User iterm2 to map shift-ctrl-t to <f16>
        nnoremap <F12> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>
        nnoremap <F16> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>

        noremap <leader>/g :lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>
        noremap <leader>/f :exec ":lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '". expand("%:t:r:r") ."' })"<cr>
        noremap <leader>// :exec ":lua require('telescope').extensions.live_grep_args.live_grep_args({ default_text = '\"". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ."\"' -g ". expand("%") ."' })"<cr>
        noremap <leader>/w :Telescope grep_string<cr>
      ]])
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
    "machakann/vim-sandwich",
    config = function()
      -- for vim-sandwich don't have any s mappings as per docs
      vim.cmd([[nmap s <Nop>]])
      vim.cmd([[xmap s <Nop>]])

      vim.api.nvim_command("runtime autoload/sandwich.vim")
      vim.g["sandwich#recipes"] = vim.list_extend(vim.g["sandwich#default_recipes"], {
        -- { buns = { '{ ', ' }' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '{' } },
        -- { buns = { '[ ', ' ]' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '[' } },
        -- { buns = { '( ', ' )' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '(' } },
        {
          buns = { "{\\s*", "\\s*}" },
          nesting = 1,
          regex = 1,
          match_syntax = 1,
          kind = { "delete", "replace", "textobj" },
          action = { "delete" },
          input = { "{" },
        },
        {
          buns = { "\\[\\s*", "\\s*\\]" },
          nesting = 1,
          regex = 1,
          match_syntax = 1,
          kind = { "delete", "replace", "textobj" },
          action = { "delete" },
          input = { "[" },
        },
        {
          buns = { "(\\s*", "\\s*)" },
          nesting = 1,
          regex = 1,
          match_syntax = 1,
          kind = { "delete", "replace", "textobj" },
          action = { "delete" },
          input = { "(" },
        },
      })
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "neovim/nvim-lspconfig",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "quangnguyen30192/cmp-nvim-ultisnips",
      "onsails/lspkind-nvim",
      -- TODO https://github.com/petertriho/cmp-git be able to reference git users and commits from github
    },
    config = function()
      vim.cmd([[
        set completeopt=menu,menuone,noselect
        set pumheight=15
      ]])

      local cmp = require("cmp")
      local lspkind = require("lspkind")
      cmp.setup({
        enabled = function()
          if vim.bo.buftype == 'prompt' then
            return false
          end

          return true
        end,
        formatting = {
          format = lspkind.cmp_format({ with_text = false, maxwidth = 40 }),
        },
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        window = {
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs( -4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-e>"] = cmp.mapping(function(fallback)
            local copilot_keys = vim.fn["copilot#Accept"]()
            if copilot_keys ~= "" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
              fallback()
            end
          end),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-Space>"] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = "nvim_lsp",  priority_weight = 2, keyword_length = 3 },
          { name = "buffer",    priority_weight = 3, keyword_length = 3 },
          { name = "ultisnips", priority_weight = 4, keyword_length = 2 },
        },
      })

      -- `/` cmdline setup.
      -- cmp.setup.cmdline("/", {
      --   mapping = cmp.mapping.preset.cmdline(),
      --   sources = {
      --     { name = "buffer", keyword_length = 4 },
      --   },
      -- })

      -- Fix the default cmdline behavior so that it uses the native one:
      -- https://github.com/hrsh7th/nvim-cmp/issues/1454
      cmp.setup.cmdline(':', {
        sources = {},
        mapping = cmp.mapping.preset.cmdline({
          ['<Tab>'] = {
            c = function(fallback)
              if cmp.visible() then
                cmp.select_next_item()
              else
                vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-z>', true, true, true), 'ni', true)
              end
            end
          }
        })
      })
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
      vim.cmd([[
      set termguicolors
      set background=dark
      colorscheme gruvbox-material
    ]])
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
        noremap ]on :set number relativenumber<cr>
        noremap [on :set nonumber norelativenumber<cr>
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
    "easymotion/vim-easymotion",
    config = function()
      vim.cmd([[
      nmap <leader>s  <Plug>(easymotion-sn)
      nmap <leader>; <Plug>(easymotion-next)
    ]])
    end,
    init = function()
      vim.cmd([[
      let g:EasyMotion_do_mapping=0
      let g:EasyMotion_smartcase=1
      let g:EasyMotion_do_mapping=0

      let g:EasyMotion_enter_jump_first = 1
      let g:EasyMotion_space_jump_first = 1
    ]])
    end,
  }, -- mapped to s for two letter searching.
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
  "tommcdo/vim-exchange",
  {
    "tommcdo/vim-lion",
    config = function()
      -- When using gL and gl, squeeze any extra leading whitespace.
      vim.g.lion_squeeze_spaces = 1
    end,
  }, -- align with operator gL and gl (ie glip= to align paragraph by =)
  "tommcdo/vim-express", -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)

  "stefandtw/quickfix-reflector.vim", -- edit the qf list directly with copen
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
  }, -- rhubarb seems to be broken for most github repos after commit af12af4
  "tpope/vim-eunuch", -- eunuch.vim: cp/move/unlink commands
  {
    "ludovicchabant/vim-gutentags",
    init = function()
      vim.g.gutentags_modules = { "ctags" }
      vim.g.gutentags_cache_dir = "~/.vim/tags"
      vim.g.gutentags_ctags_exclude = {
        "*/node_modules/*",
        "*/bower_components/*",
        "*/public/assets/*",
        "*/public/packs/*",
        "*/public/packs-test/*",
        "*/vendor/*",
        "tags",
        "**/*.json",
        "**/*.md",
        "**/*.sql",
        "**/*.html",
      }

      vim.cmd([[
      " If there is more than one tag match, show the list of matches
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
    end,
  },
  {
    "tpope/vim-abolish",
    config = function()
      vim.cmd([[
      " pathing for abolish
      set runtimepath+=~/.vim/after
    ]])
    end,
  }, -- fix spelling errors
  "mattn/emmet-vim", -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  "tomtom/tcomment_vim", -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup()

      local npairs = require('nvim-autopairs')
      local Rule = require('nvim-autopairs.rule')
      local cond = require('nvim-autopairs.conds')
      local utils = require('nvim-autopairs.utils')

      -- from https://github.com/windwp/nvim-autopairs/issues/167 -- ability to jump out of pairs
      local function multiline_close_jump(open, close)
        return Rule(close, '')
            :with_pair(function()
              local buf = vim.fn.bufnr()
              local row, col = utils.get_cursor(0)
              local line = utils.text_get_current_line(buf)

              if #line ~= col then --not at EOL
                return false
              end

              local unclosed_count = 0
              for c in line:gmatch("[\\" .. open .. "\\" .. close .. "]") do
                if c == open then unclosed_count = unclosed_count + 1 end
                if unclosed_count > 0 and c == close then unclosed_count = unclosed_count - 1 end
              end
              if unclosed_count > 0 then return false end

              local nextrow = row + 1
              if nextrow < vim.api.nvim_buf_line_count(0)
                  and vim.regex("^\\s*" .. close):match_line(0, nextrow) then
                return true
              end
              return false
            end)
            :with_move(cond.none())
            :with_cr(cond.none())
            :with_del(cond.none())
            :set_end_pair_length(0)
            :replace_endpair(function()
              return '<esc>xEa'
            end)
      end

      npairs.add_rules({
        multiline_close_jump('(', ')'),
        multiline_close_jump('[', ']'),
        multiline_close_jump('{', '}'),
      })
    end,
  },
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
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
          augend.date.alias["%m-%d-%Y"], -- date (02/19/2022, etc.)
        },
        enhanced = {
          augend.integer.alias.decimal, -- nonnegative decimal number (0, 1, 2, 3, ...)
          augend.integer.alias.hex, -- nonnegative hex number  (0x01, 0x1a1f, etc.)
          augend.date.alias["%m/%d/%Y"], -- date (02/19/2022, etc.)
          augend.constant.new({ elements = { "&&", "||" }, word = false, cyclic = true }),
          augend.constant.new({ elements = { "==", "!=" }, word = false, cyclic = true }),
          augend.constant.new({ elements = { "true", "false" } }),
          augend.constant.new({ elements = { "info", "warn", "debug" } }),
          augend.constant.new({ elements = { "INFO", "WARN", "DEBUG" } }),
          augend.constant.new({ elements = { "align", "justify" } }),
          augend.constant.new({ elements = { "and", "or" } }),
          augend.constant.new({ elements = { "assertContains", "assertNotContains" } }),
          augend.constant.new({ elements = { "assertFalse", "assertTrue" } }),
          augend.constant.new({ elements = { "assertIn", "assertNotIn" } }),
          augend.constant.new({ elements = { "before", "after" } }),
          augend.constant.new({ elements = { "columns", "rows" } }),
          augend.constant.new({ elements = { "disabled", "enabled" } }),
          augend.constant.new({ elements = { "even", "odd" } }),
          augend.constant.new({ elements = { "first", "last" } }),
          augend.constant.new({ elements = { "left", "right" } }),
          augend.constant.new({ elements = { "min", "max" } }),
          augend.constant.new({ elements = { "top", "bottom" } }),
          augend.constant.new({ elements = { "up", "down" } }),
          augend.constant.new({ elements = { "width", "height" } }),
          augend.constant.new({ elements = { "yes", "no" } }),
          augend.constant.new({ elements = { "open", "close" } }),
          augend.constant.new({ elements = { "padding", "margin" } }),
          augend.constant.new({ elements = { "present", "absent" } }),
          augend.constant.new({ elements = { "enable", "disable" } }),
          augend.constant.new({ elements = { "public", "protected", "private" } }),
          augend.user.new({
            find = require("dial.augend.common").find_pattern_regex("\\v\\.([a-zA-Z_-]+)>"),
            add = function(text, addend, cursor)
              local word = text:sub(2)
              text = "['" .. word .. "']"
              cursor = #text
              return { text = text, cursor = cursor }
            end,
          }),
          augend.user.new({
            find = require("dial.augend.common").find_pattern_regex("\\v\\[['\"]([a-zA-Z_-]+)['\"]\\]"),
            add = function(text, addend, cursor)
              local word = text:sub(3, -3)
              text = "." .. word
              cursor = #text
              return { text = text, cursor = cursor }
            end,
          }),
        },
      })

      vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual("enhanced"), { noremap = true })
      vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual("enhanced"), { noremap = true })
    end,
  },
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
  { dir = "~/Documents/classes/nvim-sluice", config = function()
  end },
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
    "glepnir/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup({
        symbol_in_winbar = {
          enable = false,
          show_file = false,
        },
        lightbulb = {
          enable = false,
          saga_winblend = 20,
        },
      })
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "nvim-treesitter/nvim-treesitter" }
    }
  },
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "stevearc/dressing.nvim",
      "williamboman/mason.nvim",
      "b0o/schemastore.nvim",
      "https://gitlab.com/yorickpeterse/nvim-dd.git",
      "jose-elias-alvarez/null-ls.nvim",
    },
    config = function()
      require("dd").setup()
      vim.diagnostic.config({
        underline = false,
        virtual_text = false,
        severity_sort = true,
        signs = true,
        update_in_insert = false,
      })

      local signs = { Error = " ", Warn = " ", Hint = " .", Info = " ᵢ" }

      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      require("mason").setup({})
      local lspconfig = require("lspconfig")
      local on_attach = require("lsp_control").on_attach
      local cmp_capabilities =
          require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())
      lspconfig.yamlls.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
          yaml = { schemas = require("schemastore").json.schemas() },
        },
      })
      lspconfig.jsonls.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
          json = { schemas = require("schemastore").json.schemas() },
          jsonls = { schemas = require("schemastore").json.schemas() },
        },
      })
      lspconfig.pyright.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = { pylsp = { plugins = { pycodestyle = { enabled = false } } } },
      })
      lspconfig.lua_ls.setup({
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = { Lua = { diagnostics = { globals = { "vim" } } } },
      })
      local opts = require("lsp_control").make_default_opts()
      lspconfig.html.setup(opts)
      lspconfig.cssls.setup(opts)
      lspconfig.jsonls.setup(opts)
      lspconfig.remark_ls.setup(opts)
      lspconfig.tsserver.setup(opts)
      lspconfig.vimls.setup(opts)

      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.diagnostics.buf,
          null_ls.builtins.code_actions.eslint_d,
          null_ls.builtins.code_actions.refactoring,
          null_ls.builtins.diagnostics.proselint,
          null_ls.builtins.formatting.black,
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.isort,
          null_ls.builtins.diagnostics.eslint_d,
          null_ls.builtins.diagnostics.pylint,
          null_ls.builtins.diagnostics.codespell,
          null_ls.builtins.diagnostics.flake8,
          null_ls.builtins.code_actions.eslint,
        },
        on_attach = on_attach,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "nvim-treesitter/playground",
    },
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all",
        ignore_install = { "phpdoc" },
        matchup = {
          enable = true,
        },
        highlight = {
          enable = true,
          use_langtree = true,
          -- disable slow treesitter highlight for large files
          disable = function(lang, buf)
            local max_filesize = 20 * 1024 -- 100 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
              return true
            end
          end,
        },
        incremental_selection = { enable = true },
        indent = { enable = false },
        textobjects = {
          select = {
            enable = true,

            -- Automatically jump forward to textobj, similar to targets.vim
            lookahead = true,

            keymaps = {
              -- You can the capture groups defined in textobjects.scm
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              -- TODO this does not currently work for multiline comments
              -- ["ac"] = "@comment.outer",
              -- ["ic"] = "@comment.outer",
              ["as"] = "@statement.outer",
              ["is"] = "@statement.outer",
              ["aa"] = "@parameter.outer",
              ["ia"] = "@parameter.inner",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["]a"] = "@parameter.inner",
            },
            swap_previous = {
              ["[a"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]c"] = "@class.outer",
              ["]]"] = "@function.outer",
            },
            goto_previous_start = {
              ["[["] = "@function.outer",
              ["[c"] = "@class.outer",
            },
          },
        },
      })
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
    -- use navic?
    "itchyny/lightline.vim",
    config = function()
      vim.cmd([[
      function! LspStatus()
        return "-"
      endfunction
      function! LightlineMode()
        return lightline#mode()[0:0]
      endfunction
      function! LightlineFilename()
        let filename = expand('%:~:.') !=# '' ? expand('%:~:.') : '[No Name]'
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
        colorscheme = "jellybeans",
        active = {
          left = {
            { "mode",     "paste" },
            { "readonly", "filename" },
          },
          right = {
            { "lineinfo" },
            { "percent" },
            { "currentfunction", "indent", "fileformat", "filetype" },
          },
        },
        component = {
          indent = '%{&expandtab?"":"t"}%{&tabstop}',
        },
        component_function = {
          mode = "LightlineMode",
          filename = "LightlineFilename",
          filetype = "LightlineFiletype",
          fileformat = "LightlineFileformat",
          currentfunction = "LspStatus",
        },
      }
    end,
  },
  "pgdouyon/vim-evanesco", -- vmap *, Highlight search, clear after searching
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      vim.cmd([[
      nmap [oG :IndentBlanklineEnable<cr>
      nmap ]oG :IndentBlanklineDisable<cr>
    ]])
      require("indent_blankline").setup({
        enabled = false,
        space_char_blankline = " ",
        show_current_context = true,
        show_current_context_start = false,
        char_list_blankline = { "|", "¦", "┆", "┊" },
        -- char_highlight_list = {
        --     "IndentBlanklineIndent1",
        --     "IndentBlanklineIndent2",
        -- },
        -- space_char_highlight_list = {
        --     "IndentBlanklineIndent1",
        --     "IndentBlanklineIndent2",
        -- },
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
    "vim-test/vim-test",
    lazy = true,
    keys = { ",ctn", ",ctf", ",ctl" },
    dependencies = { "vinodkri/vim-tmux-runner" },
    config = function()
      vim.g["test#preserve_screen"] = 1
      vim.g["test#strategy"] = "vtr"
      vim.g["test#sub"] = ""
      local SubstituteTransform = function(cmd)
        -- Transforms for running tests in. {} is replaced. For example:
        -- let test#sub = 'docker run --rm web python manage.py test {} | pygmentize -l pytb'
        -- or, just pipe to something
        -- let g:test#transformation = 'sub'
        -- let test#sub = '{} | pygmentize -l pytb'
        return vim.fn.substitute(vim.g["test#sub"], "{}", cmd, "g")
      end
      local LastTransform = function(cmd)
        -- Keep only the last word, and combine with SubstituteTransform - handy for
        -- the djangotest type test where I want to take advantage of its figuring out
        -- the test name (at the end of the cmd) but want to run it differently
        -- let g:test#transformation = 'last'
        -- let test#sub = '{} | pygmentize -l pytb'
        return SubstituteTransform(vim.fn.substitute(cmd, "^.* \\(\\S\\+\\)$", "\\1", ""))
      end
      vim.g["test#custom_transformations"] = {
        sub = SubstituteTransform,
        last = LastTransform,
      }

      -- E15 when I run this. I think its b/c of function?
      vim.cmd([[
        " Send a selection to the terminal:
        map <leader>ctn :TestNearest<CR>
        map <leader>ctf :TestFile<CR>
        map <leader>ctt :TestLast<CR>

        VtrAttachToPane
      ]])
    end,
  },
  "michaeljsmith/vim-indent-object", -- vii and viI (visual inner Indent)
  { "saaguero/vim-textobj-pastedtext", dependencies = { "kana/vim-textobj-user" } }, -- vgb for last pasted text.
  { "glts/vim-textobj-comment",        dependencies = { "kana/vim-textobj-user" } }, -- select comment with vic or vac.
  "ryanoasis/vim-devicons",
})
