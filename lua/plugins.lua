vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'

  use { 'andymass/vim-matchup', config = function()
    vim.g.matchup_matchparen_hi_background = 2
    vim.g.matchup_matchparen_offscreen = {method= 'popup'}
  end}
  use 'chrisbra/unicode.vim'
  use { 'chrisbra/csv.vim', config = function()
    vim.g.csv_nomap_space = 1
  end }

  -- syntax:
  use 'towolf/vim-helm'
  use 'aklt/plantuml-syntax'
  use { 'norcalli/nvim-colorizer.lua', config = function()
    require('colorizer').setup {
      'css';
      'typescriptreact';
    }
  end}

  -- use {
  --   "nvim-neotest/neotest",
  --   requires = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --     "antoinemadec/FixCursorHold.nvim"
  --   },
  --   config = function()
  --     require("neotest").setup({
  --       adapters = {
  --         require("neotest-python")({
  --           dap = { justMyCode = false },
  --         }),
  --         require("neotest-plenary"),
  --         require("neotest-vim-test")({
  --           ignore_file_types = { "python", "vim", "lua" },
  --         }),
  --       },
  --     })
  --   end
  -- }

  use { 'f-person/git-blame.nvim', config = function()
    vim.g.gitblame_enabled = 1
    vim.g.gitblame_date_format = '%x'
    vim.g.gitblame_message_template = '<date> <author>: <sha> <summary>'
    vim.g.gitblame_highlight_group = "CommentCurrentLine"
    vim.cmd([[
      nmap [og :GitBlameEnable<cr>
      nmap ]og :GitBlameDisable<cr>
    ]])
  end }
  use { 'chrisbra/NrrwRgn', config = function()
    vim.g.nrrw_rgn_nomap_nr = 1
    vim.g.nrrw_rgn_nomap_Nr = 1

    vim.cmd([[
      " get rid of any extra git fugitive buffers
      autocmd BufReadPost NrrwRgn_* set bufhidden=wipe
    ]])
  end }
  use { "junegunn/goyo.vim", requires = { 'junegunn/limelight.vim' }, config = function()
    -- vim.cmd([[
    --   autocmd! User GoyoEnter Limelight
    --   autocmd! User GoyoLeave Limelight!
    -- ]])
  end }
  use { "github/copilot.vim", config = function()
    vim.g.copilot_no_tab_map = true
    vim.g.copilot_assume_mapped = true
    vim.g.copilot_tab_fallback = ""
  end }
  use { "nathom/filetype.nvim", config = 'vim.g.did_load_filetypes = 1' }
  use { 'plasticboy/vim-markdown', config = function()
    vim.g.vim_markdown_folding_disabled = 1
  end }

  use { 'mhinz/vim-signify', config = function()
    vim.g.signify_priority = 5
    vim.g.signify_sign_show_count = 0
    vim.g.signify_sign_add        = '│'
    vim.g.signify_sign_change     = '┊'
    vim.cmd([[
      nmap ]h <plug>(signify-next-hunk)
      nmap [h <plug>(signify-prev-hunk)
      omap ih <plug>(signify-motion-inner-pending)
      xmap ih <plug>(signify-motion-inner-visual)
      omap ah <plug>(signify-motion-outer-pending)
      xmap ah <plug>(signify-motion-outer-visual)
    ]])
  end }
  use { 'AndrewRadev/splitjoin.vim', config = function()
    vim.g.splitjoin_trailing_comma = 1
  end }
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'nvim-lua/popup.nvim',
      'nvim-telescope/telescope-media-files.nvim',
    },
    run = 'pip install ueberzug',
    config = function()
      require('telescope').load_extension('media_files')
      require('telescope').setup {
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
            }
          },
          mappings = {
            i = {
              ["<C-j>"] = require('telescope.actions').move_selection_next,
              ["<C-k>"] = require('telescope.actions').move_selection_previous,
              ["<C-p>"] = require('telescope.actions').close,
              ["<Esc>"] = require('telescope.actions').close,
              ["<C-c>"] = function() vim.cmd [[stopinsert]] end
            },
            n = {
              ["<C-c>"] = require('telescope.actions').close,
            }
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
          }
        }
      }

      vim.cmd([[
        nnoremap <C-p> :Telescope find_files<CR>
        " User iterm2 to map shift-ctrl-p to <f15>
        nnoremap <F11> :Telescope oldfiles<CR>
        nnoremap <F15> :Telescope oldfiles<CR>
        nnoremap <C-t> :Telescope tags<CR>
        " User iterm2 to map shift-ctrl-t to <f16>
        nnoremap <F12> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>
        nnoremap <F16> :silent! lua require"telescope-config".treesitter_or_ctags()<CR>
      ]])
    end
  }
  use { 'ThePrimeagen/refactoring.nvim', requires = { 'nvim-lua/plenary.nvim' }, config = function()
    -- load refactoring Telescope extension
    require("telescope").load_extension("refactoring")

    -- remap to open the Telescope refactoring menu in visual mode
    vim.api.nvim_set_keymap(
      "v",
      "<leader>rr",
      "<Esc><cmd>lua require('telescope').extensions.refactoring.refactors()<CR>",
      { noremap = true }
    )
  end }
  use { 'machakann/vim-sandwich', config = function()
    -- for vim-sandwich don't have any s mappings as per docs
    vim.cmd [[nmap s <Nop>]]
    vim.cmd [[xmap s <Nop>]]

    vim.api.nvim_command('runtime autoload/sandwich.vim')
    vim.g['sandwich#recipes'] = vim.list_extend(vim.g['sandwich#default_recipes'], {
      -- { buns = { '{ ', ' }' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '{' } },
      -- { buns = { '[ ', ' ]' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '[' } },
      -- { buns = { '( ', ' )' }, nesting = 1, match_syntax = 1, kind = { 'add', 'replace' }, action = { 'add' }, input = { '(' } },
      { buns = { '{\\s*', '\\s*}' }, nesting = 1, regex = 1, match_syntax = 1, kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '{' } },
      { buns = { '\\[\\s*', '\\s*\\]' }, nesting = 1, regex = 1, match_syntax = 1, kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '[' } },
      { buns = { '(\\s*', '\\s*)' }, nesting = 1, regex = 1, match_syntax = 1, kind = { 'delete', 'replace', 'textobj' }, action = { 'delete' }, input = { '(' } }
    })
  end }
  use { 'hrsh7th/nvim-cmp',
    commit = '53f49c5^',
    requires = {
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'quangnguyen30192/cmp-nvim-ultisnips',
      'onsails/lspkind-nvim',
    },
    config = function()
      vim.cmd([[
        set completeopt=menu,menuone,noselect
        set pumheight=15
      ]])

      local cmp = require 'cmp'
      local lspkind = require('lspkind')
      cmp.setup({
        formatting = {
          format = lspkind.cmp_format({ with_text = false, maxwidth = 40 })
        },
        snippet = {
          expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
          end,
        },
        window = {
          -- completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-e>'] = cmp.mapping(function(fallback)
            local copilot_keys = vim.fn["copilot#Accept"]()
            if copilot_keys ~= "" then
              vim.api.nvim_feedkeys(copilot_keys, "i", true)
            else
              fallback()
            end
          end),
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
        },
        sources = {
          { name = 'nvim_lsp', priority_weight = 2, keyword_length = 3 },
          { name = 'buffer', priority_weight = 3, keyword_length = 3 },
          { name = 'ultisnips', priority_weight = 4, keyword_length = 2 },
        }
      })

      -- `/` cmdline setup.
      cmp.setup.cmdline('/', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = {
          { name = 'buffer', keyword_length = 3 }
        }
      })

      -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
      cmp.setup.cmdline(':', {
        mapping = cmp.mapping.preset.cmdline(),
        sources = cmp.config.sources({})
      })
    end
  }
  use { '~/Documents/classes/vim-diffundo', opt = true, keys = { { 'n', ',uu' }, { 'n', ',rr' }, { 'n', ',uf' }, { 'n', ',rf' } }, config = function()
    vim.cmd([[
      " undo/redo to the previous write
      Repeatable map <leader>uu :DiffEarlier<cr>
      Repeatable map <leader>rr :DiffLater<cr>
      Repeatable map <leader>uf :DiffEarlier 1f<cr>
      Repeatable map <leader>rf :DiffLater 1f<cr>
    ]])
  end }
  use { 'sainnhe/gruvbox-material', config = function()
    vim.g.gruvbox_material_palette                 = 'material'
    vim.g.gruvbox_material_background              = 'hard'
    vim.g.gruvbox_material_enable_italic           = 1
    vim.g.gruvbox_material_enable_bold             = 1
    vim.g.airline_theme                            = 'gruvbox_material'
    vim.g.gruvbox_material_current_word            = 'grey background'
    vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
    vim.cmd([[
      set termguicolors
      set background=dark
      colorscheme gruvbox-material
    ]])
  end }
  use { 'jeetsukumaran/vim-indentwise', config = function()
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
  end } -- Support indent motions ]ii
  use { 'tpope/vim-unimpaired', config=function ()
    vim.cmd([[
      " unmap ]t
      " unmap [t
    ]])
  end }
  use { 'kreskij/Repeatable.vim', requires = { 'tpope/vim-repeat' }, config = function()
    vim.cmd([[
      call repeatable#Setup()

      " When in Gstatus jump to the next file in the list and diff it.
      Repeatable map <leader>gj <C-w>l<C-w>kjdv
      Repeatable map <leader>gk <C-w>l<C-w>kkdv
    ]])
  end }
  use { 'easymotion/vim-easymotion', config = function()
    vim.cmd([[
      nmap <leader>s  <Plug>(easymotion-sn)
      nmap <leader>; <Plug>(easymotion-next)
    ]])
  end, setup = function()
    vim.cmd([[
      let g:EasyMotion_do_mapping=0
      let g:EasyMotion_smartcase=1
      let g:EasyMotion_do_mapping=0

      let g:EasyMotion_enter_jump_first = 1
      let g:EasyMotion_space_jump_first = 1
    ]])
  end } -- mapped to s for two letter searching.
  use { 'wellle/visual-split.vim', opt = true, keys = { { 'v', ',v' }, { 'n', ',v' } }, config = function()
    vim.cmd([[
      vmap <leader>v :VSSplit<cr>
    ]])
  end } -- I've mapped this to <leader>v Lines to quickly resize splits (VSSplit)
  use { 'kana/vim-operator-user', config = function()
    vim.cmd([[
      call operator#user#define_ex_command('vtr', 'VtrSendLinesToRunner')
      " call operator#user#define_ex_command('g/', 'VtrSendLinesToRunner')
    ]])
  end } -- Define my own operators for motions.
  use { 'tommcdo/vim-exchange', opt = true, keys = { { 'n', 'cx' }, }, }
  use { 'tommcdo/vim-lion', config = function()
    -- When using gL and gl, squeeze any extra leading whitespace.
    vim.g.lion_squeeze_spaces = 1
  end } -- align with operator gL and gl (ie glip= to align paragraph by =)
  use { 'tommcdo/vim-express', opt = true, keys = { { 'n', 'g=' } } } -- custom g* operations (g=iw - prompt 'get_'.v:val.'()' to change a word to a func)

  use 'stefandtw/quickfix-reflector.vim' -- edit the qf list directly with copen
  use { 'dsummersl/vim-projectionist', branch = 'issue-94', config = function()
    vim.cmd([[
      " Use projectionist mapping when doing a C-7
      nnoremap <leader>6 :A<cr>
      nnoremap <leader>. :E
    ]])
  end } -- :E* commands for a project
  use { 'embear/vim-localvimrc', config = function()
    vim.g.localvimrc_persistent = 1
    vim.g.localvimrc_ask = 0
    vim.g.localvimrc_sandbox = 0
    vim.g.localvimrc_name = { '.lvimrc', '.vimrc' }
  end } -- enable project local .vimrc files
  use { 'tpope/vim-fugitive', config = function()
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
  end } -- git
  -- rhubarb seems to be broken for most github repos after commit af12af4
  use { 'tpope/vim-rhubarb', commit = 'af12af4', requires = { 'tpope/vim-fugitive' } }
  use { 'tpope/vim-eunuch', opt = true, cmd = { 'Copy', 'Remove', 'Delete', 'Move', 'Rename' } } -- eunuch.vim: cp/move/unlink commands
  use { 'ludovicchabant/vim-gutentags', config = function()
    vim.g.gutentags_modules = { 'ctags' }
    vim.g.gutentags_cache_dir = '~/.vim/tags'
    vim.g.gutentags_ctags_exclude = { '*/node_modules/*', '*/bower_components/*',
      '*/public/assets/*', '*/public/packs/*', '*/public/packs-test/*', '*/vendor/*',
      'tags', '**/*.json', '**/*.md', '**/*.sql', '**/*.html' }

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
  end }
  use { 'tpope/vim-abolish', config = function()
    vim.cmd([[
      " pathing for abolish
      set runtimepath+=~/.vim/after
    ]])
  end } -- fix spelling errors
  use 'editorconfig/editorconfig-vim' -- 0.1.0 EditorConfig Plugin for Vim -- helps define and maintain consistent coding style
  use 'mattn/emmet-vim' -- fast HTML tag generation (in insert mode type tr*3CTL-Y, to make three <tr>s
  use { 'tomtom/tcomment_vim' } -- An extensible & universal comment vim-plugin that also handles embedded filetypes
  use { 'mhinz/vim-grepper', config = function()
    vim.g.grepper = {
      open = 1,
      stop = 300,
      tools = { 'git', 'ag', 'sift', 'rg' },
    }

    vim.cmd([[
      " search for the name of this file:
      noremap <leader>/f :exec "Grepper -jump -tool ag -noprompt -query ". expand("%:t:r:r")<CR>
      " search this directory:
      noremap <leader>/g :Grepper -tool ag -jump<cr>

      " see all the search matches in a separate window
      noremap <leader>// :exec "Grepper -jump -tool ag -noprompt -query ". substitute(escape(@/,' '),'\\[<>]\{1}','\\\\b','g') ." ". expand("%")<CR>

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
      command! -nargs=1 GG call ExecFileType("silent! GrepperGit %s -- '*.%s'",'<args>')
      command! -nargs=1 AA call ExecFileType("silent! GrepperAg '%s' -G '.*.%s'",'<args>')
      " TODO make Ggrep be test for the command...for non git projects, fallback on Ag
      " Something like :if exists(':Ggrep')
      command! -nargs=1 Gg exec "silent! GrepperGit -jump ". '<args>'
      command! -nargs=1 Aa exec "silent! GrepperAg -jump ". '<args>'

      nmap gs <plug>(GrepperOperator)
      xmap gs <plug>(GrepperOperator)
    ]])
  end } -- Grepper to search in lots of ways
  use { 'cohama/lexima.vim', config = function()
    vim.cmd([[
      ; call lexima#add_rule({'char': ')', 'leave': 1})
    ]])
  end } -- close quotes and such automatically
  use { '~/Documents/classes/vim-searchconceal', config = function()
    vim.cmd([[
      map ,cc :SearchConcealClear<CR>
      map ,ch :SearchConceal<CR>
    ]])
  end }
  use { '~/Documents/classes/vim-utf2ascii', opt = true, cmd = 'UTFToASCII', config = function()
    vim.cmd([[
      " Convert unicode to ASCII
      command! UTFToASCII :call utf2ascii#replaceUTF()<cr>
    ]])
  end } -- simple utf2ascii function.
  use { 'monaqa/dial.nvim', config = function()
    local augend = require("dial.augend")
    require("dial.config").augends:register_group {
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
        augend.constant.new { elements = { "&&", "||" }, word = false, cyclic = true },
        augend.constant.new { elements = { "==", "!=" }, word = false, cyclic = true },
        augend.constant.new { elements = { "true", "false" } },
        augend.constant.new { elements = { "info", "warn", "debug" } },
        augend.constant.new { elements = { "INFO", "WARN", "DEBUG" } },
        augend.constant.new { elements = { "align", "justify" } },
        augend.constant.new { elements = { "and", "or" } },
        augend.constant.new { elements = { "assertContains", "assertNotContains" } },
        augend.constant.new { elements = { "assertFalse", "assertTrue" } },
        augend.constant.new { elements = { "assertIn", "assertNotIn" } },
        augend.constant.new { elements = { "before", "after" } },
        augend.constant.new { elements = { "columns", "rows" } },
        augend.constant.new { elements = { "disabled", "enabled" } },
        augend.constant.new { elements = { "even", "odd" } },
        augend.constant.new { elements = { "first", "last" } },
        augend.constant.new { elements = { "left", "right" } },
        augend.constant.new { elements = { "min", "max" } },
        augend.constant.new { elements = { "top", "bottom" } },
        augend.constant.new { elements = { "up", "down" } },
        augend.constant.new { elements = { "width", "height" } },
        augend.constant.new { elements = { "yes", "no" } },
        augend.constant.new { elements = { "open", "close" } },
        augend.constant.new { elements = { "padding", "margin" } },
        augend.constant.new { elements = { "present", "absent" } },
        augend.constant.new { elements = { "enable", "disable" } },
        augend.constant.new { elements = { "public", "protected", "private" } },
        augend.user.new {
          find = require("dial.augend.common").find_pattern_regex('\\v\\.([a-zA-Z_-]+)>'),
          add = function(text, addend, cursor)
            local word = text:sub(2)
            text = "['" .. word .. "']"
            cursor = #text
            return { text = text, cursor = cursor }
          end
        },
        augend.user.new {
          find = require("dial.augend.common").find_pattern_regex('\\v\\[[\'"]([a-zA-Z_-]+)[\'"]\\]'),
          add = function(text, addend, cursor)
            local word = text:sub(3, -3)
            text = "." .. word
            cursor = #text
            return { text = text, cursor = cursor }
          end
        },
      },
    }

    vim.api.nvim_set_keymap("n", "<C-a>", require("dial.map").inc_normal("enhanced"), { noremap = true })
    vim.api.nvim_set_keymap("n", "<C-x>", require("dial.map").dec_normal("enhanced"), { noremap = true })
    vim.api.nvim_set_keymap("v", "<C-a>", require("dial.map").inc_visual("enhanced"), { noremap = true })
    vim.api.nvim_set_keymap("v", "<C-x>", require("dial.map").dec_visual("enhanced"), { noremap = true })
    vim.api.nvim_set_keymap("v", "g<C-a>", require("dial.map").inc_gvisual("enhanced"), { noremap = true })
    vim.api.nvim_set_keymap("v", "g<C-x>", require("dial.map").dec_gvisual("enhanced"), { noremap = true })
  end }
  use { '~/Documents/classes/vim-mundo', config = function()
    vim.g.mundo_verbose_graph = 0
    vim.g.mundo_mirror_graph = 1
    vim.g.mundo_prefer_python3 = 1
    vim.g.mundo_help = 0
    vim.g.mundo_inline_undo = 1
    vim.cmd([[
      nnoremap <F5> :MundoToggle<CR>
      map <leader>f5 :MundoToggle<cr>
    ]])
  end }
  use { 'w0rp/ale', opt = true, cmd = { 'ALEEnable', 'ALELint', 'ALEFix' }, requires = { 'kreskij/Repeatable.vim' }, setup = function()
    vim.g.ale_linter_aliases = {
      python = { 'python' },
      markdown = { 'asciidoc', 'markdown' },
      ruby = { 'asciidoc', 'ruby' }
    }
    vim.g.ale_linters = {
      python = { 'black', 'pyls', 'isort', 'trim_whitespace' },
      javascript = { 'eslint' },
      scss = { 'stylelint' }
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
  end }
  -- TODO really really slow for big files
  -- use { 'RRethy/vim-hexokinase', run = 'make hexokinase', config = function()
  --   vim.g.Hexokinase_virtualText = ' '
  --   vim.g.Hexokinase_optInPatterns = 'full_hex,rgb,rgba,hsl,hsla'
  --   -- let g:Hexokinase_highlighters = [ 'virtual', 'backgroundfull' ]
  -- end} -- Colors for red/green/#123123
  use { '~/Documents/classes/nvim-sluice', config = function()
    end
  }
  use { 'SirVer/ultisnips', config = function()
    vim.cmd([[
      let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/UltiSnips', $HOME.'/.vim/bundle/vim-snippets/UltiSnips']
      let g:UltiSnipsSnippetsDir='~/.vim/UltiSnips'
      let g:UltiSnipsListSnippets='<C-\>'
      let g:UltiSnipsExpandTrigger='<Tab>'
      let g:UltiSnipsJumpForwardTrigger='<Tab>'                                           
      let g:UltiSnipsJumpBackwardTrigger='<S-Tab>'
    ]])
  end }
  use { 'RRethy/vim-illuminate', config = function()
    require('illuminate').configure()
  end }
  use { 'stevearc/aerial.nvim', config = function()
    require("aerial").setup()
    vim.cmd([[
      nnoremap [t :AerialToggle<CR>
    ]])
  end }
  use { 'neovim/nvim-lspconfig',
    requires = {
      'stevearc/dressing.nvim',
      'williamboman/mason.nvim',
      'b0o/schemastore.nvim',
      'glepnir/lspsaga.nvim',
      'https://gitlab.com/yorickpeterse/nvim-dd.git',
      'jose-elias-alvarez/null-ls.nvim',
    },
    config = function()
      require('dd').setup()

      require('lspsaga').setup({
        symbol_in_winbar = {
          enable = false,
          show_file = false,
        },
        lightbulb = {
          enable = false,
          saga_winblend = 20,
        }
      })

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

      require("mason").setup {}
      local lspconfig = require('lspconfig')
      local on_attach = require'lsp_control'.on_attach
      lspconfig.yamlls.setup {
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
          yaml = { schemas = require('schemastore').json.schemas() },
        }
      }
      lspconfig.jsonls.setup {
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = {
          json = { schemas = require('schemastore').json.schemas() },
          jsonls = { schemas = require('schemastore').json.schemas() },
        }
      }
      lspconfig.pyright.setup {
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = { pylsp = { plugins = { pycodestyle = { enabled = false } } } }
      }
      lspconfig.lua_ls.setup {
        on_attach = on_attach,
        capabilities = cmp_capabilities,
        flags = { debounce_text_changes = 150 },
        settings = { Lua = { diagnostics = { globals = { 'vim' } } } }
      }
      local opts = require'lsp_control'.make_default_opts()
      lspconfig.html.setup(opts)
      lspconfig.cssls.setup(opts)
      lspconfig.emmet_ls.setup(opts)
      lspconfig.jsonls.setup(opts)
      lspconfig.remark_ls.setup(opts)
      lspconfig.tsserver.setup(opts)
      lspconfig.vimls.setup(opts)

      local null_ls = require('null-ls')
      null_ls.setup({ sources = {
        null_ls.builtins.diagnostics.buf,
        null_ls.builtins.code_actions.refactoring,
        null_ls.builtins.diagnostics.proselint,
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.isort,
        null_ls.builtins.diagnostics.pylint,
        null_ls.builtins.diagnostics.codespell,
        null_ls.builtins.diagnostics.flake8,
        null_ls.builtins.code_actions.eslint,
      },
      on_attach = on_attach,
      })
    end }
  use { 'nvim-treesitter/nvim-treesitter', requires = {
    'nvim-treesitter/nvim-treesitter-textobjects',
    'nvim-treesitter/playground',
  }, run = ':TSUpdate', config = function()
    require 'nvim-treesitter.configs'.setup {
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
            -- You can use the capture groups defined in textobjects.scm
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
          }
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
        }
      },
    }
  end }
  use { 'folke/trouble.nvim', requires = "kyazdani42/nvim-web-devicons", config = function()
    require("trouble").setup {
      mode = 'document_diagnostics'
    }
  end }
  use { 'itchyny/lightline.vim', requires = { 'SmiteshP/nvim-gps' }, config = function()
    require("nvim-gps").setup({
      depth = 3,
    })

    vim.cmd([[
      lua gps = require("nvim-gps")
      function! LspStatus()
        if luaeval('gps.is_available()')
          return luaeval('gps.get_location()')
        endif
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
  end }
  use 'pgdouyon/vim-evanesco' -- vmap *, Highlight search, clear after searching
  use { 'lukas-reineke/indent-blankline.nvim', config = function()
    vim.cmd([[
      nmap [oG :IndentBlanklineEnable<cr>
      nmap ]oG :IndentBlanklineDisable<cr>
    ]])
    require("indent_blankline").setup {
      enabled = false,
      space_char_blankline = " ",
      show_current_context = true,
      show_current_context_start = false,
      char_list_blankline = { '|', '¦', '┆', '┊' },
      -- char_highlight_list = {
      --     "IndentBlanklineIndent1",
      --     "IndentBlanklineIndent2",
      -- },
      -- space_char_highlight_list = {
      --     "IndentBlanklineIndent1",
      --     "IndentBlanklineIndent2",
      -- },
    }
  end }
  use { 'vinodkri/vim-tmux-runner', config = function()
    vim.cmd([[
      map <leader>gv  <Plug>(operator-vtr)
    ]])
  end } -- :VtrSendCommandToRunner for tmux
  use { 'vim-test/vim-test',
    keys = { { 'n', ',ctn' }, { 'n', ',ctf' }, { 'n', ',ctl' } },
    opt = true,
    config = function()
      vim.g['test#preserve_screen'] = 1
      vim.g['test#strategy'] = 'vtr'
      vim.g['test#sub'] = ''
      local SubstituteTransform = function(cmd)
        -- Transforms for running tests in. {} is replaced. For example:
        -- let test#sub = 'docker run --rm web python manage.py test {} | pygmentize -l pytb'
        -- or, just pipe to something
        -- let g:test#transformation = 'sub'
        -- let test#sub = '{} | pygmentize -l pytb'
        return vim.fn.substitute(vim.g['test#sub'], '{}', cmd, 'g')
      end
      local LastTransform = function(cmd)
        -- Keep only the last word, and combine with SubstituteTransform - handy for
        -- the djangotest type test where I want to take advantage of its figuring out
        -- the test name (at the end of the cmd) but want to run it differently
        -- let g:test#transformation = 'last'
        -- let test#sub = '{} | pygmentize -l pytb'
        return SubstituteTransform(vim.fn.substitute(cmd, '^.* \\(\\S\\+\\)$', '\\1', ''))
      end
      vim.g['test#custom_transformations'] = {
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
    end }
  -- use 'prabirshrestha/async.vim' -- TODO who needs this?
  -- use 'mattn/webapi-vim' -- TODO who needs this?
  use { 'michaeljsmith/vim-indent-object', opt = true, keys = { { 'o', 'iI' }, { 'o', 'ii' }, { 'v', 'ii' }, { 'v', 'iI' } } } -- vii and viI (visual inner Indent)
  use { 'saaguero/vim-textobj-pastedtext', requires = { 'kana/vim-textobj-user' } } -- vgb for last pasted text.
  use { 'glts/vim-textobj-comment', requires = { 'kana/vim-textobj-user' } } -- select comment with vic or vac.
  use 'ryanoasis/vim-devicons'
end)
